class Issue < ActiveRecord::Base
  belongs_to :repository
  belongs_to :user
  belongs_to :status, :class_name => 'IssueStatus'
  has_many :comments
  belongs_to :closed_by, :class_name => 'User', :foreign_key => 'closed_by'
end
