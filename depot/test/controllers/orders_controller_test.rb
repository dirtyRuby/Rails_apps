require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:slash_order)
    @update = {
        name:     'John',
        address:  'LosAngeles',
        email:    'john@example.org',
        pay_type: 'credit_card'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    item = LineItem.new
    item.build_cart
    item.product = products(:jquery)
    item.save!
    session[:cart_id] = item.cart.id
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: @update
    end

    assert_redirected_to store_url
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: @update
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end

  test "requires item in the cart" do
    get :new
    assert_redirected_to store_path
    assert_equal flash[:notice], "Your cart is empty."
  end
end