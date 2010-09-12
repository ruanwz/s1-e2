class IssueStatus < ActiveRecord::Base
  has_many :issues, :foreign_key => 'status_id'
end
