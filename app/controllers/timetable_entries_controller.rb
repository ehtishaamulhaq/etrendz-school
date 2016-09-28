class TimetableEntriesController < ApplicationController
  before_action :set_timetable_entry, only: [:show, :edit, :update, :destroy]
 # before_action :require_login

  # GET /timetable_entries
  # GET /timetable_entries.json
  def index
    @timetable_entries = TimetableEntry.all
  end

  # GET /timetable_entries/1
  # GET /timetable_entries/1.json
  def show
  end

  # GET /timetable_entries/new
  def new
    @timetable_entry = TimetableEntry.new
  end

  # GET /timetable_entries/1/edit
  def edit
  end

  # POST /timetable_entries
  # POST /timetable_entries.json
  def create
    @timetable_entry = TimetableEntry.new(timetable_entry_params)

    respond_to do |format|
      if @timetable_entry.save
        format.html { redirect_to @timetable_entry, notice: 'Timetable entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @timetable_entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @timetable_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timetable_entries/1
  # PATCH/PUT /timetable_entries/1.json
  def update
    respond_to do |format|
      if @timetable_entry.update(timetable_entry_params)
        format.html { redirect_to @timetable_entry, notice: 'Timetable entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @timetable_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetable_entries/1
  # DELETE /timetable_entries/1.json
  def destroy
    @timetable_entry.destroy
    respond_to do |format|
      format.html { redirect_to timetable_entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable_entry
      @timetable_entry = TimetableEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_entry_params
      params.require(:timetable_entry).permit(:batch_id)
    end
end
