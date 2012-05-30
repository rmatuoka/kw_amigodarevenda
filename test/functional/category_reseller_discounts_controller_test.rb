require 'test_helper'

class CategoryResellerDiscountsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => CategoryResellerDiscount.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    CategoryResellerDiscount.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    CategoryResellerDiscount.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to category_reseller_discount_url(assigns(:category_reseller_discount))
  end

  def test_edit
    get :edit, :id => CategoryResellerDiscount.first
    assert_template 'edit'
  end

  def test_update_invalid
    CategoryResellerDiscount.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CategoryResellerDiscount.first
    assert_template 'edit'
  end

  def test_update_valid
    CategoryResellerDiscount.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CategoryResellerDiscount.first
    assert_redirected_to category_reseller_discount_url(assigns(:category_reseller_discount))
  end

  def test_destroy
    category_reseller_discount = CategoryResellerDiscount.first
    delete :destroy, :id => category_reseller_discount
    assert_redirected_to category_reseller_discounts_url
    assert !CategoryResellerDiscount.exists?(category_reseller_discount.id)
  end
end
