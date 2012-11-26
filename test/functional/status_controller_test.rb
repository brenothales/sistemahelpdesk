require 'test_helper'

class StatusControllerTest < ActionController::TestCase
  setup do
    @statu = status(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statu" do
    assert_difference('Statu.count') do
      post :create, statu: { nome: @statu.nome, references: @statu.references }
    end

    assert_redirected_to statu_path(assigns(:statu))
  end

  test "should show statu" do
    get :show, id: @statu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statu
    assert_response :success
  end

  test "should update statu" do
    put :update, id: @statu, statu: { nome: @statu.nome, references: @statu.references }
    assert_redirected_to statu_path(assigns(:statu))
  end

  test "should destroy statu" do
    assert_difference('Statu.count', -1) do
      delete :destroy, id: @statu
    end

    assert_redirected_to status_path
  end
end
