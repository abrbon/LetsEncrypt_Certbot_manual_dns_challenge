# LetsEncrypt Certbot with DuckDNS via DNS challenge

This is a bundle of scripts i made for my own convenience to create LetsEncrypt certificates for my internal servers with my free public domain at DuckDNS.org.

At the time i created these scripts i only tested it on some of my Jails (iocage) on my TrueNAS 12.0 Core server.
Although it should work fine on any Linux distro as well, it's based on the BASH shell.
<br><br>
<h2>Configuration</h2>
Almost all configuration could be set in the <code>certbot_config_vars.sh</code> script.<br>
In this script you can change and set your configurations for the DuckDNS (like the token)
and where to copy and name your certificate files and some other variables.
Most of them have a small comment behind them with a short explanation.
<br><br>
<h2><b>Installation</b></h2>
Make sure you run all commands with 'root' privileges.<br><br>

- Install the Certbot package on your server. On my iocage jail the command is: <code>pkg install py37-certbot</code>
- Create following directory for these scripts: <code>/usr/local/certbot_files/</code>
- Change to the directory you just created: <code>cd /usr/local/certbot_files</code>
- Clone this git repo with following command:<br>
    <code>git clone https://github.com/abrbon/LetsEncrypt_DuckDNS_script_toolset.git .</code><br>
    Pay attention to the . at the end of the line!
- Make sure all scripts have execution rights (chmod u+x *.sh)
- Now run the <code>certbot_firstrun_script.sh</code> script to get started.

The script will now attempt to create the LetsEncrypt certificates depending on the variables
you have set in the <code>certbot_config_var.sh</code> script.

The default settings are set to run in so called 'dry-run' mode.<br>
This means that no certifcates are created but the scripts are tested for working correctly.
<br><br>
Besides that the script is also creating test certificates by default, see STAGING variable in <code>certbot_config_vars.sh</code>.<br>
This is recommended for testing. There is a <a href="https://letsencrypt.org/docs/rate-limits">rate limit</a> in creating real signed certificates by LetsEncrypt.
<br><br>
If all is working correctly you can remove the '--dry-run' mode and change the STAGING variable in <code>certbot_config_vars.sh</code> and 
run the <code>certbot_firstrun_script.sh</code> again to create the final sigened certiciates.
<br><br>
<br><br>
