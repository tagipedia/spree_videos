module SpreeVideos
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../templates/', __FILE__)

      def add_javascripts
        append_file "vendor/assets/javascripts/spree/backend/all.js", "//= require spree/backend/spree_videos\n" 
      end

      def add_stylesheets
        append_file "vendor/assets/stylesheets/spree/backend/all.css", "//= require spree/backend/spree_videos\n" 
      end

      def copy_initializer_file
        copy_file 'spree_videos.rb', "config/initializers/spree_videos.rb"
      end

      def add_migrations
        run 'rake railties:install:migrations FROM=spree_videos'
      end

      def run_migrations
         res = ask "Would you like to run the migrations now? [Y/n]"
         if res == "" || res.downcase == "y"
           run 'rake db:migrate'
         else
           puts "Skiping rake db:migrate, don't forget to run it!"
         end
      end
    end
  end
end
