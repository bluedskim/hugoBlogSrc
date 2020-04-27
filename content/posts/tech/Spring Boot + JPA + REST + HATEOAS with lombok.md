---
title: "Spring Boot + JPA + REST + HATEOAS + Lombok 그리고 VS code 환경에서 getter()를 찾지 못하는 문제"
date: 2020-04-27T21:26:43+09:00
featured_image: "images/SambandoApplication java - sambando - Code - OSS.png"
tags: ["Spring Boot", "JPA", "VS code"]
draft: false
---

증상은 제목과 같다.

아래 소스코드에서 보듯 @Data 어노테이션이 있는데도 불구하고 api 호출 결과에 word 변수의 값이 출력되지 않는다

##### Java소스

{{< highlight java "linenos=table,hl_lines=2 15-15,linenostart=1" >}}
@Entity
@Data
@Table(name="first_word")
@NamedQuery(name="FirstWord.findAll", query="SELECT e FROM FirstWord e")
public class FirstWord extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="seq")
	@Description("순번")
	private Long seq;

	@Column(name="word")
	@Description("단어")
	private String word;
}
{{< / highlight >}}
<br/>
##### API호출결과 Json

{{< highlight json "linenos=table,hl_lines=3-10,linenostart=1" >}}
{
  "_embedded" : {
    "firstWords" : [ {
      "_links" : {
        "self" : {
          "href" : "http://penguin.termina.linux.test:8081/firstWords/1"
        },
        "firstWord" : {
          "href" : "http://penguin.termina.linux.test:8081/firstWords/1"
        }
      }
    }, {
{{< / highlight >}}

</br>
VS code 에서 SpringBootApplication의 main 메소드를 바로 run실행했을 때 발생하는데 

[![SambandoApplication java - sambando - Code - OSS](/images/SambandoApplication java - sambando - Code - OSS.png)](/images/SambandoApplication java - sambando - Code - OSS.png)

문제는 일관성이 없다는 점이다. Entity에 @Data 어노테이션을 뺐다가 다시 넣었을 때 정상 동작하기도 한다 -.-
