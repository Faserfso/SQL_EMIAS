SELECT distinct
    l.type_id тип,
    l.id LPU_ID,
    l.name Название,
--    l.ADDRESS,
--    l.specialization_code,
--    l.agencyorg_code,
    l.lpu_group_id ИД_ГРУППЫ,
    lg.MAIN_LPU_ID ИД_ГОЛОВЫ,
    l2.name голова,
    l.is_introduced НА_ПОРТАЛЫ,
 l.head_finance в_подушевом--участвует в финансировании
FROM
    lpu l
    left join lpu_group lg on l.lpu_group_id=lg.id
    left join lpu l2 on l2.id=lg.main_lpu_id
     join service_district sd on sd.lpu_id =l.id
     join lpu_district_type ldt on ldt.id=sd.lpu_district_type
   -- right join area_type art on art.code=ldt.district_type 
   -- where sd.district_status=1 and art.code in (30,190)

WHERE     ldt.district_type in (30,190) or l.type_id IN (41,42)