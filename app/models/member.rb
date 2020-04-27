class Member < ApplicationRecord
    has_one :address, dependent: :destroy
end
