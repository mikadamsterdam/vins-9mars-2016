class Review < ActiveRecord::Base
 # validates :expert_name, :review, :rating, :wine_id, presence:true
  belongs_to :wine
end
