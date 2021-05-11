class Customers::CustomersController < Customers::ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)

  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      @customer = Customer.find(current_customer.id)
      render :edit
    end
  end
  
  def unsubscribe
  end
  
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
    

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :email, :telephone_number, :is_active)
  end


end
