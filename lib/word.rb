require 'pry'

class Album

  attr_reader :id 
  attr_accessor :name
  @@words = {}
  @@total_rows = 0 

 