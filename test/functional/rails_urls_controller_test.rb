require 'test_helper'

class RailsUrlsControllerTest < ActionController::TestCase
  setup do
    @rails_url = rails_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rails_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rails_url" do
    assert_difference('RailsUrl.count') do
      post :create, :rails_url => @rails_url.attributes
    end

    assert_redirected_to rails_url_path(assigns(:rails_url))
  end

  test "should show rails_url" do
    get :show, :id => @rails_url.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rails_url.to_param
    assert_response :success
  end

  test "should update rails_url" do
    put :update, :id => @rails_url.to_param, :rails_url => @rails_url.attributes
    assert_redirected_to rails_url_path(assigns(:rails_url))
  end

  test "should destroy rails_url" do
    assert_difference('RailsUrl.count', -1) do
      delete :destroy, :id => @rails_url.to_param
    end

    assert_redirected_to rails_urls_path
  end
end
