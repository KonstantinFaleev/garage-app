class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :tasks, -> { order(position: :asc) }

  validates :title, presence: true, length: {maximum: 255}

end
