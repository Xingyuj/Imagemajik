# Imagemajik
Online Photo Processing System
## Installation

Dependencies:
- [imagemagick](http://www.imagemagick.org/script/binary-releases.php)
- [git](http://git-scm.com/)
- [sqlite3](https://www.sqlite.org/)

Installing the project:

1. clone the repo

  ```
  git clone https://XingyuJi@bitbucket.org/XingyuJi/ebuy-shopping-centre.git
  ```
2. move into the repository directory
  
  ```
cd Imagemajik
  ```
3. Install Rails
  
  ```
gem install rails
```

4. install imagemagick

  ```
brew install ImageMagick
```
5. Install dependencies
  ```
gem install bundler
gem update bundler
gem install rmagick
bundle install
```

## Usage

To run the server:
```
rails s -r xxxx
```
where `XXXX` is the port number you wish to run the application on (defaults to 2000)

## Documentation for libraries used
Server-side

- [rmagick](https://rmagick.github.io/) RMagick is a binding from Ruby to the ImageMagick TM image manipulation library.
- [carrierwave](https://github.com/carrierwaveuploader/carrierwave) This gem provides a simple and extremely flexible way to upload files from Ruby applications. It works well with Rack based web applications, such as Ruby on Rails.
- [turbolinks](https://github.com/rails/turbolinks)Turbolinks makes following links in your web application faster.
- [devise](https://github.com/plataformatec/devise)Devise is a flexible authentication solution for Rails based on Warden.
- [sass-rails](https://github.com/rails/sass-rails) This gem provides official integration for Ruby on Rails projects with the Sass stylesheet language.
- [uglifier](https://github.com/lautis/uglifier) Use Uglifier as compressor for JavaScript assets
- [coffee-rails](https://github.com/rails/coffee-rails) Use CoffeeScript for .coffee assets and views

Client-side

- [jquery](http://jquery.com/) fast, small, and feature-rich javascript library that makes DOM-traversal easy
- [Bootstrap](http://getbootstrap.com/) as a good-looking CSS framework
- [jbuilder](https://github.com/rails/jbuilder) Build JSON APIs with ease.

All other frameworks used are either part of the above, dependencies of the above or perform a function to trivial to mention.
