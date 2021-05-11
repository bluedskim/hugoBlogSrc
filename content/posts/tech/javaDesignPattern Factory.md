---
title: "Java Design Pattern-02.Factory"
date: 2021-05-11T00:00:00+09:00
categories: ["tech"]
tags: ["java", "Design Pattern"]
draft: false
---

(*Java 디자인 패턴 스터디 모집 중 : https://github.com/bluedskim/javaDesignPatterns*)

# Factory Method 패턴

![Factory design Pattern in Java – with examples](https://dotnettutorials.net/wp-content/uploads/2018/11/word-image-103.png "Factory design Pattern in Java – with examples")

(출처:[Abstract Factory Design Pattern in C#](https://dotnettutorials.net/lesson/abstract-factory-design-pattern-csharp/))

## 해결하려는 문제
1. 생성자를 직접 호출해서 객체를 생성하는 경우 해당 객체와 클라이언트가 강하게 결합되게 되어 확정성이 떨어진다.

## 개요
* 생성자를 호출하지 않고 생성하기 위한 패턴(생성될 클래스를 지정하지 않는다)
* 해당 클래스를 사용하는 클래스에 하드코딩을 없앨 수 있다.
## 클래스 다이어그램
![Factory Method 패턴(김동석)](https://www.plantuml.com/plantuml/png/XPBFIm915CVFpL_n4CBre7kN2A48BqAa_y2uyzpTsb_Dl2sM2WhtPc0T10FrtB508lybtVqVsbKplTWmXpTVFjzvN-PDJH6N5BeEd763V1b10ydo1QJFxsayrUQpnqN_BOd79SOiMo2W6r04Bhfjb6fNodsACRB9mV-liv0Bb60H1QggwwPDLjYk6BwhjvqGXRgoNVsIt_1JLBRfdNCYb9vY7T_F2aWchqdycVH6yuydE1ISK2j4sQeq6XKXYb2irwkkMyXIsrx6TxY1qBHuW7373feaRSy48VcjLc8FZ1aELmfER6au-u0BD8XxvbwcUHrokHV8K_o-JeujKvb8oq9RkrH-Q4K1BfqhvkY-N5w7t5OsgRR5LGp6rerMKsYX8YYNZtSpLF-QB_fnEXpakpigiHrgOyluT31Tz6QmeY7fZlDHJ5uW7NudNoDMGqzaF-e7 "Factory Method 패턴(김동석)")

## 소스
* Shape.java : 도형(인터페이스)
{{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.factorymethod;

public interface Shape {
	String draw();
}{{< / highlight >}}
* 도형 객체들 : Shape.java 를 implement
  * Rectangle.java : 사각형
  {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.factorymethod;

public class Rectangle implements Shape {
	@Override
	public String draw() {
		return "draw Rectangle";
	}
}{{< / highlight >}}
  * Circle.java : 원
  {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.factorymethod;

public class Circle implements Shape {
	@Override
	public String draw() {
		return "draw Circle";
	}
}{{< / highlight >}}
  * Square.java : 정사각형
  {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.factorymethod;

public class Square implements Shape {
	@Override
	public String draw() {
		return "draw Square";
	}
}{{< / highlight >}}
* ShapeFactory.java : 도형 팩토리(Virtual Constructor)
  {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.factorymethod;

public class ShapeFactory {
	// use getShape method to get object of type shape
	public Shape getShape(String shapeType) {
		if (shapeType == null) {
			return null;
		}
		if (shapeType.equalsIgnoreCase("CIRCLE")) {
			return new Circle();

		} else if (shapeType.equalsIgnoreCase("RECTANGLE")) {
			return new Rectangle();

		} else if (shapeType.equalsIgnoreCase("SQUARE")) {
			return new Square();
		}

		return null;
	}
}{{< / highlight >}}
* 클라이언트 : FactoryMethodTest.java
  {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.factorymethod;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FactoryMethodTest {
	@Test
	public void decoratorTest() {
		ShapeFactory shapeFactory = new ShapeFactory();

		// get an object of Circle and call its draw method.
		Shape shape1 = shapeFactory.getShape("CIRCLE");

		// call draw method of Circle
		String drawResult = shape1.draw();
		log.info("className={}, drawResult={}", shape1.getClass().getSimpleName(), drawResult);
		assertEquals("draw Circle", drawResult);

		// get an object of Rectangle and call its draw method.
		Shape shape2 = shapeFactory.getShape("RECTANGLE");

		// call draw method of Rectangle
		drawResult = shape2.draw();
		log.info("className={}, drawResult={}", shape2.getClass().getSimpleName(), drawResult);
		assertEquals("draw Rectangle", drawResult);

		// get an object of Square and call its draw method.
		Shape shape3 = shapeFactory.getShape("SQUARE");

		// call draw method of square
		drawResult = shape3.draw();
		log.info("className={}, drawResult={}", shape3.getClass().getSimpleName(), drawResult);
		assertEquals("draw Square", drawResult);
	}
}{{< / highlight >}}

## 참고

* [refactoring.guru : Factory Method](https://refactoring.guru/design-patterns/factory-method)
* [tutorialspoint : Design Pattern - Factory Pattern](https://www.tutorialspoint.com/design_pattern/factory_pattern.htm)
* [wikipedia : Factory method pattern](https://en.wikipedia.org/wiki/Factory_method_pattern#Java)
* [baeldung : Introduction to Creational Design Patterns](https://www.tutorialspoint.com/design_pattern/factory_pattern.htm)
