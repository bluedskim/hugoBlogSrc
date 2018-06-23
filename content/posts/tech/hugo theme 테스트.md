+++
date = "2018-06-23T10:54:24+02:00"
draft = false
title = "Hugo Theme 변경 테스트"
slug = "post-title"
tags = ["Hugo","Theme"]
image = ""
comments = true	# set false to hide Disqus
share = true	# set false to hide share buttons
menu= ""		# set "main" to add this content to the main menu
author = ""
featured = false
description = "Hugo Theme 변경 테스트"
+++
원래 사용하던 theme이 좀 평범한 듯 하여 다른 theme 을 테스트 하고 있다. 
지금 현재 쓰는 theme 은 bleak 라는 것인데 메인화면에서 compact 하게 공간 낭비가 없다는게 좋다.

https://github.com/Zenithar/hugo-theme-bleak

한가지 마음에 안드는게 있는데 상세화면에서 소스 코드 보기(code태그) 가 눈에 잘 안띈다는 건데. 그래서  아래처럼 main.css를 좀 바꿨더니 볼만해졌다.

```
code,pre,tt{
	font-family:Inconsolata,monospace;
	background-color:white
}
```

하지만 bleak를 쓰지 않기로 함.

* code line numbering 된다고 했는데 안되고 https://bleak.zutrinken.com/demo/
* google analytics 동작 안되고(세팅을 잘못했을 수도)
* 업데이트가 활발하지 않은 듯

그래서 [ananke](https://themes.gohugo.io/gohugo-theme-ananke/) 로 다시 돌아감 

그 외에 괜찮은 theme 들

* https://github.com/progrhyme/hugo-theme-bootie-docs
* https://themes.gohugo.io/hugo_theme_pickles/
* https://themes.gohugo.io/black-and-light/
* https://themes.gohugo.io/hugo-kiera/
* https://github.com/budparr/gohugo-theme-ananke
* https://themes.gohugo.io/hugo-theme-minos/
* https://themes.gohugo.io/gohugo-amp/

