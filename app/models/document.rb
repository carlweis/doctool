class Document < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :state, presence: true
  validates :permalink, presence: true, uniqueness: true

  def self.find_by_id_or_permalink(id:)
    if id.to_i.positive?
      find_by(id: id)
    else
      find_by(permalink: id.downcase.parameterize)
    end
  end
end
