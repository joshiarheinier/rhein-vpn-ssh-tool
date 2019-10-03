#!/usr/bin/expect -f
set address [lindex $argv 0];
set username [lindex $argv 1];
set password [lindex $argv 2];
set profile [lindex $argv 3];
spawn /opt/cisco/anyconnect/bin/vpn connect $address
expect {
    "*Connect Anyway?" {
        send "y\r"
        exp_continue
    }
    "Group:*" {
        send "$profile\r"
        exp_continue
    }
    "Username:*" {
        send "$username\r"
        exp_continue
    }
    "Password:" {
        send "$password\r"
        exp_continue
    }
}
