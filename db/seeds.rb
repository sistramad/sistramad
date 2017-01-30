# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(:username => 'admin',
                :email => 'admin@admin.com',
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.save!(:validate => false)

user.add_role(:admin)

user = User.new(:username => 'test',
                :email => 'test@test.com',
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.save!(:validate => false)

user.add_role(:docente)

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
user.add_role(:docente)

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

user.add_role(:docente)

user = User.new(:username => 'marcano',
                :email => 'marcano@test.com',
                :first_name => 'jose',
                :middle_name => 'x',
                :last_name => 'marcano',
                :genre => 'm',
                :identification_document => '1000',
                :birthday => "06/10/1960".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.save!
user.add_role(:docente)
user.add_role(:decano)

user = User.new(:username => 'asuntos',
                :email => 'asuntos@test.com',
                :first_name => 'Asuntos',
                :middle_name => 'x',
                :last_name => 'Profesorales',
                :genre => 'm',
                :identification_document => '1000',
                :birthday => "06/10/1960".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.save!
user.add_role(:docente)
user.add_role(:asuntos)

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

employee = Employee.new(:user_id => 5,:type_employee_id => 2,:scale_classification_id => 1,:scale_category_id => 2)
employee.faculties << Faculty.find(1)
employee.save!


employee = Employee.new(:user_id => 3,:type_employee_id => 2,:scale_classification_id => 1,:scale_category_id => 2)
employee.faculties << Faculty.find(1)
employee.save!

employee = Employee.new(:user_id => 4,:type_employee_id => 2,:scale_classification_id => 1,:scale_category_id => 2)
employee.faculties << Faculty.find(1)
employee.save!

document = Document.new(:name => 'Solicitud del Beneficiario')
document.save!
document = Document.new(:name => 'Fotocopia de la Cedula de identidad')
document.save!
document = Document.new(:name => 'Fotocopia del RIF')
document.save!
document = Document.new(:name => 'Fotocopia del ultimo ascenso')
document.save!
document = Document.new(:name => 'Plan de Trabajo')
document.save!
document = Document.new(:name => 'Justificacion de la escogencia del Plan')
document.save!
document = Document.new(:name => 'Razones de la escogencia del pais')
document.save!
document = Document.new(:name => 'Carta de aceptacion de cumplir con lo estipulado')
document.save!
document = Document.new(:name => 'Constancia de aceptacion por parte de la Universidad en la que desea realizar los estudios')
document.save!
document = Document.new(:name => 'Certificacion academica')
document.save!
document = Document.new(:name => 'Solvencias')
document.save!
document = Document.new(:name => 'Sintesis curricular')
document.save!
document = Document.new(:name => 'Constancia de manejo de idioma foraneo')
document.save!
document = Document.new(:name => 'Carta de Recomendacion de Aprobacion')
document.save!
document = Document.new(:name => 'Carta de desaprobacion')
document.save!
document = Document.new(:name => 'Informe Parcial')
document.save!
document = Document.new(:name => 'Informe Final')
document.save!
document = Document.new(:name => 'Carta de Aceptación')
document.save!
joint_plan = JointPlan.new(:name => "Plan Conjunto",:user_id => 3,:status => 1)
joint_plan.save!

joint_plan = JointPlan.new(:name => "Plan Conjunto",:user_id => 4,:status => 1)
joint_plan.save!