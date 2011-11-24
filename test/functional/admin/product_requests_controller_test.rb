require 'test_helper'

class Admin::ProductRequestsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ProductRequest.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ProductRequest.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ProductRequest.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_product_request_url(assigns(:product_request))
  end

  def test_edit
    get :edit, :id => ProductRequest.first
    assert_template 'edit'
  end

  def test_update_invalid
    ProductRequest.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProductRequest.first
    assert_template 'edit'
  end

  def test_update_valid
    ProductRequest.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProductRequest.first
    assert_redirected_to admin_product_request_url(assigns(:product_request))
  end

  def test_destroy
    product_request = ProductRequest.first
    delete :destroy, :id => product_request
    assert_redirected_to admin_product_requests_url
    assert !ProductRequest.exists?(product_request.id)
  end
end
