class Event < ActiveRecord::Base

  belongs_to :user
  validates_presence_of :author_id

  self.per_page = 7

end
