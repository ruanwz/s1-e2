class Commit < ActiveRecord::Base
  belongs_to :user
  belongs_to :repository
  belongs_to :parent, :class_name =>'Commit'
  has_many :commit_notes

end
