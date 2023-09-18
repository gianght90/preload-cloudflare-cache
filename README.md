# preload-cloudflare-cache
Preload trang theo file sitemap.xml và check status cache Cloudflare 

Chạy liên tục 24/24 qua nohup, có thể tự chạy lại sau khi khởi động VPS
```shell
sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/preload-cloudflare-cache/main/preload_setup.sh -O preload_setup.sh && sudo chmod +x preload_setup.sh && sudo ./preload_setup.sh
```
