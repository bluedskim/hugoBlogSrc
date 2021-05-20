---
title: "Perl스크립트로 Http Get 요청하고 응답출력하기"
date: 2021-05-21T00:00:37+09:00
categories: ["tech", "perl", "linux"]
draft: false
---

리눅스/유직스 서버에서 http포트가 열려있는지, 웹서버가 떠있는지 등등을 확인 할 때 일반적으로 wget혹은 curl을 주로 사용한다.

wget도 curl도 없는 *nix서버는 보기 힘들지만 간혹 없는 경우도 있다
(JVM이라도 있다면 Java로 간단하게 프로그램을 짜서 돌리면 되지만 소스도 길고 컴파일도 해줘야 하니 불편하다 -.-).

그래서 perl스크립트는 없는지 구글링 해보니 역시나 있다.

다음은 Http Get 요청 수행 후 응답을 출력하는 perl 스크립트다.

{{< highlight perl "linenos=table,hl_lines=11-17,linenostart=1" >}}
#!/usr/bin/perl
use LWP::Simple;
getprint($ARGV[0]) if $ARGV[0];
{{< / highlight >}}
[출처] https://dzone.com/articles/simplest-wgetcurl-replacement

실행은 다음과 같이 한다.

	$ ./lwp-get.pl http://bluedskim.github.io

wget, curl은 없어도 perl이 없는 *nix서버는 없으니 그나마 다행이다.
