SELECT DISTINCT
*
/*
    a.fullname,
--    d.psdep_name,
    m.name,
--    c.name AS name1,
    c.fullname AS название_МО,
    a.pension_nbr,
    dep.name отделение,
  --  dep.enddate--,
--    cl.dismiss_date,
--    cl.dismiss_motiv,
--    cl.jobbegin_date,
--    cl.last_jobbeg_date,
 --   a.agnfamilyname||' '|| a.agnfirstname||' '||  a.agnlastname фио
    cp.company,
 --   m.company AS company1,
  --  m.crn,
  --  c.rn,
  --  sv.SNAME,
 --   sv.SUPP_ID,
    sv.STATUS*/
FROM
    parus.agnlist a
WHERE
  /*  cp.psdeprn = d.rn
    AND   dep.rn = d.deptrn
    AND   d.postrn = m.rn
    AND   d.company = c.rn
    AND   cl.pers_agent = a.rn
    AND   cp.persrn = cl.rn*/
 a.pension_nbr='057-604-306-55'
--    and a.fullname=   'Копылова Раиса Петровна'
 --   and a.pension_nbr='108-569-036 72'
 /*  and c.rn=sv.COMPANY
      and CP.BEGENG <= sysdate
  and (CP.ENDENG >= sysdate or CP.ENDENG is null)*/
/*and c.company not in (  40455,--Эталон
                       70596745,  --Обучение
                       410753202,--Общая
                       5286261093,
                       7184861766,
                       2120177615,
                       1862316535,
                       31926488,
                       4694873510,
                       4990375385,
                       4694906966,
                       1465040954,
                       4694905822,
                       4694826260,
                       1444638,
                       4694902067,
                       4694900761,
                       4694889075,
                       4694899541,
                       4694876076,
                       4694919226,
                       4694929580,
                       4694916625,
                       5286267692
                       )  */
    --AND   cp.begeng <= SYSDATE