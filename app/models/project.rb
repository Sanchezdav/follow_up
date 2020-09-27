class Project < ApplicationRecord
  belongs_to :user
  has_rich_text :description

  validates :name, presence: true, length: {minimum: 2, maximum: 50}
end
