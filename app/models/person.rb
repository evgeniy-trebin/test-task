class Person < ActiveRecord::Base

  extend Ennumerize

  validates_presence_of :name, :surname, :photo

  enumerize :sex, in: [:male, :female]

end
