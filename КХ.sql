-- запрос для картохранилища
SELECT 
routing_point.lpu_id, 
rO.volume_id, 
rO.datetime as take_in_datetime,
jI.datetime as near_from_cardstore, 
rN.type, 
rN.name, 
rN.room_id
FROM routing_journal rO JOIN routing_point ON rO.point_id = routing_point.id
LEFT JOIN routing_journal jI ON jI.volume_id = rO.volume_id AND jI.datetime = (select max(datetime) FROM routing_journal r JOIN routing_point p1 ON r.point_id = p1.id WHERE r.volume_id = rO.volume_id AND r.datetime < rO.datetime AND r.type = 'takeVolumeOut' AND p1.type != 'cardstore' GROUP BY r.volume_id)
LEFT JOIN routing_point rN ON jI.point_id = rN.id
WHERE rO.type = 'takeVolumeIn' AND routing_point.type = 'cardstore';