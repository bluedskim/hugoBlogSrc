---
title: "Certbot을 이용해 Iptime DDNS 도메인용 인증서 발급"
date: 2020-05-10T21:23:09+09:00
tags: ["certbot", "Spring Boot"]
draft: false
---

발급될지 살짝 의심했었지만 발급 안될 이유가 없더라.

환경은 다음과 같다.

* iptime 공유기 A104(version 10.03.8)
* Odroid Ubuntu 14.04
	* python 2.7 : 혹자는 3.6 이상 버전이 필요하다고 하지만 2.7에서도 정상 동작하였다
	* Spring Boot 2

##### certbot 설치

	$ git clone https://github.com/certbot/certbot

##### certbot 인증서 발행

이 때 80 port에 서비스가 있다면 잠시 내려두자. 인증을 위해 certbot이 잠시 이 포트를 사용할 것이기 때문이다(인증서 갱신시에는 80포트가 불필요 하다)


	$ sudo ./certbot-auto certonly -a standalone -d samba.iptime.org

	...
	IMPORTANT NOTES:
	- Congratulations! Your certificate and chain have been saved at:
		/etc/letsencrypt/live/samba.iptime.org/fullchain.pem
		Your key file has been saved at:
		/etc/letsencrypt/live/samba.iptime.org/privkey.pem
		Your cert will expire on 2020-08-08. To obtain a new or tweaked
		version of this certificate in the future, simply run certbot-auto
		again. To non-interactively renew *all* of your certificates, run
		"certbot-auto renew"
	- If you like Certbot, please consider supporting our work by:

		Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
		Donating to EFF:                    https://eff.org/donate-le 


여기 경로에(/etc/letsencrypt/live/samba.iptime.org) 인증서 파일이 잘 생성되었다.

#### PKCS12 생성

Spring Boot2 Backe-end 에서는 pkcs12 형식의 인증서가 필요하다(고 한다. 보안쪽은 잘 모르므로 패스 -.-)
여기서 지정한 암호는 SpringBoot설정파일에 넣을 것이므로 잘 메모해 두자.

	$ sudo openssl pkcs12 -export -in /etc/letsencrypt/live/samba.iptime.org/fullchain.pem -inkey /etc/letsencrypt/live/samba.iptime.org/privkey.pem -out sambando.p12 -name bootalias -CAfile /etc/letsencrypt/live/samba.iptime.org/chain.pem -caname root -password pass:암호를지정하셔요

##### SpringBoot2 설정(yaml파일)

	server:
	  port: 8082
	  ssl:
		key-store: classpath:sambando.p12
		key-store-password: 지정한_암호를_넣는다
		keyStoreType: PKCS12 

SpringBoot을 기동한 후 인증서 정보를 확인해보자

[![Certbot을 이용해 Iptime DDNS 도메인용 인증서 발급.png](/images/Certbot을 이용해 Iptime DDNS 도메인용 인증서 발급.png)](/images/Certbot을 이용해 Iptime DDNS 도메인용 인증서 발급.png)

	
만세! iptime의 top level domain 이지만 뭔가 신뢰가 간다.
