---
title: "Java 디자인 패턴-11.Decorator"
date: 2021-06-03T22:31:58+09:00
categories: ["tech"]
tags: ["java", "Design Pattern"]
draft: false
---

(*Java 디자인 패턴 스터디 모집 중 : https://github.com/bluedskim/javaDesignPatterns*)

## Decorator 패턴

![IEC 61131-3: The Decorator Pattern](https://stefanhenneken.files.wordpress.com/2019/02/picture03.png "IEC 61131-3: The Decorator Pattern")

(출처:[https://stefanhenneken.net/2019/02/16/iec-61131-3-the-decorator-pattern](https://stefanhenneken.net/2019/02/16/iec-61131-3-the-decorator-pattern))

## 해결하려는 문제
## 특징/용도
1. 런타임에 객체에 동적으로 기능을 추가하기 위한 structural 패턴
1. 래퍼wrapper 클래스로 구현. 
1. chain of responsibility pattern과 유사함
1. 생성자 혹은 다른 메소드에서 해당 클래스 자체를 인수로 받는 경우 데코레이터라 볼 수 있다(https://refactoring.guru/design-patterns/decorator/java/example)

## 고려사항

## 클래스 다이어그램
![Decorator 패턴(김동석)](https://www.plantuml.com/plantuml/png/dLJ1IWCn53oRhmW5QNjeUoyUYgtefI3e3sIJvsxiPhFalHL41ONU5CIZe9uzAdZnbshz1wEsMxVTLd5FksycCybCs0wIS9IPcFT0MYV8Elv-zVW-VAcDNi_Vhc_7m_iwOv5MmC6aTCmDc00S5aSKMOMCaQOOLYf581Gu7X6bs6wrGarH5ZIbDQqWpa3XG9lMeJWIFK0T9hk225o2xC1Q_yB73pVZuVFuycxqTC7NbI2eLOxzq-ptcqfLUNLdfsrCnMzO14XEIE8o5eXy4ux0YH0s1G8_OMkfytgIGF4zSZe9kGAKJgUaRUBHB8Yrd48XK6-6rkevddiewmVmIUnQ9CyuOspY6mivs0VnvVczQZbv2rC7YFPFv6q7aFokF9T3roPA6qW8yv8M8oc45Km-PixTo4eR--npiHzxM0HhfNBrFnonh-D1cKTX_d_vlImKhao_2Fp7eB1auxJHo2z22JIjlGIQbbm2BMboZhc2o9RTXM_vXHvNymkThAOMusKTI9J__tm0 "Decorator 패턴(김동석)")
## 소스
* 꾸며질decorated 객체
  * BeverageBase.java : 부모 abstract 객체
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.decorator;
abstract class BeverageBase {

	protected String description = "";

	public String getDescription() {
		return description;
	}

	/**
	 * 가격을 계산하는 로직은 하위 객체가 구현해야 한다.
	 * @return
	 */
	public abstract double getCost();
}{{< / highlight >}}
  * BlackTea.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.decorator;

class BlackTea extends BeverageBase {

	public BlackTea() {
		description = "Black tea from teabag";
	}

	@Override
	public double getCost() {
		return 5;
	}
}{{< / highlight >}}
  * Espresso.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.decorator;

abstract class BeverageBase {

	protected String description = "";

	public String getDescription() {
		return description;
	}

	/**
	 * 가격을 계산하는 로직은 하위 객체가 구현해야 한다.
	 * @return
	 */
	public abstract double getCost();
}{{< / highlight >}}
  * GreenTea.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.decorator;

class GreenTea extends BeverageBase {

	public GreenTea() {
		description = "Green leaf tea";
	}

	@Override
	public double getCost() {
		return 8;
	}
}{{< / highlight >}}
* 꾸미는decorator 객체 
  * CondimentsDecoratorBase.java : 부모 abstract 객체
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.decorator;

/**
 * 데코레이터 객체
 */
abstract class CondimentsDecoratorBase extends BeverageBase {
	BeverageBase beverage;

	/**
	 * 생성자에서 BeverageBase의 참조를 받아서 멤버변수에 할당
	 * @param beverage
	 */
	protected CondimentsDecoratorBase(BeverageBase beverage) {
		this.beverage = beverage;
	}
}{{< / highlight >}}
  * CholateCondiment.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.decorator;

class ChocolateCondiment extends CondimentsDecoratorBase {
	/**
	 * 생성자에서 해당 클래스 자체를 인수로 받는다
	 */
	public ChocolateCondiment(BeverageBase beverage) {
		super(beverage);
		description = beverage.getDescription() + " + Chocolate";
	}

	@Override
	public double getCost() {
		return beverage.getCost() + 4;
	}
}{{< / highlight >}}
  * MilkCondiment.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.decorator;

class MilkCondiment extends CondimentsDecoratorBase {
	public MilkCondiment(BeverageBase beverage) {
		super(beverage);
		description = this.beverage.getDescription() + " + Milk";
	}

	@Override
	public double getCost() {
		return beverage.getCost() + 3;
	}
}{{< / highlight >}}
  * SugarCondiment.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.decorator;

class SugarCondiment extends CondimentsDecoratorBase {
	public SugarCondiment(BeverageBase beverage) {
		super(beverage);
		description = beverage.getDescription() + " + Sugar";
	}

	@Override
	public double getCost() {
		return beverage.getCost() + 1;
	}
}{{< / highlight >}}

## 참고

* [baeldung : The Decorator Pattern in Java](https://www.baeldung.com/java-decorator-pattern)
* [DZone : Decorator Design Pattern in Java](https://dzone.com/articles/decorator-design-pattern-in-java)

