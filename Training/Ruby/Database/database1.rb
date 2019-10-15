require 'dbi'

begin {
dbc = DBI.connect("DBI:Postgresql:northwind:localhost", "postgres", "postgres")

puts "Connected to PDB"
}
rescue DBI::DatabaseError => e

puts "Error"

ensure
puts dbc.func(:client_info)
   puts dbc.func(:client_version)
   puts dbc.func(:host_info)
   puts dbc.func(:proto_info)
   puts dbc.func(:server_info)
   puts dbc.func(:thread_id)
   puts dbc.func(:stat)

end{
dbc.disconnect if dbc
}

