---
title: "얼굴인식 오픈소스 간단 비교 OpenFace, CompreFace & 뉴스에서 정치인 얼굴 검색 데모"
date: 2023-11-30T13:20:48+09:00
draft: false
---

## [CompreFace](https://github.com/exadel-inc/CompreFace)

* 얼굴인식(Facial Detection), 얼굴식별(Facial Recognition), 동일인 판별(Facial Validation)
* 그 외 분석 속성 : 나이, 성별, 인종, 시선, landmark, 마스크 착용 여부
* 웹GUI, API 제공
* GPU없이 CPU만 쓰는데도 OpenFace에 비해 처리 속도가 빠르다.
* 악수하는 손을 인물로 인식하는 경우
	![초기화면](../../images/홍준표라니.png)

해당 인물이 아닌 다른 인물로 인식하는 경우도 많은데 그럼에도 산출된 유사도가 90%가 넘는다.
반면 몇몇 인물은 아주 잘 인식하기도 하는 것으르 보면 이는 샘플 이미지의 문제인 것 같다.
이 [블로그](https://hyunah-home.tistory.com/entry/%EA%B8%B0%EC%A1%B4%EC%9D%98-%EC%96%BC%EA%B5%B4-%EC%9D%B8%EC%8B%9D-%EB%AA%A8%EB%8D%B8%EB%93%A4FaceNet-VGG-Face%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%B4-%ED%95%9C%EA%B5%AD%EC%9D%B8-%EC%96%BC%EA%B5%B4-%EC%9D%B8%EC%8B%9D%ED%95%B4%EB%B3%B4%EA%B8%B0?category=1019729)와 이 [블로그](https://brunch.co.kr/@tobesoft-ai/6)에서 학습시킬 얼굴 이미지들을 전처리하는 것처럼 하면 인식율이 높아질 것 같기는 한데
노가다작업이라 할 엄두가 나지 않는다.

### 데모 : 뉴스에서 정치인 얼굴 검색

* 주소 : http://bossa.iptime.org:8005/
* 대표적인 정치인들의 사진으로 학습(3692명 7379장의 사진)
* 미디어 다음 > 정치뉴스의 사진에서 정치인을 찾아서 태깅
* 웹ui에서 정치인 이름으로 해당 정치인이 등장한 사진이 있는 기사 검색(AND 검색 지원)

## [OpenFace](https://github.com/serengil/deepface)

* 파이썬 라이브러리(간단한 웹API도 제공)
* 얼굴인식(Facial Detection), 얼굴식별(Facial Recognition), 동일인 판별(Facial Validation)
* 그 외 분석 속성 : 나이, 성별, 감정, 인종
* CompreFace에 비해 인식 속도는 느리지만 인식율이 좋고 평가된 유사도가 더 정확한 듯
* 이 라이브러리를 '뉴스에서 정치인 얼굴 검색'에서 사용하려면 해줘야 할게 너무 많다 -.-