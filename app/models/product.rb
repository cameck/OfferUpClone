class Product < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :photo,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates :photo, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :photo
  validates_with AttachmentSizeValidator, attributes: :photo, less_than: 1.megabytes

  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    format("%.2f", price_in_dollars)
  end
end
