---
title: "Java 디자인 패턴-07.State"
date: 2021-05-24T08:46:28+09:00
categories: ["tech"]
tags: ["java", "Design Pattern"]
draft: true
---

## 패턴 다이어그램

![State](https://refactoring.guru/images/patterns/content/state/state-en-2x.png?id=dfd427a938223ae88029 "State")
"어떤 객체의 상태에 따라 행위가 변경되는 경우 유용한 패턴"
(출처:[https://refactoring.guru/design-patterns/state](https://refactoring.guru/design-patterns/state))

## 해결하려는 문제

1. context의 상태에 따른 처리가 구분되는 경우 해당 구분로직을 context에 하드 코딩하게 되면 경우 확장성이 떨어진다.

## 특징/용도
1. 상태를 클래스화 하고 해당 동작들을 넣는다
1. 원래의 객체(context)는 현재 상태 객체의 참조를 가진다
1. context는 2개 이상의 상태를 동시에 가질 수는 없다

## 고려사항

1. State 패턴은 Strategy 패턴과 유사하다. 주요한 차이점은 상태객체들은 서로의 존재를 아는 반면 Strategy패턴에서는 Strategy간의 관련성은 없다는 것이다(https://refactoring.guru/design-patterns/state)

## 클래스 다이어그램

![State 패턴(김동석)](https://www.plantuml.com/plantuml/png/dLEzJiCm49xnKrYLK9EXoLuGwb293XGgu0MS-9gOnabbNu8gG0Af6qY84GawCuB4mYkLz1rm4re8b85wEj_TztDdkQMHAKnbH8-G8T3PpTDi_6fDtoxVR-_pyQDDI2WuK9137549qWEbgoaC4wu9GO4H_CaI0kEWQ8Wur4tN3GI6gUVuYNIzA0Mk1qAw9onZRT0YY7iC4LIiIJz9J43poLq-Vicl7wRFLtIJ6mchDZB7wNOTpkkqtkaqfQmPiqJ41j1dFj0UymSiWDBH6TaOfbuaVEDGYJYW0U1-Wg8_seMvrfxGQDdaWX0_ObhJ0yKLyFMmROW4PB0s_X1y4DcwwC-n2vmIsPoYiWa_LGfYB2vRI-ui4PngADDM1H33QH7Oo-PAELY0x7yQBL37e75kjTHVPCgsYipskUDyVvKLrHzxNz5HsImXNmuQZPt5LAkp5SRV1TA2c9jVz040 "State 패턴(김동석)")

## 소스
1. Context : 상태를 가지고있는 객체(Package.java)
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.state.solution;

/**
 * 주문 객체
 */
public class Package {
	private PackageState currentState = new OrderedState();

	public void setState(PackageState newState) {
		this.currentState = newState;
	}

	public PackageState getState() {
		return this.currentState;
	}

	/**
	 * 상태 변경시 알려줄 대상 목록 반환
	 * @return
	 */
	public String getNotifyGetterList() {
		return currentState.getNotifyGetterList();
	}
}

{{< / highlight >}}
1. State
	* OrderedState.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.state.solution;

/**
 * 상태 객체-주문
 */
public class OrderedState implements PackageState {
	/**
	 * 알림 수신 대상자 목록 반환
	 */	
	@Override
	public String getNotifyGetterList() {
		return "shipper";
	}
		
	@Override
	public String toString() {
		return "OrderedState";
	}
}{{< / highlight >}}
	* DelieveredState.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.state.solution;

/**
 * 상태 객체-배송완료
 */
public class DeliveredState implements PackageState {
	/**
	 * 알림 수신 대상자 목록 반환
	 */
	@Override
	public String getNotifyGetterList() {
		return "orderer";
	}

	@Override
	public String toString() {
		return "DeliveredState";
	}
}{{< / highlight >}}	
	* ReceivedState.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.state.solution;

/**
 * 상태 객체-수령완료
 */
public class ReceivedState implements PackageState {
	/**
	 * 알림 수신 대상자 목록 반환
	 */	
	@Override
	public String getNotifyGetterList() {
		return "orderer,manager";
	}

	@Override
	public String toString() {
		return "ReceivedState";
	}
}{{< / highlight >}}
1. client : StateTest.java
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.state.solution;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class StateTest {

	@Test
	void stateTest() {
		Package pkg = new Package();
		
		log.info("state={}", pkg.getState());
		assertEquals("shipper", pkg.getNotifyGetterList());

		pkg.setState(new DeliveredState());
		log.info("state={}", pkg.getState());
		assertEquals("orderer", pkg.getNotifyGetterList());

		pkg.setState(new ReceivedState());
		log.info("state={}", pkg.getState());
		assertEquals("orderer,manager", pkg.getNotifyGetterList());

		/* //CancelState를 추가하는 경우에도 Package 소스를 수정할 필요가 없다
		pkg.setState(new CancelState());
		log.info("state={}", pkg.getState());
		assertEquals("shipper,manager", pkg.getNotifyGetterList());
		*/
	}
}{{< / highlight >}}


## 참고

* [wikipedia : State pattern](https://en.wikipedia.org/wiki/State_pattern)
* [refactoring.guru : Design Patterns / Behavioral Patterns / State](https://refactoring.guru/design-patterns/state)
* [tutorialspoint : Design Patterns - State Pattern](https://www.tutorialspoint.com/design_pattern/state_pattern.htm)
