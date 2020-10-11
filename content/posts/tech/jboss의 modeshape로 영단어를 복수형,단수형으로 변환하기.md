---
title: "Jboss의 Modeshape로 영단어를 복수형 혹은 단수형으로 변환하기"
date: 2020-10-11T21:39:37+09:00
categories: ["tech"]
tags: ["java"]
draft: false
---

java 프로젝트를 진행할 때 단수 영단어를 복수로 변환하거나 반대로 복수 영단어를 단수로 변환해야 하는 경우가 있다. 

Jboss에서 제공하는 Modeshape의 Inflector 라이브러리를 쓰면 쉽게 구현이 가능하다.

Modeshape(https://modeshape.wordpress.com) 는 오픈소스 JCR(Java Content 
Repository)이라고 한다.

하지만 나의 관심사는 영단어 단수/복수 변환이었기에 JCR에 대해서는 더 이상 알아보지는 않기로 했다(그래서 이 라이브러리를 단복수 변환에만 쓰기 위해 사용하는 것은 overkill일 것 같기는 하다).

Gradle로 최신판을 의존성에 추가한다(아쉽게도 2017년 이후로 버전업 되고 있지 않다)

	compile group: 'org.modeshape', name: 'modeshape-common', version: '5.4.1.Final'

사용법은 아주 쉽다.

{{< highlight go "linenos=table,hl_lines=15-16,linenostart=1" >}}

import org.modeshape.common.text.Inflector;

public class App {
	public static void main(String[] args) {
		Inflector inflector = new Inflector();
		System.out.println("cat:" + inflector.pluralize("cat") + "/" + inflector.singularize("cats"));
		System.out.println("asdf:" + inflector.pluralize("asdf") + "/" + inflector.singularize("asdfs"));
		System.out.println("bus:" + inflector.pluralize("bus") + "/" + inflector.singularize("buses"));
		System.out.println("penny:" + inflector.pluralize("penny") + "/" + inflector.singularize("pennies"));
		System.out.println("child:" + inflector.pluralize("child") + "/" + inflector.singularize("children"));
		System.out.println("fungus:" + inflector.pluralize("fungus") + "/" + inflector.singularize("fungi"));
		System.out.println("datum:" + inflector.pluralize("datum") + "/" + inflector.singularize("data"));
		System.out.println("sheep:" + inflector.pluralize("sheep") + "/" + inflector.singularize("sheep"));
		System.out.println("knife:" + inflector.pluralize("knife") + "/" + inflector.singularize("knives"));
		// 오류! criterion의 복수형은 criteria이다. 
		System.out.println("criterion:" + inflector.pluralize("criterion") + "/" + inflector.singularize("criteria"));
		System.out.println("bacterium:" + inflector.pluralize("bacterium") + "/" + inflector.singularize("bacteria"));
		
	}
}

{{< / highlight >}}

위의 코드는 규칙 단복수형의 경우 잘 동작하지만 일부 불규칙 단복수형의 경우 오동작하는 경우가 있다.

가령 criterion의 복수형은 criteria 이지만 criterions이라고 출력되었고 criteria를 단수형으로 변환 했을 때 criterium이라고 출력되었다.

github에 소스가 공개되어있으니(https://github.com/ModeShape/modeshape) 직접 고쳐쓰는것도 방법이다. 

