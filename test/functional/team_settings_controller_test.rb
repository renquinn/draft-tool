require 'test_helper'

class TeamSettingsControllerTest < ActionController::TestCase
  setup do
    @team_setting = team_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_setting" do
    assert_difference('TeamSetting.count') do
      post :create, team_setting: { attempts: @team_setting.attempts, completions: @team_setting.completions, interceptions: @team_setting.interceptions, passing_touchdowns: @team_setting.passing_touchdowns, passing_yards: @team_setting.passing_yards, receiving_touchdowns: @team_setting.receiving_touchdowns, receiving_yards: @team_setting.receiving_yards, receptions: @team_setting.receptions, rushes: @team_setting.rushes, rushing_touchdowns: @team_setting.rushing_touchdowns, rushing_yards: @team_setting.rushing_yards }
    end

    assert_redirected_to team_setting_path(assigns(:team_setting))
  end

  test "should show team_setting" do
    get :show, id: @team_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_setting
    assert_response :success
  end

  test "should update team_setting" do
    put :update, id: @team_setting, team_setting: { attempts: @team_setting.attempts, completions: @team_setting.completions, interceptions: @team_setting.interceptions, passing_touchdowns: @team_setting.passing_touchdowns, passing_yards: @team_setting.passing_yards, receiving_touchdowns: @team_setting.receiving_touchdowns, receiving_yards: @team_setting.receiving_yards, receptions: @team_setting.receptions, rushes: @team_setting.rushes, rushing_touchdowns: @team_setting.rushing_touchdowns, rushing_yards: @team_setting.rushing_yards }
    assert_redirected_to team_setting_path(assigns(:team_setting))
  end

  test "should destroy team_setting" do
    assert_difference('TeamSetting.count', -1) do
      delete :destroy, id: @team_setting
    end

    assert_redirected_to team_settings_path
  end
end
