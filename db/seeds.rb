# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#  Mayor.create(name: 'Emanuel', city: cities.first)

Role.new(name: "system_admin").save
Role.new(name: "admin").save

#Carga grupos de usuarios y roles
Group.new(name: "Dirección de asuntos profesorales", code: "D20", description: "Miembros de la dirección de asuntos profesorales", active: true).save
Role.new(name: "asuntos_profesorales").save

Group.new(name: "Consejo de departamento", code: "C10", description: "Miembros del consejo de departamento", active: true).save
Role.new(name: "consejo_departamento").save

Group.new(name: "Consejo de facultad", code: "C20", description: "Miembros del consejo de facultad", active: true).save
Role.new(name: "consejo_facultad").save

Group.new(name: "Representante de Facultad", code: "R10", description: "Representantes de Facultad", active: true).save
Role.new(name: "representante_facultad").save

Group.new(name: "Consejo Universitario", code: "C30", description: "Concejo Universitario", active: true).save
Role.new(name: "consejo_universitario").save

Group.new(name: "Jefe de Departamento", code: "J10", description: "Jefe de Departamento", active: true).save
Role.new(name: "jefe_departamento").save

Group.new(name: "Director de Departamento", code: "D30", description: "Director del Departamento", active: true).save
Role.new(name: "director_departamento").save

Group.new(name: "Decano", code: "D40", description: "Decano", active: true).save
Role.new(name: "decano").save

Group.new(name: "Director de Escuela", code: "D50", description: "Director del Departamento", active: true).save
Role.new(name: "director_escuela").save

