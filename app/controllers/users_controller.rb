class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create, :index, :profile]
    before_action :authorize_user, only: [:show, :edit, :update]

    def require_login
      @user = User.find_by(id: session[:user_id])
      if @user.blank?
        redirect_to root_url, notice: "Please login."
      end
    end

    def authorize_user
      if @user.id != session[:user_id]
        redirect_to root_url, notice: "Nice try!"
      end
    end

    def index
      @users = User.limit(20)
      if session[:user_id]
        @user = User.find_by(id: session[:user_id])
      end
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user= User.new
      @user.name = params[:name]
      @user.email = params[:email]
      @user.age = params[:age]
      @user.sex = params[:sex]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      @user.region = params[:region]

      if @user.save
        flash[:notice] = "Welcome to this site! #{@user.name}"
        redirect_to root_url
      else
        render 'new'
      end
    end

    def update
      @user.name = params[:name]
      @user.email = params[:email]
      @user.age = params[:age]
      @user.sex = params[:sex]
      @user.region = params[:region]
      @user.status = params[:status]
      @user.save
      flash[:notice] = "Updated successfully."
      redirect_to user_path(@user.id)
    end

    def edit

    end

    def profile
      @user = User.find_by(id: params[:id].to_i)
    end

    def destroy
      User.delete(@user.id)
      flash[:notice] = "Account deleted successfully"
      redirect_to root_path
    end
end
