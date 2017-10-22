source 'https://rubygems.org'
ruby '2.4.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0', '>= 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'bootstrap-datepicker-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#maquina de estados:
gem 'aasm'
#guarda variables de entorno:
gem 'figaro'
# Backend para procesos en background
gem 'delayed_job_active_record'

# para la autenticación de usuarios
gem 'devise'
# para porder mandar invitaciones por correo electronico
gem 'devise_invitable'

gem 'awesome_print', :group => :development
gem 'pry', :group => :development
# gem 'rest-client', '~> 1.8'
gem 'rest-client'

# para el manejo de roles
gem 'cancancan', '~> 1.10'

gem 'rolify' #usar >rails g rolify Role User y agregar al controller load_and_authorize_resource :only => [:new, :edit, :destroy]
# para usar migas de pan
gem 'breadcrumbs_on_rails'

# para simplificar los formularios
gem 'simple_form'

# para la paginacion
gem 'kaminari'

# para instalar el compilador css sass
gem 'sass'

# para integrar bootstrap
gem 'bootstrap-sass'

# para cuando se compile se agregan los prefijos automaticamente de acuerdo al proveedor
gem 'autoprefixer-rails'

# para mostrar las rutas con show-routes y ls modelos con show-models
gem 'pry-rails', :group => :development

# para traducir las rutas
gem 'route_translator'

# para abrir correos desde local
gem "letter_opener", :group => :production
# para el procesamiento de archivos varios
gem 'carrierwave'
# pare recortar imagenes
gem 'carrierwave-crop'
# para transformar imagenes
# gem 'rmagick', '~> 2.15', '>= 2.15.4'

# para transformar imagenes
#gem 'rmagick'

# para que puedan coexistir jquery y turbolinks sin problemas
gem 'jquery-turbolinks'

# para adjuntar archivos
gem 'paperclip'
# Para creat archivos zip
gem 'rubyzip'
# Creat ventanas modales (pop-ups)
gem 'magnific-popup-rails', '~> 1.1.0'

#Amazon WS
#gem 'aws-sdk', '~> 2.3'

gem 'jcrop-rails-v2'

gem 'redis'
#gem 'sidekiq'
gem 'sinatra', github:"sinatra/sinatra"
gem 'rails_semantic_logger'
gem 'mini_magick'
gem 'chronic'
gem 'whenever', require: false

# se reemplazo el servidor de web-brick a puma 
gem "puma"
# para generar pdf
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end
