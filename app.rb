require 'rubygems'
require 'sinatra'
require './position'
require 'sinatra/reloader' if development?


get "/"  do
  @positions = Position.all
  erb :index
end