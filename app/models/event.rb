class Event < ActiveRecord::Base

  belongs_to :user
  validates_presence_of :author_id

end
