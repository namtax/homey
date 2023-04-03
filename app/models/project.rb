class Project < ApplicationRecord
  enum status: [:in_progress, :completed]
  validates :name, presence: true

  belongs_to :user
  has_many :comments, primary_key: :id, foreign_key: :project_id

  has_paper_trail only: [:status]
end
