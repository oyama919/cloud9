class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end
  
  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    # raise @contact.inspect 
    render :new if @contact.invalid?
  end
  
  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      redirect_to new_contact_path,notice:"お問い合わせありがとうございました！"
    else
      render action: 'new'
    end
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name,:email,:content)
    end
end