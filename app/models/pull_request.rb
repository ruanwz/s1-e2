class PullRequest < ActiveRecord::Base
  belongs_to :user
  has_one :pull_commit
  belongs_to :target_repository, :class_name => 'Repository'
  belongs_to :source_repository, :class_name => 'Repository'

end
