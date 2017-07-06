class Image < ApplicationRecord
  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates :title, :presence => true
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
  belongs_to :user
  has_and_belongs_to_many :tags
  scope :tag_images, -> (user_parameter) { joins(:tags).where(tags: {name: user_parameter})} 
end
