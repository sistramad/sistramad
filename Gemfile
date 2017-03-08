source 'https://rubygems.org'
ruby '2.2.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails','~>5'
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
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# gemas agregadas

group :production do
 gem 'rails_12factor'
end

# para la autenticación de usuarios
gem 'devise'
# para porder mandar invitaciones por correo electronico
gem 'devise_invitable'

gem 'awesome_print', :group => :development
gem 'pry', :group => :development

# gem 'rest-client', '~> 1.8'
gem 'rest-client'

# para el manejo de roles
gem 'cancan', '~> 1.6', '>= 1.6.10'
gem 'rolify', '~> 5.1' #usar >rails g rolify Role User y agregar al controller load_and_authorize_resource :only => [:new, :edit, :destroy]

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
gem "letter_opener", :group => :development


# para el procesamiento de archivos varios
gem 'carrierwave'


# para transformar imagenes
gem 'rmagick'

# para que puedan coexistir jquery y turbolinks sin problemas
gem 'jquery-turbolinks'

# para adjuntar archivos
gem 'paperclip'
# Para creat archivos zip
gem 'rubyzip'
# Creat ventanas modales (pop-ups)
gem 'magnific-popup-rails', '~> 1.1.0'

#Amazon WS
gem 'aws-sdk', '~> 2.3'

gem 'jcrop-rails-v2'

gem 'redis'
gem 'sidekiq'
gem 'sinatra', github:"sinatra/sinatra"
gem 'puma'
gem 'rails_semantic_logger'