class Review < ActiveRecord::Base
 validates :expert_name, :review, :rating, :wine_id, presence:true
 validates_inclusion_of :rating, in: [1, 2, 3, 4, 5], allow_blank: true


  belongs_to :wine
end
