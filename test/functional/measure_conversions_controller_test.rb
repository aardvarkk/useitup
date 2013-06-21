require 'test_helper'

class MeasureConversionsControllerTest < ActionController::TestCase
  setup do
    @measure_conversion = measure_conversions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:measure_conversions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create measure_conversion" do
    assert_difference('MeasureConversion.count') do
      post :create, measure_conversion: { ingredient_id: @measure_conversion.ingredient_id, measure_type_id: @measure_conversion.measure_type_id, multiplier: @measure_conversion.multiplier }
    end

    assert_redirected_to measure_conversion_path(assigns(:measure_conversion))
  end

  test "should show measure_conversion" do
    get :show, id: @measure_conversion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @measure_conversion
    assert_response :success
  end

  test "should update measure_conversion" do
    put :update, id: @measure_conversion, measure_conversion: { ingredient_id: @measure_conversion.ingredient_id, measure_type_id: @measure_conversion.measure_type_id, multiplier: @measure_conversion.multiplier }
    assert_redirected_to measure_conversion_path(assigns(:measure_conversion))
  end

  test "should destroy measure_conversion" do
    assert_difference('MeasureConversion.count', -1) do
      delete :destroy, id: @measure_conversion
    end

    assert_redirected_to measure_conversions_path
  end
end
