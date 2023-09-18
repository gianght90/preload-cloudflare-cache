sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/preload-cloudflare-cache/main/precache.sh -O /usr/local/bin/precache_cloudflare.sh
chmod +x /usr/local/bin/precache_cloudflare.sh
nohup /usr/local/bin/precache_cloudflare.sh >> ./out 2>&1 <&- &
crontab -l > precache_cloudflare
echo "@reboot nohup /usr/local/bin/monitor_service_restart.sh >> ./out 2>&1 <&- &" >> precache_cloudflare
crontab precache_cloudflare
