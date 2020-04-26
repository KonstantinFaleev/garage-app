class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :tasks, -> { order(position: :asc) }

end
