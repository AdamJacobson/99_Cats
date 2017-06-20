class Cat < ApplicationRecord
  COLORS = ['Calico', 'Tabby', 'Tuxedo', 'Tiger']
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: { in: ['F', 'M'], message: "%{value} is not an accepted value" }
  validates :color, inclusion: { in: COLORS, message: "%{value} is not an accepted value" }

  def age
    Date.today.year - birth_date.year
  end

  def colors
    COLORS
  end

end
