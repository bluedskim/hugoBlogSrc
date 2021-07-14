---
title: "Docker로 Oracle12 설치하기"
categories: ["tech"]
tags: ["Docker", "Oracle"]
date: 2021-07-14T23:59:28+09:00
draft: false
---

* _oracle 12 enterprise 버전 설치에 대한 글이다._
* _다른 버전 설치는 이렇게 복잡하지 않은 듯. 아래 링크 참조_
	* Docker로 Oracle xe 11g 설치 :   https://romeoh.tistory.com/entry/Oracle-docker%EC%97%90-Oracle-11g-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0
	* [Docker] Oracle DB(Oracle 12c) 구성하기 : https://gomguk.tistory.com/69
* _Docker를 어느 정도 사용할 수 있어야 아래 설명을 따라갈 수 있다._

___

리눅스에 오라클DB 설치는 정말 악몽이다(윈도우즈는 차라리 낫다). 만약 리눅스가 그래픽환경(X windows)가 아니라면 완전 낭패다.

그래서 X windows를 설치하기까지 했었다.  그래픽환경(X windows)은 시스템 리소스를 더 쓸 수 밖에 없는데 -.- 서버에 그래픽환경(X windows)을 설치할 필요는 없잖아~

고맙게도 Docker로 설치하면 이런 문제는 해결된다.

### 데이터 저장용 폴더 준비하기

데이터를 docker 내부에 저장하면 이후에 대이터를 백업하거나 다른 서버로 이전할 때 힘들어진다. 처음부터 데이터는 docker 컨테이너 외부에 저장하자. 

1. 데이터 저장용 폴더 생성

	저장용 폴더는 본인 환경에 맞게 경로를 지정한다.

		$ mkdir /home/shed/util/data/oradata
	
1. 폴더에 권한 주기

	마운드될 폴더에 쓰기 권한이 없으면 기동자체가 되지 않는다 -.- 아래의 명령어로 쓰기 권한을 주자.

		$ chmod -R a+w /home/shed/util/data/oradata

	생성한 폴더는 도커 기동시 볼륨으로 연결할 것이다.

### 실행

	$ docker run -d -it --name oracle -e ORACLE_CHARACTERSET=AL32UTF8 -p 1521:1521 -p 5500:5500 -v /home/shed/util/data/oradata:/ORCL store/oracle/database-enterprise:12.2.0.1
	
	/oracle:/ORCL store/oracle/database-enterprise:12.2.0.1
	Unable to find image 'store/oracle/database-enterprise:12.2.0.1' locally
	12.2.0.1: Pulling from store/oracle/database-enterprise
	4ce27fe12c04: Pull complete 
	9d3556e8e792: Pull complete 
	fc60a1a28025: Pull complete 
	0c32e4ed872e: Pull complete 
	b465d9b6e399: Downloading [============================>                      ]  1.538GB/2.739GB

다운로드가 끝나면 자동으로 실행된다.  docker ps -a 명령으로 확인해보자.

	$ docker ps -a
	CCONTAINER ID        IMAGE                                       COMMAND                  CREATED              STATUS                        PORTS                                            NAMES
	d4d851dea5b9        store/oracle/database-enterprise:12.2.0.1   "/bin/sh -c '/bin/ba…"   About a minute ago   Up About a minute (healthy)   0.0.0.0:1521->1521/tcp, 0.0.0.0:5500->5500/tcp   oracle

### 계정 생성

접속용 계정을 생성해야 각종 툴에서 사용가능하다.

1. sqlplus로 접속

		$ docker exec -it oracle bash -c "source /home/oracle/.bashrc; sqlplus /nolog"
		SQL*Plus: Release 12.2.0.1.0 Production on Wed Jul 14 15:42:57 2021
		Copyright (c) 1982, 2016, Oracle.  All rights reserved.
		SQL>

1. 로그인

		SQL> conn sys/oracle as sysdba
		Connected.

1. 세션 설정 변경

		SQL> alter session set "_ORACLE_SCRIPT"=true;
		Session altered.

1. 계정 생성 & 권한 주기

	acc01라는 계정을 만들어 보겠다.

		SQL> create user acc01 identified by passwd;
		User created.
		SQL> GRANT CREATE SESSION TO acc01;
		SQL> GRANT CONNECT, RESOURCE, DBA TO acc01;
		Grant succeeded.

1. 생성한 계정으로 sqlplus 접속 테스트

		$ docker exec -it oracle bash -c "source /home/oracle/.bashrc; sqlplus acc01/passwd@ORCLCDB"
		SQL*Plus: Release 12.2.0.1.0 Production on Wed Jul 14 16:00:51 2021
		Copyright (c) 1982, 2016, Oracle.  All rights reserved.
		Last Successful login time: Wed Jul 14 2021 15:59:45 +00:00
		Connected to:
		Oracle Database 12c Enterprise Edition Release 12.2.0.1.0 - 64bit Production
		SQL>

### DBeaver로 접속

다음과 같이 접속 설정을 한다.

![기본 UI](/images/Docker로_Oracle설치하기_DBeaver로_접속.png "Title here")

Docker기반 오라클12 정도면 개발 환경에서 사용하기에는 충분한것 같다.

















