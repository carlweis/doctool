class Document < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :state, presence: true
  validates :permalink, presence: true, uniqueness: true
end
