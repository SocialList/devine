class Project < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :repo_id, uniqueness: true
end
