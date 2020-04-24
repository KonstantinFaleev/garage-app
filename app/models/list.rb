class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  acts_as_list scope: :list

  def completed?
    !done.blank?
  end
end
