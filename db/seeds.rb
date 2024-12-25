# frozen_string_literal: true
require "factory_bot"

require_relative "./create_record"
# require_relative "./upload_csv_data"

puts "Seeding..."
start_time = Time.zone.now

start_seed # create data from another file.

end_time = Time.zone.now
puts "Seeding done from #{start_time} to #{end_time}."
puts "Total Time = #{end_time - start_time}"
ApplicationRecord.record_count
