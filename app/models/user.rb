class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :events

  def sum_scoreboard
    events = Event.where(author_id: self.id)

    event_type_points = []

    events.each do |event|
      event_type_points << EventType.find(event.event_type_id).points
    end

    return event_type_points.inject(0){ |sum, point| sum += point}
  end

end
