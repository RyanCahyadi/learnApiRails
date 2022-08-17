class MasterLocation < ApplicationRecord
    before_validation :normalize_column, on: [:create, :update]
    # before_validation :normalize_column, on: :update
    validates :name, presence: true
    
    private
    def normalize_column
        self.name = name.downcase
    end
end
