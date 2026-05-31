FROM jasongdove/ersatztv:latest

# yt-dlp, Deno (YouTube JS challenges), and pre-cached EJS solver components
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        curl \
        ca-certificates \
        unzip \
    && curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp \
    && chmod a+rx /usr/local/bin/yt-dlp \
    && curl -fsSL https://deno.land/install.sh | DENO_INSTALL=/usr/local sh \
    && yt-dlp --remote-components ejs:github --version \
    && apt-get purge -y unzip \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
