---
title: "Chromebook crostini에 SSH접속하기"
date: 2020-05-16T17:49:41+09:00
tags: ["chromebook", "linux"]
draft: false
---

'굳이 뭐 이런것까지' 라고 생각할 사람도 있을지 모르겠지만 요긴할 때가 있다(sftp로 파일 전송, 부하 모니터링 등등...) 

이 방법의 핵심은 **Connection Forwarder** 라고 하는 port forwarding 앱에 있다.

이 앱이 없다면 다른 기기에서 ssh접속은 불가능하다.

* sshd 설치 설명은 생략한다. debian에서 sshd설치 가이드는 인터넷상의 다른 자료를 참조하길 바란다
* 암호 로그인 대신 키파일 로그인을 하도록 한다. crostini 의 기본 계정의 암호를 알아내는 방법은 없다. 암호를 변경할 수는 있겠지만 이렇게 했을 때 어떤 문제가 발생할지 알 수 없어 키파일 방식 인증을 하도록 하겠다

#### 키 생성

크롬북의 터미널에서 아래 명령을 실행한다.

	$ mkdir ~/.ssh
	$ chmod 700 ~/.ssh
	$ cd ~/.ssh
	$ ssh-keygen -t rsa
	$ cat id_rsa.pub >> authorized_keys
	$ chmod 600 authorized_keys

일단 crostini 내에서 자기 자신으로 ssh접속이 되는지 확인해보자

	본인아이디@penguin:~$ ssh 본인아이디@localhost -i ~/.ssh/id_rsa
	Linux penguin 4.19.98-08076-g24ab33fb8e14 #1 SMP PREEMPT Wed Apr 1 17:14:27 PDT 2020 x86_64

	The programs included with the Debian GNU/Linux system are free software;
	the exact distribution terms for each program are described in the
	individual files in /usr/share/doc/*/copyright.

	Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
	permitted by applicable law.
	Last login: Sat May 16 20:46:05 2020 from ::1
	본인아이디@penguin:~$	

#### port forwarding

아래 주소에서 connection-forwarder 를 설치하고 기동한다
https://chrome.google.com/webstore/detail/connection-forwarder/ahaijnonphgkgnkbklchdhclailflinn 

다음과 같이 포워딩 규칙을 생성한다

* Source Address : 0.0.0.0(anywhere)
* Source Port : 22를 제외한 적당한 숫자를 입력한다(22번은 ssh의 기본 포트인데 해커들이 좋아하는 포트이니 가능하면 피하는 것이 좋다)
* Destination Address : penguin.termina.linux.test (이 host명은 chromebook 시스템내에서 crostini 를 가리킨다)
* Destination Port : 22

[![connection_forwarder.png](/images/connection_forwarder.png)](/images/크롬북 아이피 알아내기.png)

#### 다른 기기에서 접속하기

리눅스 컴퓨터에서 접속하는 것으로 예를 들어보자.

1. 크롬북의 아이피 알아내기 : crostini의 아이피가 아니라 **크롬북의 아이피**를 알아내야 한다. '설정' 에서 현재 접속한 AP를 선택하면 확인할 수 있다
[![크롬북 아이피 알아내기.png](/images/크롬북 아이피 알아내기.png)](/images/크롬북 아이피 알아내기.png)

1. 생성된 키를 클라이언트로 복사
1. 다른 키와 구별하기 위해 이름을 변경

		mv id_rsa id_rsa_chrome

1. 키  권한을 수정

		chmod 600 id_rsa_chrome

1. 접속

		ssh 본인아이디@크롬북아이피 -i id_rsa_chromebook -p 소스포트번호
		
이런 방법으로 crostini내의 모든 서비스에 다른 기기에서 접속가능하다. 
