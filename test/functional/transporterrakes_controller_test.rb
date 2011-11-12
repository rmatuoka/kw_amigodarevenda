require 'test_helper'

class TransporterrakesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Transporterrake.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Transporterrake.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Transporterrake.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to transporterrake_url(assigns(:transporterrake))
  end
  
  def test_edit
    get :edit, :id => Transporterrake.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Transporterrake.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Transporterrake.first
    assert_template 'edit'
  end

  def test_update_valid
    Transporterrake.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Transporterrake.first
    assert_redirected_to transporterrake_url(assigns(:transporterrake))
  end
  
  def test_destroy
    transporterrake = Transporterrake.first
    delete :destroy, :id => transporterrake
    assert_redirected_to transporterrakes_url
    assert !Transporterrake.exists?(transporterrake.id)
  end
end
