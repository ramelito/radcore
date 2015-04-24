## Description.
RADCORE is RADio COmmunication REcorder software, 
which will help you to get more from your scanner.

## Installation.

Before radcore usage you have to install following packages:
- sudo apt-get install sox libsox-fmt-all
- sudo apt-get install darkice (multiverse for ubuntu)
- sudo apt-get install python-jinja2 python-requests python-argparse
- git clone https://github.com/ramelito/uniden-api; cd uniden-api; sudo ./setup.py install

To install radcore run ./install.sh with sudo.

To run radcore upon system startup use radcore.sh script.
E.g. for Debian: 
```bash
cp -v radcore.sh /etc/init.d/
insserv radcore.sh
```

## Usage.

To operate with your scanners you need to create a config file in YAML.
For more details look through radcore.yml.example config file.
```yml
---
- scanner: {name: srch, type: uniden, port: 3110, speed: 9600, volume: 9, squelch: 5}
  audio: {card: 'Intel', profile: mod, format: mp3}
  templates:
   dir: '/scanner_audio/%(year)s%(mon)s%(day)s/%(system)s/%(group)s/%(channel)s/%(hour)s'
   wav: '%(year)s-%(mon)s-%(day)s_%(hour)sh%(min)sm%(sec)ss_%(frqtgid)s_MHz'
   egc: '/scanner_audio/%(year)s%(mon)s%(day)s/%(system)s/%(frqtgid)s/%(hour)s'
  time_zone: 'Europe/Moscow'
- scanner: {name: apco, type: uniden, port: 2110, speed: 57600, volume: 3, squelch: 5, collect_uids: 'on'}
  audio: {card: 'USBSOUND32', profile: mod, format: mp3}
  icecast: {live: 'on', mp3bitrate: 32, host: example.com, port: 8001, pass: xxxxxxx, mount: xxxxxx,
           name: Test Feed, desc: Test Feed Desc, url: 'http://example.com', genre: scanner, public: no}
  templates:
   dir: '/home/ulab/public/scanner/p25/%(year)s%(mon)s%(day)s/%(group)s/%(channel)s/%(hour)s'
   wav: '%(year)s-%(mon)s-%(day)s_%(hour)sh%(min)sm%(sec)ss_%(frqtgid)s_%(system)s'
   egc: '/home/ulab/public/scanner/p25/%(year)s%(mon)s%(day)s/FOUND TGIDS/%(frqtgid)s/%(hour)s'
   ice: '%(system)s %(group)s %(channel)s %(frqtgid)s'
  time_zone: 'Europe/Moscow'
  icao_code: UUEE #code to fetch METAR info
  ```

Radcore can be used with scanner w/o remote control, so called simple scanner.
And software is compatible with Uniden scanners (RS-232 remote control).
