require 'test_helper'

class SubdptosControllerTest < ActionController::TestCase
  setup do
    @subdpto = subdptos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subdptos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subdpto" do
    assert_difference('Subdpto.count') do
      post :create, subdpto: { dpto_id: @subdpto.dpto_id, name: @subdpto.name }
    end

    assert_redirected_to subdpto_path(assigns(:subdpto))
  end

  test "should show subdpto" do
    get :show, id: @subdpto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subdpto
    assert_response :success
  end

  test "should update subdpto" do
    patch :update, id: @subdpto, subdpto: { dpto_id: @subdpto.dpto_id, name: @subdpto.name }
    assert_redirected_to subdpto_path(assigns(:subdpto))
  end

  test "should destroy subdpto" do
    assert_difference('Subdpto.count', -1) do
      delete :destroy, id: @subdpto
    end

    assert_redirected_to subdptos_path
  end
end
