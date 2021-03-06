---
title: "Java 디자인 패턴-01.Singleton"
date: 2021-05-07T12:13:37+09:00
categories: ["tech"]
tags: ["java", "Design Pattern"]
draft: false
---

(*Java 디자인 패턴 스터디 모집 중 : https://github.com/bluedskim/javaDesignPatterns*)

![singleton 일러스트](https://refactoring.guru/images/patterns/content/singleton/singleton-comic-1-en-2x.png?id=05678e879d13f7f6a377 "singleton 일러스트")
(출처 : [refactoring.guru : Singleton pattern](https://refactoring.guru/design-patterns/singleton))
## 해결하려는 문제
1. 공유된 자원은 대체로 한정적이다. 이 자원을 무분별하게 사용하는 경우 쉽게 고갈될 수 있다. 

## 용도
1. 어플리케이션을 통틀어 한 개의 인스턴스만 필요할 때
1. 그 한 개의 인스턴스를 쉽게 접근하고자 할 때
1. 어플리케이션의 전체 영역에서 사용할 수 있는 전역변수가 필요할 때

## 특징
1. 해당 클래스의 생성자는 직접 호출할 수 없음
1. 대신 해당 객체를 반환하는 public static 메소드를 만든다

## 고려사항
1. 객체지향 설계원칙에 위배
    * singleton 클래스는 상속 불가
1. "No control over creation"
1. singleton 클래스에 dependency injection 불가
1. spring bean은 기본적으로 singleton으로 동작한다(https://www.baeldung.com/spring-bean-scopes)

## 클래스 다이어그램

![Singleton 패턴(김동석)](https://www.plantuml.com/plantuml/png/VP71IiD048RFxbCC1MbwQ7FFGGhnK0y1GLzWancJrUnkoKuAHGI5tXJ4ew2UFIfuyPNQz1tSscfZ3yvfvly_vbzcXuvbnRKkuKIPl2Is1fPthylPHp3_l5xSFpQpvvuGXK82qcEUWYQTKkN-IbnOT4AmufB-tLIGHAgWO1wxA0npnKMT3ZAhmxIi2Ts5qk6vdCX3SYetnvAPAkF4cRM-WURbePczDxTFyxSRs4V957IclWP9Ca3iGdSqYhJk-0TdfNGEOgiCN8gzSQKc7WPb63AlnROsl9Nz3LXbQrePFvcCjkvA3df-hjFIKsqu9pxQy2rYbUAT-2UePKsiGf28YQreP--tXOHrnXldIeZVKvwIO-Zt3zQvqKxoa0pwF_m2 "Singleton 패턴(김동석)")

## 소스

* 소스 다운로드 : https://github.com/bluedskim/javaDesignPatterns/tree/master/01.Singleton/dskim_singleton
* 싱글톤 클래스 : Coin.java
{{< highlight java "linenos=table,hl_lines=6-6,linenostart=1" >}}
package net.dskim.desingpattern.singleton;

public class Coin {
	private static final int ADD_MORE_COIN = 10;
	private int coinCount;
	private static Coin instance = new Coin(); // Eagerly Loading of singleton instance

	private Coin() {
		// private to prevent anyone else from instantiating
	}

	public static Coin getInstance() {
		return instance;
	}

	public int getCoinCount() {
		return coinCount;
	}

	public void addMoreCoin() {
		coinCount += ADD_MORE_COIN;
	}

	public void deductCoin() {
		coinCount--;
	}
}
{{< / highlight >}}

* 클라이언트 : SingletonTest.java
{{< highlight java "linenos=table,hl_lines=26,linenostart=1" >}}
package net.dskim.desingpattern.singleton;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SingletonTest {
	@Test
	public void singletonTest() {
		Coin coin1 = Coin.getInstance();
		Coin coin2 = Coin.getInstance();

		log.info("coin1={}, coin2={}", coin1, coin2);
		assertEquals(coin1, coin2);

		coin1.addMoreCoin();
		
		log.info("coin1.getCoinCount()={}, coin2.getCoinCount()={}", coin1.getCoinCount(), coin2.getCoinCount());
		assertEquals(10, coin2.getCoinCount());

		coin2.deductCoin();
		log.info("coin1.getCoinCount()={}, coin2.getCoinCount()={}", coin1.getCoinCount(), coin2.getCoinCount());
		assertEquals(9, coin1.getCoinCount());
	}
}
{{< / highlight >}}

## 참고

* [refactoring.guru : Singleton pattern](https://refactoring.guru/design-patterns/singleton)
* [wikipedia : Singleton pattern](https://en.wikipedia.org/wiki/Singleton_pattern#Java_Implementation_[7])

(*Java 디자인 패턴 스터디 모집 중 : https://github.com/bluedskim/javaDesignPatterns*)
