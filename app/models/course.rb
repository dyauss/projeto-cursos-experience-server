class Course < ApplicationRecord
  validates :title, presence: true
  validates :topic, presence: true
  validates :subtopic, presence: true
end
