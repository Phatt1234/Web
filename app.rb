# app.rb  
require 'rubygems'
require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
	:adapter	=>  "mysql2",
	:host 		=>	"localhost" ,
	:username 	=>  "root" ,
	:password	=>	"123456" ,
	:database	=> 	"mydb"
	)
class Name < ActiveRecord::Base
end
class Model_Name < Sinatra::Base
	def getname

		results=''
		@allname = Name.last(1)

		for item in @allname
			#results += '<tr><td>'
			results += item.name 
			#results += '</tr></td>'
		end

		return results 	
	end
end
class Form < Sinatra::Base
	set :views, File.dirname(__FILE__) + "/views"
	get '/form' do
		@data = getname
		erb :form
	end
	post '/form' do
		
		if params[:name]!="" 
			Name.create(:name => params[:name])
			
		end
		

		@data = ""#getname
		erb :form
	end
	def getname

		results=''
		@allname = Name.last(10)

		for item in @allname
			results += '<tr><td align="center">'
			results += item.name 
			results += '</tr></td>'
		end

		return results 	
	end
end

