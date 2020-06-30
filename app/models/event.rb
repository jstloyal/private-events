class Event < ApplicationRecord
  validates :date, :location, :description, presence: true

  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :attendee
  belongs_to :creator, class_name: 'User'

  scope :all_upcoming_events, -> { where('date > ?', Time.now) }
  scope :all_past_events, -> { where('date < ?', Time.now) }
end
