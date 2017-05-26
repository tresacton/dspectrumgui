class SectionTemplatesController < ApplicationController
  before_action :set_section_template, only: [:show]

  # GET /section_templates
  # GET /section_templates.json
  def index
    @section_templates = SectionTemplate.all
  end

  # GET /section_templates/1
  # GET /section_templates/1.json
  def show
  end

  def create
    @device = Device.find params[:section_template][:device_id]
    @device.sections_to_csv params[:section_template][:name], params[:section_template][:added_by]
    redirect_to controller: 'dashboard', action: 'contribute'
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section_template
      @section_template = SectionTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_template_params
      params.require(:section_template).permit(:name, :sections, :added_by)
    end
end
