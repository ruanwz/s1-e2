require 'test/unit'
require File.join(File.dirname(__FILE__) + '/badges.rb')
class BadgesTest < Test::Unit::TestCase
  def setup
    @user=User.new "david"
    @repos=Repository.new(@user,'kenrel')
    @c=Commit.new
    @c2=Commit.new
    @user2=User.new 'rainly'
    @c2.author=@user2
  end
  def test_static_badge_list
    assert StaticBadge.static_badge_list.include? CommitGold
  end

  def test_static_badge_for user
    assert @user.badges.include? CommitBronze
  end
end
 
