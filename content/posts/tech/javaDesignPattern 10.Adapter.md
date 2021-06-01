---
title: "Java 디자인 패턴-10.Adapter"
date: 2021-06-01T16:12:55+09:00
categories: ["tech"]
tags: ["java", "Design Pattern"]
draft: false
---
(*Java 디자인 패턴 스터디 모집 중 : https://github.com/bluedskim/javaDesignPatterns*)

## Adapter(적응) 패턴

![숲속의 곰이 북극에 적응하기](https://static.spacecrafted.com/b849f747e16744a5be3537c67cbb5770/i/f4d8c0d7559a4f02861ae4d67e55ceb2/1/GCuCv726gZycFxatRCb7iU/Adaptation.jpg "숲속의 곰이 북극에 적응하기")

(출처:[https://educationinaction.org/water-rocks-vocabulary/adaptation](https://educationinaction.org/water-rocks-vocabulary/adaptation))

## 해결하려는 문제
1. 인터페이스의 불일치 해결.
## 용도/목적
1. 구조적Structural 패턴
1. 어떤 인터페이스를 다른 목적의 인터페이스로 만드는 패턴.
1. 클라이언트 소스 수정이 불가능한 경우 유용하다.

## 구성요소
1. adapter(wrapper) : adaptee의 interface를 클라이언트가 원하는 target의 인터페이스로 변경하는 객체
1. adaptee : 변경대상이 되는 객체
1. target : 클라이언트가 원하는 인터페이스를 가지고 있는 객체
1. 클라이언트 : target으로 변경된 adaptee를 사용하는 객체
## 고려사항

다른 유사한 패턴과 비교해보자 https://en.wikipedia.org/wiki/Adapter_pattern#Usage

1. Decorator : 원래의 소스를 감싸는 방식으로 인터페이스에 동적으로 기능을 추가한다.
1. Delegation : 상속을 통한 조합
1. Facade : 단순화된 인터페이스 제공

## 클래스 다이어그램

![Adapter 패턴(김동석)](https://www.plantuml.com/plantuml/png/hLFBIWCn55qtNn4AqkcYC_iYOi551Gi5wmTa9hUJw2GPaaoXgA3GdOAu5DIrImKt_bAT_eFfaqvjYmMpkxdtd7Dp3ZaqbcYRYGGtA4ajQ3owVniDFhtXryttmrC-UAaYn3W532ArVIn0XA1DySeoHGr2bji4jl0m8DGrcBMfgGT1p2tBGZzI8WYJ3AYvu28u9pro18R7iasiev46TPKQy-MlZ_dW8xzx7hxVuZrAB7ZblZj-g-LJMi6LPhCkHDcjYxXqW2w909_mc5d9PTncIWA-HALJgrs9DKICw1YyAYhr5ASuCx0OTfVNoomj7cbrPiA_aCndfnnHGep1n-dkwbDaGr8zxk-kkQ3hg7bxdemZIpNlEGTnbqkIhBgK54fKsapbRKLM_t7f3XYxneL2Cbun9x5SJKHMjjs_ylrPDgW8dNGsBxDkUfRKaiXluskrWnMljurFdZo65DGGEWH9tOVz0G00 "Adapter 패턴(김동석)")

## 소스
1. adapter : LightningToMicroUsbAdapter.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.adapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LightningToMicroUsbAdapter implements MicroUsbPhone {
	private final LightningPhone lightningPhone;

	public LightningToMicroUsbAdapter(LightningPhone lightningPhone) {
		this.lightningPhone = lightningPhone;
	}

	@Override
	public void useMicroUsb() {
		log.info("MicroUsb connected");
		lightningPhone.useLightning();
	}

	@Override
	public String recharge() {
		return lightningPhone.recharge();
	}
}{{< / highlight >}}
1. adaptee : LightningPhone.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.adapter;

public interface LightningPhone {
	String recharge();
	void useLightning();
}{{< / highlight >}}
1. target : MicroUsbPhone.java 
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.adapter;

public interface MicroUsbPhone {
	String recharge();
	void useMicroUsb();
}{{< / highlight >}}
1. 클라이언트 : LightningToMicroUsbAdapterTest.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.adapter;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LightningToMicroUsbAdapterTest {
	// MicroUsbPhone 충전전용 메소드를 반드시 써야 한다고 가정한다.
	public String rechargeMicroUsbPhone(MicroUsbPhone microUsbPhone) {
		microUsbPhone.useMicroUsb();
		return microUsbPhone.recharge();
	}

	@Test
	public void lightningToMicroUsbAdapterTest() {
        Android android = new Android();
		String androidRechargeResult = rechargeMicroUsbPhone(android);
		log.info("androidRechargeResult={}", androidRechargeResult);
		assertEquals("Recharge finished", androidRechargeResult);

        Iphone iPhone = new Iphone();
		//rechargeMicroUsbPhone(iPhone); //iPhone에서 micro usb를 쓰려한다면 compile 에러 발생
		String iphoneWithMicroUsbRechargeResult = rechargeMicroUsbPhone(new LightningToMicroUsbAdapter(iPhone));
		log.info("iphoneWithMicroUsbRechargeResult={}", iphoneWithMicroUsbRechargeResult);
		assertEquals("Recharge finished", iphoneWithMicroUsbRechargeResult);
	}
}{{< / highlight >}}

## 참고

* [refactoring.guru : Adapter pattern](https://refactoring.guru/design-patterns/adapter)
* [wikipedia : Adapter pattern](https://en.wikipedia.org/wiki/Adapter_pattern)
* [baeldung : The Adapter Pattern in Java](https://www.baeldung.com/java-adapter-pattern#:~:text=An%20Adapter%20pattern%20acts%20as,compatible%20with%20the%20client's%20interface.)
