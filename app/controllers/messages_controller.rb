class MessagesController < ApplicationController
  before_action :require_login

  def require_login
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "Please login."
    end
  end

  def index
  end

  def show
  end

  def create
    m = Message.new
    m.receiver_id = params[:receiver_id].to_i
    m.content = params[:content]
    m.sender_id = @user.id
    m.save
    flash[:notice] = "Message sent successfully!"
    redirect_to messages_path
  end

  def new
    @destination = User.find_by(id: params[:id].to_i)
  end
end
