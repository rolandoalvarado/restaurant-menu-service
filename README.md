# Restaurant Menu Service

## Requirements

- Ruby 2.3.1
- Rails 5.1.4
- PostgreSQL 9.5.4
- Bootstrap
- Jquery-ui
- Chosen-rails

## Installations

- $ git clone git@github.com:rolandoalvarado/restaurant-menu-service.git
- $ bundle

## Configs

- .editorconfig
- .rspec
- .rubocop.yml
- .ruby-gemset
- .ruby-version
- database.yml

## Migrations

NOTE: Setup database.yml first

- $ rake db:create
- $ rake db:migrate
- $ rake db:seed # To add user for logging-in the app.

## Testing

- guard
- guard-rubocop
- rubocop
- mocha
- rspec-rails
- faker
- shoulda, etc.

#### Route files
- `match` is deprecated. Use `get` and `post`. If you found yourself supporting `get` and `post` for one route, just specify one route for `get` and another for `post`.

#### Assets
-  Referencing assets (`images`, `js` , `css` or any assets under `app/assets`) should not be hardcoded. We are using asset pipeline to serve these assets to make it faster. Refer [here](http://api.rubyonrails.org/classes/ActionView/Helpers/AssetUrlHelper.html) to determine what helper methods you can use.
-  If we have pages that is not hosted by us and there are reference to assets in there, make sure you don't put the assets in the `app/assets`. Just put in public folder and reference accordingly.

#### Mass Assignments (Rails 4.x.x)
-  `attr_protected` and `attr_accessible` is deprecated use [strong parameters](https://github.com/rails/strong_parameters) instead.