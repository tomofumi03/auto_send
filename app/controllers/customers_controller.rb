class CustomersController < ApplicationController
  before_action :logged_in_user
  def new
    @customer = Customer.new
  end

  def create
    @customer = current_user.customers.build(customer_params)
    if @customer.save
      flash[:success] = "新しい送信者を登録しました"
      redirect_to customers_path
    else
      flash[:alert] = "もう一度やり直してください"
      render 'new'
    end
  end



  def index
    @user = User.find(current_user.id)
    @customers = Customer.where(user_id: @user.id)#.pluck(:user_id)
  end

  def update
    @user = User.find(current_user.id)
    customers = Customer.where(user_id: @user.id)
    @customers = customers.pluck(:email, :name)
    @customers.each do |customer|
      EveryoneMailer.remind_mail_to_everyone(customer).deliver
      if EveryoneMailer.remind_mail_to_everyone(customer).deliver
      else
        flash[:alert] = "もう一度やり直してください"
      end
    end



    customer = Customer.find(params[:id])
    CustomerMailer.remind_mail(customer).deliver
    if CustomerMailer.remind_mail(customer).deliver
      flash[:success] = "メールを送信しました"
      redirect_to customers_path
    else
      flash[:alert] = "もう一度やり直してください"
      redirect_to customers_path
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :email)
    end
end
