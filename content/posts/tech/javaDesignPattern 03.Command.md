---
title: "Java Design Pattern-03.Command"
date: 2021-05-12T00:48:24+09:00
categories: ["tech"]
tags: ["java", "Design Pattern"]
draft: false
---

(*Java 디자인 패턴 스터디 모집 중 : https://github.com/bluedskim/javaDesignPatterns*)

# Command 패턴

![Command Pattern : Real-World Analogy](https://refactoring.guru/images/patterns/content/command/command-comic-1-2x.png?id=47b3c00b2cfbda7157a1 "Command Pattern : Real-World Analogy")
([출처:https://refactoring.guru/design-patterns/command](https://refactoring.guru/design-patterns/command))

## 해결하려는 문제
1. view(presentation)과 비즈니스 로직의 직접 연관을 제거(행위가 소스에 하드코딩되어 있다면 런타임에 추가/변경이 불가능)

## 용도/목적
1. 조건문이 많은 복잡한 로직을 간단하게
1. invoker와 receiver 사이에 command를 두어 직접 연관을 제거하여 새로운 command가 추가되더라도 invoker를 수정할 필요가 없음

## 특징
1. 행위behavioral 패턴
1. 눈에 보이지 않는 무형의 개념(행위)도 객체화 할 수 있다.

## 고려사항
1. command용 interface(TextFileOperation.java)는 @FunctionalInterface로 할 수 있다.

## 클래스 다이어그램

![Command Method 패턴(김동석)](https://www.plantuml.com/plantuml/png/bLFFIyCm63sRlo8CPErXxNs83Fp1BaDXWkUq-RP6cwGqNyU62WgxAOX7GJrxLF3YlpIx_y4uPzri7PfJykMzxxsyZxGCiXGp6TCjBILJd7O08ytfzEfnEdvn9g_dRzUt-VZU9IGI72Z814TKWWmWDSkb3vuX10N6KBGhzuc0SKXfX9YOfk_t1KPPu8LQ-a6S0JV7Glf7RC2smOY-scU8a2f3UbhR3SqVRlBnStvvDtcweEkS8JYraLrUf-DnNgVrThifPStQ3MDc33s08UuAQ-Y4h7Kn5QfFTGBASOkZOGEmnpD2XB8AFHP2mTfB86Kej5gWmn323EUKJn4BKvMK90jY4LRVEuKrd6_SLHfTQtELHkNzFpLA_9qPHgU7TaXV4oqbKLRxzeS_ApErCcxZrFEgO_eDNFbUGgf7qMXi5eyZrKakGSYVabYaB5XeWUBsHxq3 "Command Method 패턴(김동석)")

## 소스
1. client : command를 초기화하고 invoker를 호출
    * TextFileOperationExecutorWithoutCommandTest.java : command를 사용하지 않은 샘플 테스트용
    {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.command;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TextFileOperationExecutorWithoutCommandTest {
	@Test
	public void executeOperationTest() {
		TextFileOperationExceutorWithoutCommand textFileOperationExecutor = new TextFileOperationExceutorWithoutCommand();

		String openTextFileResult = textFileOperationExecutor.execute(new TextFile("file1.txt"), "open");
		log.info("openTextFileResult={}", openTextFileResult);
		assertEquals("Opening file file1.txt", openTextFileResult);

		String saveTextFileResult = textFileOperationExecutor.execute(new TextFile("file2.txt"), "save");
		log.info("saveTextFileResult={}", saveTextFileResult);
		assertEquals("Saving file file2.txt", saveTextFileResult);
	}
}{{< / highlight >}}
    * TextFileOperationExecutorWithCommandTest.java : command를 사용한 샘플 테스트용
    {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.command;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TextFileOperationExecutorWithCommandTest {
	@Test
	public void executeOperationTest() {
		TextFileOperationExecutorWithCommand textFileOperationExecutor = new TextFileOperationExecutorWithCommand();

		String openTextFileOperationResult = textFileOperationExecutor.executeOperation(new OpenTextFileOperation(new TextFile("file1.txt")));
		log.info("openTextFileOperationResult={}", openTextFileOperationResult);
		assertEquals("Opening file file1.txt", openTextFileOperationResult);

		String saveTextFileOperation = textFileOperationExecutor.executeOperation(new SaveTextFileOperation(new TextFile("file2.txt")));
		log.info("saveTextFileOperation={}", saveTextFileOperation);
		assertEquals("Saving file file2.txt", saveTextFileOperation);
		
		String udateTextFileOperation = textFileOperationExecutor.executeOperation(new UpdateTextFileOperation(new TextFile("file2.txt")));
		log.info("udateTextFileOperation={}", udateTextFileOperation);
		assertEquals("Updating file file2.txt", udateTextFileOperation);
	}
}{{< / highlight >}}
    
1. invoker : command를 받아 interface에 정의된 메소드를 호출하고 필요 시 이력 저장용 list에 저장
    * TextFileOperationExecutorWithCommand.java
    {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.command;

import java.util.ArrayList;
import java.util.List;

/**
 * command 패턴 샘플 invoker 클래스
 * 새로운 처리가 추가 되더라도 이 소스를 수정할 필요 없음
 */
public class TextFileOperationExecutorWithCommand {
	/**
	 * 실행 이력 저장용. 이 샘플에서는 불필요
	 */
	private final List<TextFileOperation> textFileOperations = new ArrayList<>();

	public String executeOperation(TextFileOperation textFileOperation) {
		textFileOperations.add(textFileOperation);
		return textFileOperation.execute();
	}
}{{< / highlight >}}
1. receiver : 실제 로직이 정의된 클래스
    * TextFile.java
    {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.command;

public class TextFile {
	private String name;

	public TextFile(String name) {
		this.name = name;
	}

	public String open() {
		return "Opening file " + name;
	}

	public String save() {
		return "Saving file " + name;
	}
	public String update() {
		return "Updating file " + name;
	}
}{{< / highlight >}}
1. command : command 객체
    * TextFileOperation.java : command용 interface
    {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.command;

/**
 * command용 interface
 */
@FunctionalInterface
public interface TextFileOperation {
	String execute();
}{{< / highlight >}}
    * OpenTextFileOperation.java : 파일 open하기 command
    {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.command;

/**
 * 파일열기 command
 */
public class OpenTextFileOperation implements TextFileOperation {
	private TextFile textFile;

	public OpenTextFileOperation(TextFile textFile) {
		this.textFile = textFile;
	}

	@Override
	public String execute() {
		return textFile.open();
	}
}{{< / highlight >}}
    * SaveTextFileOperation.java : 파일 save하기 command
    {{< highlight java "linenos=table,hl_lines=0-0,linenostart=1" >}}
package net.dskim.desingpattern.command;

/**
 * 파일저장 command
 */
public class SaveTextFileOperation implements TextFileOperation {
	private TextFile textFile;

	public SaveTextFileOperation(TextFile textFile) {
		this.textFile = textFile;
	}

	@Override
	public String execute() {
		return textFile.save();
	}
}{{< / highlight >}}

## 참고

* [wikipedia : Command pattern](https://en.wikipedia.org/wiki/Command_pattern)
* [baeldung : The Command Pattern in Java](https://www.baeldung.com/java-command-pattern)
* [Alvin Alexander : A Java Command Design Pattern example](https://alvinalexander.com/java/java-command-design-pattern-in-java-examples/)
  + [A Java Action, ActionListener, and AbstractAction example](https://alvinalexander.com/java/java-action-abstractaction-actionlistener)
