select * from emias_cluster.attachment where speciality_code in (1, 44, 46, 47, 69, 602, 758, 759, 897, 921, 935)
 and attachment_end_date is null
 order by attachment_start_date desc;