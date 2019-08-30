require 'dbi'

begin

dbc = DBI.connect("DBI:Postgresql:northwind:localhost", "postgres", "postgres")

puts "Connected to PDB"

rescue DBI::DatabaseError => e

puts "Error"

ensure

dbc.disconnect if dbc

end
