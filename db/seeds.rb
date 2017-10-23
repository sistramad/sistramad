Role.create!([
  {name: "admin", resource_id: nil, resource_type: nil},
  {name: "test", resource_id: nil, resource_type: nil},
  {name: "docente", resource_id: nil, resource_type: nil},
  {name: "decano", resource_id: nil, resource_type: nil},
  {name: "asuntos", resource_id: nil, resource_type: nil},
  {name: "departamento", resource_id: nil, resource_type: nil},
  {name: "Consejo_Departamento", resource_id: nil, resource_type: nil},
  {name: "Consejo_Facultad", resource_id: nil, resource_type: nil},
  {name: "Consejo_Escuela", resource_id: nil, resource_type: nil},
  {name: "Consejo_Universitario", resource_id: nil, resource_type: nil},
  {name: "Jefe_Departamento", resource_id: nil, resource_type: nil}
])
user = User.new(:id => 1,
                :username => 'admin',
                :email => 'admin@admin.com',
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:admin)                
user.save!(:validate => false)

user = User.new(:id => 2,
                :username => 'test',
                :email => 'test@test.com',
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:test)                
user.save!(:validate => false)
User.create!([
  {id: 3,username: "joalbert", first_name: "joalbert", middle_name: "andrés", last_name: "gonzález", genre: "m", identification_document: "18468784", birthday: "1988-11-24", email: "joalbertgonzalez@gmail.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-01-17 00:01:48", sign_in_count: 14, current_sign_in_at: "2017-10-16 08:26:15", last_sign_in_at: "2017-08-24 03:29:27", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  # 3
  {id: 4,username: "lisset", first_name: "lisset", middle_name: "alexandra", last_name: "orozco", genre: "f", identification_document: "18686803", birthday: "1987-10-06", email: "liss612@gmail.com",password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-01-17 00:01:49", sign_in_count: 13, current_sign_in_at: "2017-10-16 08:25:38", last_sign_in_at: "2017-08-28 06:47:14", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  # 4
 {id: 5,username: "jesusdeabreu", first_name: "Jesus", middle_name: "Manuel", last_name: "De abreu", genre: "m", identification_document: "18241891", birthday: "1988-12-21", email: "jemadam2@hotmail.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-01-27 04:09:53", sign_in_count: 74, current_sign_in_at: "2017-10-20 23:23:07", last_sign_in_at: "2017-10-20 03:08:04", current_sign_in_ip: "::1", last_sign_in_ip: "::1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: "jesusdeabreu.png"},
  # 8 -> 5
  {id: 13,username: "marcano", first_name: "jose", middle_name: "x", last_name: "marcano", genre: "m", identification_document: "1000", birthday: "1960-10-06", email: "marcano@test.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-02-08 03:06:33", sign_in_count: 13, current_sign_in_at: "2017-10-20 05:02:32", last_sign_in_at: "2017-10-20 04:46:09", current_sign_in_ip: "::1", last_sign_in_ip: "::1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  #13 -> 6
  {id: 14,username: "asuntos", first_name: "Asuntos", middle_name: "x", last_name: "Profesorales", genre: "m", identification_document: "1000", birthday: "1960-10-06", email: "jmanueldeabreum@gmail.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-02-08 03:06:34", sign_in_count: 7, current_sign_in_at: "2017-10-20 05:38:25", last_sign_in_at: "2017-10-20 04:54:26", current_sign_in_ip: "::1", last_sign_in_ip: "::1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  #14 -> 7
  {id: 15,username: "iperez", first_name: "ivan", middle_name: "enrique", last_name: "perez", genre: "m", identification_document: "19878987", birthday: "1990-12-14", email: "jemadam@hotmail.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-08-29 03:01:04", sign_in_count: 6, current_sign_in_at: "2017-10-21 18:17:54", last_sign_in_at: "2017-10-20 23:26:36", current_sign_in_ip: "::1", last_sign_in_ip: "::1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  #15 -> 8
  {id: 20,username: "consejodepartamento", first_name: "Consejo", middle_name: "x", last_name: "Departamental", genre: "m", identification_document: "1001", birthday: "1965-10-06", email: "consejodepartamental@test.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-09-09 04:07:46", sign_in_count: 10, current_sign_in_at: "2017-10-20 04:31:47", last_sign_in_at: "2017-10-08 01:50:44", current_sign_in_ip: "::1", last_sign_in_ip: "127.0.0.1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  #20 -> 9
  {id: 21,username: "departamento", first_name: "Departamento", middle_name: "x", last_name: "Departamento", genre: "m", identification_document: "1002", birthday: "1966-10-06", email: "departamento@test.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-09-09 04:07:47", sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  #21 -> 10
  {id: 22,username: "consejoescuela", first_name: "Consejo", middle_name: "x", last_name: "Escuela", genre: "m", identification_document: "1003", birthday: "1967-10-06", email: "consejoescuela@test.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-09-09 04:07:47", sign_in_count: 1, current_sign_in_at: "2017-10-20 15:51:46", last_sign_in_at: "2017-10-20 15:51:46", current_sign_in_ip: "::1", last_sign_in_ip: "::1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  # 22 -> 11
  {id: 23,username: "consejofacultad", first_name: "Consejo", middle_name: "x", last_name: "Facultad", genre: "m", identification_document: "1004", birthday: "1968-10-06", email: "consejofacultad@test.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-09-09 04:07:48", sign_in_count: 4, current_sign_in_at: "2017-10-20 05:39:55", last_sign_in_at: "2017-10-16 13:40:53", current_sign_in_ip: "::1", last_sign_in_ip: "127.0.0.1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  # 23 -> 12
  {id: 24,username: "consejouniversitario", first_name: "Consejo", middle_name: "x", last_name: "Universitario", genre: "m", identification_document: "1001", birthday: "1970-10-06", email: "consejouniversitario@test.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-09-15 03:41:14", sign_in_count: 5, current_sign_in_at: "2017-09-24 13:24:16", last_sign_in_at: "2017-09-24 03:21:16", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
  # 24 -> 13
 # {id: 1,username: "admin", first_name: "", middle_name: "", last_name: "", genre: "m", identification_document: "", birthday: nil, email: "admin@admin.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-01-17 00:01:46", sign_in_count: 56, current_sign_in_at: "2017-10-21 03:58:59", last_sign_in_at: "2017-10-21 03:56:20", current_sign_in_ip: "::1", last_sign_in_ip: "::1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil}
 # {id: 2,username: "test", first_name: "", middle_name: "", last_name: "", genre: "m", identification_document: "", birthday: nil, email: "test@test.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-01-17 00:01:48", sign_in_count: 14, current_sign_in_at: "2017-10-16 08:25:06", last_sign_in_at: "2017-08-24 03:15:05", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil},
 {id:28,username: "testing", first_name: "testing", middle_name: "x", last_name: "testing", genre: "m", identification_document: "7654567", birthday: "1962-10-21", email: "testing@gmail.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-10-21 04:02:30", sign_in_count: 1, current_sign_in_at: "2017-10-21 04:03:17", last_sign_in_at: "2017-10-21 04:03:17", current_sign_in_ip: "::1", last_sign_in_ip: "::1", failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0, avatar: nil}
 #id: 28 -> 14
])
UsersRole.create!([
  {user_id: 1, role_id: 1}, 
  {user_id: 2, role_id: 2},
  {user_id: 3, role_id: 1},
  {user_id: 3, role_id: 2},
  {user_id: 4, role_id: 2},
  {user_id: 8, role_id: 1},
  {user_id: 8, role_id: 2},
  {user_id: 13, role_id: 3},
  {user_id: 13, role_id: 4},
  {user_id: 14, role_id: 3},
  {user_id: 14, role_id: 5},
  {user_id: 8, role_id: 3},
  {user_id: 19, role_id: 5},
  {user_id: 20, role_id: 6},
  {user_id: 21, role_id: 9},
  {user_id: 22, role_id: 8},
  {user_id: 23, role_id: 7},
  {user_id: 24, role_id: 10},
  {user_id: 19, role_id: 3},
  {user_id: 15, role_id: 3},
  {user_id: 28, role_id: 2}
])
Document.create!([
  {name: "Solicitud del Beneficiario", status: nil},
  {name: "Fotocopia de la Cedula de identidad", status: nil},
  {name: "Fotocopia del RIF", status: nil},
  {name: "Fotocopia del ultimo ascenso", status: nil},
  {name: "Plan de Trabajo", status: nil},
  {name: "Justificacion de la escogencia del Plan", status: nil},
  {name: "Razones de la escogencia del pais", status: nil},
  {name: "Carta de aceptacion de cumplir con lo estipulado", status: nil},
  {name: "Constancia de aceptacion por parte de la Universidad en la que desea realizar los estudios", status: nil},
  {name: "Certificacion academica", status: nil},
  {name: "Solvencias", status: nil},
  {name: "Sintesis curricular", status: nil},
  {name: "Constancia de manejo de idioma foraneo", status: nil},
  {name: "Carta de Recomendacion de Aprobacion", status: nil},
  {name: "Carta de desaprobacion", status: nil},
  {name: "Informe Parcial", status: nil},
  {name: "Informe Final", status: nil},
  {name: "Carta de Aceptación", status: nil},
  {name: "Copia Certificada Titulo Universitario", status: nil},
  {name: "Motivación Razonada para el Traslado", status: nil},
  {name: "Certificación Expedida de Secretario Universidad de Origen", status: nil},
  {name: "Copia de Oficio de Designación como Docente", status: nil},
  {name: "Copia de Oficio de Aprobación de Traslado", status: nil},
  {name: "Copia de Oficio de Aprobacion de Cambio en Dedicacion", status: nil},
  {name: "Oficio del Aval del Departamento", status: nil},
  {name: "Oficio de Consejo de Escuela", status: nil},
  {name: "Fondo Negro de Título IV Nivel", status: nil},
  {name: "Copia del Último Ascenso", status: nil},
  {name: "Copia de Curso de Certificación como Docente", status: nil}
])
FormalitiesMaster.create!([
  {name: "Traslados", description: "Se entiende por traslado al procedimiento académico administrativo mediante el cual un miembro del personal Docente y de Investigación puede ser transferido, en forma Parcial o Total, transitoria o permanentemente, a otra Unidad Académica de Adscripción en la misma Escuela, a otra Escuela o su equivalente o a otra Facultad, sin que implique un Cambio de Dedicación.", table_manager: "ProfessorsTransfer", isactive: true},
  {name: "Plan Conjunto", description: "Se entiende por Plan Conjunto a la combinación secuencial de un año sabático y una beca sueldo en la que el componente de Año Sabático queda incluido como parte del plan de formación al grado académico correspondiente y goza de todos los beneficios y soporta los deberes que se le otorgan al Becario.", table_manager: "JointPlan", isactive: false},
  {name: "Cambio de Dedicacion", description: "Se entiende por Cambio de Dedicación Temporal, al proceso mediante el cual, los miembros del personal Docente y de Investigación, por razones justificadas, a juicio del Consejo de Facultad, solicitan ante su Unidad Académica de adscripción ser clasificados en una dedicación distinta a la que poseen de manera Temporal, las cuales podrán ser solicitadas por", table_manager: "ProfessorsTransfer", isactive: true}
])
JointPlan.create!([
  {name: "Plan Conjunto", user_id: 3, status: 1, created: nil},
  {name: "Plan Conjunto", user_id: 4, status: 1, created: nil},
  {name: "Plan Conjunto", user_id: 8, status: nil, created: nil},
  {name: "Plan Conjunto", user_id: 2, status: nil, created: nil}
])
ProfessorsTransfer.create!([
  {name: "Traslados", status: "AP", user_id: 15, isactive: nil, processed: nil, isapproved: nil, faculty_from_id: 62, faculty_to_id: 68, type_of_translate: 8, process_type: 1},
  {name: "Traslados", status: "IP", user_id: 8, isactive: nil, processed: nil, isapproved: nil, faculty_from_id: 48, faculty_to_id: 47, type_of_translate: 7, process_type: 1},
  {name: "Cambio de Dedicacion", status: "IP", user_id: 15, isactive: nil, processed: nil, isapproved: nil, faculty_from_id: 56, faculty_to_id: 53, type_of_translate: 51, process_type: 3}
])
Reference.create!([
  {name: "region", description: nil},
  {name: "sub_region", description: nil},
  {name: "classification", description: nil},
  {name: "category", description: nil},
  {name: "type_employee", description: nil},
  {name: "type_of_translation", description: "Tipo de Traslado, puede ser Universitario, entre Escuelas o entre Facultades"},
  {name: "Universidades", description: "Traslado entre Universidades"},
  {name: "Facultades", description: ""},
  {name: "Escuela o Departamento", description: ""},
  {name: "Tipo de Cambio", description: "Tipo de cambio de dedicación ya sea Temporal, Permanente o solicitud de permanencia en la dedicación"},
  {name: "Dedicacion", description: "Tipo de dedicación del docente"}
])
ReferenceList.create!([
  {name: "without region", description: nil, value: nil, reference_id: 1},
  {name: "without sub region", description: nil, value: nil, reference_id: 2},
  {name: "asia", description: nil, value: nil, reference_id: 1},
  {name: "europe", description: nil, value: nil, reference_id: 1},
  {name: "africa", description: nil, value: nil, reference_id: 1},
  {name: "oceania", description: nil, value: nil, reference_id: 1},
  {name: "americas", description: nil, value: nil, reference_id: 1},
  {name: "southern asia", description: nil, value: nil, reference_id: 2},
  {name: "northern europe", description: nil, value: nil, reference_id: 2},
  {name: "southern europe", description: nil, value: nil, reference_id: 2},
  {name: "northern africa", description: nil, value: nil, reference_id: 2},
  {name: "polynesia", description: nil, value: nil, reference_id: 2},
  {name: "middle africa", description: nil, value: nil, reference_id: 2},
  {name: "caribbean", description: nil, value: nil, reference_id: 2},
  {name: "south america", description: nil, value: nil, reference_id: 2},
  {name: "western asia", description: nil, value: nil, reference_id: 2},
  {name: "australia and new zealand", description: nil, value: nil, reference_id: 2},
  {name: "western europe", description: nil, value: nil, reference_id: 2},
  {name: "eastern europe", description: nil, value: nil, reference_id: 2},
  {name: "central america", description: nil, value: nil, reference_id: 2},
  {name: "western africa", description: nil, value: nil, reference_id: 2},
  {name: "northern america", description: nil, value: nil, reference_id: 2},
  {name: "southern africa", description: nil, value: nil, reference_id: 2},
  {name: "eastern africa", description: nil, value: nil, reference_id: 2},
  {name: "south-eastern asia", description: nil, value: nil, reference_id: 2},
  {name: "eastern asia", description: nil, value: nil, reference_id: 2},
  {name: "melanesia", description: nil, value: nil, reference_id: 2},
  {name: "micronesia", description: nil, value: nil, reference_id: 2},
  {name: "central asia", description: nil, value: nil, reference_id: 2},
  {name: "instructor", description: nil, value: "1", reference_id: 3},
  {name: "asistente", description: nil, value: "2", reference_id: 3},
  {name: "agregado", description: nil, value: "3", reference_id: 3},
  {name: "asociado", description: nil, value: "4", reference_id: 3},
  {name: "titular", description: nil, value: "5", reference_id: 3},
  {name: "categoria I", description: nil, value: "1", reference_id: 4},
  {name: "categoria II", description: nil, value: "2", reference_id: 4},
  {name: "categoria III", description: nil, value: "3", reference_id: 4},
  {name: "categoria IV", description: nil, value: "4", reference_id: 4},
  {name: "categoria V", description: nil, value: "5", reference_id: 4},
  {name: "docente", description: nil, value: nil, reference_id: 5},
  {name: "de investigacion", description: nil, value: nil, reference_id: 5},
  {name: "aux docente", description: nil, value: nil, reference_id: 5},
  {name: "aux de investigacion", description: nil, value: nil, reference_id: 5},
  {name: "Universidad de Carabobo", description: "Universidad de Carabobo", value: "1", reference_id: 7},
  {name: "Universidad de Oriente (UDO)", description: "Universidad de Oriente (UDO)", value: "2", reference_id: 7},
  {name: "Universidad Jose Antonio Paez (UJAP)", description: "Universidad Jose Antonio Paez (UJAP)", value: "3", reference_id: 7},
  {name: "Traslado entre Universidades", description: "Traslado de Universidad a Universidad", value: "U", reference_id: 6},
  {name: "Traslado entre Facultades", description: "Traslados entre Facultades de la Universidad de Carabobo", value: "F", reference_id: 6},
  {name: "Traslado entre Escuelas", description: "Traslado entre Escuelas de la Universidad de Carabobo", value: "E", reference_id: 6},
  {name: "Cambio de Dedicación Permanente", description: "Cambio de Dedicación Permanente", value: "CDP", reference_id: 10},
  {name: "Cambio de Dedicación Temporal", description: "Cambio de Dedicación Temporal", value: "CDT", reference_id: 10},
  {name: "Permanencia en la Dedicación", description: "Permanencia en la Dedicación", value: "PED", reference_id: 10},
  {name: "Dedicacion Medio Tiempo", description: "", value: "DMT", reference_id: 11},
  {name: "Dedicacion Exclusiva o Tiempo Completo", description: "", value: "DE", reference_id: 11},
  {name: "Departamento de Computación", description: "Departamento de Computación de FACYT", value: "", reference_id: 9},
  {name: "Departamento de Biología", description: "Departamento de Biología de FACYT", value: "", reference_id: 9},
  {name: "Departamento de Quimica", description: "Departamento de Quimica de FACYT", value: "", reference_id: 9},
  {name: "Departamento de Física", description: "Departamento de Física de FACYT", value: "", reference_id: 9},
  {name: "Departamento de Matemática", description: "Departamento de Matemática de Facyt", value: "", reference_id: 9},
  {name: "Facultad de Ciencia y Tecnologia (FACYT)", description: "Facultad de Ciencia y Tecnologia (FACYT)", value: "FACYT", reference_id: 8},
  {name: "Facultad de Ciencias Económicas (FACES)", description: "Facultad de Ciencias Económicas (FACES)", value: "FACES", reference_id: 8},
  {name: "Facultad de Educación (FACE)", description: "Facultad de Educación", value: "FACE", reference_id: 8},
  {name: "Facultad de Ciencias Jurídicas Y Políticas (FCJP)", description: "Facultad de Ciencias Jurídicas Y Políticas (FCJP)", value: "FCJP", reference_id: 8},
  {name: "Facultad de Ciencia de la Salud (FCS)", description: "Facultad de Ciencia de la Salud (FCS)", value: "FCS", reference_id: 8},
  {name: "Facultad de Ingeniería (FACING)", description: "Facultad de Ingeniería (FACING)", value: "FACING", reference_id: 8},
  {name: "Facultad de Odontología ", description: "Facultad de Odontología ", value: "Facultad de Odontología ", reference_id: 8}
])
Attachment.create!([
  {user_id: 2, document_id: 1, link: nil, file_file_name: "Wallpaper-3D-2013-.jpg", file_content_type: "image/jpeg", file_file_size: 532832, file_updated_at: "2017-02-12 22:54:14", process_id: nil},
  {user_id: 8, document_id: 2, link: nil, file_file_name: "JesusDeAbreu.jpg", file_content_type: "image/jpeg", file_file_size: 33215, file_updated_at: "2017-09-27 03:49:39", process_id: nil},
  {user_id: 8, document_id: 3, link: nil, file_file_name: "JesusDeAbreu2.jpg", file_content_type: "image/jpeg", file_file_size: 14756, file_updated_at: "2017-09-27 03:49:40", process_id: nil},
  {user_id: 8, document_id: 4, link: nil, file_file_name: "3D-Wallpaper-5.jpg", file_content_type: "image/jpeg", file_file_size: 295162, file_updated_at: "2017-02-28 21:01:15", process_id: nil},
  {user_id: 8, document_id: 12, link: nil, file_file_name: "certificadoRubyOnRails2.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-02-28 23:33:18", process_id: nil},
  {user_id: 8, document_id: 19, link: nil, file_file_name: "certificadoRubyOnRails3.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-03-01 03:24:10", process_id: nil},
  {user_id: 8, document_id: 20, link: nil, file_file_name: "3D-Wallpaper-52.jpg", file_content_type: "image/jpeg", file_file_size: 295162, file_updated_at: "2017-02-28 23:15:41", process_id: nil},
  {user_id: 8, document_id: 6, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-07 04:39:41", process_id: nil},
  {user_id: 2, document_id: 19, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-02-25 16:18:35", process_id: nil},
  {user_id: 4, document_id: 4, link: nil, file_file_name: "3D-Cigarette-Wallpaper_VeqSC7f.jpg", file_content_type: "image/jpeg", file_file_size: 130334, file_updated_at: "2017-03-14 01:52:57", process_id: nil},
  {user_id: 4, document_id: 12, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-14 01:52:58", process_id: nil},
  {user_id: 8, document_id: 21, link: nil, file_file_name: "download.jpg", file_content_type: "image/jpeg", file_file_size: 5086, file_updated_at: "2017-02-27 18:44:00", process_id: nil},
  {user_id: 4, document_id: 19, link: nil, file_file_name: "3D-Wallpaper-5.jpg", file_content_type: "image/jpeg", file_file_size: 295162, file_updated_at: "2017-03-14 01:52:58", process_id: nil},
  {user_id: 4, document_id: 20, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-03-14 01:56:13", process_id: nil},
  {user_id: 4, document_id: 21, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-14 01:56:14", process_id: nil},
  {user_id: 4, document_id: 22, link: nil, file_file_name: "download.jpg", file_content_type: "image/jpeg", file_file_size: 5086, file_updated_at: "2017-03-14 01:56:14", process_id: nil},
  {user_id: 3, document_id: 12, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-24 18:56:11", process_id: nil},
  {user_id: 3, document_id: 19, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-03-24 18:56:11", process_id: nil},
  {user_id: 3, document_id: 20, link: nil, file_file_name: "3d-wallpaperfire-heart-3d-wallpaper---3d-hd-wallpaper-9hunqb6m_oOkydiq.jpg", file_content_type: "image/jpeg", file_file_size: 2097152, file_updated_at: "2017-03-24 18:56:11", process_id: nil},
  {user_id: 3, document_id: 21, link: nil, file_file_name: "download.jpg", file_content_type: "image/jpeg", file_file_size: 5086, file_updated_at: "2017-03-24 18:56:11", process_id: nil},
  {user_id: 3, document_id: 22, link: nil, file_file_name: "Wallpaper-3D-2013-.jpg", file_content_type: "image/jpeg", file_file_size: 532832, file_updated_at: "2017-03-24 18:56:12", process_id: nil},
  {user_id: 3, document_id: 4, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-02-27 21:53:57", process_id: nil},
  {user_id: 2, document_id: 12, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-03-24 19:06:31", process_id: nil},
  {user_id: 2, document_id: 4, link: nil, file_file_name: "3D-Wallpaper-of-Tiger_60ipnX3.jpg", file_content_type: "image/jpeg", file_file_size: 389486, file_updated_at: "2017-03-24 19:08:26", process_id: nil},
  {user_id: 2, document_id: 20, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-24 19:08:26", process_id: nil},
  {user_id: 2, document_id: 21, link: nil, file_file_name: "UCd.jpg", file_content_type: "image/jpeg", file_file_size: 120507, file_updated_at: "2017-03-24 19:08:26", process_id: nil},
  {user_id: 2, document_id: 22, link: nil, file_file_name: "hexagons-3d-desktop-wallpaper-hd_VUiBHpV.jpg", file_content_type: "image/jpeg", file_file_size: 128475, file_updated_at: "2017-03-24 19:08:26", process_id: nil},
  {user_id: 8, document_id: 22, link: nil, file_file_name: "pagocarne.pdf", file_content_type: "application/pdf", file_file_size: 63742, file_updated_at: "2017-09-03 23:12:40", process_id: nil},
  {user_id: 8, document_id: 23, link: nil, file_file_name: "traslado_aprobacion_temp20171004-4608-1w1z7mm.pdf", file_content_type: "application/pdf", file_file_size: 104717, file_updated_at: "2017-10-05 02:35:33", process_id: 115},
  {user_id: 15, document_id: 12, link: nil, file_file_name: "3D-Cigarette-Wallpaper_VeqSC7f.jpg", file_content_type: "image/jpeg", file_file_size: 130334, file_updated_at: "2017-10-19 17:46:01", process_id: nil},
  {user_id: 15, document_id: 20, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-10-19 17:46:03", process_id: nil},
  {user_id: 15, document_id: 19, link: nil, file_file_name: "3D-Wallpaper-of-Tiger_60ipnX3.jpg", file_content_type: "image/jpeg", file_file_size: 389486, file_updated_at: "2017-10-19 18:37:12", process_id: nil},
  {user_id: 15, document_id: 21, link: nil, file_file_name: "controllers_complete_(1).png", file_content_type: "image/png", file_file_size: 121436, file_updated_at: "2017-10-19 19:58:26", process_id: nil},
  {user_id: 15, document_id: 4, link: nil, file_file_name: "download.jpg", file_content_type: "image/jpeg", file_file_size: 5086, file_updated_at: "2017-10-20 01:34:19", process_id: nil},
  {user_id: 15, document_id: 26, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-10-20 02:05:27", process_id: nil},
  {user_id: 15, document_id: 22, link: nil, file_file_name: "3D-Cigarette-Wallpaper_VeqSC7f.jpg", file_content_type: "image/jpeg", file_file_size: 130334, file_updated_at: "2017-10-20 02:36:44", process_id: nil},
  {user_id: 15, document_id: 23, link: nil, file_file_name: "traslado_aprobacion_temp20171020-28749-1pe2jpu.pdf", file_content_type: "application/pdf", file_file_size: 104826, file_updated_at: "2017-10-20 06:28:14", process_id: 132},
  {user_id: 15, document_id: 3, link: nil, file_file_name: "controllers_complete.png", file_content_type: "image/png", file_file_size: 121436, file_updated_at: "2017-10-20 23:28:35", process_id: nil},
  {user_id: 15, document_id: 25, link: nil, file_file_name: "female_user.png", file_content_type: "image/png", file_file_size: 1043, file_updated_at: "2017-10-20 23:28:36", process_id: nil},
  {user_id: 15, document_id: 27, link: nil, file_file_name: "Etiqueta_Anaquel.pdf", file_content_type: "application/pdf", file_file_size: 12909, file_updated_at: "2017-10-20 23:28:36", process_id: nil},
  {user_id: 15, document_id: 29, link: nil, file_file_name: "UCd.jpg", file_content_type: "image/jpeg", file_file_size: 120507, file_updated_at: "2017-10-20 23:28:36", process_id: nil},
  {user_id: 15, document_id: 2, link: nil, file_file_name: "admin_1.png", file_content_type: "image/png", file_file_size: 57303, file_updated_at: "2017-10-20 23:41:23", process_id: nil}
])
Employee.create!([
  {user_id: 4, type_employee_id: 2, scale_classification_id: 1, scale_category_id: 2, dedication_classification_id: nil, dedication_start_date: nil},
  {user_id: 3, type_employee_id: 40, scale_classification_id: 30, scale_category_id: 35, dedication_classification_id: nil, dedication_start_date: nil},
  {user_id: 8, type_employee_id: 40, scale_classification_id: 30, scale_category_id: 35, dedication_classification_id: 56, dedication_start_date: "2017-10-08"},
  {user_id: 15, type_employee_id: 40, scale_classification_id: 30, scale_category_id: 35, dedication_classification_id: 56, dedication_start_date: "2016-10-30"}
])
Employee::HABTM_Faculties.create!([
  {employee_id: 2, faculty_id: 1},
  {employee_id: 3, faculty_id: 1},
  {employee_id: 4, faculty_id: 1}
])
Faculty.create!([
  {name: "facultad de ciencias y tecnología", acronym: "FaCyT", active: true},
  {name: "facultad de ciencias de la salud", acronym: "FCS", active: true},
  {name: "facultad de ciencias económicas y sociales", acronym: "FaCES", active: true},
  {name: "facultad de ciencias juridicas y politicas", acronym: "FCJP", active: true},
  {name: "facultad de ingeniería", acronym: "FACING", active: true},
  {name: "facultad de odontología", acronym: "FAO", active: true},
  {name: "Facultad de ciencias de la educación", acronym: "FaCE", active: true}
])
Faculty::HABTM_Employees.create!([
  {employee_id: 2, faculty_id: 1},
  {employee_id: 3, faculty_id: 1},
  {employee_id: 4, faculty_id: 1}
])
FormalitiesDocument.create!([
  {formalities_master_id: 1, document_id: 19},
  {formalities_master_id: 1, document_id: 12},
  {formalities_master_id: 1, document_id: 22},
  {formalities_master_id: 1, document_id: 21},
  {formalities_master_id: 1, document_id: 4},
  {formalities_master_id: 1, document_id: 20},
  {formalities_master_id: 2, document_id: 1},
  {formalities_master_id: 2, document_id: 2},
  {formalities_master_id: 2, document_id: 3},
  {formalities_master_id: 2, document_id: 4},
  {formalities_master_id: 2, document_id: 5},
  {formalities_master_id: 2, document_id: 6},
  {formalities_master_id: 2, document_id: 7},
  {formalities_master_id: 2, document_id: 8},
  {formalities_master_id: 2, document_id: 9},
  {formalities_master_id: 2, document_id: 10},
  {formalities_master_id: 2, document_id: 11},
  {formalities_master_id: 2, document_id: 12},
  {formalities_master_id: 2, document_id: 9},
  {formalities_master_id: 2, document_id: 13},
  {formalities_master_id: 3, document_id: 2},
  {formalities_master_id: 3, document_id: 3},
  {formalities_master_id: 3, document_id: 22},
  {formalities_master_id: 3, document_id: 4},
  {formalities_master_id: 3, document_id: 25},
  {formalities_master_id: 3, document_id: 26},
  {formalities_master_id: 3, document_id: 27},
  {formalities_master_id: 3, document_id: 29}
])
RequestWorkflow.create!([
  {name: "Workflow Traslado entre Universidades", description: "Flujo principal del trámite de Traslado entre Universidades", professors_transfer_id: 115, is_active: true, is_completed: false},
  {name: "Workflow Traslado entre Facultades", description: "Flujo principal del trámite de Traslado entre Facultades", professors_transfer_id: 132, is_active: true, is_completed: false},
  {name: "Workflow Cambio de Dedicación Temporal", description: "Flujo principal del trámite de Cambio de Dedicación Temporal", professors_transfer_id: 133, is_active: true, is_completed: false}
])
WorkflowStep.create!([
  {name: "Analisis y Remisión de juicio de Asuntos Profesorales.", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 4, info: nil, step_number: 3, is_active: true, is_completed: nil, status: "AP"},
  {name: "Analisis y Remisión de juicio a Decano.", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 6, info: nil, step_number: 3, is_active: true, is_completed: nil, status: "AP"},
  {name: "Verificar Aval Academico y Presupuestario", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 5, info: nil, step_number: 4, is_active: true, is_completed: nil, status: "AP"},
  {name: "Evaluación de Recaudos iniciales", description: nil, request_workflow_id: 24, approval_date: "2017-09-21", role_id: 5, info: nil, step_number: 1, is_active: true, is_completed: nil, status: "AP"},
  {name: "Analisis y Remisión de juicio a Consejo de Facultad", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 5, info: nil, step_number: 5, is_active: true, is_completed: nil, status: "AP"},
  {name: "Analisis y Remisión de juicio a Consejo de Departamento.", description: nil, request_workflow_id: 24, approval_date: "2017-09-24", role_id: 10, info: nil, step_number: 2, is_active: true, is_completed: nil, status: "AP"},
  {name: "Aprobacion de Jefe de Departamento y Remisión de juicio a Decano.", description: nil, request_workflow_id: 36, approval_date: nil, role_id: 6, info: nil, step_number: 2, is_active: true, is_completed: nil, status: "DR"},
  {name: "Verificar Aval Academico y Presupuestario", description: nil, request_workflow_id: 36, approval_date: nil, role_id: 4, info: nil, step_number: 3, is_active: true, is_completed: nil, status: "DR"},
  {name: "Analisis Final de Traslado", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 7, info: nil, step_number: 6, is_active: true, is_completed: nil, status: "AP"},
  {name: "Analisis y Remisión de juicio a Consejo de Facultad", description: nil, request_workflow_id: 36, approval_date: nil, role_id: 4, info: nil, step_number: 4, is_active: true, is_completed: nil, status: "DR"},
  {name: "Analisis Final de Traslado", description: nil, request_workflow_id: 36, approval_date: nil, role_id: 7, info: nil, step_number: 5, is_active: true, is_completed: nil, status: "DR"},
  {name: "Evaluación de Recaudos iniciales", description: nil, request_workflow_id: 36, approval_date: "2017-10-21", role_id: 5, info: nil, step_number: 1, is_active: true, is_completed: nil, status: "IP"},
  {name: "Analisis y Remisión de juicio a Consejo de Facultad", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 5, info: nil, step_number: 6, is_active: true, is_completed: nil, status: "DR"},
  {name: "Analisis Final de Traslado", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 7, info: nil, step_number: 7, is_active: true, is_completed: nil, status: "DR"},
  {name: "Verificar Aval Academico y Presupuestario", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 5, info: nil, step_number: 5, is_active: true, is_completed: nil, status: "DR"},
  {name: "Analisis y Remisión de juicio de Asuntos Profesorales.", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 4, info: nil, step_number: 4, is_active: true, is_completed: nil, status: "IP"},
  {name: "Evaluación de Recaudos iniciales", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 5, info: nil, step_number: 1, is_active: true, is_completed: nil, status: "AP"},
  {name: "Analisis y Remisión de juicio a Decano.", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 6, info: nil, step_number: 2, is_active: true, is_completed: nil, status: "AP"}
])
Review.create!([
  {name: "Analisis y Remisión de juicio a Consejo de Departamento.", comment: "igyggkjgj yg iyg iughklj hk ", files_reviewed: true, approval: true, workflow_step_id: 125, user_id: 24},
  {name: "Analisis y Remisión de juicio a Decano.", comment: "", files_reviewed: true, approval: true, workflow_step_id: 126, user_id: 20},
  {name: "Analisis y Remisión de juicio de Asuntos Profesorales.", comment: "", files_reviewed: true, approval: true, workflow_step_id: 127, user_id: 13},
  {name: "Verificar Aval Academico y Presupuestario", comment: "", files_reviewed: true, approval: true, workflow_step_id: 128, user_id: 14},
  {name: "Analisis y Remisión de juicio a Consejo de Facultad", comment: "Se aprueba", files_reviewed: true, approval: true, workflow_step_id: 129, user_id: 14},
  {name: "Analisis y Remisión de juicio a Decano.", comment: "Esta todo correcto, apruebo el Trámite", files_reviewed: true, approval: true, workflow_step_id: 156, user_id: 20},
  {name: "Analisis y Remisión de juicio de Asuntos Profesorales.", comment: "OK", files_reviewed: true, approval: true, workflow_step_id: 157, user_id: 13},
  {name: "Verificar Aval Academico y Presupuestario", comment: "ok", files_reviewed: true, approval: true, workflow_step_id: 158, user_id: 14},
  {name: "Analisis y Remisión de juicio a Consejo de Facultad", comment: "ok", files_reviewed: true, approval: true, workflow_step_id: 159, user_id: 14}
])