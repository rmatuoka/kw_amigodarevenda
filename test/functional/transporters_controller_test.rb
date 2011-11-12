require 'test_helper'

class TransportersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Transporter.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Transporter.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Transporter.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to transporter_url(assigns(:transporter))
  end
  
  def test_edit
    get :edit, :id => Transporter.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Transporter.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Transporter.first
    assert_template 'edit'
  end

  def test_update_valid
    Transporter.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Transporter.first
    assert_redirected_to transporter_url(assigns(:transporter))
  end
  
  def test_destroy
    transporter = Transporter.first
    delete :destroy, :id => transporter
    assert_redirected_to transporters_url
    assert !Transporter.exists?(transporter.id)
  end
end
