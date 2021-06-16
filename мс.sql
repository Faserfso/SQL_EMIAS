-- ������ ���������� �� ����� � �������������

SELECT a.IDUSER, -- ������������� ������������
       a.LASTNAME, -- �������
       a.FIRSTNAME, -- ���
       a.MIDDLENAME, -- ��������
       a.LOGIN, -- �����
   --    a.PHONE, -- �������
    --   a.EMAIL, -- ��. �����
    --   a.USER_HOSTNAME, -- ���
     --  a.IDMU, -- ��� ��
     --  a.IDLPU, -- ��� ��
       b.NAMEMU--, -- ��
    --   b.CODE, -- ��� �������
     --  CA.LT -- �����
  FROM MONITORING.REF_USER a
  INNER JOIN REF_MU b ON A.IDMU = B.IDMU
  CROSS APPLY (SELECT listagg(t1.DESCRIPTION, ', ') 
            WITHIN GROUP(order by t1.DESCRIPTION) AS LT
    FROM REF_USERINROLE t
    INNER JOIN REF_ROLE t1 ON t1.IDROLE = T.IDROLE
    WHERE T.IDUSER = A.IDUSER) CA
  WHERE DELETED = 0 AND A.IDMU > 2