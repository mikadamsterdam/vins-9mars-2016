class Wine < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  # validates :wine_name, :wine_description, :wine_origin, presence:true
end


def average_rating
  #self.reviews.average(:rating).round if self.reviews.present?
  if self.reviews.present?
    self.reviews.average(:rating).round
  else
    return 0
  end
end
