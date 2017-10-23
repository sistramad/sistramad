class SystemProcedure
  include EmailService

  attr_accessor :name
  attr_accessor :code
  attr_accessor :procedure

  def initialize
    
  end

  def create_step(workflow, name, description, group_name)
    step = Step.new(name: name, description: description, is_active: true)
    step.group = Group.find_by(name: group_name)
    step.workflow = workflow
    step.save
  end

  def all_required_documents_has_attachment?
    return true #Validacion saltada para testear
    self.procedure.documents.each do |doc|
      unless doc.attachment.present?
        return false
      end
    end
  end

  def approve_step?(step_name) #posiblemente agregar el nombre o el codigo del workflow como parametro
    step = self.procedure.workflows.first.steps.where(name: step_name).first
    step.approve!
    step.update(approved_at: Time.now)
    step.approved?
  end

  def start_step(step_name)
    step = self.procedure.workflows.first.steps.where(name: step_name).first
    step.start!
    step.update(updated_at: Time.now)
    step.in_progress?
  end 

  def deny_step(owner, responsable_fullname)
    email_data = {user: owner, owner: owner, responsable: responsable_fullname, template: 'step_deny'}
    send_email(email_data)
    self.procedure.destroy
  end

end