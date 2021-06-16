    SELECT
      lpu.name AS lpu_name,
    lpu.phone,
    lpu.id,
    lpu.type_id,
    lpu.street_code,
    lpu.building_registry_code,
    ou.name улица,
        bti.house дом,
    bti.building корпус,
    bti.construction строение,
    ou.te_code,
    ou.name,
 --   ou.tm_code,
   -- ou.msr_name_old,
    ou.msr_code,
    ou.msr_name,
    ou.bti_code,
    ou.bti_name,
    bti.code,
    bti.house,
    bti.building,
    bti.construction,
   -- ou.code_new,
    ou.kladr_code
   
FROM
   emias_cluster.lpu 
 -- left outer join  emias_cluster.omk_um ou on bti.um_bti_code = ou.bti_code
    left JOIN emias_cluster.building_registry bti on lpu.building_registry_code=bti.code   --
    left outer join  emias_cluster.omk_um ou on bti.um_bti_code = ou.bti_code
--WHERE
   -- (bti.urgency = 1)
    --    and 
      --  (ou.msr_code=018890)
 --    bti.um_bti_code='198531'
      --	ou.kladr_code=77011000013000100
       -- and bti.house='42'
        
    
   -- and (    ou.msr_code<>ou.msr_name_old)
/*ORDER BY
    1,
    2,
    3,
    4,
    5*/