select
name_ac ÀÖ,
name_f Ôèëèàë,
attachment_request_id ÈÄ_ÇÀßÂËÅÍÈß,
date_10 ÄÀÒÀ,
--date_11 ÄÀÒÀ2,
request_number Íîìåğ,
name_ds ÒÈÏ_Ó×ÀÑÒÊÀ,
ars_name Ñòàòóñ
from 
(select distinct 
        l2.name name_ac, 
        l.name name_f ,  
        ar.attachment_request_id , 
        --trunc(min(are.change_date)) date_10,
trunc(are.change_date) date_10,         
ar.request_number ,
        art.name name_ds  , 
        ars.name ars_name
    from 
        emias_cluster.attachment_request ar
        join emias_cluster.attachment_request_status ars on ars.code=ar.attachment_request_status
        join emias_cluster.attachment_request_event are on are.attachment_request_id=ar.attachment_request_id and are.attachment_request_status =10 
        join emias_cluster.lpu l on l.id=ar.lpu_id
        left join emias_cluster.lpu_group lg on lg.id=l.lpu_group_id
        left join emias_cluster.lpu l2 on l2.id=lg.main_lpu_id
        join emias_cluster.service_district sd on sd.id=ar.service_district_id
        join emias_cluster.lpu_district_type ldt on ldt.id=sd.lpu_district_type
        join emias_cluster.area_type art on art.code=ldt.district_type
    where art.code in (10,20, 190, 30) and are.source_type=20 
group by  l2.name, l.name, ar.attachment_request_id,  ar.request_number, art.name, ars.name, are.change_date )
/*where date_10<= to_date('31.10.2018', 'dd.mm.yyyy')*/
order by  attachment_request_id-- name_ac ,  name_f, date_10 ;



/*
select
name_ac ÀÖ,
name_f Ôèëèàë,
attachment_request_id ÈÄ_ÇÀßÂËÅÍÈß,
date_10 ÄÀÒÀ,
request_number Íîìåğ,
name_ds ÒÈÏ_Ó×ÀÑÒÊÀ,
ars_name Ñòàòóñ
from 
(select distinct 
l2.name name_ac, l.name name_f ,  ar.attachment_request_id , trunc(min(are.change_date)) date_10, ar.request_number ,art.name name_ds  , ars.name ars_name
from 
emias_cluster.attachment_request ar
join emias_cluster.emias_cluster.attachment_request_status ars on ars.code=ar.attachment_request_status
join emias_cluster.emias_cluster.attachment_request_event are on are.attachment_request_id=ar.attachment_request_id and are.attachment_request_status =10 
join emias_cluster.emias_cluster.lpu l on l.id=ar.lpu_id
left join emias_cluster.lpu_group lg on lg.id=l.lpu_group_id
left join emias_cluster.lpu l2 on l2.id=lg.main_lpu_id
join emias_cluster.service_district sd on sd.id=ar.service_district_id
join emias_cluster.lpu_district_type ldt on ldt.id=sd.lpu_district_type
join emias_cluster.area_type art on art.code=ldt.district_type
where art.code in (10,20) and are.source_type=20 
group by  l2.name, l.name, ar.attachment_request_id,  ar.request_number, art.name, ars.name )
where date_10<= to_date('31.10.2018', 'dd.mm.yyyy')
order by  name_ac ,  name_f, date_10 ;*/