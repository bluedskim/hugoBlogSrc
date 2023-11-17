---
title: "유용한 LINUX CLI명령어와 쉡스크립트들"
date: 2023-11-16T18:15:11+09:00
draft: false
---

## ffmpeg
범용 미디어 변환 프로그램

* 오디오 파일을 avi동영상으로 변환하기
    ```shell
    ffmpeg -i inputFile.mp4 -q:v 6 outputFile.avi
    ```

* 특정 폴더의 mp3 파일들을 합친 후 사진을 삽입하여 유튜브 업로드용 동영상으로 변환하기
    ```shell
    find -name "*.mp3" -exec ffmpeg -loop 1 -framerate 2 -i 사진.jpg -i {} -tune stillimage -crf 18 -c:a copy -shortest {}.mkv \;
    ```

* 동영상 파일에서 특정 구간 복사하기

    ```shell
    #10초부터 20초 분량의 동영상 추출
    ffmpeg -ss 00:00:10 -i "원본.MP4" -t 00:00:20 -vcodec copy -acodec copy "10초부터_20초까지.MP4"
    ```

* rtsp 스트리밍 동영상을 캡쳐하여 mp4로 저장
    ```shell
    ffmpeg -i rtsp://서버주소 -vcodec copy -acodec copy -f mp4 -y 저장파일명.mp4    
    ```

## uvccapture
웹캠 캡쳐 유틸

* YUYV포맷으로 캡쳐하여 파일명.jpg로 저장하기

    ```shell
    uvccapture -m -o파일명.jpg
    ```

## lshw
하드웨어 정보 출력

* 하드웨어 정보를 html 포맷으로 생성하고 파이어폭스에서 열기

    ```shell
    lshw -html > ~/hardware_info.html && firefox ~/hardware_info.html
    ```

## curl
각종 인터넷 프로토콜 클라이언트

* http응답 코드 출력
    ```
    curl -Is https://www.google.com/  | grep HTTP | cut -d ' ' -f2
    ```

## xdotool
명령행 x11자동화 툴

* 마우스 위치 출력하기
    ```shell
    while true; do xdotool getmouselocation; sleep 0.2; clear; done
    ```

## ctronome
메트로놈 유틸리티

* https://github.com/bivanbi/ctronome에서 소스를 받아서 컴파일해야 함
* 구동 스크립트 샘플
    ```shell
    #!/bin/sh
    killall ctronome
    bpm="100"
    baseDir="메트로놈_사운드_wav파일_디렉토리"
    if [ "$#" -eq  "0" ]
    then	
        bpm="100"
        echo "No arugments supplied"
        echo bpm : $bpm
    else
        bpm=$1
        echo bpm : $bpm
    fi
    padsp ctronome -b $bpm -t 2 -w1 $baseDir/a5.wav -w2 $baseDir/a4.wav
    ```

## 웹서버
* [mini-httpd](https://manpages.ubuntu.com/manpages/trusty/en/man8/mini-httpd.8.html) : 가벼운 설치형 웹서버. CGI, SSL지원. Apache웹서버 성능의 90% 성능을 보인다고
* [darkhttpd](https://github.com/emikulic/darkhttpd) : 직접 컴파일이 필요한 가벼운 웹서버
* python3 내장 웹서버 : python3에는 웹서버가 내장되어 있다. 터미널에서 아래 명령어를 입력하여 실행한다.

    ```shell
    python3 -m http.server
    ```

## csv를 xlsx로 변환
* libreoffice
    ```shell
    soffice --headless --convert-to xlsx:"Calc MS Excel 2007 XML" file.csv
    ```
* [csv2xlsx](https://github.com/mentax/csv2xlsx)
    ```shell
        csv2xlsx --output 변환후.xlsx 변환전.csv
    ```

## [yewtube](https://github.com/mps-youtube/yewtube)
* 터미널 유튜브 클라이언트
* 유튜브 계정없이 사용가능
* 유튜브 광고 없음
* 동영상 다운로드 가능

## [yt-dlp](https://github.com/yt-dlp/yt-dlp)
유튜브 다운로더

* 동영상 다운로드
    ```shell
    yt-dlp https://www.youtube.com/watch?v=^CaN5ZCaiQI
    ```

* mp3로 다운로드
    ```shell
    yt-dlp https://www.youtube.com/watch?v=^CaN5ZCaiQI -x --audio-format mp3
    ```

## 쉘 스크립트
* 특정 폴더내의 특정 확장자 파일내의 탭문자를 스페이스 4개로 바꾸기

    ```shell
    #!/bin/bash
    find 해당디랙토리 -name '*.java' ! -type d -exec bash -c 'expand -i -t 4 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;    
    ```

* 카운트 다운

    ```shell
    #!/bin/sh
    # ex) ./countdown.sh 60 : 1분 동안 카운트 다운
    clear
    date1=$((`date +%s` + $1));
    while [ "$date1" -ge `date +%s` ]; do
    ## Is this more than 24h away?
    days=$(($(($(( $date1 - $(date +%s))) * 1 ))/86400))
    echo "\033[H$days day(s) and $(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r"; 
    sleep 0.1
    done
    ```

* 스탑와치

    ```shell
    date1=`date +%s`;
    while true; do
    days=$(( $(($(date +%s) - date1)) / 86400 ))
    echo -ne "$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
    done
    ```
