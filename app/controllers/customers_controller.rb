class CustomersController < ApplicationController
  before_action :logged_in_user
  def new
    @customer = Customer.new
  end

  def create
#binding.pry
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
    @customers = Customer.where(user_id: @user.id)
  end

  private
    def customer_params
      #binding.pry
      params.require(:customer).permit(:name, :email)
    end
end
