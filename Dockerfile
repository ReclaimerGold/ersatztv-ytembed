FROM jasongdove/ersatztv:latest

# Install python, curl, and the latest yt-dlp binary
RUN apt-get update && apt-get install -y python3 curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp
