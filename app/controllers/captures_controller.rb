class CapturesController < ApplicationController
  before_action :set_capture, only: [:show, :edit, :update, :destroy, :shift_left, :shift_right]

  require 'pty'

  # GET /captures
  # GET /captures.json
  def index
    @captures = Capture.all
  end

  # GET /captures/1
  # GET /captures/1.json
  def show
  end

  def shift_right
    @capture.shift_right
    redirect_to :back
  end

  def shift_left
    @capture.shift_left
    redirect_to :back
  end

  # GET /captures/new
  def new
    @capture = Capture.new(unit_id:params[:unit_id],device_id:params[:device_id])
    # dd
    # `inspectrum`


    cmd = 'inspectrum'
    begin
      PTY.spawn(cmd) do |r, stdin, pid|
        begin
          got_it = false

          loop do
            if !got_it
              line = r.gets
              raw = line.chomp.strip.split(',')
              puts "\n[*] Data as array: #{raw}" if $verbose == true
              if raw.count > 1
                demod = ''
                arr = raw
                threshold = arr.inject { |sum, el| sum + el }.to_f / arr.size
                raw.to_a.each do |r|
                  r.to_f > threshold.to_f ? demod << '1' : demod << '0'
                end

                # threshold safety check start

                # threshold_safety_check raw, threshold
                # threshold safety check end

                # hex = print_results demod
                # compare demod
                @capture.original_binary = demod
                got_it = true unless demod == ''
              end
            else
              break
            end
          end
          Process.kill 'INT', pid
        rescue Errno::EIO
          puts '[!] Errno:EIO error, this may just mean the process has finished giving output'.colorize(:red)
          Process.kill 'INT', pid
        end
      end
    rescue PTY::ChildExited
      puts '[!] The child process exited!'.colorize(:red)
    end




  end

  # GET /captures/1/edit
  def edit
  end

  # POST /captures
  # POST /captures.json
  def create
    @capture = Capture.new(capture_params)

    respond_to do |format|
      if @capture.save
        @capture.binary = @capture.original_binary
        @capture.save
        puts "the above update occured on create..."
        format.html { redirect_to @capture.unit, notice: 'Capture was successfully created.' }
        format.json { render :show, status: :created, location: @capture }
      else
        format.html { render :new }
        format.json { render json: @capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /captures/1
  # PATCH/PUT /captures/1.json
  def update
    respond_to do |format|
      if @capture.update(capture_params)
        format.html { redirect_to @capture, notice: 'Capture was successfully updated.' }
        format.json { render :show, status: :ok, location: @capture }
      else
        format.html { render :edit }
        format.json { render json: @capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /captures/1
  # DELETE /captures/1.json
  def destroy
    @capture.destroy
    respond_to do |format|
      format.html { redirect_to captures_url, notice: 'Capture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capture
      begin
        @capture = Capture.find(params[:id])
      rescue
        @capture = Capture.find(params[:capture_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capture_params
      params.require(:capture).permit(:unit_id, :device_id, :name, :notes, :binary, :original_binary)
    end
end
