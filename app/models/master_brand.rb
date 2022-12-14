class MasterBrand < ApplicationRecord
    
    has_many :master_product
    
    before_validation :normalize_column, on: [:create, :update]
    # before_validation :normalize_column, on: :update
    validates :name, presence: true
    validates :initial, length: {maximum: 2}, uniqueness: true
    
    private
    def normalize_column
        self.name = name.downcase
        self.description = description.downcase
        self.initial = initial.upcase
    end
end
