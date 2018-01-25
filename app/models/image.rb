class Image < ApplicationRecord
	has_attached_file :pic, styles: { medium: "400x450>", thumb: "100x100>" }, default_url: "/images/:styles/missing.png"
	validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/
end
