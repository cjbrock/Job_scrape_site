require 'rubygems'
require 'sinatra'
require './position'
#require "sinatra/reloader"


get "/"  do
  @positions = Position.all
  erb :index
end