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
  Threshold=5
end
class CommitGold < StaticBadge
  Threshold=10
end

module Badgable
  attr_accessor :achieved_static_badge_list
  def badges
    @achieved_static_badge_list ||= []
    StaticBadge.static_badge_list.each do |level|
      next if @achieved_static_badge_list.include? level 
      if commits.count >= level::Threshold
        puts "#{self.name} got #{level}"
        achieved_static_badge_list << level
      else
        break
      end
    end
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
