class RepositoryType < ActiveRecord::Base
  has_many :repositories, :foreign_key => 'type_id'
end
