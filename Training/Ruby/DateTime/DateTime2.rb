require 'date'

y=2000
m=12
d=25
h=12
min=34
datetime = DateTime.new(y,m,d,h,min)
m = 3.5
datetime2 = DateTime.new(y,m,d,h,min)

datetime = DateTime.new(y,m,d,h,min, Rational(h_rel,mode))
datetime = DateTime.new(y,m,d,h,min, '+#{h_rel_str}' + ':' + '#{min_rel_str}')

d =DateTime.parse(date_string)

print d.hour, d.min, d.sec, d.offset, d.zone
d+= Rational ('1.5')
d=d.new_offset('+09:00')
d.strftime('%I:%M:%S %p')
d=DateTime.new(1999)

puts datetime.methods

