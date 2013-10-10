require 'rubygems'
require 'packetfu'

stream = PacketFu::Capture.new(:start => true, :iface => 'en1', :promisc => true)

# stream.stream.each do |raw|
	# Check for NULL scan

	# Check for XMAS scan

	# Check for another scan

	# Check for 
# end

stream.show_live()