class Project < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :id, use: :slugged
end
