require 'sinatra'
require 'sqlite3'
#require 'sinatra/reloader'

class Position

attr_accessor :id, :title, :job_link, :location, :description, :telecommute

  @@attributes = %w{id
                    title
                    job_link
                    location
                    description
                    telecommute
  }



  JOBS_INDEX = {
    0 => :ID_INDEX,
    1 => :TITLE_INDEX,
    2 => :JOB_LINK_INDEX,
    3 => :LOCATION_INDEX,
    10 => :DESCRIPTION_INDEX,
    13 => :TELECOMMUTE_INDEX
  }

  @@db = SQLite3::Database.new("dice_jobs.db")

  def self.all
    positions = []
    jobs = @@db.execute("SELECT * FROM jobs")
    
    jobs.each do |job|

      position = Position.new
      JOBS_INDEX.each do |key_index, attribute|
        method = attribute.to_s.gsub("_INDEX", "").downcase
        # position.id = 1
        # position.title = "test"
        # position.job_link = "test"
        # position.location = "test"
        # position.description = "test"
        # position.telecommute = "test"
        position.send("#{method}=", job[key_index])
      end  
      positions << position
    end

    positions
  end

  
end