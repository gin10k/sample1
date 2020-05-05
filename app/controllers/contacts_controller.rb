class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :show]
  before_action :move_to_index, except: [:index]#リファクタリング+index以外は未ログインでは見れない

  def index
    @contacts = Contact.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @contact = Contact.new
  end

  def create
    Contact.create(contact_params)
  end

  def edit
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(contact_params)
  end

  def show
    @comment = Comment.new
    @comments = @contact.comments.includes(:user)
  end


  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
  end

  private
  def contact_params
    params.require(:contact).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_contact
    @contact =Contact.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    #ログインしていなければindex移行する
  end

end

