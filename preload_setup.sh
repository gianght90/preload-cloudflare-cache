sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/preload-cloudflare-cache/main/precache.sh -O /usr/local/bin/precache_cloudflare.sh
sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/preload-cloudflare-cache/main/preload__img_bibica_net_.sh -O /usr/local/bin/preload__img_bibica_net_.sh

chmod +x /usr/local/bin/precache_cloudflare.sh
chmod +x /usr/local/bin/preload__img_bibica_net_.sh

nohup /usr/local/bin/precache_cloudflare.sh >> ./out 2>&1 <&- &
nohup /usr/local/bin/preload__img_bibica_net_.sh >> ./out 2>&1 <&- &

crontab -l > precache_cloudflare
echo "@reboot nohup /usr/local/bin/precache_cloudflare.sh >> ./out 2>&1 <&- &" >> precache_cloudflare
echo "@reboot nohup /usr/local/bin/preload__img_bibica_net_.sh >> ./out 2>&1 <&- &" >> precache_cloudflare

crontab precache_cloudflare
