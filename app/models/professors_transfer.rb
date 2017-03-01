class ProfessorsTransfer < ActiveRecord::Base
  include AASM
  belongs_to :user
  accepts_nested_attributes_for :user
  has_many :attachments

  aasm column: "status" do    
  	
  	state :DR, :initial => true #DR stands for Drafted(Borrador)
  	state :IP, :AP, :RE, :CL 

  	event :procesar do
      transitions :from => :DR, :to => :IP
    end 

  end
end
