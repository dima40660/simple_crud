class Task < ApplicationRecord
  enum importance: [:high, :middle, :low]
  belongs_to :user
end
