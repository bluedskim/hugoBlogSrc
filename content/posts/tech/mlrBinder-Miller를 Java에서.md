---
title: "mlrBinder 소개 — Java에서 Miller를 간단하게 부르기"
date: 2026-04-13T12:00:00+09:00
draft: false
description: "README를 바탕으로 핵심만 짧게 정리한 mlrBinder 소개와 전체 샘플 모음."
---

**먼저 밝힙니다.** [mlrBinder](https://github.com/bluedskim/mlrBinder)는 제가 직접 만들고 있는 프로젝트입니다. 이 글은 README를 바탕으로 **설명은 짧게 줄이고, 샘플은 모두 포함한 버전**입니다.

---

mlrBinder는 [Miller](https://miller.readthedocs.io/)(`mlr`)를 **자바에서 읽기 좋은 체인 API로 호출**할 수 있게 해 주는 라이브러리입니다. 내부적으로는 표준 `mlr` 프로세스를 그대로 실행합니다.

- **Java 11 이상**
- **Maven Central:** `io.github.bluedskim:mlr-binder`
- **권장 `mlr` 버전:** [`mlr` 6.17.0](https://github.com/johnkerl/miller/releases/tag/v6.17.0)
- **실행 방식:** JNI가 아니라 외부 `mlr` 프로세스를 실행
- **권장 스타일:** 전역 플래그는 `Mlr` 체인에, 동사는 Miller와 같은 이름의 메서드로 호출 (`filter` / `split`만 `.filterVerb()` / `.splitVerb()`)

---

## 설치 — 이렇게만 추가해 보세요

**Java 11 이상**이면 됩니다. 주요 타입이 들어 있는 패키지는 **`net.shed.mlrbinder`**입니다.

Maven (`pom.xml`):

```xml
<dependency>
  <groupId>io.github.bluedskim</groupId>
  <artifactId>mlr-binder</artifactId>
  <version>0.2</version>
</dependency>
```

Gradle (Kotlin DSL):

```kotlin
dependencies {
    implementation("io.github.bluedskim:mlr-binder:0.2")
}
```

Gradle (Groovy):

```groovy
dependencies {
    implementation 'io.github.bluedskim:mlr-binder:0.2'
}
```

---

## README 샘플 모음

아래는 README의 샘플을 그대로 옮긴 것입니다.

- **시작:** `Mlr.inDir(…)` 또는 `Mlr.withCsvPreset()`
- **전역 플래그:** `Mlr` 체인에 붙이기
- **동사:** Miller와 같은 이름의 메서드 사용
- **예외:** `filter` / `split`만 `.filterVerb()` / `.splitVerb()`
- **연속 동사:** 여러 동사를 잇으면 `then`이 자동으로 들어감

필요한 import만 골라 쓰시면 됩니다.

```java
import static net.shed.mlrbinder.Flag.flag;
import static net.shed.mlrbinder.Objective.objective;
import static net.shed.mlrbinder.SortFlags.f;
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;
import static net.shed.mlrbinder.verb.Option.option;

import net.shed.mlrbinder.Mlr;
```

### 입출력 플래그와 `cat`

```bash
mlr --csv cat example.csv
```

```java
Mlr.inDir(workingPath)
	.csv()
	.cat()
	.file("example.csv")
	.run();
```

```bash
mlr --icsv --opprint cat example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.cat()
	.file("example.csv")
	.run();
```

### 파일 형식(CSV, JSON, DKVP, TSV)

```bash
mlr --csv cat shape.csv
mlr --json cat shape.json
mlr --idkvp --ocsv cat shape.dkvp
mlr --tsv cat shape.tsv
```

```java
Mlr.inDir(workingPath).csv().cat().file("shape.csv").run();
Mlr.inDir(workingPath).jsonFlag().cat().file("shape.json").run();
Mlr.inDir(workingPath).idkvp().ocsv().cat().file("shape.dkvp").run();
Mlr.inDir(workingPath).tsv().cat().file("shape.tsv").run();
```

### `head` / `tail` 옵션

```bash
mlr --csv head -n 4 example.csv
```

```java
Mlr.inDir(workingPath)
	.csv()
	.head(4)
	.file("example.csv")
	.run();
```

```bash
mlr --csv tail -n 4 example.csv
```

```java
Mlr.inDir(workingPath)
	.csv()
	.tail(4)
	.file("example.csv")
	.run();
```

### `sort`, `cut`

```bash
mlr --icsv --opprint sort -f shape -nr index example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.sort(f("shape"), nr("index"))
	.file("example.csv")
	.run();
```

```bash
mlr --icsv --opprint cut -o -f flag,shape example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.cut(
		option(flag("-o")),
		option(flag("-f").objective("flag,shape")))
	.file("example.csv")
	.run();
```

### `filter` / `put` (DSL은 문자열 그대로)

```bash
mlr --icsv --opprint filter '$color == "red"' example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.filterVerb(objective("$color == \"red\""))
	.file("example.csv")
	.run();
```

```bash
mlr --icsv --opprint put '$[[3]] = "NEW"' example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.put(objective("$[[3]] = \"NEW\""))
	.file("example.csv")
	.run();
```

### 공백이 있는 필드 이름 (`-nr` 값은 셸에서 따옴표로 감싸지 않아도 하나의 토큰입니다)

```bash
mlr --csv cat spaces.csv
```

```java
Mlr.withCsvPreset()
	.workDir(workingPath)
	.cat()
	.file("spaces.csv")
	.run();
```

```bash
mlr --c2p sort -nr 'Total MWh' spaces.csv
```

```java
Mlr.inDir(workingPath)
	.c2p()
	.sort(nr("Total MWh"))
	.file("spaces.csv")
	.run();
```

```bash
mlr --c2p put '${Total KWh} = ${Total MWh} * 1000' spaces.csv
```

```java
Mlr.inDir(workingPath)
	.c2p()
	.put(objective("${Total KWh} = ${Total MWh} * 1000"))
	.file("spaces.csv")
	.run();
```

### 여러 입력 파일

```bash
mlr --csv cat data/a.csv data/b.csv
```

```java
Mlr.inDir(workingPath)
	.csv()
	.cat()
	.file("data/a.csv")
	.file("data/b.csv")
	.run();
```

### `then`으로 동사 연결

```bash
mlr --icsv --opprint sort -nr index then head -n 3 example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.sort(nr("index"))
	.head(3)
	.file("example.csv")
	.run();
```

셸 파이프(`mlr … | mlr …`)는 자바에서는 **`Mlr`를 두 번** 호출하는 식으로 옮기면 됩니다.

```bash
mlr --csv sort -nr index example.csv | mlr --icsv --opprint head -n 3
```

```java
import java.nio.file.Files;
import java.nio.file.Path;

Path tmp = Files.createTempDirectory("mlr-pipe");
Path sorted = tmp.resolve("sorted.csv");
Mlr.inDir(workingPath)
	.csv()
	.sort(nr("index"))
	.file("example.csv")
	.redirectOutputFile(sorted.toFile())
	.run();

String pprintTop = Mlr.inDir(tmp.toString())
	.icsv()
	.opprint()
	.head(3)
	.file(sorted.getFileName().toString())
	.run();
```

### `--from`

```bash
mlr --icsv --opprint --from example.csv sort -nr index then head -n 3
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.from("example.csv")
	.sort(nr("index"))
	.head(3)
	.run();
```

### `--mfrom` / `--mload` (`--`가 가변 인자 뒤에 오는 경우)

```bash
mlr --csv --mfrom a.csv b.csv -- cat
```

```java
Mlr.inDir(workingPath)
	.csv()
	.mfrom("a.csv", "b.csv")
	.cat()
	.run();
```

### `stats1`처럼 옵션이 많은 동사

```bash
mlr --icsv --opprint --from example.csv stats1 -a count,min,mean,max -f quantity -g shape
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.from("example.csv")
	.stats1(
		flag("-a").objective("count,min,mean,max"),
		flag("-f").objective("quantity"),
		flag("-g").objective("shape"))
	.run();
```

### JSON 입력·출력

```bash
mlr --ijson --ocsv cat example.json
```

```java
Mlr.inDir(workingPath)
	.ijson()
	.ocsv()
	.cat()
	.file("example.json")
	.run();
```

### 제자리 갱신 `-I`

```bash
mlr -I --csv sort -f shape newfile.txt
```

```java
Mlr.inDir(tmpDir)
	.inPlace()
	.csv()
	.sort(f("shape"))
	.file("newfile.txt")
	.run();
```

튜토리얼의 `put` 예제에 나오는 `$y2`는 문서 오타일 가능성이 있습니다. Miller에서는 제곱을 `$y**2`로 쓰는 편이 맞습니다.

---

## 추가 예제

README의 예제입니다.

```java
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;

import net.shed.mlrbinder.Mlr;

// 전역 플래그는 체인에, 동사는 이름 그대로
String runResult = Mlr.inDir(workingPath)
	.csv()
	.sort(n("a"), nr("b"))
	.file("example.csv")
	.run();

// 처음부터 CSV를 전제로 시작할 때
String runResult2 = Mlr.withCsvPreset()
	.workDir(workingPath)
	.sort(n("a"), nr("b"))
	.file("example.csv")
	.run();
```

짧게만 정리하면, 전역 플래그는 체인에 붙이고 동사는 Miller와 같은 이름의 메서드로 부르면 됩니다. `filter` / `split`만 예외입니다.

```java
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;

String runResult = Mlr.withCsvPreset()
	.workDir(workingPath)
	.sort(n("a"), nr("b"))
	.file(new File("example.csv"))
	.run();

// 튜토리얼과 같은 흐름
String top3 = Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.sort(nr("index"))
	.head(3)
	.file("example.csv")
	.run();
```

`filter`와 `split`은 체인에서는 **`.filterVerb(…)`**, **`.splitVerb(…)`**를 씁니다.

```java
import static net.shed.mlrbinder.Objective.objective;

Mlr.inDir(workingPath)
	.csv()
	.filterVerb(objective("$index > 1"))
	.file("example.csv")
	.run();
```

`file(File)`은 작업 디렉터리가 비어 있으면 자동으로 작업 디렉터리를 채웁니다.

---

## 마무리

- **저장소·이슈·기여:** [https://github.com/bluedskim/mlrBinder](https://github.com/bluedskim/mlrBinder)
- **Miller 공식 문서:** [https://miller.readthedocs.io/](https://miller.readthedocs.io/)

JVM에서 Miller를 그대로 쓰면서 호출 코드만 정리하고 싶으시다면, mlr-binder를 한 번 살펴봐 주시면 좋겠습니다.
