class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }

  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations, source: :attended_event
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
end
