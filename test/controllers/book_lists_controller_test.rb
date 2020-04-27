require 'test_helper'

class BookListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_lists_index_url
    assert_response :success
  end

end
