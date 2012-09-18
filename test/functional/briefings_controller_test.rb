require 'test_helper'

class BriefingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Briefing.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Briefing.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Briefing.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to briefing_url(assigns(:briefing))
  end

  def test_edit
    get :edit, :id => Briefing.first
    assert_template 'edit'
  end

  def test_update_invalid
    Briefing.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Briefing.first
    assert_template 'edit'
  end

  def test_update_valid
    Briefing.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Briefing.first
    assert_redirected_to briefing_url(assigns(:briefing))
  end

  def test_destroy
    briefing = Briefing.first
    delete :destroy, :id => briefing
    assert_redirected_to briefings_url
    assert !Briefing.exists?(briefing.id)
  end
end
