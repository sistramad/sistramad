class LicensePeriod < ApplicationRecord
  has_many :license_infos
  has_many :procedures, through: :license_info
end
