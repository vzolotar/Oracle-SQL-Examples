-- ============================================================
--   Database name:  MODEL_3                                   
--   DBMS name:      ORACLE Version 8                          
--   Created on:     03/21/2000  2:22 PM                       
-- ============================================================

drop table TT_STATES cascade constraints
/

drop table TT_PRODUCT_LNK cascade constraints
/

drop table TT_PRODUCT cascade constraints
/

drop table TT_PAYMENT_LNK cascade constraints
/

drop table TT_PAYMENT cascade constraints
/

drop table TT_ORDER_LNK cascade constraints
/

drop table TT_ORDER cascade constraints
/

drop table TT_KEYS cascade constraints
/

drop table TT_CUSTOMER_LNK cascade constraints
/

drop table TT_CUSTOMER cascade constraints
/

drop table TT_ADDRESS2 cascade constraints
/

-- ============================================================
--   Table: TT_ADDRESS2                                        
-- ============================================================
create table TT_ADDRESS2
(
    ADDR2_ID                NUMBER(11)             not null,
    ADDR2_SUIT              VARCHAR2(50)           null    ,
    ADDR2_PH_AC             VARCHAR2(3)            null    ,
    ADDR2_PHONE             VARCHAR2(100)          null    ,
    ADDR2_PH_EXT            VARCHAR2(8)            null    ,
    ADDR2_NAME              VARCHAR2(70)           null    ,
    ADDR2_USE               VARCHAR2(20)           null    ,
    ADDR2_ENTRY             VARCHAR2(2)            null    ,
    constraint SYS_C00970 primary key (ADDR2_ID)
)
/

-- ============================================================
--   Table: TT_CUSTOMER                                        
-- ============================================================
create table TT_CUSTOMER
(
    CUST_ID                 NUMBER(11)             not null,
    CUST_FIRM_ID            VARCHAR2(11)           null    ,
    CUST_ACCT_N             VARCHAR2(6)            null    ,
    CUST_PARENT_ID          VARCHAR2(11)           null    ,
    CUST_COMPANY_NAME       VARCHAR2(70)           null    ,
    CUST_STREET             VARCHAR2(50)           null    ,
    CUST_CITY               VARCHAR2(25)           null    ,
    CUST_ZIP                VARCHAR2(10)           null    ,
    CUST_STATE              VARCHAR2(20)           null    ,
    CUST_COUNTY             VARCHAR2(20)           null    ,
    CUST_COUNTRY            VARCHAR2(20)           null    ,
    CUST_PO_BOX             VARCHAR2(15)           null    ,
    CUST_ATTN               VARCHAR2(50)           null    ,
    CUST_ACT_STATUS         VARCHAR2(20)           null    ,
    CUST_TAX_EX             VARCHAR2(10)           null    ,
    CUST_CUST_TYPE          VARCHAR2(20)           null    ,
    CUST_GROUP              VARCHAR2(10)           null    ,
    CUST_COMMENTS           VARCHAR2(1000)         null    ,
    CUST_SUIT               VARCHAR2(40)           null    ,
    CUST_OLD_ACC            VARCHAR2(6)            null    ,
    CUST_VANITY             VARCHAR2(50)           null    ,
    CUST_LOAD_TYPE          VARCHAR2(1)            null    ,
    CUST_ENTRY              VARCHAR2(2)            null    ,
    constraint SYS_C001276 primary key (CUST_ID)
)
/

-- ============================================================
--   Table: TT_CUSTOMER_LNK                                    
-- ============================================================
create table TT_CUSTOMER_LNK
(
    CUST_LNK_CUST_ID        NUMBER(11)             not null,
    CUST_LNK_ADDR2_ID       NUMBER(11)             not null,
    constraint SYS_cust_lnk primary key (CUST_LNK_CUST_ID, CUST_LNK_ADDR2_ID)
)
/

-- ============================================================
--   Table: TT_KEYS                                            
-- ============================================================
create table TT_KEYS
(
    TABLE_NAME              VARCHAR2(20)           not null,
    NEXT_KEY                NUMBER(11)             not null,
    constraint SYS_key1 primary key (TABLE_NAME)
)
/

