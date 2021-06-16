-- общая информация по ЛПУ
select      distinct
    lpu.name lpu_name,
    --lpu.phone,
    lpu.id,
    lpu.type_id,
    ou.name улица,
    bti.um_bti_code,
    bti.house дом,
    bti.building корпус,
    bti.construction строение,
    lpu.SHORT_NAME, 
    lpu.ADDRESS, 
    lpu.MGFOMS, 
    lpu.MCOD,
    lpu.lpu_group_id ИД_ГРУППЫ,
    lg.MAIN_LPU_ID ИД_ГОЛОВЫ,
    l2.name голова,
    lpu.is_introduced НА_ПОРТАЛЫ,
    lpu.head_finance в_подушевом
 --lpu.*
from 
    emias_cluster.lpu
    left join emias_cluster.lpu_group lg on lpu.lpu_group_id=lg.id
    left join emias_cluster.lpu l2 on l2.id=lg.main_lpu_id
    left JOIN emias_cluster.building_registry bti ON bti.code = lpu.building_registry_code
        left join emias_cluster.omk_um ou on ou.bti_code=bti.um_bti_code --lpu.street_code
--where lpu.id=10646000
