-- запрос полномочий по ролям в медстатистике

SELECT a.IDUSER, -- Идентификатор пользователя
       a.LASTNAME, -- Фамилия
       a.FIRSTNAME, -- Имя
       a.MIDDLENAME, -- Отчество
       a.LOGIN, -- Логин
   --    a.PHONE, -- Телефон
    --   a.EMAIL, -- Эл. почта
    --   a.USER_HOSTNAME, -- АРМ
     --  a.IDMU, -- Код МУ
     --  a.IDLPU, -- Код АЦ
       b.NAMEMU--, -- МО
    --   b.CODE, -- Код филиала
     --  CA.LT -- Права
  FROM MONITORING.REF_USER a
  INNER JOIN REF_MU b ON A.IDMU = B.IDMU
  CROSS APPLY (SELECT listagg(t1.DESCRIPTION, ', ') 
            WITHIN GROUP(order by t1.DESCRIPTION) AS LT
    FROM REF_USERINROLE t
    INNER JOIN REF_ROLE t1 ON t1.IDROLE = T.IDROLE
    WHERE T.IDUSER = A.IDUSER) CA
  WHERE DELETED = 0 AND A.IDMU > 2