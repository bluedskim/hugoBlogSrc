---
title: "mlrBinder로 Miller(mlr)를 자바에서 편하게 쓰기"
date: 2026-04-13T12:00:00+09:00
draft: false
---

CSV나 JSON, TSV, DKVP처럼 **구분 텍스트**를 다룰 때 [Miller](https://miller.readthedocs.io/)(`mlr`)만큼 손에 잘 맞는 도구도 드물다. 그런데 JVM 쪽 배치나 서비스, 테스트 코드까지 가면 긴 셸 문자열을 이어 붙이거나 `Runtime.exec`에 argv를 손으로 짜는 일이 잦아지고, 나중에 고치기도 부담스럽다.

그럴 때 한번 써 보면 좋은 게 **[mlrBinder](https://github.com/bluedskim/mlrBinder)**다. Maven Central에는 **`mlr-binder`**라는 아티팩트 이름으로 올라가 있고, GitHub에서는 `mlrBinder`로 검색하면 된다. Miller를 **읽기 쉬운 자바 API(플루언트 스타일)**로 호출할 수 있게 해 주며, 내부에서는 우리가 익숙한 **`mlr` 실행 파일**을 그대로 띄운다. 그래서 Miller가 해 주던 일은 그대로 두고, 자바 쪽 코드만 정리되고 리팩터링하기 좋아진다.

---

## 이런 점이 좋다

- **긴 명령 문자열이 줄어든다.** 셸 한 줄을 이어 붙이느라 IDE에서 이름 바꾸기나 리뷰가 힘들어지는 대신, `Mlr` 체인과 `Flag`, `Verb`, `Option`으로 차근차근 조립할 수 있다.
- **실수를 조금 더 일찍 발견할 수 있다.** 메서드 이름과 타입이 Miller 구조를 담아 주기 때문이다. 다만 `put`·`filter` 같은 **Miller DSL 조각**은 여전히 `mlr`이 돌 때 검증된다는 점만 기억해 두면 된다.
- **프로젝트에 붙이기 쉽다.** Maven 또는 Gradle 의존성 하나, `PATH`에 있는 `mlr`(또는 직접 지정한 경로), 그다음 `Mlr.inDir(...).csv().sort(...).file(...).run()` 정도면 시작할 수 있다. JNI로 Miller를 JVM에 묶는 방식이 아니라서, 별도 네이티브 빌드나 서비스도 필요 없다.
- **Maven Central에서 바로 받을 수 있다.** 좌표는 **`io.github.bluedskim:mlr-binder`**이고, 예시로 쓴 **0.2**는 [Central 디렉터리](https://repo1.maven.org/maven2/io/github/bluedskim/mlr-binder/0.2/)에서도 확인할 수 있다.

---

## 설치부터

**Java 11 이상**이면 된다. 라이브러리 타입이 들어 있는 패키지 이름은 **`net.shed.mlrbinder`**다. 아래를 `pom.xml`이나 `build.gradle`에 그대로 넣어 보면 된다.

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

## 이런 때에 특히 잘 맞는다

- **데이터 준비·ETL:** JVM 파이프라인 안에서 대용량 구분 파일이나 JSON을 정렬·절단·조인·변형·집계할 때, 처리 엔진은 익숙한 Miller로 두고 호출만 자바로 정리할 수 있다.
- **백엔드·배치:** 스케줄러나 워커에서 매번 같은 `mlr` 흐름을 돌릴 때, 작업 디렉터리와 파일 경로를 API로 다루면 `Runtime.exec`에 긴 문자열을 넣는 것보다 훨씬 덜 깨지기 쉽다.
- **테스트·품질 게이트:** 아래 **「Miller in 10 minutes → 자바」** 절처럼 [Miller in 10 minutes](https://miller.readthedocs.io/en/latest/10min/)에 나온 흐름을 테스트 코드로 옮겨 두면, 팀이 정한 Miller 버전과 동작을 함께 고정해 두기 좋다.
- **팀이 나뉘어 있을 때:** 분석 쪽은 Miller에 익숙하게 두고, 애플리케이션 팀은 자바에서 **같은 동사(verb)를 공유 의존성 하나**로 호출할 수 있다.

---

## Miller(`mlr`) 버전은 이렇게 맞추면 된다

개발과 테스트는 Miller **[`mlr` 6.17.0](https://github.com/johnkerl/miller/releases/tag/v6.17.0)**을 기준으로 돌아간다. 가능하면 `PATH`에 이 버전을 올려 두고 쓰면 가장 편하고, 다른 버전을 쓰신다면 한번 돌려 보시며 동작만 확인해 주시면 된다.

**편의를 위한 메서드(바인더 쪽 “설탕”)도 있다.** 예를 들어 `uniqCountBy`처럼 자주 쓰는 옵션 묶음을 한 번에 부를 수 있게 해 두었다(`uniq -c -g …`에 대응). 이런 **자바 쪽 이름이 Miller CLI에 그대로 있는 것은 아니다**는 점만 알아 두면 된다. 실제로 뜨는 건 언제나 익숙한 `mlr` 프로세스다. 각 메서드가 어떤 Miller 명령에 해당하는지는 Javadoc에 적어 두었고, `net.shed.mlrbinder` 패키지 요약에도 표로 모아 두었다. IDE에서 `Mlr`이나 패키지 설명을 펼쳐 보면 바로 이어진다.

**처음 쓰실 때는 이렇게만 기억해 보시면 된다.** 가능하면 **`Mlr` 체인 하나**로 끝낸다. 전역 플래그는 **`.icsv()`, `.from("…")` 같은 체인 메서드**로, 동사는 **Miller와 같은 이름의 메서드**(`.sort(…)`, `.cat()` 등)로 붙인다. **`filter`와 `split`만** 이름이 겹쳐서 `.filterVerb()`, `.splitVerb()`로 불러 준다. `flag(Flags…)`와 `verb(Mlr.Verbs…)` 조합은 **정말 필요할 때**만 꺼내 쓰면 충분하다.

---

## 이 라이브러리가 지향하는 것

- **Miller를 부르는 방식이 정리된다.** 긴 명령 문자열을 이어 붙이기보다, 가능한 한 **자바 메서드와 객체**로 Miller 동작을 표현한다. `Flag`, `Verb`, `Option`과 주변 타입으로 한 줄씩 조립해 가면 된다.
- **컴파일 단계에서 잡히는 것이 늘어난다.** 플래그 이름, 동사 이름, 인자 순서처럼 API로 만든 부분은 타입과 메서드 시그니처 덕분에 IDE가 도와 준다. 반면 Miller DSL(예: `put` 식)이나 필드 이름이 맞는지는 여전히 **`mlr`이 실행될 때 검사**한다. 그래서 “컴파일만으로 끝”은 아니라는 점만 짚어 두면 된다.
- **Miller를 아주 깊게 안 써도 시작할 수 있다.** 위에서 말한 **권장 스타일**을 따르면 전역 플래그는 **`Mlr` 체인**에, 동사는 **Miller와 같은 이름의 `Mlr` 메서드**에 두면 된다(`filter` → `.filterVerb()`, `split` → `.splitVerb()`). 더 세밀하게 조립하고 싶을 때는 **`Mlr.Verbs`** 정적 팩터리도 있다. Miller와 똑같은 인자를 넘기고 싶다면 `Flag`, `Objective`, `Option`을 쓰면 된다. (`Verb`는 argv 조각이라, 앱 코드에서는 가능하면 `new Verb(...)` 대신 제공되는 팩터리를 쓰는 편이 편하다.)
- **실행은 익숙한 방식이다.** 내부에서는 `ProcessBuilder`로 조립된 인자 목록을 들고 `mlr` 프로세스를 띄운다. `mlr`은 `PATH`에서 찾거나(또는 설정한 경로), **JVM 안에 Miller를 링크해 넣는 구조는 아니다.**

---

## 미리 알아 두면 좋은 범위

- **Miller가 하는 일 대부분을 따라간다.** 동사마다 팩터리는 `net.shed.mlrbinder.verb.Verbs`에 모여 있고, **`Mlr`의 동사 이름 메서드**와 **`Mlr.Verbs`**가 함께 그쪽을 바라본다. 전역 플래그는 업스트림 [reference-main-flag-list](https://github.com/johnkerl/miller/blob/main/docs/src/reference-main-flag-list.md)를 따라 `Flags`에 정적 팩터리로 있고, **`Mlr` 체인 메서드**로도 같은 내용을 편하게 쓸 수 있게 해 두었다(저장소에서는 `python3 utils/gen_flags.py`로 맞춰 갱신한다). 문서에 아직 없는 플래그가 필요하면 `Flags.raw("--name")` / `Flags.raw("--name", "value")`나 동사 쪽 `Flag.flag("...")`로 넘기면 된다. `--mfrom` / `--mload`처럼 가변 인자 뒤에 `--`가 붙는 형태는 `Mlr#mfrom` / `#mload`를 쓰면 된다.
- **네이티브로 Miller를 JVM에 붙이는 프로젝트는 아니다.** 말 그대로 **밖에서 `mlr`을 실행**하는 방식이라, 설치와 운영이 단순하다는 대신 `mlr` 바이너리는 꼭 필요하다.
- **일부 오류는 실행 직전에 보인다.** 조합이 어긋나면 `run()`이나 `run(InputStreamReader)`에서 종료 코드와 stderr로 알려 준다.

---

## 저장소를 클론해 보신다면

테스트는 Gradle 한 줄이면 된다.

```bash
./gradlew :lib:test
```

돌린 뒤에는 `lib/build/reports/tests/test/index.html`에서 결과를, `lib/build/jacocoHtml/index.html`에서 커버리지를 볼 수 있다([Jacoco](https://docs.gradle.org/current/userguide/jacoco_plugin.html)).

---

## Miller in 10 minutes → 자바로 옮기기

[Miller in 10 minutes](https://miller.readthedocs.io/en/latest/10min/)에 나오는 `mlr` 한 줄이 자바에서는 어떻게 보이는지, 아래에서 차례로 맞춰 보았다. **자바 예제는 모두 같은 권장 스타일**을 따른다: **`Mlr.inDir(…)`**로 시작하고 CSV가 필요하면 **`.csv()`**(`--csv`), 아니면 정적 **`Mlr.withCsvPreset()`**으로 `mlr`과 `--csv`를 먼저 깔고 `workDir`과 파일을 이어 붙인다. 전역 플래그는 **`Mlr`에 체인**하고, 동사는 **이름이 같은 메서드**로 붙인다(`filter`/`split`만 `.filterVerb` / `.splitVerb`). 같은 체인에 `--csv`를 한 번 더 넣고 싶으면 **`.csv()`**를 또 호출하면 된다. **동사 옵션**은 `SortFlags`의 `f` / `n` / `nr`, `import static …Flag.flag`와 `flag("-f").objective("…")`, `option` / `objective` 같은 도우미를 쓰면 된다. 동사를 여러 개 이으면 `run()`이 만들 argv에 **`then`이 자동으로 들어간다.**

실제 프로젝트에서는 필요한 import만 골라 쓰시면 된다. 자주 함께 등장하는 묶음은 대략 이렇다.

```java
import static net.shed.mlrbinder.Flag.flag;
import static net.shed.mlrbinder.Objective.objective;
import static net.shed.mlrbinder.SortFlags.f;
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;
import static net.shed.mlrbinder.verb.Option.option;

import net.shed.mlrbinder.Mlr;
```

더 많은 패턴은 저장소의 `TenMinTutorialE2eTest`, `TenMinTutorialFormatsE2eTest`(튜토리얼의 CSV/JSON/DKVP/TSV 형식 절), `lib/src/test/resources/10min/`을 둘러보시면 그대로 따라가기 쉽다.

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

튜토리얼 “File formats” 절과 같이, `--csv` / `--json` / `--idkvp` / `--tsv` 등으로 입력 형식을 맞춘다.

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

### `filter` / `put`(DSL은 그대로 문자열)

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

### 공백이 있는 필드 이름(`-nr` 값은 셸 따옴표 없이도 하나의 토큰)

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

튜토리얼에 나오는 **셸 파이프**(`mlr … | mlr …`)는 자바에서는 **`Mlr`를 두 번** 부르는 그림에 가깝다. 첫 단계 표준 출력을 임시 파일로 받고 싶다면 `redirectOutputFile`을 쓰면 되고, 두 번째 단계는 그 디렉터리에서 파일만 넘겨 돌리면 된다(표준 입력은 쓰지 않는다).

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

### `--mfrom` / `--mload`(가변 인자 뒤의 `--`)

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

튜토리얼 `put` 예에 `$y2`가 나오는 부분은 문서 오타일 수 있다. Miller에서는 제곱을 `$y**2`로 쓰는 편이 맞다.

---

## 짧은 예제로 감 잡기

아래 두 덩어리만 복사해 IDE에 붙여 보셔도, “아, 이렇게 읽히는구나” 하는 감이 바로 올 것이다.

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

// 처음부터 CSV 전제로 시작하고 싶다면 정적 메서드
String runResult2 = Mlr.withCsvPreset()
	.workDir(workingPath)
	.sort(n("a"), nr("b"))
	.file("example.csv")
	.run();
```

### `Mlr`로 체인 짜는 요령(권장 스타일)

- **`Mlr.withCsvPreset()`**으로 시작하면 이미 `mlr`과 `--csv`가 깔린 상태다. 아직 작업 디렉터리는 비어 있으니 이어서 `.workDir(…)`나 `.file(…)`을 붙이면 된다. 같은 체인에 `--csv`를 한 번 더 넣고 싶다면 **`.csv()`**를 또 호출하면 된다.
- **전역 플래그**는 `.icsv()`, `.opprint()`, **`.csv()`**, `.ocsv()`, `.ijson()`, **`.jsonFlag()`**(`--json`), `.idkvp()`, `.tsv()`, `.oxtab()`, `.ixtab()`, `.c2p()`, `.from("path")`, **`.inPlace()`**(`-I`)처럼 체인 메서드로 붙이는 쪽이 읽기 좋다. `flag(Flags…)`로도 같은 일을 할 수 있지만, 평소에는 **체인을 먼저** 쓰면 된다.
- **동사**는 Miller와 같은 이름의 메서드가 대부분이다(예: `.uniq()`, `.histogram()`, `.join(…)`). 예외는 **`filter`** → **`.filterVerb(…)`**, **`split`** → **`.splitVerb(…)`**뿐이다. 자주 쓰는 조합은 **`.head(n)`**, **`.tail(n)`**, **`.cutFields` / `.cutOrdered` / `.cutExcept`**, **`.stats1("count", "qty")`**, **`.splitBy("shape")`**, **`.putQuiet(…)`**처럼 짧게도 부를 수 있다. 위 패턴으로 부족할 때만 **`.verb(Mlr.Verbs.foo(…))`**를 꺼내면 된다.

`cut`의 `-o` / `-x` / `-f`는 **`CutFlags`**와 **`.cutOrdered` / `.cutFields`**, 또는 **`.cut(option(…), option(…))`**로 맞추면 된다. `head`/`tail` 개수는 **`.head(4)`** / **`.tail(4)`** 또는 **`HeadTail.n(4)`**. `stats1`의 `-a`/`-f`/`-g`는 **`StatsFlags`**. `put -q`는 **`.putQuiet(…)`**. `split -g`는 **`.splitBy("shape")`**. 여러 동사에서 같이 쓰는 그룹핑은 **`MillerVerbOpts.groupBy("field")`**(예: `head -g`)를 참고하면 된다.

**`SortFlags`**는 **`n("field")`**, **`nr("field")`**, **`f("field")`**, 그리고 `head`용 맨 `-n`인 **`n()`**을 계속 쓰면 된다.

```java
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;

String runResult = Mlr.withCsvPreset()
	.workDir(workingPath)
	.sort(n("a"), nr("b"))
	.file(new File("example.csv"))
	.run();

// 튜토리얼에 나오는 흐름과 같은 그림
String top3 = Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.sort(nr("index"))
	.head(3)
	.file("example.csv")
	.run();
```

Miller의 `filter`와 `split`은 자바 예약어와 겹치니, 체인에서는 **`.filterVerb(…)`**와 **`.splitVerb(…)`**로 부르면 된다.

```java
import static net.shed.mlrbinder.Objective.objective;

Mlr.inDir(workingPath)
	.csv()
	.filterVerb(objective("$index > 1"))
	.file("example.csv")
	.run();
```

**`file(File)`**은 작업 디렉터리가 비어 있을 때 알아서 채워 준다. 절대 경로 파일이면 부모 폴더를, 상대 경로면 `user.dir`을 기준으로 잡는다. 마음에 안 들면 언제든 `workDir(String)`이나 `workingPath(String)`으로 덮어쓰면 된다.

---

## 더 알아보기

- **소스와 이슈, 기여:** [https://github.com/bluedskim/mlrBinder](https://github.com/bluedskim/mlrBinder)
- **Miller 공식 문서:** [https://miller.readthedocs.io/](https://miller.readthedocs.io/)

Miller는 그대로 두고 JVM 쪽만 **읽기 좋은 체인 API**로 감싸고 싶다면 mlr-binder를 한번 의존성에 넣어 보시길 권한다. 버전이나 좌표는 시간이 지나면 바뀔 수 있으니, 쓰시기 직전에 GitHub README와 Maven Central을 함께 확인해 주시면 가장 안전하다.
