# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# for Countries
Country.delete_all

connection = ActiveRecord::Base.connection()

# Import country data from shpfile to countries table
from_country_shp_sql = `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shpfiles', 'GAB_adm0.shp')} countries_ref`
connection.execute "drop table if exists countries_ref"
connection.execute from_country_shp_sql
connection.execute <<-SQL
    insert into countries(name, iso_code, geom) 
      select name_engli, iso, geom from countries_ref
SQL
connection.execute "drop table countries_ref"

# for Provinces
Province.delete_all
from_province_shp_sql = `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shpfiles', 'GAB_adm1.shp')} provinces_ref`
connection.execute "drop table if exists provinces_ref"
connection.execute from_province_shp_sql
connection.execute <<-SQL
    insert into provinces(name, geom) 
      select name_1, geom from provinces_ref
SQL
connection.execute "drop table provinces_ref"

# for Cities
City.delete_all
from_city_shp_sql = `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shpfiles', 'GAB_adm2.shp')} cities_ref`

connection.execute "drop table if exists cities_ref"
connection.execute from_city_shp_sql
connection.execute <<-SQL
    insert into cities(name, province_id, geom) 
      select cities_ref.name_2, provinces.id , cities_ref.geom from cities_ref, provinces where provinces.name = cities_ref.name_1
SQL
connection.execute "drop table cities_ref"