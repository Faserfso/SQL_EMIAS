SELECT 
i.INCIDENT_ID Kod_obrascheniya,
i.CONTACT_NAME Kontaktnoe_litso,
i.OPEN_TIME v_rabotu,
i.DESCRIPTION Opisanie,
i.AFFECTED_ITEM Usluga,
i.CALLBACK_TYPE Sposob_obrascheniya,
i.RESOLUTION Reshenie,
i.CATEGORY Kategoriya,
i.CLOSE_TIME v_vypolneno,
i.CURRENT_PHASE Status,
i.TITLE Kratkoe_opisanie,
i.JET_RATING Otsenka,
i.JET_REVIEW Otzyv,
i.JET_REJECT_COUNT CHislo_vozvratov_,
i.JET_ASSIGNMENT TSK,
i.JET_IS_REJECT Vozvrat,
i.JET_SERVICE_GR Servisnaya_liniya,
i.JET_SERVICE Servis,
i.JET_NEED_INFO Trebuetsya_otvet,
i.JET_ASSIGNEE Spetsialist_TSK,
i.JET_ASSIGNEE Spetsialist_TSK,
i.ASSIGNEE nedokc,
--i.JET_ASSIGNEE_NAME nedokc,
i.AK_EMIASROLES Roli,
j.ASSIGNMENT   
FROM HPSM.INCIDENTSM1 i
INNER JOIN HPSM.JETCATALOGM1 j
ON i.SUBCATEGORY=j.PRODUCT AND i.JET_SERVICE_GR=j.SERVICE_GR AND i.AFFECTED_ITEM=j.SERVICE AND i.JET_SERVICE=j.ACTION
where i.JET_SERVICE_GR not in ('— ”” ƒ«Ã','—œ”','— ””')
and (i.OPEN_TIME between '19112018' and '25112018')