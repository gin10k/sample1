class Contact < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Contact.all unless search
    Contact.where('text LIKE(?)',"%#{search}%")
  end
end
