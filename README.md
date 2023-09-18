# preload-cloudflare-cache
Preload, tạo cache trang và ảnh theo status cache Cloudflare = HIT, chạy dựa theo sitemap.xml

Set chạy ngầm liên tục 24/24 qua nohup, có thể tự chạy lại sau khi khởi động VPS
```shell
sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/preload-cloudflare-cache/main/preload_setup.sh -O preload_setup.sh && sudo chmod +x preload_setup.sh && sudo ./preload_setup.sh
```
