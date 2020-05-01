class Address < ApplicationRecord
  belongs_to :member, dependent: :destroy
end
