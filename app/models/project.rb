class Project < ApplicationRecord
  enum status: [:in_progress, :completed]
  validates :name, presence: true

  belongs_to :user
end
