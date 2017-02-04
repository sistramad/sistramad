class Document < ActiveRecord::Base
	belongs_to :user, inverse_of: :document
end
