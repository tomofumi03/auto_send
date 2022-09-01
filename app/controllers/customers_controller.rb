class CustomersController < ApplicationController
  before_action :logged_in_user
  def new
    @customer = Customer.new
    @user = current_user
  end

  def create
    @customer = current_user.customers.build(customer_params)
    if @customer.save
      flash[:success] = "新しい送信者を登録しました"
      redirect_to user_customers_path
    else
      flash[:alert] = "もう一度やり直してください"
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params_subject)
      flash[:success] = "登録されました"
      redirect_to edit_user_customer_path(@customer)
    else
      render 'edit'
    end
  end

  def send_to_everyone
    @user = User.find(current_user.id)
    @customers = Customer.where(user_id: @user.id)
    customers = @customers.pluck(:email, :subject, :content)

      if EveryoneMailer.remind_mail_to_everyone(customers).deliver
        flash[:success] = "メールを送信しました"
        redirect_to user_customers_path(@customers)
      else
        flash[:alert] = "もう一度やり直してください"
        redirect_to user_customers_path(@customers)
      end
  end

  def send_to_someone
    customer = Customer.find(params[:id])
    if CustomerMailer.remind_mail(customer).deliver
      flash[:success] = "メールを送信しました"
      redirect_to user_customers_path(customer)
    else
      flash[:alert] = "もう一度やり直してください"
      redirect_to user_customers_path(customer)
    end
  end

  def show

  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "消去しました"
    redirect_to user_customers_path(params[:user_id])
  end


  def index
    @user = User.find(current_user.id)
    @customers = Customer.where(user_id: @user.id)#.pluck(:name, :id)
    #binding.pry
  end


  private
    def customer_params
      params.require(:customer).permit(:name, :email)
    end
    def customer_params_subject
      params.require(:customer).permit(:subject, :content)
    end
end
