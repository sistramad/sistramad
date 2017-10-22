class FormalitiesMaster < ActiveRecord::Base
	has_many :formalities_documents
	has_many :documents, through: :formalities_documents
end
