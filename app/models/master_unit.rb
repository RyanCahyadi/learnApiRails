class MasterUnit < ApplicationRecord

    has_many :master_product

    before_validation :normalize_column, on: [:create, :update]
    validates :name, presence: true

    private
    def normalize_column
        self.name = name.downcase
    end

end
