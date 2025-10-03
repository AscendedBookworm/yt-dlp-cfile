#!/bin/bash

#Parse a list of URLs for yt-dlp with any command switches passed beforehand. 
VERSION="0.1.0"

die()
{
    printf "%s\n" "$1" >&2;
    exit_failure "1";
}

exit_failure()
{
    exit "$1";
}

exit_success()
{
    exit 0;
}

print_help()
{
    echo "Usage: ytdlpparse [filename]";
}

print_version()
{
    echo "ytdlpparse version ${VERSION}";
}

if [ "$#" -ne 1 ]; then
    print_help;
    exit_failure 1;
fi

if [[ "$1" = "-h" ]] || [[ "$1" = "--help" ]]; then
    print_help;
    exit_success;
fi

if [[ "$1" = "-v" ]] || [[ "$1" = "--version" ]]; then
    print_version;
    exit_success;
fi

#type yt-dlp >/dev/null 2>&1
#if [[ "$?" -ne "0" ]]; then
#    die "yt-dlp is not installed or not available on PATH.";
#fi

type yt-dlp >/dev/null 2>&1 || die "yt-dlp is not installed or is not available on PATH.";

if ! [ -f "$1" ]; then
    die "File $1 does not exist.";
fi

if ! [ -r "$1" ]; then
    die "File $1 is not readable.";
fi

while read -r LINE || [ -n "${LINE}" ]; do
    firstchar="${LINE:0:1}"

    if ! [ "${firstchar}" = "#" ] && [[ $LINE = *[^[:space:]]* ]]; then
        COMMAND="yt-dlp ${LINE}";
#        $(echo ${COMMAND});
        echo "${COMMAND}";
    fi
done < "$1"

exit_success;