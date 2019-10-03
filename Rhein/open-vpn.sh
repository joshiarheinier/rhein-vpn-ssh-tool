#!/usr/bin/expect -f
set ovpn_file [lindex $argv 0];
set username [lindex $argv 1];
set password [lindex $argv 2];
spawn /usr/local/Cellar/openvpn/2.4.7_1/sbin/openvpn $ovpn_file
expect {
    "*Enter Auth Username:" {
        send "$username\r"
        exp_continue
    } 
    "Enter Auth Password:" {
        send "$password\r"
        exp_continue
    }
}
