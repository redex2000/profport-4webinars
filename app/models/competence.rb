class Competence < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 255 }

  def self.search(search_string=nil)
    if search_string
      where('name like ?', "%#{search_string}%")
    else
      all
    end
  end

end
