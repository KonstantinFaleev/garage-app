class Task < ApplicationRecord
  belongs_to :list

  acts_as_list scope: :list

  validates :name, presence: true, length: {maximum: 255}

  def completed?
    !done.blank?
  end
end
