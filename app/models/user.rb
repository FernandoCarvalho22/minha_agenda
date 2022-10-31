class User < ApplicationRecord
    has_many :addresses

    def address
        self.addresses.first
    end
end
