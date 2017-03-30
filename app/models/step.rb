class Step < ApplicationRecord
  belongs_to :workflow
  belongs_to :group

  aasm column: 'state' do
    state :in_progress, :initial => true
    state :in_progress, :approved , :disapproved

    event :approve do
      transitions :from => [:in_progress, :disapproved], :to => :approved
    end

    event :disapprove do
      transitions :from => :in_progress, :to => :disapproved
    end

    event :reset do
      transitions :from => [:approved :disapproved], :to => :in_progress
    end
   
  end

end
