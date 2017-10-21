class Step < ApplicationRecord
  include AASM
  belongs_to :workflow
  belongs_to :group

  aasm column: 'state' do
    state :in_draft, :initial => true
    
    state :in_draft, :in_progress, :approved , :disapproved

    event :start do
      transitions :from => :in_draft, :to => :in_progress
    end

    event :approve do
      transitions :from => [:in_progress, :disapproved], :to => :approved
    end

    event :disapprove do
      transitions :from => :in_progress, :to => :disapproved
    end

    event :reset do
      transitions :from => [:in_progress,:approved,:disapproved], :to => :in_draft
    end

     #for testing:
    event :restart do 
      transitions :from => [:approved, :in_progress], :to => :in_draft
    end
   
  end


end
