#!/usr/bin/env bash

declare -A codes=(
    ["US"]="CONUS-LARGE"
    ["Aberdeen"]="KABR"
    ["Amarillo"]="KAMA"
    ["Austin/San Antonio"]="KEWX"
    ["Baltimore"]="KLWX"
    ["Binghamton"]="KBGM"
    ["Birmingham"]="KBMX"
    ["Bismarck"]="KBIS"
    ["Boston"]="KBOX"
    ["Brownsville"]="KBRO"
    ["Buffalo"]="KBUF"
    ["Caribou Maine"]="CARIB"
    ["Chanhassen"]="KMPX"
    ["Charleston"]="KRLX"
    ["Cheyenne"]="KCYS"
    ["Chicago"]="KLOT"
    ["Cleveland"]="KCLE"
    ["Columbia"]="KCAE"
    ["Corpus Christi"]="KCRP"
    ["Davenport"]="KDVN"
    ["Des Moines"]="KDMX"
    ["Detroit"]="KDTX"
    ["Dodge City"]="KDDC"
    ["Duluth"]="KDLH"
    ["El Paso"]="KEPZ"
    ["Gaylord"]="KAPX"
    ["Glasgow"]="KGGW"
    ["Goodland"]="KGLD"
    ["Grand Rapids"]="KGRR"
    ["Gray"]="KGYX"
    ["Great Falls"]="KTFX"
    ["Green Bay"]="KGRB"
    ["Greenville"]="KGSP"
    ["Houston/Galveston"]="KHGX"
    ["Indianapolis"]="KIND"
    ["Jackson"]="KJKL"
    ["Jacksonville"]="KJAX"
    ["Kansas City"]="KEAX"
    ["Key West"]="KEYX"
    ["La Crosse"]="KARX"
    ["Lake Charles"]="KLCH"
    ["Lincoln"]="KILX"
    ["Little Rock"]="KLZK"
    ["Marquette"]="KMQT"
    ["Melbourne"]="KMLB"
    ["Midland/Odessa"]="KMAF"
    ["Milwaukee"]="KMKX"
    ["Mobile"]="KMOB"
    ["Morehead City"]="KMHX"
    ["Morristown/Knoxville"]="KMRX"
    ["Nashville"]="KOHX"
    ["New York"]="KOKX"
    ["Newport"]="KMHX"
    ["Northern Indiana"]="KIWX"
    ["Norton"]="KBOX"
    ["Omaha/Valley"]="KOAX"
    ["Paducah"]="KPAH"
    ["Paducah"]="PAHG"
    ["Peachtree City/Atlanta"]="KFFC"
    ["Pendleton"]="KPDT"
    ["Pittsburgh"]="KPBZ"
    ["Pleasant Hill"]="KEAX"
    ["Pontiac"]="KDTX"
    ["Portland"]="KGYX"
    ["Quad Cities"]="KDVN"
    ["Riverton"]="KRIW"
    ["San Angelo"]="KSJT"
    ["San Joaquin Valley/Hanford"]="KHNX"
    ["Shreveport"]="KSHV"
    ["Sioux Falls"]="KFSD"
    ["Spartanburg"]="KGSP"
    ["Spokane"]="KOTX"
    ["Springfield"]="KSGF"
    ["St. Louis"]="KLSX"
    ["Sullivan"]="KMKX"
    ["Tampa"]="KTBW"
    ["Twin Cities"]="KMPX"
    ["Wakefield"]="KAKQ"
    ["Wichita"]="KICT"
    ["Wilmington"]="KILN"
)

cities=("${!codes[@]}")

if [[ -z "$1" ]]; then
    city=$(printf '%s\n' "${cities[@]}" | sort | fzf --prompt="Select a city: " --reverse --height=40%)
else
    city="$1"
    if [[ -z "${codes[$city]}" ]]; then
        echo "Error: '$city' is not a valid city." >&2
        exit 1
    fi
fi

if [[ -z "$city" ]]; then
    echo "No city selected. Exiting."
    exit 1
fi

url="https://radar.weather.gov/ridge/standard/${codes[$city]}_loop.gif"

mpv --loop --geometry=100%x100%+50%+50% $url
