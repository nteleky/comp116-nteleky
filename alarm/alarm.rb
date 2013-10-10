require 'rubygems'
require 'packetfu'

# If there are no flags in the TCP Packet header, then there is likely
# a NULL Scan.
def null_scan?(pkt)
	if pkt.tcp_flags.to_i == 0
		return true
	else
		return false
	end
end

# If the URG, PSH, and FIN flags in the TCP Packet header are on, then
# there is likely a XMAS Scan.
def xmas_scan?(pkt)
	tcp_flag = pkt.tcp_flags
	if tcp_flag.urg.to_i == 1 && tcp_flag.psh.to_i == 1 && tcp_flag.psh.to_i == 1
		return true
	else
		return false
	end
end
=begin
def nmap_scan?(pkt)
	payload = pkt.payload.to_s
	if payload.include? "nmap"
		return true
	else
		return false
	end
end
=end
# alert printing function
def print_alert(pkt, attack, num)
	print "#{num}. ALERT: #{attack} is detected from #{pkt.ip_saddr} (#{pkt.proto.last})!\n"
end


# Main part of the code below

stream = PacketFu::Capture.new(:start => true, :iface => 'en1', :promisc => true)
incident_number = 0
 stream.stream.each do |p|
	# incidentFound = false
	pkt = PacketFu::Packet.parse p
	# Check for NULL scan
	if pkt.proto.last == "TCP" && null_scan?(pkt)
		incident_number = incident_number + 1
		print_alert pkt, "NULL scan", incident_number
		next
	end

	# Check for XMAS scan
	if pkt.proto.last == "TCP" && xmas_scan?(pkt)
		incident_number = incident_number + 1
		print_alert pkt, "XMAS scan", incident_number
		next
	end
=begin
	# Check for NMAP scan
	if nmap_scan?(pkt)
		incident_number = incident_number + 1
		print_alert pkt, "NMAP scan", incident_number
		next
	end
=end
	# Check for 
	# print "Packet: " + packet + "END \n\n\n\n"
 end

# stream.show_live()

# Set boolean like scanFound
# create several methods that return booleans 
#if scanFound is true, then skip the other ones
