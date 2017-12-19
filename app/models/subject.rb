class Subject < ApplicationRecord
    has_many :enrolls
    has_many :documents
    has_many :students, through: :enrolls
    belongs_to :teacher
end