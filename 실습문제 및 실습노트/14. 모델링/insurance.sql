DROP TABLE CONTRACT;

CREATE TABLE CONTRACT
(
    CONTRACT_NO    NUMBER NOT NULL,
    PRODUCT_NO    NUMBER NOT NULL,
    CUST_NO    NUMBER NOT NULL,
    CONTRACT_DATE    DATE NOT NULL,
    START_DATE    DATE NOT NULL,
    END_DATE    DATE NOT NULL,
    PRICE    NUMBER NOT NULL,
    PAY_NO    NUMBER NOT NULL
);

COMMENT ON COLUMN CONTRACT.CONTRACT_NO IS '계약번호';

COMMENT ON COLUMN CONTRACT.PRODUCT_NO IS '상품번호';

COMMENT ON COLUMN CONTRACT.CUST_NO IS '고객번호';

COMMENT ON COLUMN CONTRACT.CONTRACT_DATE IS '계약일자';

COMMENT ON COLUMN CONTRACT.START_DATE IS '보험시작일자';

COMMENT ON COLUMN CONTRACT.END_DATE IS '보험종료일자';

COMMENT ON COLUMN CONTRACT.PRICE IS '매월 납입 보험료';

COMMENT ON COLUMN CONTRACT.PAY_NO IS '총납입회차';

COMMENT ON TABLE CONTRACT IS '계약';

CREATE UNIQUE INDEX CONTRACT_NO_PK ON CONTRACT
( CONTRACT_NO );

ALTER TABLE CONTRACT
 ADD CONSTRAINT CONTRACT_NO_PK PRIMARY KEY ( CONTRACT_NO )
 USING INDEX CONTRACT_NO_PK;

ALTER TABLE CONTRACT
DROP PRIMARY KEY;

ALTER TABLE CONTRACT
 ADD CONSTRAINT CONTRACT_NO_PK PRIMARY KEY ( CONTRACT_NO )
 USING INDEX CONTRACT_NO_PK;

COMMENT ON COLUMN CONTRACT.CONTRACT_NO IS '계약번호';

COMMENT ON COLUMN CONTRACT.PRODUCT_NO IS '상품번호';

COMMENT ON COLUMN CONTRACT.CUST_NO IS '고객번호';

COMMENT ON COLUMN CONTRACT.CONTRACT_DATE IS '계약일자';

COMMENT ON COLUMN CONTRACT.START_DATE IS '보험시작일자';

COMMENT ON COLUMN CONTRACT.END_DATE IS '보험종료일자';

COMMENT ON COLUMN CONTRACT.PRICE IS '매월 납입 보험료';

COMMENT ON COLUMN CONTRACT.PAY_NO IS '총납입회차';

COMMENT ON TABLE CONTRACT IS '계약';

DROP SEQUENCE SEQ_CONTRACT_NO;
CREATE SEQUENCE SEQ_CONTRACT_NO
INCREMENT BY 1
START WITH 1
MINVALUE 0
MAXVALUE 1000
CYCLE;
