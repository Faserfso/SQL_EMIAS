SELECT distinct
    l.type_id тип,
    l.id LPU_ID,
    l.name Название,
    l.short_name краткое_назв,
--    l.ADDRESS,
--    l.specialization_code,
--    l.agencyorg_code,
    l.lpu_group_id ИД_ГРУППЫ,
    lg.MAIN_LPU_ID ИД_ГОЛОВЫ,
    l2.name голова,
    l.is_introduced НА_ПОРТАЛЫ,
 l.head_finance в_подушевом--участвует в финансировании
FROM
    emias_cluster.lpu l
    left join emias_cluster.lpu_group lg on l.lpu_group_id=lg.id
    left join emias_cluster.lpu l2 on l2.id=lg.main_lpu_id
   left join emias_cluster.service_district sd on sd.lpu_id =l.id
left join emias_cluster.lpu_district_type ldt on ldt.id=sd.lpu_district_type
   -- right join area_type art on art.code=ldt.district_type 
   -- where sd.district_status=1 and art.code in (30,190)

--WHERE     ldt.district_type in (30,190) or l.type_id IN (41,42)