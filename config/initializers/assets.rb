# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css.sass, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( users/avatar_carrier_wave_crop.js users/avatar_preview_text_input.js )
Rails.application.config.assets.precompile += %w( professors_transfers.js )
# Rails.application.config.assets.precompile += %w( others )

#para agregar las fuentes a la ruta
Rails.application.config.assets.enabled = true
# Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
# Precompile additional assets
Rails.application.config.assets.precompile += %w( .svg .eot .woff .ttf )