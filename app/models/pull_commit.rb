class PullCommit < ActiveRecord::Base
  belongs_to :pull_request
  belongs_to :user
  belongs_to :start_commit, :class_name => 'Commit'
  belongs_to :end_commit, :class_name => 'Commit'
end
