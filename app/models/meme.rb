class Meme < ApplicationRecord
  # Associations
  belongs_to :category
  belongs_to :owner, class_name: "User", counter_cache: true
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :commentators, through: :comments, source: :user
  has_many :votes
  has_many :voters, through: :votes, source: user

  # Enums
  enum type: { image: "image", gif: "gif" }

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :type, presence: true
  validates :url_source, presence: true, format: {whit: %r{^https?://.+(png|gif|jpg)$}, message: "Add a valid meme URL"}
end
