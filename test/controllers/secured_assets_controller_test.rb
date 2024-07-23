require "test_helper"

class SecuredAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Assuming you have fixtures or factories set up
    sign_in @user
    @secured_asset = secured_assets(:one)
  end

  test "should get index" do
    get secured_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_secured_asset_url
    assert_response :success
  end

  test "should create secured_asset" do
    assert_difference("SecuredAsset.count") do
      post secured_assets_url, params: { secured_asset: { carrots: @secured_asset.carrots, trader_number: @secured_asset.trader_number } }
    end

    assert_redirected_to secured_asset_url(SecuredAsset.last)
  end

  test "should show secured_asset" do
    get secured_asset_url(@secured_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_secured_asset_url(@secured_asset)
    assert_response :success
  end

  test "should update secured_asset" do
    patch secured_asset_url(@secured_asset), params: { secured_asset: { carrots: @secured_asset.carrots, trader_number: @secured_asset.trader_number } }
    assert_redirected_to secured_asset_url(@secured_asset)
  end

  test "should destroy secured_asset" do
    assert_difference("SecuredAsset.count", -1) do
      delete secured_asset_url(@secured_asset)
    end

    assert_redirected_to secured_assets_url
  end
end
