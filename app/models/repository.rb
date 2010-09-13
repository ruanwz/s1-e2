class Repository < ActiveRecord::Base
  belongs_to :repository_type, :foreign_key => 'type_id'
  belongs_to :user
  belongs_to :fork_from, :class_name=>'Repository', :foreign_key => 'fork_from_id'
  has_many :commits
  has_many :watchings
  has_many :issues

  has_many :watchers, :through => :watchings, :source => :user
end
