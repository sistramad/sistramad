class LicenseInfo < ApplicationRecord
  belongs_to :procedure
  belongs_to :license_type
  belongs_to :license_period
end