class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  #before_action :require_login


  def grouped_batches
    @course = Course.find(params[:id])
    @batch_groups = @course.batch_groups
    @batches = @course.active_batches.reject{|b| GroupedBatch.exists?(:batch_id=>b.id)}
    @batch_group = BatchGroup.new
  end


  def assign_subject_amount
    @course = Course.active.find(params[:id])
    @subjects = @course.batches.map(&:subjects).flatten.compact.map(&:code).compact.flatten.uniq
    @subject_amount = @course.subject_amounts.build
    @subject_amounts = @course.subject_amounts.reject{|sa| sa.new_record?}
    if request.post?
      code = params[:subject_amount][:code]
      @subject_amount = @course.subject_amounts.build(subject_amount_params)
      if @subject_amount.save
        @subject_amounts = @course.subject_amounts.to_a.reject{|sa| sa.new_record?}
        flash[:notice] = "Subject amount saved successfully"
        redirect_to assign_subject_amount_courses_path(:id => @course.id)
      else
        render :assign_subject_amount
      end
    end
  end

  def manage_course
    @courses = Course.active
  end

  # GET /courses
  # GET /courses.json
  def index
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @batches = @course.batches.active
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @grade_types=Course.grading_types_as_options
  end

  def manage_batches
    @courses = Course.active
  end


  def update_batch
    @batch = Batch.where(:course_id => params[:course_name], :is_deleted => false, :is_active => true)
    render :partial=>'update_batch'

  end
  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_name, :section_name)
    end
end
