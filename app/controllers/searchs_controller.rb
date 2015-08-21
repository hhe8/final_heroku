class SearchsController < ApplicationController
  before_action :require_login

  def require_login
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "Please login."
    end
  end

  def index
    search = @user.searchs.last
    if search
      @searches = User.where("age= ? AND region= ? AND sex= ?",search.age, search.region, search.sex)
    end
  end

  def show
  end

  def create
    s = Search.new
    s.age = params[:age]
    s.sex = params[:sex]
    s.region = params[:region]
    s.searcher_id = @user.id
    s.save
    flash[:notice] = "Searched people at age #{params[:age]}, #{params[:sex]}, and live in #{params[:region]}}"
    redirect_to searchs_path
  end

  def new
  end

end
