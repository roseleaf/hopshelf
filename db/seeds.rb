# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Region.delete_all
regions = Region.create!([{:name => 'Santa Cruz', :path => '/assets/sc.png'}, 
                         {:name => 'East Bay', :path => '/assets/bay.png'}, 
                         {:name => 'Antelope Valley', :path => '/assets/av.png'}])