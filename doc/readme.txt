--------------------------------------------------
 About JDBC
--------------------------------------------------
1. JDBC-날것 그대로
2. DAO (Data Access Object)
3. DTO (Data Transfer Object), VO(Value Object)

JSP 페이지에 Parameter 전달
JSP와 서블릿의 관계는?

JSP에서 POJO DAO 사용 (JDBC)
Servlet에서 POSO DAO 사용 (JDBC)

Servlet에서 Parameter 전달
JSP와 Servlet 소스비교

JSP에서 Parameter를 이용하여 POJO DAO 사용
Servlet에서 Parameter를 이용하여 POJO DAO 사용


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

