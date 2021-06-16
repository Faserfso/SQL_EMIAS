SELECT
    a.fullname,
    d.psdep_name,
    m.name,
    c.name AS name1,
    c.fullname AS fullname1,
    a.pension_nbr,
    dep.name AS name2,
    dep.enddate,
    cl.dismiss_date,
    cl.dismiss_motiv,
    cl.jobbegin_date,
    cl.last_jobbeg_date,
    a.agnfamilyname,
    a.agnfirstname,
    a.agnlastname,
    cp.company,
    cp.crn,
    c.rn,
    dep.company AS company1,
    dep.code,
    a.rn AS rn1,
    a.crn AS crn1,
    a.econcode,
    a.orgcode,
    c.dummy,
    c.agent,
    c.stamp,
    dep.crn AS crn2,
    dep.prn
FROM
    clnpspfm cp,
    clnpsdep d,
    clnposts m,
    companies c,
    clnpersons cl,
    ins_department dep,
    agnlist a
WHERE
    cp.psdeprn = d.rn
    AND   dep.rn = d.deptrn
    AND   d.postrn = m.rn
    AND   d.company = c.rn
    AND   cl.pers_agent = a.rn
    AND   cp.persrn = cl.rn
    AND   a.pension_nbr = '141-514-902 27'
    AND   cp.company NOT IN (
        40455,
        1445233,
        1446773,
        1447081,
        1447389,
        1447697,
        1448005,
        1448313,
        1448621,
        1448929,
        1449237,
        13468535,
        31925780,
        70596745,
        195210508,
        195210881,
        229234795,
        238751916,
        238752261,
        334915463,
        336765558,
        372218764,
        410753202,
        591175346,
        591176120,
        810163799,
        811148439,
        811576639,
        1071941064,
        1113424527,
        1239549445,
        1359251688,
        1359395354,
        1359407352,
        1359407891,
        1359409993,
        1359417824,
        1359418380,
        1359418896,
        5286219030,
        5286226774,
        5286233450,
        5286240918,
        5286247978,
        5286254859,
        5286261093,
        5286267692,
        5286275414,
        5286281684,
        5286288886,
        5286297068,
        5286306366,
        5286314422,
        5286322529,
        5286330446,
        5286338233,
        5286346724,
        5286354734,
        5286363334,
        5286370454,
        5286378503,
        5286387193,
        5286395120,
        1359420385,
        1359429625,
        1359430859,
        1473531420,
        1488556226,
        1528993099,
        1559795830,
        1893362385,
        1939200776,
        2194070991,
        4694824172,
        4694842312,
        4694851972,
        4694865114,
        4694878092,
        4694882217,
        4694896513,
        4694903067,
        4694924140,
        4694931710,
        4694933789,
        5286211205,
        5286403565,
        5286411804,
        5286420169,
        5286428677,
        5286437429,
        5286445035,
        5286452321,
        5286461353,
        5286468198,
        5286476476,
        5286485872,
        5286493476,
        5286501851,
        5286510557,
        5286518265,
        5286526129,
        5286534007,
        5286542476,
        5286551016,
        5286559199,
        5420739164
    )
    AND   cp.begeng <= SYSDATE