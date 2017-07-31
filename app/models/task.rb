class Task < ApplicationRecord
  validates :content, presence: true, length: {minimum: 5, maximum: 144}

  belongs_to :user, dependent: :destroy
end
