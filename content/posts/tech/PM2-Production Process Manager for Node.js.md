---
title: "PM2 - Production Process Manager for Node"
date: 2020-09-30T12:37:16+09:00
categories: ["tech"]
tags: ["Node", "ReactJS"]
draft: false
---

ReactJS 로 Single-page application을 개발한다면 일반적으로 build를 하고 build를 deploy하는 방식을 사용한다.

최근 진행했던 프로젝트에서도 역시 이런 방식으로 deploy를 해왔는데, deploy후 레이아웃이 깨지는 경우를 발견하게 되었다. 

뭔가 CSS 충돌이 발생한 상황인 듯 한데 소스레벨에서는 해결할 수도 피해갈 수도 없는 상황이었다. 

방법은 단 하나, 리소스 낭비를 감수하면서 운영환경에서도 npm start 형태로 구동하여 서비스할 수 밖에 없었다.

하지만 리소스 낭비보다 더 심각한 문제가 있었으니.

npm start로 구동하는 경우 nohup 을 이용한 background 프로세스로 구동하여야 하는데 리로드가 아닌 프로세스 리스타트가 필요한 경우(모듈이 추가된다던지 하는 이유로) 해당 프로세스를 ps명령으로 찾아서 kill해야 했다.

만약 여러 서비스를 한개 서버에서 동시에 서비스 해야하는 경우라면 더 심각해진다.

왜냐하면 node 프로세스를 다수 띄워야 하기 때문에 ps명령으로 해당 서비스의 프로세스를 찾는 것이 쉽지않고 자칫 실수하면 다른 프로세스를 kill하는 경우도 발생하기 때문이다.

이런 시나리오에 유용한 툴이 있으니 바로 PM2(https://pm2.keymetrics.io) 이다.

PM2를 이용하면 여러 node 프로세스를 쉽게 모니터링하고 관리(정지, 재기동)할 수 있다.

npm 기반이기 때문에 설치도 간단하다. 아래의 명령으로 설치한다.

	npm install pm2 -g

실행은 해당 폴더에서 아래의 명령으로 띄운다('서비스명' 은 다른 서비스와 구별할수 있는 고유 식별자를 사용).

	pm2 start npm --name 서비스명 -- start

상태를 모니터링 할 때는 'pm2 monit' 명령을 실행한다.

	pm2 monit
	┌─ Process List ────┐┌──  rnd Logs  ──────────────────────────────────┐
	│[ 0] 서비스명  Mem:  ││                                                │
	│                   ││                                                │
	│                   ││                                                │
	│                   ││                                                │
	│                   ││                                                │
	│                   ││                                                │
	│                   ││                                                │
	└───────────────────┘└────────────────────────────────────────────────┘
	┌─ Custom Metrics ──┐┌─ Metadata ─────────────────────────────────────┐
	│ Heap Size         ││ App Name              서비스명                   │
	│ Heap Usage        ││ Namespace             default                  │
	│ Used Heap Size    ││ Version               N/A                      │
	│ Active requests   ││ Restarts              0                        │
	│ Active handles    ││ Uptime                3m                       │
	│ Event Loop        ││ Script path           /usr/bin/npm             │
	└───────────────────┘└────────────────────────────────────────────────┘

어플리케이션 정지

	pm2 stop 서비스명
	
어플리케이션 삭제(파일을 삭제하는 것이 아니고 pm2 관리 대상에서 삭제한다는 의미)

	pm2 delete 서비스명
	
아래처럼 어플리케이션의 포트를 지정할 수 있다고 하나 기동자체가 되지 않았다

	pm2 start npm --name 서비스명 -- --port 1520 -- start
	
이 때는 아래처럼 package.json 를 수정 후 기동하면 가능하기는 하지만,

	sed -i "s/npm-run-all -p build:css watch:\*/PORT=1520 npm-run-all -p build:css watch:\*/g" ./package.json
	
왠간하면 빌드해서 반영하자. pm2는 최후의 수단이다. 
	

