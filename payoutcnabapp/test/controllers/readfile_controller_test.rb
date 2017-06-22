require 'test_helper'

class ReadfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get readfile_index_url
    assert_response :success
  end

  test "should get show" do
    get readfile_show_url
    assert_response :success
  end

  test "should get create" do
    get readfile_create_url
    assert_response :success
  end

  test "should get update" do
    get readfile_update_url
    assert_response :success
  end

  test "should get destroy" do
    get readfile_destroy_url
    assert_response :success
  end

end
