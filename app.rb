require 'bundler'
Bundler.require
require './lib/entry.rb'


module Something
  class App < Sinatra::Application
    
   
   
    get '/' do

      erb :home
    end

    post '/:id' do
      @hack = Entry.new(params[:id],"#{params["title"]}")
      @hack.css = params["css"]
      @hack.html_render = params["html"]
      @hack.html_display = @hack.html_render.gsub("<","&lt;").gsub(">","&gt;")
      erb :index
    end

    helpers do 
      def simple_partial(template)
        erb template
      end
    end

  end
end

# TO DO
# incorporate database and have id numbers increment 
# save entries to the database
# style the form
# figure out how to link to any part of the carousel with ID
# responsive styling 
# ruby cycle through each hack for each slide
