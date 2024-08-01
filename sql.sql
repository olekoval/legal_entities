
/* Тільки по діючим на поточний момент договорам*/
SELECT lee.registration_area, lee.edrpou, lee.kwd_name, 
       m.contract_number, m.contract_start_date, m.contract_end_date
  FROM analytics.dwh_legal_entities_edrpou_view AS lee
       JOIN analytics.dwh_contract_master_smarttender_view m ON m.edrpou = lee.edrpou
       JOIN analytics.dwh_smd_contract_specifications_view as sp ON sp.contract_id = m.id
 WHERE sp.specification_id = '42' -- номер пакету
   AND lee.status = 'ACTIVE'
 ORDER BY lee.registration_area, lee.edrpou   
