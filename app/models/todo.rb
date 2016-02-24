class Todo < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :title, :project
end
