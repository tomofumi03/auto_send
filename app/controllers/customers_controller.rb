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

  def send_to_everyone
    @user = User.find(current_user.id)
    @customers = Customer.where(user_id: @user.id)
    customers = @customers.pluck(:email)

      if EveryoneMailer.remind_mail_to_everyone(customers).deliver
        flash[:success] = "メールを送信しました"
        redirect_to customers_path
      else
        flash[:alert] = "もう一度やり直してください"
      end
  end

  def send_to_someone
    customer = Customer.find(params[:id])
    if CustomerMailer.remind_mail(customer).deliver
      flash[:success] = "メールを送信しました"
      redirect_to customers_path
    else
      flash[:alert] = "もう一度やり直してください"
      redirect_to customers_path
    end
  end


  def index
    @user = User.find(current_user.id)
    @customers = Customer.where(user_id: @user.id)#.pluck(:user_id)
  end

  def update





  end

  private
    def customer_params
      params.require(:customer).permit(:name, :email)
    end
end
