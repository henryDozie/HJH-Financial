customers = []
File.open(File.dirname(__FILE__ ) + '/data/customers.txt', 'r') do |line_by_line|
  customers = line_by_line.readline
end
puts customers

class Customers

end