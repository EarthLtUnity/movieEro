DROP TABLE NOTICE_BOARD;
DROP SEQUENCE NOTICE_BOARD_SEQ;

CREATE TABLE NOTICE_BOARD
   (	MB_ID VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"NOTICE_BOARD_TITLE" VARCHAR2(200 BYTE), 
	"NOTICE_BOARD_CONTENT" VARCHAR2(4000 BYTE), 
	"NOTICE_BOARD_DATE" DATE, 
	"NOTICE_BOARD_ORIGINFILENAME" VARCHAR2(200 BYTE), 
	"NOTICE_BOARD_READCNT" NUMBER, 
	"NOTICE_BOARD_NO" NUMBER, 
	"NOTICE_BOARD_RENAMEFILENAME" VARCHAR2(200 BYTE),
	 CONSTRAINT NOTICE_BOARD_FK1 FOREIGN KEY (MB_ID)
	  REFERENCES MEMBER (MB_ID) ENABLE
   );
   
   CREATE SEQUENCE  NOTICE_BOARD_SEQ  
   MINVALUE 1 
   MAXVALUE 99999999999 
   INCREMENT BY 1 
   START WITH 21 
   CACHE 20 NOORDER  
   NOCYCLE ;
   
   insert into NOTICE_BOARD VALUES('admin','[공지] 백석지점 조조 영화관람 시간대 조정 안내','<table border="0" cellpadding="0" cellspacing="0" style="width: 611px;" width="611">
	<tbody>
		<tr>
			<td style="width: 611px; height: 58px;">
			<p align="left">안녕하세요,</p>
			<p align="left">메가박스 백석지점입니다.</p>
			<p align="left">&nbsp;</p>
			<p align="left">아래와 같이 조조 영화관람 시간대가 변경되오니,</p>
			<p align="left">지점 이용에 참고 부탁드립니다.</p>
			<p align="left">&nbsp;</p>
			<p align="left">1. 일시: 2018년 4월6일(금) 상영작부터</p>
			<p align="left">2. 내용</p>
			<table border="1" cellpadding="0" cellspacing="0" style="width: 602px;" width="602">
				<tbody>
					<tr>
						<td style="width: 140px; height: 20px;">
						<p align="center">&nbsp;구분</p>
						</td>
						<td style="width: 232px; height: 20px;">
						<p align="center">&nbsp;기존</p>
						</td>
						<td style="width: 222px; height: 20px;">
						<p align="center">&nbsp;변경</p>
						</td>
					</tr>
					<tr>
						<td style="width: 140px; height: 20px;">
						<p align="center">&nbsp;금~일/공휴일</p>
						</td>
						<td style="width: 232px; height: 20px;">
						<p align="center">&nbsp;오전 11시 전 시작 영화</p>
						</td>
						<td style="width: 222px; height: 20px;">
						<p align="center">&nbsp;오전 10시 전 시작 영화</p>
						</td>
					</tr>
				</tbody>
			</table>
			<p align="left">* 주중(월~목) 조조 시간대는 기존과 동일</p>
			<p align="left">&nbsp;</p>
			<p align="left">언제나 더 나은 서비스를 위해 최선을 다하는 메가박스가 되겠습니다.</p>
			<p align="left">&nbsp;</p>
			<p align="left">감사합니다.</p>
			</td>
		</tr>
	</tbody>
</table>',sysdate,null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('admin','[공지] 거창지점 4/6(금) 임시 휴관 안내','<p>안녕하세요,</p>
<p>메가박스 거창지점입니다.</p>
<p>&nbsp;</p>
<p>항상 메가박스 거창지점을 찾아주시는 고객 여러분께 감사의 인사드립니다.</p>
<p><br>
저희 지점은 4월 6일(금) 상영관 내부 공사로 인해 임시 휴관을 하게 되었습니다.</p>
<p>&nbsp;</p>
<p>영화관 이용에 착오 없으시기 바라며, 추후 새롭게 단장한 모습으로 찾아 뵙겠습니다.<br>
&nbsp;</p>
<p>감사합니다.</p>',sysdate,null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('admin','[공지] 클래식 라이브 - 2018 베를린 필하모닉 유로파 콘서트 상영 안내
','<p align="left">&nbsp;</p>
<p align="left">안녕하세요. 메가박스 입니다.</p>
<p align="left">&nbsp;</p>
<p align="left">세계 최고의 오케스트라 중 하나인 베를린 필하모닉 오케스트라가 창립 기념일을 맞이하여</p>
<p align="left">유럽의 문화 유산을 찾아 공연하는 “베를린 필하모닉 유로파 콘서트”가 상영됩니다.</p>
<p align="left">올해는 바로크 극장의 걸작으로 손꼽히는 독일 바이로이트의 마르크그라프 오페라 하우스에서 공연될 예정입니다.</p>
<p align="left">오직 메가박스에서만 만날 수 있는 단 한번의 라이브에 초대합니다.</p>
<p align="left">&nbsp;</p>
<p align="left"><strong>[</strong><strong>공연 정보]</strong></p>
<p align="left">-&nbsp;공연 명칭 : 2018 베를린 필하모닉 유로파 콘서트</p>
<p align="left">-&nbsp;상영 일시 : 2018년 5월 1일(화) 18:00 *생중계</p>
<p align="left">-&nbsp;상영 지점 : 메가박스 코엑스, 센트럴, 신촌, 목동, 분당, 킨텍스, 광주, 서면 / 8개 지점</p>
<p align="left">-&nbsp;공연 시간 : 120분 *인터미션 포함</p>
<p align="left">&nbsp;</p>
<p align="left"><strong>[</strong><strong>예매 오픈]</strong></p>
<p align="left">-&nbsp;2018년 3월 30일(금) 15:00</p>
<p align="left">&nbsp;</p>
<p align="left"><strong>[</strong><strong>티켓 안내]</strong></p>
<p align="left">-&nbsp;성인 30,000원 / 청소년 15,000원 / VIP 할인 15%</p>
<p align="left">-&nbsp;관람하시는 상영관에 따라 금액이 상이합니다.</p>
<p align="left">-&nbsp;공연 3일 전~1일 전 취소 시 티켓금액의 10%의 수수료가 부과됩니다. (부분 취소 및 환불 불가)</p>
<p align="left">-&nbsp;해당 공연은 상영 당일에는 취소 및 환불 불가합니다.</p>
<p align="left">&nbsp;</p>
<p align="left"><strong>[</strong><strong>유의사항]</strong></p>
<p align="left">-&nbsp;본 상영은 위성 중계 프로그램이며, 자막이 제공되지 않습니다.</p>
<p align="left">-&nbsp;본 상영은 현지 사정에 의해 러닝타임 및 프로그램, 출연진이 변경될 수 있습니다.</p>
<p align="left">-&nbsp;본 상영은 현지?국내 기상과 위성 사정에 따라 화질 및 음질이 고르지 못할 수 있습니다.</p>
<p align="left">-&nbsp;본 상영이 시작 된 이후에는 입장이 제한 될 수 있습니다.</p>
<p align="left">&nbsp;</p>
<p align="left">많은 관심 부탁 드립니다.</p>
<p align="left">감사합니다.</p>
<p align="left">&nbsp;</p>
<p>&nbsp;</p>',sysdate,null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('admin','[공지] 3/21 민방위의 날 전국 화재 대피 훈련 실시 안내','<p>안녕하십니까, 메가박스입니다.</p>
<p>&nbsp;</p>
<p>행정안전부 주관 전국 화재 대피 훈련이 다음과 같이 실시됩니다.</p>
<p>영화관 이용에 참고 해주시기 바랍니다.</p>
<p>&nbsp;</p>
<p>1. 일시: 2018년 3월 21일 수요일 오후 14:00 ~ 14:20</p>
<p>2. 장소: 전국 메가박스 지점</p>
<p>&nbsp;</p>
<p>해당 시간 영화관에 방문 중인 고객님께서는</p>
<p>화재 대피 훈련에 적극적인 협조 및 참여 부탁드립니다.</p>
<p>&nbsp;</p>
<p>감사합니다.</p>.',sysdate,null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('admin','[공지] 유니텔 오페라 3/21(수) 상영 일정 조정 안내','<p>안녕하세요, 메가박스입니다.</p>
<p>&nbsp;</p>
<p>3월 21일 수요일 제406차 민방공 대피훈련이 실시됨에 따라,</p>
<p>해당일 유니텔 오페라의 상영 일정이 조정됩니다.</p>
<p>&nbsp;</p>
<p>오페라 관람 예정이신 고객님께서는 아래의 내용을 참고 해주시기 바랍니다.</p>
<p>&nbsp;</p>
<p>1. 영화명: [필름 오페라] 라 트라비아타</p>
<p>2. 해당 지점: 대구신세계지점, 목동지점, 센트럴지점, 하남스타필드지점</p>
<p>3. 상영 시간</p>
<p>&nbsp;- 기존: 3월 21일 수요일 오후 2시</p>
<p>&nbsp;- <strong><u>변경: 3월 21일 수요일 오후 3시</u></strong></p>
<p>&nbsp;</p>
<p>항상 저희 메가박스를 이용해주셔서 감사합니다.</p>',sysdate,null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('admin','[공지] 클래식 라이브 잘츠부르크 부활절 페스티벌 <토스카> 상영 안내','<p>안녕하세요.</p>
<p>메가박스 입니다.</p>
<p>&nbsp;</p>
<p>카라얀의 음악적 이상이 살아있는 “잘츠부르크 부활절 페스티벌”이 상영될 예정입니다.</p>
<p>올해는 특히 푸치니의 가장 극적인 오페라 &lt;토스카&gt;가 공연됩니다.</p>
<p>오직 메가박스에서만 만날 수 있는 단 한번의 라이브에 여러분을 초대 합니다.<br>
&nbsp;</p>
<p><strong>[공연 정보]</strong><br>
&nbsp;- 공연 명칭 : 잘츠부르크 부활절 페스티벌 – 토스카<br>
&nbsp;- 상영 일시 : 2018년 4월 1일(일) 17:00 *딜레이 중계<br>
&nbsp;- 상영 지점 : 코엑스, 센트럴, 신촌, 목동, 분당, 킨텍스, 광주, 서면 / 8개 지점<br>
&nbsp;- 공연 시간 : 125분 / 인터미션 없음</p>
<p>&nbsp;</p>
<p><strong>[예매 오픈]</strong><br>
&nbsp;- 예매 오픈 : 2018년 3월 2일(금) 15:00</p>
<p>&nbsp;</p>
<p><strong>[티켓 안내]</strong><br>
&nbsp;- 성인 30,000원 / 청소년 15,000원 / VIP 할인 15%<br>
&nbsp;- 관람하시는 상영관에 따라 금액이 상이합니다.<br>
&nbsp;- 공연 3일 전~1일 전 취소 시 티켓금액의 10%의 수수료가 부과됩니다.<br>
&nbsp;- 해당 공연은 상영 당일에는 취소 및 환불 불가합니다.</p>
<p>&nbsp;</p>
<p><strong>[유의사항]</strong><br>
&nbsp;- 본 상영은 위성 중계 프로그램이며, 자막이 제공됩니다.<br>
&nbsp;- 본 상영은 현지 사정에 의해 러닝타임 및 프로그램, 출연진이 변경될 수 있습니다.<br>
&nbsp;- 본 상영은 현지, 국내 기상과 위성 사정에 따라 화질 및 음질이 고르지 못할 수 있습니다.<br>
&nbsp;- 본 상영이 시작 된 이후에는 입장이 제한 될 수 있습니다.<br>
&nbsp;</p>
<p>많은 관심 부탁 드립니다.</p>
<p>감사합니다.</p>
<p>&nbsp;</p>',sysdate,null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('admin','[공지] 매거진M 발행 중단으로 인한 보상 안내','<div class="contents">
		<p>안녕하세요. 메가박스입니다.</p>
<p>&nbsp;</p>
<p>12월 초 안내 드린 바와 같이 매거진M이 244호(12월 22일자)를 마지막으로 발행이 중단되었습니다.</p>
<p>현재 VIP 혜택으로 매거진M을 구독하고 계셨던 고객님께는 잔여 구독기간에 따라 메가박스 관람권을 쿠폰함에 넣어 드렸습니다.</p>
<p>&nbsp;</p>
<p>예매권 사용 문의는 메가박스 드림센터 1544-0070,</p>
<p>매거진M을 구독하고 계시는데 관람권이 지급되지 않았거나 또는 지급 기준에 대해 문의가 있으실 경우 중앙일보 콜센터 080-023-5001 로 문의 바랍니다.</p>
<p>&nbsp;</p>',sysdate,
   									null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);