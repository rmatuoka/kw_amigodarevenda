require 'test_helper'

class RepresentantsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Representant.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Representant.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Representant.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to representant_url(assigns(:representant))
  end
  
  def test_edit
    get :edit, :id => Representant.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Representant.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Representant.first
    assert_template 'edit'
  end

  def test_update_valid
    Representant.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Representant.first
    assert_redirected_to representant_url(assigns(:representant))
  end
  
  def test_destroy
    representant = Representant.first
    delete :destroy, :id => representant
    assert_redirected_to representants_url
    assert !Representant.exists?(representant.id)
  end
end
