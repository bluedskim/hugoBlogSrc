---
title: "CPU와 메모리가 열일하고 있는지 확인하기"
date: 2023-11-14T19:25:01+09:00
draft: false
---
    
<div class="layout-content layout-editor" style="min-height: 170px;">
    <div class="notion-page-content" style="flex-shrink: 0; flex-grow: 1; max-width: 100%; display: flex; align-items: flex-start; flex-direction: column; font-size: 16px; line-height: 1.5; width: 100%; z-index: 4; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;">
        <div data-block-id="9fd38760-3402-4687-8aa5-bc29a2d10aa1" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 2px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">리눅스 CLI용 모니터링 툴을 비교해보자</div>
                </div>
            </div>
        </div>
        <div data-block-id="474b5831-1589-45c5-822c-3f7bf98b9ac7" class="notion-selectable notion-sub_header-block" style="width: 100%; max-width: 919px; margin-top: 1.4em; margin-bottom: 1px;">
            <div style="display: flex; width: 100%; color: inherit; fill: inherit;">
                <h3 spellcheck="true" placeholder="제목2" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 600; font-size: 1.5em; line-height: 1.3; margin: 0px;">테스트 환경</h3></div>
        </div>
        <div data-block-id="a4d412a4-a501-4557-b0fe-6f9f0a62ecc6" class="notion-selectable notion-numbered_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: unset; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);"><span class="pseudoBefore" style="--pseudoBefore--content: &quot;1.&quot;; text-align: center; white-space: nowrap; width: 24px;">1.</span></div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">CPU : Intel(R) Core(TM) i5-6600 4core</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="bbaaa604-6329-42bd-8eb1-203f3198782a" class="notion-selectable notion-numbered_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: unset; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);"><span class="pseudoBefore" style="--pseudoBefore--content: &quot;2.&quot;; text-align: center; white-space: nowrap; width: 24px;">2.</span></div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">memory : 32GB</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="67ce4a58-1861-43f6-9a57-46d542b3ffe6" class="notion-selectable notion-header-block" style="width: 100%; max-width: 919px; margin-top: 2em; margin-bottom: 4px;">
            <div style="display: flex; width: 100%; color: inherit; fill: inherit;">
                <h2 spellcheck="true" placeholder="제목1" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 600; font-size: 1.875em; line-height: 1.3; margin: 0px;"><a href="https://man7.org/linux/man-pages/man1/top.1.html" style="cursor:pointer;color:inherit;word-wrap:break-word;text-decoration:inherit" class="notion-link-token notion-focusable-token notion-enable-hover highlight" rel="noopener noreferrer" data-token-index="0" tabindex="0"><span style="border-bottom:0.05em solid;border-color:rgba(255, 255, 255, 0.283);opacity:0.7" class="link-annotation-67ce4a58-1861-43f6-9a57-46d542b3ffe6--1038192525">top</span></a>(<span style="color:rgba(223, 84, 82, 1);fill:rgba(223, 84, 82, 1)" data-token-index="2" class="notion-enable-hover">T</span>able <span style="color:rgba(223, 84, 82, 1);fill:rgba(223, 84, 82, 1)" data-token-index="4" class="notion-enable-hover">O</span>f <span style="color:rgba(223, 84, 82, 1);fill:rgba(223, 84, 82, 1)" data-token-index="6" class="notion-enable-hover">P</span>rocesses)</h2></div>
        </div>
        <div data-block-id="402055ed-e2cb-4535-b019-55e07dd424b8" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">왠간한 리눅스 배포판에는 기본으로 있다</div>
                </div>
            </div>
        </div>
        <div data-block-id="90df65f3-6e20-47e7-a390-675fcd132f72" class="notion-selectable notion-image-block" style="width: 100%; max-width: 1111px; align-self: center; margin-top: 4px; margin-bottom: 4px;">
            <div contenteditable="false" data-content-editable-void="true" role="figure" aria-labelledby="id_1">
                <div style="display: flex;">
                    <div class="notion-cursor-default" style="position: relative; overflow: hidden; flex-grow: 1;">
                        <div style="position: relative;">
                            <div>
                                <div style="height: 100%; width: 100%;"><a href="../../images/top.gif" data-featherlight="image"><img loading="lazy" src="../../images/top.gif" referrerpolicy="same-origin" style="display: block; object-fit: cover; border-radius: 1px; pointer-events: auto; width: auto; height: auto;"></a></div>
                            </div>
                        </div>
                        <div style="position: absolute; top: 4px; right: 4px; border-radius: 4px; color: white; fill: white; font-size: 11.5px; background: rgba(0, 0, 0, 0.6); display: flex; white-space: nowrap; height: 26px; max-width: calc(100% - 16px); overflow: hidden; pointer-events: none; opacity: 0; transition: opacity 300ms ease-in 0s; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; z-index: 2;">
                            <div role="button" tabindex="0" style="user-select: none; transition: background 20ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; padding: 4px 6px; border-right: 1px solid rgba(255, 255, 255, 0.2);">
                                <svg role="graphics-symbol" viewBox="0 0 16 16" class="download" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0; margin-right: 0px;">
                                    <path d="M8.215 15.126c3.862 0 7.061-3.192 7.061-7.062 0-3.862-3.199-7.061-7.068-7.061-3.862 0-7.055 3.2-7.055 7.061 0 3.87 3.2 7.062 7.062 7.062zm0-1.388a5.654 5.654 0 01-5.667-5.674 5.642 5.642 0 015.66-5.667 5.66 5.66 0 015.68 5.667 5.66 5.66 0 01-5.673 5.674zm0-9.174c-.342 0-.602.247-.602.588v3.234l.062 1.401-.622-.766-.766-.8a.557.557 0 00-.41-.177.54.54 0 00-.56.547c0 .164.054.3.163.41l2.256 2.283c.15.157.294.226.479.226.191 0 .335-.075.485-.226l2.256-2.283a.557.557 0 00.164-.41.539.539 0 00-.56-.547.523.523 0 00-.41.178l-.766.793-.622.779.054-1.408V5.152c0-.341-.253-.588-.601-.588z"></path>
                                </svg>
                            </div>
                            <div role="button" tabindex="0" style="user-select: none; transition: opacity 200ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; flex-shrink: 0; width: 24px; height: 24px; border-radius: 4px; fill: rgba(255, 255, 255, 0.443);">
                                <svg role="graphics-symbol" viewBox="0 0 13 3" class="dots" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0;">
                                    <g>
                                        <path d="M3,1.5A1.5,1.5,0,1,1,1.5,0,1.5,1.5,0,0,1,3,1.5Z"></path>
                                        <path d="M8,1.5A1.5,1.5,0,1,1,6.5,0,1.5,1.5,0,0,1,8,1.5Z"></path>
                                        <path d="M13,1.5A1.5,1.5,0,1,1,11.5,0,1.5,1.5,0,0,1,13,1.5Z"></path>
                                    </g>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="3eb73cde-817c-4dbe-a9a1-c20b648ac7b7" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">시스템 요약 정보 뿐만 아니라 현재 리눅스 커널이 관리하고 있는 프로세스와 쓰레드 목록도 같이 보여주는데 무었을 어떻게 보여줄지는 사용자가 설정 가능하다. 설정을 저장해서 다음에 명령어를 실행할 때도 사용할 수 있다.</div>
                </div>
            </div>
        </div>
        <div data-block-id="721fe03c-b475-4b8c-b0cf-9e2b4229b1cb" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">하지만 나는 이 명령어를 잘 사용하지 않는다. 못생겼기 때문이다 -.-</div>
                </div>
            </div>
        </div>
        <div data-block-id="d03db6ae-50d6-4b0c-9e54-853743303ae1" class="notion-selectable notion-header-block" style="width: 100%; max-width: 919px; margin-top: 2em; margin-bottom: 4px;">
            <div style="display: flex; width: 100%; color: inherit; fill: inherit;">
                <h2 spellcheck="true" placeholder="제목1" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 600; font-size: 1.875em; line-height: 1.3; margin: 0px;"><a href="https://linux.die.net/man/1/htop" style="cursor:pointer;color:inherit;word-wrap:break-word;text-decoration:inherit" class="notion-link-token notion-focusable-token notion-enable-hover highlight" rel="noopener noreferrer" data-token-index="0" tabindex="0"><span style="border-bottom:0.05em solid;border-color:rgba(255, 255, 255, 0.283);opacity:0.7" class="link-annotation-d03db6ae-50d6-4b0c-9e54-853743303ae1--1478383287">htop</span></a></h2></div>
        </div>
        <div data-block-id="e23d54df-9f52-4a15-8744-1def95f463a1" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">일단 top보다 훨씬 예쁘다.</div>
                </div>
            </div>
        </div>
        <div data-block-id="26fd49ed-6f82-4032-b77e-e409d5d0866a" class="notion-selectable notion-image-block" style="width: 100%; max-width: 1111px; align-self: center; margin-top: 4px; margin-bottom: 4px;">
            <div contenteditable="false" data-content-editable-void="true" role="figure" aria-labelledby="id_2">
                <div style="display: flex;">
                    <div class="notion-cursor-default" style="position: relative; overflow: hidden; flex-grow: 1;">
                        <div style="position: relative;">
                            <div>
                                <div style="height: 100%; width: 100%;"><a href="../../images/htop.gif" data-featherlight="image"><img loading="lazy" src="../../images/htop.gif" referrerpolicy="same-origin" style="display: block; object-fit: cover; border-radius: 1px; pointer-events: auto; width: auto; height: auto;"></a></div>
                            </div>
                        </div>
                        <div style="position: absolute; top: 4px; right: 4px; border-radius: 4px; color: white; fill: white; font-size: 11.5px; background: rgba(0, 0, 0, 0.6); display: flex; white-space: nowrap; height: 26px; max-width: calc(100% - 16px); overflow: hidden; pointer-events: none; opacity: 0; transition: opacity 300ms ease-in 0s; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; z-index: 2;">
                            <div role="button" tabindex="0" style="user-select: none; transition: background 20ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; padding: 4px 6px; border-right: 1px solid rgba(255, 255, 255, 0.2);">
                                <svg role="graphics-symbol" viewBox="0 0 16 16" class="download" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0; margin-right: 0px;">
                                    <path d="M8.215 15.126c3.862 0 7.061-3.192 7.061-7.062 0-3.862-3.199-7.061-7.068-7.061-3.862 0-7.055 3.2-7.055 7.061 0 3.87 3.2 7.062 7.062 7.062zm0-1.388a5.654 5.654 0 01-5.667-5.674 5.642 5.642 0 015.66-5.667 5.66 5.66 0 015.68 5.667 5.66 5.66 0 01-5.673 5.674zm0-9.174c-.342 0-.602.247-.602.588v3.234l.062 1.401-.622-.766-.766-.8a.557.557 0 00-.41-.177.54.54 0 00-.56.547c0 .164.054.3.163.41l2.256 2.283c.15.157.294.226.479.226.191 0 .335-.075.485-.226l2.256-2.283a.557.557 0 00.164-.41.539.539 0 00-.56-.547.523.523 0 00-.41.178l-.766.793-.622.779.054-1.408V5.152c0-.341-.253-.588-.601-.588z"></path>
                                </svg>
                            </div>
                            <div role="button" tabindex="0" style="user-select: none; transition: opacity 200ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; flex-shrink: 0; width: 24px; height: 24px; border-radius: 4px; fill: rgba(255, 255, 255, 0.443);">
                                <svg role="graphics-symbol" viewBox="0 0 13 3" class="dots" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0;">
                                    <g>
                                        <path d="M3,1.5A1.5,1.5,0,1,1,1.5,0,1.5,1.5,0,0,1,3,1.5Z"></path>
                                        <path d="M8,1.5A1.5,1.5,0,1,1,6.5,0,1.5,1.5,0,0,1,8,1.5Z"></path>
                                        <path d="M13,1.5A1.5,1.5,0,1,1,11.5,0,1.5,1.5,0,0,1,13,1.5Z"></path>
                                    </g>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="53318821-6d6d-49f1-b4f2-398b3b5faf57" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">cpu코어별로 bar차트를 제공하므로 부하를 쉽게 확인 가능</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="0e2f2eef-41cd-4cec-b686-b0b9eed5e020" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">ncurses 기반이라 top보다 다양한 기능 제공(가로 혹은 세로로 스크롤하기 등)</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="953291b6-2ca4-405e-b9e7-87d2e7824674" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">프로세스 죽이기, 우선순위 변경하기 등을 바로 수행가능함</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="5d4b09b8-9979-4949-a192-502569e8d8c6" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">적당한 cpu 사용량</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="57975441-56e1-4982-92ff-21e99af49646" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">(유틸리티의 저자 이름이 Hisham라서 htop이라고…)</div>
                </div>
            </div>
        </div>
        <div data-block-id="361c0305-79af-4552-a3d9-2a447e9548fe" class="notion-selectable notion-sub_header-block" style="width: 100%; max-width: 919px; margin-top: 1.4em; margin-bottom: 1px;">
            <div style="display: flex; width: 100%; color: inherit; fill: inherit;">
                <h3 spellcheck="true" placeholder="제목2" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 600; font-size: 1.5em; line-height: 1.3; margin: 0px;">atop</h3></div>
        </div>
        <div data-block-id="34417b10-fa57-4f87-b1d9-50a1137e2d1a" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">모두 다 보여줄게. 하지만 가독성이 떨어짐</div>
                </div>
            </div>
        </div>
        <div data-block-id="f286ba44-9d02-4ec9-8e61-c84c48cf57ae" class="notion-selectable notion-image-block" style="width: 100%; max-width: 1111px; align-self: center; margin-top: 4px; margin-bottom: 4px;">
            <div contenteditable="false" data-content-editable-void="true" role="figure" aria-labelledby="id_3">
                <div style="display: flex;">
                    <div class="notion-cursor-default" style="position: relative; overflow: hidden; flex-grow: 1;">
                        <div style="position: relative;">
                            <div>
                                <div style="height: 100%; width: 100%;"><a href="../../images/atop.gif" data-featherlight="image"><img loading="lazy" src="../../images/atop.gif" referrerpolicy="same-origin" style="display: block; object-fit: cover; border-radius: 1px; pointer-events: auto; width: auto; height: auto;"></a></div>
                            </div>
                        </div>
                        <div style="position: absolute; top: 4px; right: 4px; border-radius: 4px; color: white; fill: white; font-size: 11.5px; background: rgba(0, 0, 0, 0.6); display: flex; white-space: nowrap; height: 26px; max-width: calc(100% - 16px); overflow: hidden; pointer-events: none; opacity: 0; transition: opacity 300ms ease-in 0s; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; z-index: 2;">
                            <div role="button" tabindex="0" style="user-select: none; transition: background 20ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; padding: 4px 6px; border-right: 1px solid rgba(255, 255, 255, 0.2);">
                                <svg role="graphics-symbol" viewBox="0 0 16 16" class="download" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0; margin-right: 0px;">
                                    <path d="M8.215 15.126c3.862 0 7.061-3.192 7.061-7.062 0-3.862-3.199-7.061-7.068-7.061-3.862 0-7.055 3.2-7.055 7.061 0 3.87 3.2 7.062 7.062 7.062zm0-1.388a5.654 5.654 0 01-5.667-5.674 5.642 5.642 0 015.66-5.667 5.66 5.66 0 015.68 5.667 5.66 5.66 0 01-5.673 5.674zm0-9.174c-.342 0-.602.247-.602.588v3.234l.062 1.401-.622-.766-.766-.8a.557.557 0 00-.41-.177.54.54 0 00-.56.547c0 .164.054.3.163.41l2.256 2.283c.15.157.294.226.479.226.191 0 .335-.075.485-.226l2.256-2.283a.557.557 0 00.164-.41.539.539 0 00-.56-.547.523.523 0 00-.41.178l-.766.793-.622.779.054-1.408V5.152c0-.341-.253-.588-.601-.588z"></path>
                                </svg>
                            </div>
                            <div role="button" tabindex="0" style="user-select: none; transition: opacity 200ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; flex-shrink: 0; width: 24px; height: 24px; border-radius: 4px; fill: rgba(255, 255, 255, 0.443);">
                                <svg role="graphics-symbol" viewBox="0 0 13 3" class="dots" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0;">
                                    <g>
                                        <path d="M3,1.5A1.5,1.5,0,1,1,1.5,0,1.5,1.5,0,0,1,3,1.5Z"></path>
                                        <path d="M8,1.5A1.5,1.5,0,1,1,6.5,0,1.5,1.5,0,0,1,8,1.5Z"></path>
                                        <path d="M13,1.5A1.5,1.5,0,1,1,11.5,0,1.5,1.5,0,0,1,13,1.5Z"></path>
                                    </g>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="1276f362-0b0e-4bcd-b96c-2f70da34afa1" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">거의 모든 시스템 리소스(CPU, memory, disk, network)를 퍼포먼스 관점에서 모니터링</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="fb14787a-487e-4d35-9121-bf2a19f4aec8" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">윈도우 가로 사이즈가 어느정도 이상 되어야 함</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="aceef484-bd47-414f-a2b2-d694ae8a4c06" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">프로세스별로 디스크 IO 모니터링 가능</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="8ffc2db7-98ee-4f7e-bef6-1e98c5858e90" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">cpu코어를 최대한 많이 사용하는 듯. 각 코어별 사용량을 합쳐도 전체 사용량은 적은 편</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="0d578fcd-2010-47bf-a207-6f4db59b92ca" class="notion-selectable notion-sub_header-block" style="width: 100%; max-width: 919px; margin-top: 1.4em; margin-bottom: 1px;">
            <div style="display: flex; width: 100%; color: inherit; fill: inherit;">
                <h3 spellcheck="true" placeholder="제목2" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 600; font-size: 1.5em; line-height: 1.3; margin: 0px;">vtop</h3></div>
        </div>
        <div data-block-id="52c91f38-5424-4e40-9a93-d886e254b053" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">nodejs 기반</div>
                </div>
            </div>
        </div>
        <div data-block-id="a42223c5-f77a-4336-a11e-87b0c37670b9" class="notion-selectable notion-image-block" style="width: 100%; max-width: 1111px; align-self: center; margin-top: 4px; margin-bottom: 4px;">
            <div contenteditable="false" data-content-editable-void="true" role="figure" aria-labelledby="id_4">
                <div style="display: flex;">
                    <div class="notion-cursor-default" style="position: relative; overflow: hidden; flex-grow: 1;">
                        <div style="position: relative;">
                            <div>
                                <div style="height: 100%; width: 100%;"><a href="../../images/vtop.gif" data-featherlight="image"><img loading="lazy" src="../../images/vtop.gif" referrerpolicy="same-origin" style="display: block; object-fit: cover; border-radius: 1px; pointer-events: auto; width: auto; height: auto;"></a></div>
                            </div>
                        </div>
                        <div style="position: absolute; top: 4px; right: 4px; border-radius: 4px; color: white; fill: white; font-size: 11.5px; background: rgba(0, 0, 0, 0.6); display: flex; white-space: nowrap; height: 26px; max-width: calc(100% - 16px); overflow: hidden; pointer-events: none; opacity: 0; transition: opacity 300ms ease-in 0s; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; z-index: 2;">
                            <div role="button" tabindex="0" style="user-select: none; transition: background 20ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; padding: 4px 6px; border-right: 1px solid rgba(255, 255, 255, 0.2);">
                                <svg role="graphics-symbol" viewBox="0 0 16 16" class="download" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0; margin-right: 0px;">
                                    <path d="M8.215 15.126c3.862 0 7.061-3.192 7.061-7.062 0-3.862-3.199-7.061-7.068-7.061-3.862 0-7.055 3.2-7.055 7.061 0 3.87 3.2 7.062 7.062 7.062zm0-1.388a5.654 5.654 0 01-5.667-5.674 5.642 5.642 0 015.66-5.667 5.66 5.66 0 015.68 5.667 5.66 5.66 0 01-5.673 5.674zm0-9.174c-.342 0-.602.247-.602.588v3.234l.062 1.401-.622-.766-.766-.8a.557.557 0 00-.41-.177.54.54 0 00-.56.547c0 .164.054.3.163.41l2.256 2.283c.15.157.294.226.479.226.191 0 .335-.075.485-.226l2.256-2.283a.557.557 0 00.164-.41.539.539 0 00-.56-.547.523.523 0 00-.41.178l-.766.793-.622.779.054-1.408V5.152c0-.341-.253-.588-.601-.588z"></path>
                                </svg>
                            </div>
                            <div role="button" tabindex="0" style="user-select: none; transition: opacity 200ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; flex-shrink: 0; width: 24px; height: 24px; border-radius: 4px; fill: rgba(255, 255, 255, 0.443);">
                                <svg role="graphics-symbol" viewBox="0 0 13 3" class="dots" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0;">
                                    <g>
                                        <path d="M3,1.5A1.5,1.5,0,1,1,1.5,0,1.5,1.5,0,0,1,3,1.5Z"></path>
                                        <path d="M8,1.5A1.5,1.5,0,1,1,6.5,0,1.5,1.5,0,0,1,8,1.5Z"></path>
                                        <path d="M13,1.5A1.5,1.5,0,1,1,11.5,0,1.5,1.5,0,0,1,13,1.5Z"></path>
                                    </g>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="619bf59f-4b2a-49c0-bcd1-ac6bcf92a603" class="notion-selectable notion-numbered_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: unset; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);"><span class="pseudoBefore" style="--pseudoBefore--content: &quot;1.&quot;; text-align: center; white-space: nowrap; width: 24px;">1.</span></div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">장점</div>
                    </div>
                    <div data-block-id="7fd85e61-d1fe-4899-b65e-8f381a55be4c" class="notion-selectable notion-numbered_list-block" style="width: 100%; max-width: 100%; margin-top: 2px; margin-bottom: 1px;">
                        <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                            <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: unset; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);"><span class="pseudoBefore" style="--pseudoBefore--content: &quot;a.&quot;; text-align: center; white-space: nowrap; width: 24px;">•</span></div>
                            <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                                <div style="display: flex;">
                                    <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">심플</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div data-block-id="a9205082-f482-40d6-b279-238df413d0ba" class="notion-selectable notion-numbered_list-block" style="width: 100%; max-width: 100%; margin-top: 1px; margin-bottom: 0px;">
                        <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                            <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: unset; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);"><span class="pseudoBefore" style="--pseudoBefore--content: &quot;b.&quot;; text-align: center; white-space: nowrap; width: 24px;">•</span></div>
                            <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                                <div style="display: flex;">
                                    <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">CPU와 메모리 사용량 추이를 쉽게 알 수 있음 </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="b95ff514-da91-42b2-bb6e-2dd50720baac" class="notion-selectable notion-numbered_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: unset; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);"><span class="pseudoBefore" style="--pseudoBefore--content: &quot;2.&quot;; text-align: center; white-space: nowrap; width: 24px;">2.</span></div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">단점</div>
                    </div>
                    <div data-block-id="6b23274a-248e-4d80-ac43-758a8b832407" class="notion-selectable notion-numbered_list-block" style="width: 100%; max-width: 100%; margin-top: 2px; margin-bottom: 1px;">
                        <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                            <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: unset; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);"><span class="pseudoBefore" style="--pseudoBefore--content: &quot;a.&quot;; text-align: center; white-space: nowrap; width: 24px;">•</span></div>
                            <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                                <div style="display: flex;">
                                    <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">다른 모니터링 툴보다 CPU와 메모리를 가장 많이 사용</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div data-block-id="f14833cf-555a-4043-84b3-d0f279932af4" class="notion-selectable notion-numbered_list-block" style="width: 100%; max-width: 100%; margin-top: 1px; margin-bottom: 0px;">
                        <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                            <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: unset; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);"><span class="pseudoBefore" style="--pseudoBefore--content: &quot;b.&quot;; text-align: center; white-space: nowrap; width: 24px;">•</span></div>
                            <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                                <div style="display: flex;">
                                    <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">nodejs기반이라 프로세스 식별이 힘듬</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="4dd24e06-2261-4b25-8dcc-fe71d6d80cbb" class="notion-selectable notion-sub_header-block" style="width: 100%; max-width: 919px; margin-top: 1.4em; margin-bottom: 1px;">
            <div style="display: flex; width: 100%; color: inherit; fill: inherit;">
                <h3 spellcheck="true" placeholder="제목2" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 600; font-size: 1.5em; line-height: 1.3; margin: 0px;">btop</h3></div>
        </div>
        <div data-block-id="9426344b-2485-4989-9f58-6cbdbdae459b" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">가장 아름다운 ui</div>
                </div>
            </div>
        </div>
        <div data-block-id="cc49e8c6-9c2b-4f44-b0ee-941e08f2a3fd" class="notion-selectable notion-image-block" style="width: 100%; max-width: 1111px; align-self: center; margin-top: 4px; margin-bottom: 4px;">
            <div contenteditable="false" data-content-editable-void="true" role="figure" aria-labelledby="id_5">
                <div style="display: flex;">
                    <div class="notion-cursor-default" style="position: relative; overflow: hidden; flex-grow: 1;">
                        <div style="position: relative;">
                            <div>
                                <div style="height: 100%; width: 100%;"><a href="../../images/btop.gif" data-featherlight="image"><img loading="lazy" src="../../images/btop.gif" referrerpolicy="same-origin" style="display: block; object-fit: cover; border-radius: 1px; pointer-events: auto; width: auto; height: auto;"></a></div>
                            </div>
                        </div>
                        <div style="position: absolute; top: 4px; right: 4px; border-radius: 4px; color: white; fill: white; font-size: 11.5px; background: rgba(0, 0, 0, 0.6); display: flex; white-space: nowrap; height: 26px; max-width: calc(100% - 16px); overflow: hidden; pointer-events: none; opacity: 0; transition: opacity 300ms ease-in 0s; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; z-index: 2;">
                            <div role="button" tabindex="0" style="user-select: none; transition: background 20ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; padding: 4px 6px; border-right: 1px solid rgba(255, 255, 255, 0.2);">
                                <svg role="graphics-symbol" viewBox="0 0 16 16" class="download" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0; margin-right: 0px;">
                                    <path d="M8.215 15.126c3.862 0 7.061-3.192 7.061-7.062 0-3.862-3.199-7.061-7.068-7.061-3.862 0-7.055 3.2-7.055 7.061 0 3.87 3.2 7.062 7.062 7.062zm0-1.388a5.654 5.654 0 01-5.667-5.674 5.642 5.642 0 015.66-5.667 5.66 5.66 0 015.68 5.667 5.66 5.66 0 01-5.673 5.674zm0-9.174c-.342 0-.602.247-.602.588v3.234l.062 1.401-.622-.766-.766-.8a.557.557 0 00-.41-.177.54.54 0 00-.56.547c0 .164.054.3.163.41l2.256 2.283c.15.157.294.226.479.226.191 0 .335-.075.485-.226l2.256-2.283a.557.557 0 00.164-.41.539.539 0 00-.56-.547.523.523 0 00-.41.178l-.766.793-.622.779.054-1.408V5.152c0-.341-.253-.588-.601-.588z"></path>
                                </svg>
                            </div>
                            <div role="button" tabindex="0" style="user-select: none; transition: opacity 200ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; flex-shrink: 0; width: 24px; height: 24px; border-radius: 4px; fill: rgba(255, 255, 255, 0.443);">
                                <svg role="graphics-symbol" viewBox="0 0 13 3" class="dots" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0;">
                                    <g>
                                        <path d="M3,1.5A1.5,1.5,0,1,1,1.5,0,1.5,1.5,0,0,1,3,1.5Z"></path>
                                        <path d="M8,1.5A1.5,1.5,0,1,1,6.5,0,1.5,1.5,0,0,1,8,1.5Z"></path>
                                        <path d="M13,1.5A1.5,1.5,0,1,1,11.5,0,1.5,1.5,0,0,1,13,1.5Z"></path>
                                    </g>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="8682f78e-0681-470d-b21c-804902315d8f" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">cpu코어를 최대한 많이 사용하는 듯. 각 코어별 사용량을 합치면 전체 사용량은 꽤 된다.</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="97d0945a-ac83-47f6-b573-1d5e3b333d7a" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">터미널 사이즈가 최소 가로 80, 세로 24가 되어야 띄울 수 있다(최소치 미달일 때 경고가 뜸)</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="990c921f-c727-495b-b80c-31a08f2a7a78" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">프로세스별 상세보기 지원</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="b478d2f2-3982-4e6c-a4b2-b7a850e512c5" class="notion-selectable notion-sub_header-block" style="width: 100%; max-width: 919px; margin-top: 1.4em; margin-bottom: 1px;">
            <div style="display: flex; width: 100%; color: inherit; fill: inherit;">
                <h3 spellcheck="true" placeholder="제목2" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 600; font-size: 1.5em; line-height: 1.3; margin: 0px;">glances</h3></div>
        </div>
        <div data-block-id="0fe0ce44-5310-4ab7-a74e-40542124d07d" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;">python기반</div>
                </div>
            </div>
        </div>
        <div data-block-id="052f57f2-dcf2-4794-abbf-982f39841c17" class="notion-selectable notion-image-block" style="width: 100%; max-width: 1111px; align-self: center; margin-top: 4px; margin-bottom: 4px;">
            <div contenteditable="false" data-content-editable-void="true" role="figure" aria-labelledby="id_6">
                <div style="display: flex;">
                    <div class="notion-cursor-default" style="position: relative; overflow: hidden; flex-grow: 1;">
                        <div style="position: relative;">
                            <div>
                                <div style="height: 100%; width: 100%;"><a href="../../images/glances.gif" data-featherlight="image"><img loading="lazy" src="../../images/glances.gif" referrerpolicy="same-origin" style="display: block; object-fit: cover; border-radius: 1px; pointer-events: auto; width: auto; height: auto;"></a></div>
                            </div>
                        </div>
                        <div style="position: absolute; top: 4px; right: 4px; border-radius: 4px; color: white; fill: white; font-size: 11.5px; background: rgba(0, 0, 0, 0.6); display: flex; white-space: nowrap; height: 26px; max-width: calc(100% - 16px); overflow: hidden; pointer-events: none; opacity: 0; transition: opacity 300ms ease-in 0s; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; z-index: 2;">
                            <div role="button" tabindex="0" style="user-select: none; transition: background 20ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; padding: 4px 6px; border-right: 1px solid rgba(255, 255, 255, 0.2);">
                                <svg role="graphics-symbol" viewBox="0 0 16 16" class="download" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0; margin-right: 0px;">
                                    <path d="M8.215 15.126c3.862 0 7.061-3.192 7.061-7.062 0-3.862-3.199-7.061-7.068-7.061-3.862 0-7.055 3.2-7.055 7.061 0 3.87 3.2 7.062 7.062 7.062zm0-1.388a5.654 5.654 0 01-5.667-5.674 5.642 5.642 0 015.66-5.667 5.66 5.66 0 015.68 5.667 5.66 5.66 0 01-5.673 5.674zm0-9.174c-.342 0-.602.247-.602.588v3.234l.062 1.401-.622-.766-.766-.8a.557.557 0 00-.41-.177.54.54 0 00-.56.547c0 .164.054.3.163.41l2.256 2.283c.15.157.294.226.479.226.191 0 .335-.075.485-.226l2.256-2.283a.557.557 0 00.164-.41.539.539 0 00-.56-.547.523.523 0 00-.41.178l-.766.793-.622.779.054-1.408V5.152c0-.341-.253-.588-.601-.588z"></path>
                                </svg>
                            </div>
                            <div role="button" tabindex="0" style="user-select: none; transition: opacity 200ms ease-in 0s; cursor: pointer; display: flex; align-items: center; justify-content: center; flex-shrink: 0; width: 24px; height: 24px; border-radius: 4px; fill: rgba(255, 255, 255, 0.443);">
                                <svg role="graphics-symbol" viewBox="0 0 13 3" class="dots" style="width: 14px; height: 14px; display: block; fill: white; flex-shrink: 0;">
                                    <g>
                                        <path d="M3,1.5A1.5,1.5,0,1,1,1.5,0,1.5,1.5,0,0,1,3,1.5Z"></path>
                                        <path d="M8,1.5A1.5,1.5,0,1,1,6.5,0,1.5,1.5,0,0,1,8,1.5Z"></path>
                                        <path d="M13,1.5A1.5,1.5,0,1,1,11.5,0,1.5,1.5,0,0,1,13,1.5Z"></path>
                                    </g>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="683ac7f6-ca31-48d0-8cb5-435322f99ac6" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">python기반이라 자체 프로세스 식별이 힘듬</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="253cc0a1-8c18-4608-a78d-d4a9ea0f89a8" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">파티션별 IO 모니터링</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="2b149e6a-0325-4ca7-858e-46202483bf05" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">메모리를 상당히 많이 사용(46MB) 하지만 CPU코어는 한 개만 사용하도록 개발한듯</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="7be2aefc-bace-4890-b0fe-9edee0cbbcaa" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">high load 발생 시 경고 출력</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="3a6a33f3-22b5-41ff-8a3b-92f0cf610a07" class="notion-selectable notion-header-block" style="width: 100%; max-width: 919px; margin-top: 2em; margin-bottom: 4px;">
            <div style="display: flex; width: 100%; color: inherit; fill: inherit;">
                <h2 spellcheck="true" placeholder="제목1" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-weight: 600; font-size: 1.875em; line-height: 1.3; margin: 0px;">총평</h2></div>
        </div>
        <div data-block-id="2ca5e489-e865-436d-b5f2-cac4dd1b96b9" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px;"><span style="font-weight:600" data-token-index="0" class="notion-enable-hover">어플리케이션 개발자라면 btop을, 시스템 관리자라면 glances를 추천</span></div>
                </div>
            </div>
        </div>
        <div data-block-id="04d468f2-618b-41d2-8b46-a8226fb8d6aa" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">가장 가벼운 툴 : top</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="66e0c824-1506-4241-b474-3321dc6ee534" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">CPU 로드 추이 시각화 : vtop, <span style="font-weight:600" data-token-index="1" class="notion-enable-hover">btop</span></div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="86b23a87-5938-45b6-befb-e1274e39168e" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">CPU 코어별 로드 모니터링 : atop, <span style="font-weight:600" data-token-index="1" class="notion-enable-hover">btop</span>, htop(바 차트)</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="d09167bc-9d59-4f06-8ccd-c7acc415037b" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">CPU 코어별 온도(그 외 각종 센서들) : <b>btop</b>, glances</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="5914cb0d-5269-44c9-a02b-d521620fa032" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">디스크 IO : atop(프로세스별로도 가능), glances(파티션 별), <span style="font-weight:600" data-token-index="1" class="notion-enable-hover">btop</span>(프로세스별)</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="f21577db-f18a-4102-ba6f-bb616ef302e5" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">네트워크 IO : <span style="font-weight:600" data-token-index="1" class="notion-enable-hover">btop</span>(추이 보기), glances</div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="93bd4fd9-f6ce-4dbc-802f-092452aa8384" class="notion-selectable notion-bulleted_list-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 1px;">
            <div style="display: flex; align-items: flex-start; width: 100%; padding-left: 2px; color: inherit; fill: inherit;">
                <div contenteditable="false" class="pseudoSelection" data-content-editable-void="true" data-text-edit-side="start" style="user-select: none; --pseudoSelection--background: transparent; margin-right: 2px; width: 24px; display: flex; align-items: center; justify-content: center; flex-grow: 0; flex-shrink: 0; min-height: calc(1.5em + 3px + 3px);">
                    <div class="pseudoBefore" style="font-size: 1.5em; line-height: 1; margin-bottom: 0px; --pseudoBefore--fontFamily: Arial; --pseudoBefore--content: &quot;•&quot;;">•</div>
                </div>
                <div style="flex: 1 1 0px; min-width: 1px; display: flex; flex-direction: column;">
                    <div style="display: flex;">
                        <div spellcheck="true" placeholder="리스트" data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; text-align: left;">프로세스별 상세 보기 : <span style="font-weight:600" data-token-index="1" class="notion-enable-hover">btop</span></div>
                    </div>
                </div>
            </div>
        </div>
        <div data-block-id="dee9cf4c-dc7f-4759-9c57-e936f8e62c9f" class="notion-selectable notion-text-block" style="width: 100%; max-width: 919px; margin-top: 1px; margin-bottom: 0px;">
            <div style="color: inherit; fill: inherit;">
                <div style="display: flex;">
                    <div spellcheck="true" placeholder=" " data-content-editable-leaf="true" contenteditable="false" style="max-width: 100%; width: 100%; white-space: pre-wrap; word-break: break-word; caret-color: rgba(255, 255, 255, 0.81); padding: 3px 2px; min-height: 1em; color: rgba(255, 255, 255, 0.81); -webkit-text-fill-color: rgba(255, 255, 255, 0.282);"></div>
                </div>
            </div>
        </div>
    </div>
</div>