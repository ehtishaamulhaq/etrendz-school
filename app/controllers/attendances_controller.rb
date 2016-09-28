class AttendancesController < ApplicationController
   respond_to :html, :js

  def index
    @attendances = Attendance.all
  end

  def show
   @attendance = Attendance.find(params[:id])
  end

  def new
    @attendance = Attendance.new
    @student = Student.find(params[:student_id])
    @attendance = Attendance.new(:student_id => params[:student_id], :forenoon => params[:forenoon], :afternoon => params[:afternoon], :month_date => params[:month_date].to_date, :batch_id => @student.batch_id) if params[:student_id]
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def create
    @attendances = Attendance.all
    @attendance = Attendance.create(attendance_params)
    respond_to do |format|
      format.html { render partial: 'new_attendance' }
      format.json { render json: @attendance }
    end
  end

  def update
    @attendances = Attendance.all
    @attendance = Attendance.find(params[:id])

    @attendance.update_attributes(attendance_params)
  end

  def delete
    @attendance = Attendance.find(params[:attendance_id])
  end

  def destroy
    @attendances = Attendance.all
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:month_date, :reason, :forenoon, :afternoon, :student_id, :batch_id)
    end
end
