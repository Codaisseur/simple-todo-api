class Project < ActiveRecord::Base
  has_many :todos

  validates_presence_of :title
end
