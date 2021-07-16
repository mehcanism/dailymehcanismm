class Task < ApplicationRecord
  belongs_to :category

  validates :status, inclusion: { in: ['PENDING', 'IN_PROGESS', 'COMPLETED'] }

  STATUS_OPTIONS = [
    ['PENDING', 'PENDING'],
    ['IN_PROGESS', 'IN_PROGESS'],
    ['COMPLETED', 'COMPLETED']
  ]

end
