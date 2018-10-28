require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
   test "can create article with user and validation" do

     user = User.new(id: 202, email: "test4@test1.com",  password: '12345678')
     article = Article.new(id: 202, title: "my title",  language: 'ruby',body:'some random text',user: user)

     assert article.save
   end

   test "cannot create article without user" do

     article = Article.new(id: 202, title: "my title",  language: 'ruby',body:'some random text')
     assert_not article.save
   end

   test "cannot create article without title" do

     article = Article.new(id: 202,  language: 'ruby',body:'some random text')
     assert_not article.save
   end

end
