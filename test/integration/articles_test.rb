require 'test_helper'

class ArticlesTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h2", "Articles"
  end


  test "can sign up an user" do
    get new_user_registration_url
    assert_response :success

    post user_registration_url, params: {user: { email: 'test1@test1.com',password: '12345678',password_confirmation: '12345678'  }}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end


  test "can sign up an user and create article" do
    get new_user_registration_url
    assert_response :success
    post user_registration_url, params: {user: { email: 'test1@test1.com',password: '12345678',password_confirmation: '12345678'  }}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    get new_article_url
    post articles_url, params: {article: { title: 'title1',language: 'ruby',body: 'some test'  }}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    #puts response.body
  end

  test "can search for articles" do
    post articles_search_url params:{search: 'some text'}
    #puts response.body
    assert_response :success
  end

end
