class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
#  before_action :require_login

  def view
    @current_user = current_user
    @news = News.find(params[:id])
    @comments = @news.comments
    @is_moderator = @current_user.privileges.include?(Privilege.find_by_name('ManageNews')) || @current_user.admin?
    @config = Configuration.find_by_config_key('EnableNewsCommentModeration')
  end
  # GET /news
  # GET /news.json
  def index

    if params[:query] #need pagination to be added
      @news = News.where("title LIKE ?", "%#{params[:query]}%")
    else
      @news = News.all
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
    #@news.author = current_user
    @news.author = User.first
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render action: 'show', status: :created, location: @news }
      else
        format.html { render action: 'new' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end

  def home

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :content, :author_id)
    end
end
