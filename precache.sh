!/bin/bash
# Automatically hits all sitemaps on a site to pre-cache then at the edge.

# CONFIG
SITEMAP_URL=https://bibica.net/sitemap.xml


# Pull the index sitemap and get a list of all of the individual sitemaps.
echo "PULLING $SITEMAP_URL"
sitemaps=`curl $SITEMAP_URL | awk -F '[<>]' '/loc/{print $3}'`

# Loop over each of the sitemap URLs and Curl it to warm up the cache.
for sitemap in $sitemaps; do

        count=0

        # Curl the sitemap URL until we confirm that it is cached by Cloudflare.
        while :; do
                let "count=count+1"

                echo "HITTING $sitemap"
                result=`curl -sI $sitemap | tr -d '\r' | tr '[:upper:]' '[:lower:]' | sed -En 's/^cf-cache-status: (.*)/\1/p'`

                # If URL is cached, move onto the next sitemap.
                if [ "hit" == "$result" ]; then
                        echo "CACHED $sitemap"
                        break
                fi

                # If we reached the limit, move on, don't get stuck in an infinite loop.
                if [ $count -ge "10" ]; then
                        echo "REACHED LIMIT"
                        break
                fi
        done

        echo "NEXT"
done

echo "DONE"
