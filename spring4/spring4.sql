
--���ӵ� ���� ����
CREATE SEQUENCE seq_product;

CREATE TABLE product (
    product_id NUMBER(10)
    , product_name VARCHAR2(255) NOT NULL
    , product_price NUMBER(10)
    , CONSTRAINT pk_product_id PRIMARY KEY (product_id)
);

INSERT INTO product VALUES (seq_product.nextval, '��Ź��', 500000);
INSERT INTO product VALUES (seq_product.nextval, '�����', 1500000);
COMMIT;
SELECT * FROM product;