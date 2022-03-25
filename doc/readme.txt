
--------------------------------------------------
 About JDBC
--------------------------------------------------

--------------------------------------------------
한글폰트문제
--------------------------------------------------
기본문자셋 UTF-8설정

request.setCharacterEncoding("utf-8"); //요청 관련 인코딩 처리
response.setContentType("text/html;charset=utf-8"); //응답 관련 인코딩 처리
Tomcat -- server.xml
<Connector connectionTimeout="20000" port="8080" protocol="HTTP/1.1" redirectPort="8443" URIEncoding="UTF-8"/>
<Connector port="8009" protocol="AJP/1.3" redirectPort="8443" URIEncoding="UTF-8"/>

한글필터추가 - web.xml
(필터를 구현하여야 함 -- 스프링에서는 구현체 있음)
<filter>
	<filter-name>setCharEncoding</filter-name>
	<filter-class>filters.SetCharacterEncodingFilter</filter-class>
	<init-param>
		<param-name>encoding</param-name>
		<param-value>UTF-8</param-value>
	</init-param>
</filter>

<filter-mapping>
	<filter-name>setCharEncoding</filter-name>
	<url-pattern>/*</url-pattern>
</filter-mapping>

참고사이트
https://dev-onestep.tistory.com/21
https://choijaehun.net/4?category=976168

--------------------------------------------------

1. JDBC-날것 그대로
2. DAO (Data Access Object)
3. DTO (Data Transfer Object), VO(Value Object)

--------------------------------------------------

JSP 페이지에 Parameter 전달
JSP와 서블릿의 관계는?
JSP와 Servlet 소스비교
* workspace 폴더 > .metadata > .plugins > org.eclipse.wst.server.core > tmp0~N > wtpwebapps
--------------------------------------------------
(Without Parameter)
JSP에서 JDBC 사용 (JDBC)
JSP에서 POJO DAO 사용 (JDBC)
Servlet에서 JDBC 사용 (JDBC)
Servlet에서 POJO DAO 사용 (JDBC)

--------------------------------------------------
(With Parameter)
JSP에서 JDBC 사용 (JDBC)
JSP에서 POJO DAO 사용 (JDBC)
Servlet에서 JDBC 사용 (JDBC)
Servlet에서 POJO DAO 사용 (JDBC)

--------------------------------------------------
 Servlet에서 JNID사용
--------------------------------------------------
JNDI 설정
serverconfig.xml
context.xml


--------------------------------------------------
 SQL
--------------------------------------------------
User : student, Table : MEMBER

CREATE TABLE "STUDENT"."MEMBER" 
   (	"NAME" VARCHAR2(10 BYTE), 
	"HEIGHT" VARCHAR2(10 BYTE), 
	"WEIGHT" VARCHAR2(10 BYTE), 
	"AGE" NUMBER(5,0), 
	"SEX" CHAR(5 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

