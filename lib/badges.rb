require 'rubygems'
require 'ruby-debug'
require File.join(File.dirname(__FILE__) + '/stub.rb')
class StaticBadge
    class << self
      attr_reader :static_badge_list
      def inherited(subclass)
        @static_badge_list ||= []
        @static_badge_list << subclass
      end
    end
end
class CommitBronze < StaticBadge
  Threshold=1
end
class CommitSilver < StaticBadge
  Threshold=10
end
class CommitGold < StaticBadge
  Threshold=100
end
class DynamicBadge
    class << self
      attr_reader :dynamic_badge_list
      def inherited(subclass)
        @dynamic_badge_list ||= []
        @dynamic_badge_list << subclass
      end
    end
end

class RepositoryBronze < DynamicBadge
  Threshold=1
end
class RepositorySilver < DynamicBadge
  Threshold=10
end
class RepositoryGold < DynamicBadge
  Threshold=100
end


module Badgable
  attr_accessor :achieved_static_badge_list
  attr_accessor :achieved_dynamic_badge_list
  def badges
    static_badges + dynamic_badges
  end
  def static_badges
    @achieved_static_badge_list ||= []
    StaticBadge.static_badge_list.each do |level|
      next if @achieved_static_badge_list.include? level 
      if commits.count >= level::Threshold
        puts "#{self.name} got #{level}"
        @achieved_static_badge_list << level
      else
        break
      end
    end
    @achieved_static_badge_list
  end
  def dynamic_badges
    @achieved_dynamic_badge_list ||= []
    DynamicBadge.dynamic_badge_list.each do |level|
      if repositories.count >= level::Threshold
        if !@achieved_dynamic_badge_list.include? level
          puts "#{self.name} got #{level}"
          @achieved_dynamic_badge_list << level
        end
      else
        if @achieved_dynamic_badge_list.include? level
          puts "#{self.name} lost #{level}"
          @achieved_dynamic_badge_list.delete level
        end
      end
    end
    @achieved_dynamic_badge_list
  end

end
class User
  include Badgable
end

if __FILE__== $0
 puts  StaticBadge.static_badge_list
 u=User.new 'david'
 r=Repository.new u,'kernel'
 c=Commit.new
 r << c
 puts u.badges
end
