########################
# Author: Nick Teleky
# Comp116: Web Security
# Assignment 2
########################

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

# Parse through the payload. If "nmap" is found in the payload, then
# this is an nmap scan.
def nmap_scan?(pkt)
	payload = pkt.payload
	nmap = payload.scan(/nmap/i)
	if nmap.length > 0
		return true
	else
		return false
	end
end

# Parse through the payload. If "nmap" is found in the payload, then
# this is an nmap scan.
def pass_scan?(pkt)
	payload = pkt.tcp_header.body
	pass = payload.scan(/PASS/i)
	if pass.length > 0
		return true
	else
		return false
	end
end

def credit_scan?(pkt)
	payload = pkt.tcp_header.body
	ver = payload.scan(/4\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/i)
	disc = payload.scan(/6011(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/i)
	mast = payload.scan(/5\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/i)
	amer = payload.scan(/3\d{3}(\s|-)?\d{6}(\s|-)?\d{5}/i)
	if (ver.length+disc.length+mast.length+amer.length) > 0
		return true
	else
		return false
	end
end

def xss_scan?(pkt)
	payload = pkt.tcp_header.body
	xss = payload.scan(/<script>\s*(alert|window.location)/i)
	if xss.length > 0
		return true
	else
		return false
	end
end

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

	# Check for NMAP scan
	if pkt.proto.last == "TCP" && nmap_scan?(pkt)
		incident_number = incident_number + 1
		print_alert pkt, "NMAP scan", incident_number
		next
	end

	# Check for passwords
	if pkt.proto.last == "TCP" && pass_scan?(pkt)
		incident_number = incident_number + 1
		print_alert pkt, "A clear-text password", incident_number
		next
	end

	# Check for credit card numbers
	if pkt.proto.last == "TCP" && credit_scan?(pkt)
		incident_number = incident_number + 1
		print_alert pkt, "A clear-text credit-card number", incident_number
		next
	end

	# Check for XSS
	if pkt.proto.last == "TCP" && xss_scan?(pkt)
		incident_number = incident_number + 1
		print_alert pkt, "A XSS attack", incident_number
		next
	end
 end
