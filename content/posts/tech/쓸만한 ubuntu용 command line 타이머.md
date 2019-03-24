+++
title = "각종 작업 소요시간 체크용 우분투용 command line stopwatch"
date = "2019-03-24T10:38:28+09:00"
tags = []
featured_image = ""
description = ""
+++
간단하게 터미널에서 작업 소요 시간을 체크 할 수 있는 방법들을 찾아봤는데 

https://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal

terdon 이라는 분이 알려준 방법은 잘 동작하였지만
https://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal?answertab=active#tab-top

~/.bashrc 파일에 함수를 추가하고 터미널에서 바로 호출해서 쓰는 방법이라 프로그램 추가 설치가 필요없다는 장점이 있다.

	countdown(){
		date1=$((`date +%s` + $1));
		while [ "$date1" -ge `date +%s` ]; do 
		## Is this more than 24h away?
		days=$(($(($(( $date1 - $(date +%s))) * 1 ))/86400))
		echo -ne "$days day(s) and $(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r"; 
		sleep 0.1
		done
	}

	function stopwatch(){
	  date1=`date +%s`; 
	   while true; do 
		echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
		sleep 0.1
	   done
	}

현재 터미널에서 바로 사용하려면 source 명렁어로 .bashrc를 다시 읽어와야 한다 

	source ~/.bashrc

터미널에서 stopwatch라고만 입력하면 stopwatch 가 동작한다

	$ stopwatch
	00:00:01

countdown 을 실행하려면 몇 초 후 정지할지 인수를 넘겨줘야 한다

	$ countdown 60*10
	0 days(s) and 00:10:00

하지만 이 방법은 한가지 단점이 있는데 백그라운드에서 동작시킬 수 없다는 점이다.
그래서 위의 2개 함수를 shell 로 만들어 해결했지만 다른 문제가 발생했는데 백그라운드 작업을 정지시킬 수가 없다는 점이다.

	bluedskim@penguin:~$ ps -ef|grep sleep
	bluedsk+ 28554 25506  0 11:26 pts/2    00:00:00 sleep 0.1
	bluedsk+ 28559 12585  0 11:26 pts/2    00:00:00 sleep 0.1
	bluedsk+ 28561   887  0 11:26 pts/0    00:00:00 grep sleep
	bluedskim@penguin:~$ kill -9 28554
	bash: kill: (28554) - No such process
	
이것은 당연해 보인다. loop를 돌면서 계속해서 새로 프로세스가 생성되기 때문이다.

그래서 sw라는 스크립트를 시도해봤는데

https://github.com/coryfklein/sw

무한루프에 빠진다 -.-

	date: invalid option -- 'v'
	Try 'date --help' for more information.

마지막에 시도했던 termdown을 쓰려고 한다.
하지만 termdown 은 python기반이기 때문에 컴퓨터에 python이 설치되어 있어야 하고 설치를 위해서는 pip도 있어야 한다는 제약사항이 있다

pip는 pip3를 설치

	$ sudo apt update
	$ sudo apt install python3-pip
	
termdown 설치

	$ pip3 install termdown
	
그런데 설치하고 바로 실행이 되지 않는다. 왜?

	$ termdown
	bash: termdown: command not found

pip3로 설치한 라이브러리를 찾지 못한다고 -.-
그래서 라이브러리를 찾을 수 있도록 ~/.bashrc에 아래를 추가한다

	export PY_USER_BIN=$(python3 -c 'import site; print(site.USER_BASE + "/bin")')
	export PATH=$PY_USER_BIN:$PATH

.bashrc를 수정했으니 source 명렁어로 .bashrc를 다시 읽어와야 한다 

	source ~/.bashrc

옵션 없이 termdown을 실행하면 stopwatch로 동작한다

[![termdown 스크린샷](/images/Screenshot 2019-03-24 at 11.55.46 AM.png)](/images/Screenshot 2019-03-24 at 11.55.46 AM.png)
