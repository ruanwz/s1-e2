require 'test/unit'
require File.join(File.dirname(__FILE__) + '/stub.rb')
class StubTest < Test::Unit::TestCase
  def setup
    @user=User.new "david"
    @repos=Repository.new(@user,'kenrel')
    @c=Commit.new
    @c2=Commit.new
    @user2=User.new 'rainly'
    @c2.author=@user2
  end
  def test_commit
    @repos << @c << @c2
    assert_equal 2, @repos.commits.count
  end

  def test_count_commit_for_user
    @repos << @c
    assert_equal 1, @user.commits.count
    assert_equal 1, @repos.commits.count
    @repos << @c2
    assert_equal 2, @repos.commits.count
    assert_equal 1, @user.commits.count
    assert_equal 1, @user2.commits.count
  end
  def test_count_repository_for_user
    assert_equal 1, @user.repositories.count 
    assert_equal 0, @user2.repositories.count 
  end
  

end

