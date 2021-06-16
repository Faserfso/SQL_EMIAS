-- ����� ���������� �� ���
select      distinct
    lpu.name lpu_name,
    --lpu.phone,
    lpu.id,
    lpu.type_id,
    ou.name �����,
    bti.um_bti_code,
    bti.house ���,
    bti.building ������,
    bti.construction ��������,
    lpu.SHORT_NAME, 
    lpu.ADDRESS, 
    lpu.MGFOMS, 
    lpu.MCOD,
    lpu.lpu_group_id ��_������,
    lg.MAIN_LPU_ID ��_������,
    l2.name ������,
    lpu.is_introduced ��_�������,
    lpu.head_finance �_���������
 --lpu.*
from 
    emias_cluster.lpu
    left join emias_cluster.lpu_group lg on lpu.lpu_group_id=lg.id
    left join emias_cluster.lpu l2 on l2.id=lg.main_lpu_id
    left JOIN emias_cluster.building_registry bti ON bti.code = lpu.building_registry_code
        left join emias_cluster.omk_um ou on ou.bti_code=bti.um_bti_code --lpu.street_code
--where lpu.id=10646000
