# yt-dlp URL list parser

The yt-dlp list parser takes a list of URLs to download with yt-dlp, preceded optionally by a list of any commands which should be passed to yt-dlp. URLs without preceding commands will simply be downloaded with the normal system configuration for yt-dlp. Comments start with a # and will be ignored.

Example:

```bash
https://example.com/123456
#This is a comment and will be ignored.
-f 24 -n 10 https://example.com/654321
 
```

In the above example, the first URL will be downloaded normally using any configuration already in place on the user's system, while the second will be told to download format code "24" and to download ten chunks at a time. Arguments to yt-dlp must go *before* the URL; the URL of the video to download must appear last on the line.
