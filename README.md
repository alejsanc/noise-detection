# noise-detection
Noise detection with ARecord

<h2>Installation</h2>

<pre># cp noise-detection.sh /usr/local/bin
# chmod +x /usr/local/bin/noise-detection.sh

# adduser noise-detection
# usermod -a -G audio noise-detection

# mkdir /var/lib/noise-detection
# chown noise-detection:noise-detection /var/lib/noise-detection

# cp noise-detection.service /lib/systemd/system
# systemctl enable noise-detection</pre>

<h2>Configuration</h2>

<pre># vi /usr/local/bin/noise-detection.sh

DIRECTORY=/var/lib/noise-detection
MAX_VOLUME=75
RECORD_SECONDS=10
MICROPHONE=dsnoop:1,0
EMAIL_ACCOUNT=email-account
ADMIN_EMAIL=admin@example.com</pre>

More info in <a href="https://www.cuadernoinformatica.com/2023/12/deteccion-de-ruido-con-arecord.html">Detección de ruido con ARecord</a> blog article.
