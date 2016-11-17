class ApplicationController < Sinatra::Base

	require 'bundler'
	Bundler.require()
	require 'sinatra'
	require 'sinatra/cross_origin'

	set :views, File.dirname(__FILE__) + '/views'
	set :public_folder, File.File.dirname(__FILE__) + '/public'

	ActiveRecord::Base.establish_connection(
		:adapter => 'mysql2',
		:database => 'Project_3'
	)

	register Sinatra::CrossOrigin

	set :allow_origin, :any
	set :allow_methods, [:get, :post, :patch, :delete]

	options "*" do
		response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
	    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
	    200
	end

	configure do
	  enable :cross_origin
	end

	get '/' do
	    {:message => 'Home page not designed yet.'}.to_json
	end

	enable :sessions, :logging


end
