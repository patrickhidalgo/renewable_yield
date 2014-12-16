class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_project, only: [:show, :edit, :update, :destroy, :submit, :withdraw]

  # def submit
  #   if current_user
  #     current_user.projects << @project
  #     redirect_to projects_path, notice: "#{@project.term} #{@project.interest_rate} has been moved to your inventory."
  #   end
  # end

  # def withdraw
  #   @project.user = nil
  #   @project.save
  #   redirect_to my_projects_path, notice: "#{@project.term} #{@project.interest_rate} has been sold!."
  # end

  def index
    @projects = Project.all.paginate(page: params[:page])
  end

  def my_projects
    @projects = Project.where(user_id: current_user.id).paginate(page: params[:page], per_page: 20)
    render 'projects/index'
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    #@project.nrel_data.build
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "#{@project.system_capacity} Kw project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "#{@project.system_capacity} Kw project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    destroy_message = "#{@project.system_capacity} Kw project has been destroyed!"
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: destroy_message }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(
        :system_capacity, :module_type, :losses, :array_type,
        :tilt, :azimuth, :address, :lat, :lon)  #:format, :api_key,, :file_id, :dataset, :radius, :timeframe, :dc_ac_ratio, :gcr, :inv_eff, :callback, :npv, :irr, :project_score, :status
    end
end
