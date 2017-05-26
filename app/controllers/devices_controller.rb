class DevicesController < ApplicationController
  require 'csv'
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @unit = Unit.new(device_id:params[:id])
    @without_baseline = params[:without_baseline].present? ? true : false
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def apply_template
    @device = Device.find params[:device_id]
    @template = SectionTemplate.find params[:template][:template_id]

    the_csv = CSV.parse(@template.sections, :headers => true, :encoding => 'ISO-8859-1')
    the_csv.each do |row|
      s = Section.new
      s.device_id = @device.id
      s.start_pos = row['start_pos']
      s.end_pos = row['end_pos']
      s.name = row['name']
      s.notes = row['notes']
      s.colour = row['colour']
      s.save
    end
    redirect_to :back, :notice => "Successfully imported sections"
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:fcc_id, :baudrate, :frequency, :modulation, :encoding, :name, :notes, :flip_pwm)
    end
end
