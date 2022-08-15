class MasterBrand < ApplicationRecord
    before_validation :normalize_column, on: :create
    validates :name, presence: true
    validates :initial, length: {maximum: 2}, uniqueness: true
    private
    def normalize_column
        self.name = name.downcase
        self.description = description.downcase
        self.initial = initial.upcase
    end
end
