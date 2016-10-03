class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :previous_data]
  before_action :login_required


  def categories
    @student_categories = StudentCategory.active
    @student_category = StudentCategory.new(student_category_params)
    if request.post? and @student_category.save
      flash[:notice] = t('student.flash7')
      redirect_to :action => 'categories'
    end
  end

  def attendance_register
    @batches = Batch.active
  end

  def student_register
    @today =  params[:date] ? params[:date].to_date : Date.today
    @month = @today.month
    @beginning_of_month = @today.beginning_of_month
    # @student_category = EmployeeCategory.find(params[:id])
    @students = Student.includes(:attendances).where(batch_id: params[:id] )

    render partial: 'student_register'


  end
  # GET /students
  # GET /students.json
  def index
    # render layout: 'application'
  end

  def search_students
    status = params[:status]
    if status == 'true'
      @student = Student.where('first_name like ? ', "%#{params[:query]}%" )
      p "====current========"
      p params[:status]

    else
      @student = ArchivedStudent.where('first_name like ? ', "%#{params[:query]}%" )
      p "=====former======="
      p params[:status]


    end
    respond_to do |format|
        format.html# { render action: 'new' }
        format.json { render json: @student, root: false }
    end
  end

  def advanced_search
    @batches = Batch.all
     @students = nil
    if request.post?
      @students = Student.where(nil)
   #   @students = @students.first_name(params[:first_name]) if params[:first_name].present?
      @students = @students.where("first_name like ?", "%#{params[:first_name]}%") if params[:first_name].present?
      @students = @students.where("admission_no like ?", "%#{params[:admission_no]}%") if params[:admission_no].present?
      @students = @students.where("batch_id = ?", params[:batch_id]) if params[:batch_id].present?

    end
  end

  def view_all
    @batches = Batch.includes(:course).active
  end

  def list_students_by_course
    @students = Batch.find(params[:id]).students
    render partial: 'index'
  end

  def admission1
    @student = Student.new(student_params)
 #   @selected_value = Setting.default_country
 #   @application_sms_enabled = SmsSetting.find_by_settings_key("ApplicationEnabled")
    @last_admitted_student = Student.last
    @config = Setting.get_config_value('AdmissionNumberAutoIncrement')
 #   @categories = StudentCategory.active
    if request.post?
      if @config.to_i == 1
        @exist = Student.find_by_admission_no(params[:student][:admission_no])
        if @exist.nil?
          @status = @student.save
        else
          @last_admitted_student = Student.last
          @student.admission_no = @last_admitted_student.admission_no.next
          @status = @student.save
        end
      else
        @status = @student.save
      end

      if @status
      #   sms_setting = SmsSetting.new
      #   if sms_setting.application_sms_active and @student.is_sms_enabled
      #     recipients = []
      #     message = "#{t('student_admission_done')} #{@student.admission_no} #{t('password_is')} #{@student.admission_no}123"
      #     if sms_setting.student_admission_sms_active
      #       recipients.push @student.phone2 unless @student.phone2.blank?
      #     end
      #     unless recipients.empty?
      #       Delayed::Job.enqueue(SmsManager.new(message,recipients))
      #     end
      #   end
        flash[:notice] = "Student Added Successfully"
        redirect_to :controller => "students", :action => "previous_data", :id => @student.id
      end
    end
  end


  def previous_data
    @student = Student.find(params[:id])
    @previous_data = StudentPreviousData.new(student_previous_data_params)
    @previous_subject = StudentPreviousSubjectMark.where(student_id: @student.id)
    if request.post?
      @previous_data.save
      redirect_to :action => "admission4", :id => @student.id
    else
      return
    end
  end

  # def previous_data
  #   @previous_data = StudentPreviousData.new
  # end

  # def previous_data_create
  #   @student = Student.find(params[:id])
  #   @previous_data = StudentPreviousData.new(student_previous_data_params)
  #   @previous_subject = StudentPreviousSubjectMark.where(student_id: @student.id)
  #   @previous_data.save
  #   redirect_to @student
  # end

  def previous_subject
    @student = Student.find(params[:id])
    @student_previous_subject_details=StudentPreviousSubjectMark.new
    render(:update) do |page|
      page.replace_html 'subject', :partial=>"previous_subject"
    end
  end


  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @last_admitted_student = Student.last
    @config = Setting.get_config_value('AdmissionNumberAutoIncrement')
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to "/students/previous_data/#{@student.id}", notice: 'Student was successfully created.' }
        format.json { render action: 'show', status: :created, location: @student }
      else
        format.html { render action: 'new' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :admission_no, :batch_id, :admission_date, :date_of_birth, :gender, :blood_group, :nationality_id, :religion, :address_line1, :city, :state, :pin_code, :phone1, :phone2, :email, :country_id)
    end
    def student_previous_data_params
      params.fetch(:student_previous_data, {}).permit(:student_id, :institution, :year, :course, :total_mark)
    end


  private

    def student_params
      params.require(:student).permit(:admission_no, :admission_date, :first_name, :middle_name, :last_name, :batch_id, :date_of_birth, :gender, :blood_group, :birth_place, :nationality_id, :language, :student_category_id, :religion, :address_line1, :address_line2, :city, :state, :pin_code, :country_id, :phone1, :phone2, :email, :photo)
    end

    def find_student
      @student = Student.find params[:id]
    end

    # This method set permit the user params
    def student_additional_field_params
      params.require(:student_additional_field).permit(:name, :status, :is_mandatory, :input_type)
    end

    def guardian_params
      params[:guardian] = params[:parent_detail] if params[:parent_detail]
      params.require(:guardian).permit(:ward_id, :first_name, :last_name, :relation, :email, :office_phone1, :office_phone2, :mobile_phone, :office_address_line1, :office_address_line2, :city, :state, :country_id, :dob, :occupation, :income, :education, :user_id) if params[:guardian]
#       params.require(:parent_detail).permit(:ward_id, :first_name, :last_name, :relation, :email, :office_phone1, :office_phone2, :mobile_phone, :office_address_line1, :office_address_line2, :city, :state, :country_id, :dob, :occupation, :income, :education, :user_id) if params[:parent_detail]
    end

    def student_previous_details_params
      params.require(:student_previous_details).permit(:student_id, :institution, :year, :course, :total_mark) if params[:student_previous_details]
    end

    def student_previous_subject_details_params
      params.require(:student_previous_subject_details).permit(:student_id, :subject, :mark) if params[:student_previous_subject_details]
    end

    def student_category_params
      params.require(:student_category).permit(:name, :is_deleted) if params[:student_category]
    end
end
