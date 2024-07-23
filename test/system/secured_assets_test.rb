require "application_system_test_case"

class SecuredAssetsTest < ApplicationSystemTestCase
  setup do
    @secured_asset = secured_assets(:one)
  end

  test "visiting the index" do
    visit secured_assets_url
    assert_selector "h1", text: "Secured assets"
  end

  test "should create secured asset" do
    visit secured_assets_url
    click_on "New secured asset"

    fill_in "Carrots", with: @secured_asset.carrots
    fill_in "Trader number", with: @secured_asset.trader_number
    click_on "Create Secured asset"

    assert_text "Secured asset was successfully created"
    click_on "Back"
  end

  test "should update Secured asset" do
    visit secured_asset_url(@secured_asset)
    click_on "Edit this secured asset", match: :first

    fill_in "Carrots", with: @secured_asset.carrots
    fill_in "Trader number", with: @secured_asset.trader_number
    click_on "Update Secured asset"

    assert_text "Secured asset was successfully updated"
    click_on "Back"
  end

  test "should destroy Secured asset" do
    visit secured_asset_url(@secured_asset)
    click_on "Destroy this secured asset", match: :first

    assert_text "Secured asset was successfully destroyed"
  end
end
