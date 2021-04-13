# Juniper-secure-port
This powershell will take an output of a Juniper switch 'show ethernet-switching table' and generate the accept-source-mac to lock down the ports.
Use this in cases where you don't want to use dot1x or can't.
We use this for computer labs once the lab is setup just run the script apply and you are good until a machine needs to change or you refresh the computer lab.
