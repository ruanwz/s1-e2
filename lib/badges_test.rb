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

  def test_static_badge_for_user
    @repos << @c
    assert @user.badges.include? CommitBronze
    (CommitSilver::Threshold-@user.commits.count).times do |i|
      c=Commit.new
      @repos << c
    end
    assert @user.badges.include? CommitSilver
    (CommitGold::Threshold-@user.commits.count).times do |i|
      c=Commit.new
      @repos << c
    end
    assert @user.badges.include? CommitGold
  end
  def test_dynamic_badge_for_user
    assert @user.badges.include? RepositoryBronze
    (RepositorySilver::Threshold-@user.repositories.count).times do |i|
      r=Repository.new(@user,i)
    end
    assert @user.badges.include? RepositorySilver
    (RepositoryGold::Threshold-@user.repositories.count).times do |i|
      r=Repository.new(@user,i)
    end
    assert @user.badges.include? RepositoryGold
  end
  def test_static_badge_never_lost_for_user
    (CommitGold::Threshold-@user.commits.count).times do |i|
      c=Commit.new
      @repos << c
    end
    assert @user.badges.include? CommitBronze
    assert @user.badges.include? CommitSilver
    assert @user.badges.include? CommitGold
    @user.commits.each do |c|
      @user.delete_commit c
    end
    assert @user.badges.include? CommitBronze
    assert @user.badges.include? CommitSilver
    assert @user.badges.include? CommitGold
  end
  def test_dynamic_may_lost_for_user
    assert  @user.badges.include?(RepositoryBronze)
    repos_list=[]
    (RepositoryGold::Threshold-@user.repositories.count).times do |i|
      repos_list << Repository.new(@user,i)
    end
    assert @user.badges.include? RepositoryBronze
    assert @user.badges.include? RepositorySilver
    assert @user.badges.include? RepositoryGold
    repos_list.each do |r|
      @user.delete_repository r
    end
    assert ! @user.badges.include?(RepositorySilver)
    assert ! @user.badges.include?(RepositoryGold)
    @user.delete_repository @repos
    assert ! @user.badges.include?(RepositoryBronze)
  end
end
 
