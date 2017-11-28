class Task < ApplicationRecord
  enum importance: [:high, :middle, :low]
end
