# Rhein: VPN & SSH Tool

## How to Use
1. `brew install openvpn` and install Cisco Anyconnect (if you need the VPN).
2. Check script `open-vpn.sh` and make sure that your openvpn path is correct (on the script, the path is `/usr/local/Cellar/openvpn/2.4.7_1/sbin/openvpn` by default. Check whether the executable exists or not).
3. Fill the configuration file in folder `config/` (template is already provided for both anyconnect and openvpn).
4. If you're going to use the SSH feature as well, fill the instance list contained in folder `config/ip_list/` (template is already provided).
5. Put your `.ovpn` file inside folder `ovpn_profile` (don't forget to write your file name inside the config file that uses openvpn as the client).
6. Add to path: `export PATH=$PATH:<path/to/folder/Rhein>` (for example, if you put the Rhein folder on `~/rhein-vpn-ssh-tool/`, then the command is `export PATH=$PATH:~/rhein-vpn-ssh-tool/Rhein`).
7. Execute `rhein` to see the usage (you can execute the command anywhere because the path is already added).

## Custom Environment Name
(To be filled.)
