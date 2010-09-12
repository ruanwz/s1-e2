class Repository < ActiveRecord::Base
  belongs_to :repository_type, :foreign_key => 'type_id'
  belongs_to :user
  belongs_to :fork_by, :class_name=>'Repository', :foreign_key => 'fork_by'
  has_many :commits
  has_many :watchings

  has_many :watchers, :through => :watchings, :source => :user
end
