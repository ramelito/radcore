RADCORE is RADio COmmunication REcorder software, 
which will help you to get more from your scanner.

Installation.

Before radcore usage you have to install following packages:
	- sox and all fmt libs
	- darkice-full from debmultimedia
	- additional python modules - jinja2, argparse and requests.
	- uniden_api from git

To install radcore run ./install.sh with sudo.

To run radcore upon system startup use radcore.sh script.
E.g. for Debian: 
cp -v radcore.sh /etc/init.d/
insserv radcore.sh

Usage.

To operate with your scanners you need to create a config file in YAML.
For more details look through radcore.yml.example config file.
It is self explanatory.

Radcore can be used with scanner w/o remote control, so called simple scanner.
And software is compatible with Uniden scanners (RS-232 remote control).
