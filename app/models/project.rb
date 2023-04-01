class Project < ApplicationRecord
  enum status: [:in_progress, :completed]
  validates :name, presence: true
end
