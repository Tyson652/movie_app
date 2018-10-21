class Movie < ApplicationRecord
  has_many :reviews
  has_one_attached :image

  def thumbnail
    return self.image.variant(resize: '300x300')
  end
end
