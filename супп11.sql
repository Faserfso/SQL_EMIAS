select ur1.user_role role,
       lpu1.name lpu_name,
       l21.name head_name,
       (select count (raur.user_role_id)   
               FROM
                emias_cluster.rel_account_and_user_role raur
                LEFT OUTER JOIN emias_cluster.lpu lpu ON lpu.id = raur.lpu_id
                INNER JOIN emias_cluster.user_role ur ON ur.id = raur.user_role_id
                INNER JOIN emias_cluster.account a ON a.login_id = raur.login_id
                LEFT OUTER JOIN emias_cluster.account_lpu_blocking_status albs ON albs.account_id = raur.login_id AND albs.lpu_id = raur.lpu_id
                where 
                 ur.user_role=ur1.user_role
                 and lpu1.id=lpu.id and
                 a.status='ACTIVE' AND nvl(albs.status,a.status)='ACTIVE'
        ) count_role
        from     
         emias_cluster.rel_account_and_user_role raur1
         LEFT OUTER JOIN emias_cluster.lpu lpu1 ON lpu1.id = raur1.lpu_id
         left join lpu_group lg1 on lpu1.lpu_group_id=lg1.id
         left join lpu l21 on l21.id=lg1.main_lpu_id
         INNER JOIN emias_cluster.user_role ur1 ON ur1.id = raur1.user_role_id
         INNER JOIN emias_cluster.account a1 ON a1.login_id = raur1.login_id
         LEFT OUTER JOIN emias_cluster.account_lpu_blocking_status albs1 ON albs1.account_id = raur1.login_id AND albs1.lpu_id = raur1.lpu_id
                 where
                 a1.status='ACTIVE' AND nvl(albs1.status,a1.status)='ACTIVE'    					     
        