#Usuarios con Roles
user = User.new(:username => 'test',
                :email => 'test@test.com',
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.save!(:validate => false)
user.add_role(:test)

user = User.new(:username => 'joalbert',
                :email => 'joalbertgonzalez@gmail.com',
                :first_name => 'joalbert',
                :middle_name => 'andrés',
                :last_name => 'gonzález',
                :identification_document => '18468784',
                :birthday => "24/11/1988".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
               :password_confirmation => '123456')
user.save!
user.add_role(:admin)

user = User.new(:username => 'jesusdeabreu',
                :email => 'jmanueldeabreum@gmail.com',
                :first_name => 'jesus',
                :middle_name => 'manuel',
                :last_name => 'de abreu',
                :genre => 'm',
                :identification_document => '18241890',
                :birthday => "21/12/1988".to_date,
                :password => 'jmdam182', #Devise.friendly_token[0,20]
                :password_confirmation => 'jmdam182')
user.save!
user.add_role(:admin)

user = User.new(:username => 'amatute',
                :email => 'alexghoro@outlook.com',
                :first_name => 'Alejandro',
                :middle_name => '',
                :last_name => 'Matute',
                :genre => 'm',
                :identification_document => '18347734',
                :birthday => "15/08/1988".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.save!
user.add_role(:admin)
user.add_role(:system_admin)

user = User.new(:username => 'jceballos',
                :email => 'jonnyceballos@gmail.com',
                :first_name => 'Jonny',
                :middle_name => '',
                :last_name => 'Ceballos',
                :genre => 'm',
                :identification_document => '17755525',
                :birthday => "02/06/1986".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.save!
user.add_role(:admin)
user.add_role(:system_admin)

user = User.new(:username => 'lisset',
                :email => 'liss612@gmail.com',
                :first_name => 'lisset',
                :middle_name => 'alexandra',
                :last_name => 'orozco',
                :genre => 'f',
                :identification_document => '18686803',
                :birthday => "06/10/1987".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.save!


user = User.new(:username => 'asupro',
        :email => 'asuntosprofesoralesuc@correok.com',
        :first_name => 'Dirección de asuntos profesorales',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '10',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.save!
user.add_role(:asuntos_profesorales)
user.add_role(:admin)

user = User.new(:username => 'condep',
        :email => 'consejodedepartamento@correo.com',
        :first_name => 'Consejo de departamento',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '20',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.save!
user.add_role(:consejo_departamento)
user.add_role(:admin)


user = User.new(:username => 'confac',
        :email => 'consejodefacultad@correo.com',
        :first_name => 'Consejo de facultad',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '30',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.save!
user.add_role(:consejo_facultad)
user.add_role(:admin)

user = User.new(:username => 'repfac',
        :email => 'representantedefacultad@correo.com',
        :first_name => 'Representante de Facultad',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '40',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.save!
user.add_role(:representante_facultad)
user.add_role(:admin)

user = User.new(:username => 'conuni',
        :email => 'consejouniversitario@correo.com',
        :first_name => 'Consejo Universitario',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '50',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.save!
user.add_role(:consejo_universitario)
user.add_role(:admin)

user = User.new(:username => 'jefdep',
        :email => 'jefedepartamento@correo.com',
        :first_name => 'Jefe de Departamento',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '60',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.save!
user.add_role(:jefe_departamento)
user.add_role(:admin)

user = User.new(:username => 'dirdep',
        :email => 'direcciondepartamento@correo.com',
        :first_name => 'Director de Departamento',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '70',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.save!
user.add_role(:director_departamento)
user.add_role(:admin)


user = User.new(:username => 'decano',
        :email => 'decano@correo.com',
        :first_name => 'Decano',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '80',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.save!
user.add_role(:decano)
user.add_role(:docente)
user.add_role(:admin)

user = User.new(:username => 'diresc',
        :email => 'directorescuela@correo.com',
        :first_name => 'Director Escuela',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '90',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.save!
user.add_role(:director_escuela)
user.add_role(:admin)

reference_region = Reference.new(:name => 'region') #1
reference_region.save!

reference_sub_region = Reference.new(:name => 'sub_region') #2
reference_sub_region.save!


region = ReferenceList.new(:name => 'without region', :reference_id => ReferenceConstant::REGION) #1
region.save!

sub_region = ReferenceList.new(:name => 'without sub region', :reference_id => ReferenceConstant::SUB_REGION) #2
sub_region.save!

region = ReferenceList.new(:name => 'asia', :reference_id => ReferenceConstant::REGION) #3
region.save!

region = ReferenceList.new(:name => 'europe', :reference_id => ReferenceConstant::REGION) #4
region.save!

region = ReferenceList.new(:name => 'africa', :reference_id => ReferenceConstant::REGION) #5
region.save!

region = ReferenceList.new(:name => 'oceania', :reference_id => ReferenceConstant::REGION) #6
region.save!

region = ReferenceList.new(:name => 'americas', :reference_id => ReferenceConstant::REGION) #7
region.save!

sub_region = ReferenceList.new(:name => 'southern asia', :reference_id => ReferenceConstant::SUB_REGION) #8
sub_region.save!

sub_region = ReferenceList.new(:name => 'northern europe', :reference_id => ReferenceConstant::SUB_REGION) #9
sub_region.save!

sub_region = ReferenceList.new(:name => 'southern europe', :reference_id => ReferenceConstant::SUB_REGION) #10
sub_region.save!

sub_region = ReferenceList.new(:name => 'northern africa', :reference_id => ReferenceConstant::SUB_REGION) #11
sub_region.save!

sub_region = ReferenceList.new(:name => 'polynesia', :reference_id => ReferenceConstant::SUB_REGION) #12
sub_region.save!

sub_region = ReferenceList.new(:name => 'middle africa', :reference_id => ReferenceConstant::SUB_REGION) #13
sub_region.save!

sub_region = ReferenceList.new(:name => 'caribbean', :reference_id => ReferenceConstant::SUB_REGION) #14
sub_region.save!

sub_region = ReferenceList.new(:name => 'south america', :reference_id => ReferenceConstant::SUB_REGION) #15
sub_region.save!

sub_region = ReferenceList.new(:name => 'western asia', :reference_id => ReferenceConstant::SUB_REGION) #16
sub_region.save!

sub_region = ReferenceList.new(:name => 'australia and new zealand', :reference_id => ReferenceConstant::SUB_REGION) #17
sub_region.save!

sub_region = ReferenceList.new(:name => 'western europe', :reference_id => ReferenceConstant::SUB_REGION) #18
sub_region.save!

sub_region = ReferenceList.new(:name => 'eastern europe', :reference_id => ReferenceConstant::SUB_REGION) #19
sub_region.save!

sub_region = ReferenceList.new(:name => 'central america', :reference_id => ReferenceConstant::SUB_REGION) #20
sub_region.save!

sub_region = ReferenceList.new(:name => 'western africa', :reference_id => ReferenceConstant::SUB_REGION) #21
sub_region.save!

sub_region = ReferenceList.new(:name => 'northern america', :reference_id => ReferenceConstant::SUB_REGION) #22
sub_region.save!

sub_region = ReferenceList.new(:name => 'southern africa', :reference_id => ReferenceConstant::SUB_REGION) #23
sub_region.save!

sub_region = ReferenceList.new(:name => 'eastern africa', :reference_id => ReferenceConstant::SUB_REGION) #24
sub_region.save!

sub_region = ReferenceList.new(:name => 'south-eastern asia', :reference_id => ReferenceConstant::SUB_REGION) #25
sub_region.save!

sub_region = ReferenceList.new(:name => 'eastern asia', :reference_id => ReferenceConstant::SUB_REGION) #26
sub_region.save!

sub_region = ReferenceList.new(:name => 'melanesia', :reference_id => ReferenceConstant::SUB_REGION) #27
sub_region.save!

sub_region = ReferenceList.new(:name => 'micronesia', :reference_id => ReferenceConstant::SUB_REGION) #28
sub_region.save!

sub_region = ReferenceList.new(:name => 'central asia', :reference_id => ReferenceConstant::SUB_REGION) #29
sub_region.save!

reference_classification = Reference.new(:name => 'classification') #3
reference_classification.save!

reference_category = Reference.new(:name => 'category') #4
reference_category.save!

classification = ReferenceList.new(:name => 'instructor', :value => '1', :reference_id => ReferenceConstant::SCALE_CLASSIFICATION) #30
classification.save!

classification = ReferenceList.new(:name => 'asistente', :value => '2', :reference_id => ReferenceConstant::SCALE_CLASSIFICATION) #31
classification.save!

classification = ReferenceList.new(:name => 'agregado', :value => '3', :reference_id => ReferenceConstant::SCALE_CLASSIFICATION) #32
classification.save!

classification = ReferenceList.new(:name => 'asociado', :value => '4', :reference_id => ReferenceConstant::SCALE_CLASSIFICATION) #33
classification.save!

classification = ReferenceList.new(:name => 'titular', :value => '5', :reference_id => ReferenceConstant::SCALE_CLASSIFICATION) #34
classification.save!

category = ReferenceList.new(:name => 'categoria I', :value => '1', :reference_id => ReferenceConstant::SCALE_CATEGORY) #35
category.save!

category = ReferenceList.new(:name => 'categoria II', :value => '2', :reference_id => ReferenceConstant::SCALE_CATEGORY) #36
category.save!

category = ReferenceList.new(:name => 'categoria III', :value => '3', :reference_id => ReferenceConstant::SCALE_CATEGORY) #37
category.save!

category = ReferenceList.new(:name => 'categoria IV', :value => '4', :reference_id => ReferenceConstant::SCALE_CATEGORY) #38
category.save!

category = ReferenceList.new(:name => 'categoria V', :value => '5', :reference_id => ReferenceConstant::SCALE_CATEGORY) #39
category.save!

reference_type_employee = Reference.new(:name => 'type_employee') #5
reference_type_employee.save!

type_employee = ReferenceList.new(:name => 'docente', :reference_id => ReferenceConstant::TYPE_EMPLOYEE) #40
type_employee.save!

type_employee = ReferenceList.new(:name => 'de investigacion', :reference_id => ReferenceConstant::TYPE_EMPLOYEE) #41
type_employee.save!

type_employee = ReferenceList.new(:name => 'aux docente', :reference_id => ReferenceConstant::TYPE_EMPLOYEE) #42
type_employee.save!

type_employee = ReferenceList.new(:name => 'aux de investigacion', :reference_id => ReferenceConstant::TYPE_EMPLOYEE) #43
type_employee.save!



faculty = Faculty.new(:name => 'facultad de ciencias y tecnología', :acronym => 'FaCyT')
faculty.save!

faculty = Faculty.new(:name => 'facultad de ciencias de la educación', :acronym => 'FaCE')
faculty.save!

faculty = Faculty.new(:name => 'facultad de ciencias de la salud', :acronym => 'FCS')
faculty.save!

faculty = Faculty.new(:name => 'facultad de ciencias económicas y sociales', :acronym => 'FaCES')
faculty.save!

faculty = Faculty.new(:name => 'facultad de ciencias juridicas y politicas', :acronym => 'FCJP')
faculty.save!

faculty = Faculty.new(:name => 'facultad de ingeniería', :acronym => 'FACING')
faculty.save!

faculty = Faculty.new(:name => 'facultad de odontología', :acronym => 'FAO')
faculty.save!

#Carga el Maestro de Documentos:

#Año Sabático:
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Año Sabático", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Año Sabático", active: true, initially_required: true ).save
DocumentMaster.new(name: "Carta de Aceptación", code: "CAC", procedure: "Año Sabático", active: true, initially_required: true ).save
DocumentMaster.new(name: "Utimo ascenso", code: "UAS", procedure: "Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Sintesis curricular", code: "SCU", procedure: "Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Solvencia Biblioteca", code: "SBI", procedure: "Año Sabático", active: true, initially_required: true ).save
DocumentMaster.new(name: "Solvencia DAE", code: "SDAE", procedure: "Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Certificado de idioma", code: "CID", procedure: "Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Plan de Trabajo", code: "PDT", procedure: "Año Sabático", active: true , initially_required: false).save
DocumentMaster.new(name: "Constancia de antiguedad", code: "CDA", procedure: "Año Sabático", active: true , initially_required: false).save
DocumentMaster.new(name: "Constancia de aprobación", code: "CDAP", procedure: "Año Sabático", active: true , initially_required: false).save

#Modificación de Plan de Trabajo:
DocumentMaster.new(name: "Plan de Trabajo Modificado", code: "PDTM", procedure: "Modificación de Plan de Trabajo", active: true , initially_required: true).save
DocumentMaster.new(name: "Documento Probatorio de Modificación", code: "DPDM", procedure: "Modificación de Plan de Trabajo", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación de Modificación del Plan de Trabajo", code: "AMPDT", procedure: "Modificación de Plan de Trabajo", active: true , initially_required: false).save

#Informe Parcial de Actividades:
DocumentMaster.new(name: "Informe Parcial", code: "IP", procedure: "Aprobación de Informe Parcial de Actividades", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación del Informe Parcial", code: "AIP", procedure: "Aprobación de Informe Parcial de Actividades", active: true , initially_required: false).save

#Informe Final de Actividades:
DocumentMaster.new(name: "Informe Final", code: "IF", procedure: "Aprobación de Informe Final de Actividades", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación del Informe Final", code: "AIF", procedure: "Aprobación de Informe Final de Actividades", active: true , initially_required: false).save

#Diferimiento de Año Sabático:
DocumentMaster.new(name: "Oficio de solicitud de diferimiento", code: "OSD", procedure: "Diferimiento de Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación de solicitud de diferimiento", code: "ASD", procedure: "Diferimiento de Año Sabático", active: true , initially_required: false).save

#Reincorporación luego de disfrute de Año Sabático:
DocumentMaster.new(name: "Oficio de solicitud de reincorporación", code: "OSR", procedure: "Reincorporación luego del disfrute del Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación de solicitud de reincorporación", code: "ASR", procedure: "Reincorporación luego del disfrute del Año Sabático", active: true , initially_required: false).save


#Plan de Formacion Especial:
DocumentMaster.new(name: "Programa de Formación Especial", code: "D-PFE", procedure: "Programa de Formación Especial", active: true , initially_required: true ).save

#Plan de Rotacion
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Plan de Rotación", active: true, initially_required: true ).save
DocumentMaster.new(name: "Carta de Propósito", code: "D-MPC", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Carta de Asunción Compartida", code: "D-MAC", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Carta de Aceptación de Condiciones", code: "D-CAC", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Carta de Aceptación de Cumplir Plan", code: "D-ACP", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Carta de Aceptación del Departamento", code: "D-ADP", procedure: "Plan de Rotación", active: true , initially_required: true ).save

#Modificacion del Plan de Rotacion
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Modificación del Plan de Rotación", active: true, initially_required: true ).save
DocumentMaster.new(name: "Oficio de Solicitud", code: "D-OS", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Modificación del Plan de Actividades", code: "D-MP", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Documentos probatorios", code: "D-PMP", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save

#Modificacion del Plan de Rotacion
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Modificación del Plan de Rotación", active: true, initially_required: true ).save
DocumentMaster.new(name: "Oficio de Solicitud", code: "D-OS", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Modificación del Plan de Actividades", code: "D-MP", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Documentos probatorios", code: "D-PMP", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save

#Prorroga del Plan de Rotacion
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Prórroga del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Prórroga del Plan de Rotación", active: true, initially_required: true ).save
DocumentMaster.new(name: "Oficio de Solicitud", code: "D-OS", procedure: "Prórroga del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Documentos probatorios", code: "D-PPP", procedure: "Prórroga del Plan de Rotación", active: true , initially_required: true ).save

#Licencias
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Licencia", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Solicitud del Beneficiario", code: "D-SOL", procedure: "Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Justificación de la Licencia", code: "D-JL", procedure: "Licencia", active: true, initially_required: true ).save

#Prorroga de Licencia
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Prórroga de Licencia", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Justificacón de la Pŕorroga", code: "D-JL", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Solicitud del beneficiario", code: "D-SB", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Documento probatorio", code: "D-DP", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Plan de trabajo o actividades", code: "D-PDT", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save

#Reincorporacion luego de licencia
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Reincorporación luego de Licencia", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Reincorporación luego de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Oficio de Solicitud", code: "D-OS", procedure: "Reincorporación luego de Licencia", active: true , initially_required: true ).save


#Maestro de tipos de licencias
LicenseType.new(code: "1", name: "Enfermedad", description:"Licencia otorgada por enfermedad", active: true).save
LicenseType.new(code: "2", name: "Estudios", description:"Licencia otorgada para estudios", active: true).save
LicenseType.new(code: "3", name: "Misiones y comisiones de la Universidad", description:"Licencia otorgada para misiones y comisiones de la Universidad", active: true).save
LicenseType.new(code: "4", name: "Ejercer funciones en los Subsistemas de Educación", description:"Licencia otorgada para ejercer funciones en los Subsistemas de Educación", active: true).save
LicenseType.new(code: "5", name: "Ocupar cargos relevantes en la administración pública", description:"Licencia otorgada para ocupar cargos relevantes en la administración pública ", active: true).save
LicenseType.new(code: "6", name: "Cuaquier otro fin", description:"Licencia otorgada para cualquier otro fin", active: true).save

#Maestro de periodos de licencias
LicensePeriod.new(code: "1", name: "Hasta 15 días", description: "De 1 a 15 días", days: 15, months: 0, years: 0, active: true).save
LicensePeriod.new(code: "2", name: "Hasta 30 días", description: "De 1 a 30 días", days: 30, months: 0, years: 0, active: true).save
LicensePeriod.new(code: "3", name: "Hasta 90 días", description: "De 1 a 90 días", days: 90, months: 0, years: 0, active: true).save
LicensePeriod.new(code: "4", name: "Mayor a 90 días", description: "Mas de 90 días", days: 90, months: 0, years: 0, active: true).save

#Seeds de Luis

employee = Employee.new(:user_id => 5,:type_employee_id => 2,:scale_classification_id => 1,:scale_category_id => 2)
employee.faculties << Faculty.find(1)
employee.save!


employee = Employee.new(:user_id => 3,:type_employee_id => 2,:scale_classification_id => 1,:scale_category_id => 2)
employee.faculties << Faculty.find(1)
employee.save!

employee = Employee.new(:user_id => 4,:type_employee_id => 2,:scale_classification_id => 1,:scale_category_id => 2)
employee.faculties << Faculty.find(1)
employee.save!

document = JointplanDocument.new(:name => 'Solicitud del Beneficiario', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Fotocopia de la Cedula de identidad', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Fotocopia del RIF',:typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Fotocopia del ultimo ascenso', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Plan de Trabajo', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Justificacion de la escogencia del Plan', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Razones de la escogencia del pais', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Carta de aceptacion de cumplir con lo estipulado', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Constancia de aceptacion por parte de la Universidad en la que desea realizar los estudios', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Certificacion academica', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Solvencias', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Sintesis curricular', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Constancia de manejo de idioma foraneo', :typedoc =>2)
document.save!
document = JointplanDocument.new(:name => 'Carta de Recomendacion de Aprobacion', :typedoc =>0)
document.save!
document = JointplanDocument.new(:name => 'Carta de desaprobacion' , :typedoc =>0)
document.save!
document = JointplanDocument.new(:name => 'Informe Parcial', :typedoc =>3)
document.save!
document = JointplanDocument.new(:name => 'Informe Final' , :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Carta de Aceptación', :typedoc =>0)
document.save!

JointPlan.new(:name => "Plan Conjunto",:user_id => 3,:status => 1).save!

JointPlan.new(:name => "Plan Conjunto",:user_id => 4,:status => 1).save!

JointPlan.new(:name => "Plan Conjunto",:user_id => 14,:status => 1).save!