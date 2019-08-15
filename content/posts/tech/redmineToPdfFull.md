---
title: "우분투 command line에서 모든 레드마인 이슈를 하나의 pdf 로 내려받기"
categories: ["tech"]
date: 2019-07-29T16:49:45+09:00
tags: ["ubuntu", "redmine"]
draft: false
---

레드마인에서 공식적으로 이 기능을 지원하지는 않고 있다.
이것을 위한 3rd party 플러그인은 있는데 동작하지 않았다.

https://github.com/brunoqs/pdf_export_redmine

Proxy Error가 발생하였는데 아마도 Apache에서 timeout이 발생한것 같았다. 레드마인 커뮤니티에서 해결방법을 찾아봤는데 원인도 정확히 밝혀지지 않은 듯 -.-

그래서 이슈별로 하나씩 pdf 로 받은 다음 병합하는 방법으로 해결하였다.

### Redmine Api Key 생성

http://레드마인서버/redmine/my/api_key 에서 생성

### 이슈 목록을 csv로 다운 받기

	curl --remote-name "http://api키:1234@레드마인서버주소/redmine/projects/프로젝트id/issues.csv"

### csv에서 이슈번호 추출

JDK1.8에서 쓸 수 있는 Javascript 인터프리터 [jjs](https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jjs.html)가 있어서 사용해봤다.
(이런 간단한 작업을 하는데 class 컴파일까지 하는건 과한 듯) 

Java 랑 JavaScript를 섞어쓰니 느낌이 묘하다.

	var curlCmds = [];

	var FileReader=Java.type("java.io.FileReader");
	var csvFile = "issues.csv";
	var fr = new FileReader(csvFile);

	var BufferedReader =Java.type("java.io.BufferedReader");
	var br = new BufferedReader(fr);

	var line ;
	br.readLine();    // 첫번째 줄은 넘어간다
	while ((line = br.readLine()) != null) {
		print(line);
		var issueNo = line.split(",")[0];
		var curlCmd = "curl --remote-name http://api키:1234@레드마인서버주소/redmine/issues/" + issueNo + ".pdf";
		print(curlCmd);
		curlCmds.push(curlCmd)
	}

	var FileWriter=Java.type("java.io.FileWriter");
	var curlCmdsFile = "downloadPdf.sh";
	var fw = new FileWriter(curlCmdsFile);
	fw.write(curlCmds.join("\n"));
	fw.write("\n");
	fw.close();  // forgetting to close it results in a truncated file

### 각각의 이슈를 pdf로 다운 받기

위의 작업을 수행하면 downloadPdf.sh 가 생성된다. 이 shell파일을 수행하면 pdf 를 다운로드 한다.

### 각각의 pdf를 하나의 pdf 로 합치기

pdfunite가 좋다고 하여 사용해봤는데 메모리 문제("Bogus memory allocation size") 발생하여 동작하지 않았다.

qpdf 라는 유틸리티를 써보니 잘 동작했다.

	qpdf --empty --pages $(ls -vr *.pdf) -- issues.pdf	#이름기준 역순descending으로 정렬됨(최신 이슈가 위로)

이 방법의 단점은 페이지 번호가 제대로 출력되지 않는 다는 점이다.