-- ============================================================
--   Table: TT_ORDER                                           
-- ============================================================
create table TT_ORDER
(
    OR_ID                   NUMBER(11)             not null,
    OR_ALT_BILTO_ID         NUMBER(11)             null    ,
    OR_ATTN_BILL_ID         NUMBER(11)             null    ,
    OR_USER_INITIALS        VARCHAR2(2)            null    ,
    OR_NUMBER               VARCHAR2(15)           null    ,
    OR_DATE                 DATE                   null    ,
    OR_ISSUE_DATE           DATE                   null    ,
    OR_TIME                 NUMBER(10)             null    ,
    OR_TOTAL_AMOUNT         FLOAT                  null    ,
    OR_TAX_AMOUNT           FLOAT                  null    ,
    OR_BPC                  NUMBER(7)              null    ,
    OR_BCC                  NUMBER(7)              null    ,
    OR_TYPE                 VARCHAR2(10)           null    ,
    OR_CUST_ID              NUMBER(11)             null    ,
    OR_STATUS               VARCHAR2(10)           null    ,
    OR_PAYMENT_YN           VARCHAR2(1)            null    ,
    OR_COMMENTS             VARCHAR2(1000)         null    ,
    OR_SHIPPING_DATE        DATE                   null    ,
    OR_PO_NUMBER            VARCHAR2(20)           null    ,
    OR_BILLING_DATE         DATE                   null    ,
    OR_PUBLISH_DATE         DATE                   null    ,
    constraint SYS_C00988 primary key (OR_ID)
)
/

-- ============================================================
--   Table: TT_ORDER_LNK                                       
-- ============================================================
create table TT_ORDER_LNK
(
    OR_LNK_ID               NUMBER(11)             not null,
    OR_LNK_ORDER_ID         NUMBER(11)             null    ,
    OR_LNK_CUST_SHIPTO_ID   NUMBER(11)             null    ,
    OR_LNK_ADDR2_SHIPTO_ID  NUMBER(11)             null    ,
    constraint SYS_C00990 primary key (OR_LNK_ID)
)
/

-- ============================================================
--   Table: TT_PAYMENT                                         
-- ============================================================
create table TT_PAYMENT
(
    PAY_ID                  NUMBER(11)             not null,
    PAY_TYPE                VARCHAR2(2)            null    ,
    PAY_ACC_NUM             VARCHAR2(20)           null    ,
    PAY_EXPIR_DATE          VARCHAR2(10)           null    ,
    PAY_AMOUNT              FLOAT                  null    ,
    PAY_DATE                VARCHAR2(10)           null    ,
    constraint SYS_C00992 primary key (PAY_ID)
)
/

-- ============================================================
--   Table: TT_PAYMENT_LNK                                     
-- ============================================================
create table TT_PAYMENT_LNK
(
    PAY_LNK_OR_ID           NUMBER(11)             not null,
    PAY_LNK_PAY_ID          NUMBER(11)             not null,
    constraint SYS_C00995 primary key (PAY_LNK_OR_ID, PAY_LNK_PAY_ID)
)
/

-- ============================================================
--   Table: TT_PRODUCT                                         
-- ============================================================
create table TT_PRODUCT
(
    PR_ID                   NUMBER(11)             not null,
    PR_NAME                 VARCHAR2(50)           null    ,
    PR_PRICE                FLOAT                  null    ,
    PR_SRT_DATE             DATE                   null    ,
    PR_END_DATE             DATE                   null    ,
    PR_LOCK_DATE            VARCHAR2(1)            null    ,
    PR_AR_CODE              VARCHAR2(4)            null    ,
    PR_DEPT                 VARCHAR2(4)            null    ,
    PR_ITT_YEAR             VARCHAR2(15)           null    ,
    PR_DISC                 VARCHAR2(10)           null    ,
    constraint SYS_C001469 primary key (PR_ID)
)
/

-- ============================================================
--   Table: TT_PRODUCT_LNK                                     
-- ============================================================
create table TT_PRODUCT_LNK
(
    PR_LNK_PR_LNK_ID        NUMBER(11)             not null,
    PR_LNK_PR_ID            NUMBER(11)             not null,
    PR_LNK_QUANTITY         NUMBER(5)              null    ,
    PR_LNK_PRICE_TOTAL      FLOAT                  null    ,
    PR_LNK_ORDER_LNK_ID     NUMBER(11)             not null,
    PR_LNK_PRICE            FLOAT                  null    ,
    PR_LNK_PURCH_TYPE       VARCHAR2(4)            null    ,
    PR_LNK_STAND_NON        VARCHAR2(1)            null    ,
    constraint SYS_C001001 primary key (PR_LNK_PR_LNK_ID)
)
/

-- ============================================================
--   Table: TT_STATES                                          
-- ============================================================
create table TT_STATES
(
    STATE_ID                VARCHAR2(3)            not null,
    STATE_NAME              VARCHAR2(24)           not null,
    STATE_CAPITAL           VARCHAR2(24)           not null,
    COUNTRY                 VARCHAR2(3)            not null,
    constraint SYS_C00963 primary key (STATE_ID)
)
/

