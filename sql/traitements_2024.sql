SELECT * FROM iav.t_periodefonctdispositif_per AS tpp 
WHERE per_dis_identifiant = 1 
AND per_date_debut > '2024-04-22 00:00:00'
AND per_date_fin <'2024-04-23 00:00:00'

SELECT * FROM iav.t_periodefonctdispositif_per AS tpp 
WHERE per_dis_identifiant = 1 
AND per_date_debut > '2024-05-21 00:00:00'
AND per_date_fin <'2024-05-22 00:00:00';

SET search_path TO 'iav', 'public';

WITH tj AS (
SELECT distinct car_lot_identifiant FROM tj_caracteristiquelot_car AS tcc 
JOIN t_lot_lot ON car_lot_identifiant =lot_identifiant 
JOIN t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_date_debut > '2024-02-08 '
AND ope_dic_identifiant = 5)
DELETE FROM tj_caracteristiquelot_car WHERE car_lot_identifiant  IN (SELECT car_lot_identifiant FROM tj); --2556


WITH lot AS (
SELECT DISTINCT lot_ope_identifiant  FROM
 t_lot_lot JOIN t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_date_debut > '2024-02-08 '
AND ope_dic_identifiant = 5)
DELETE FROM t_lot_lot WHERE lot_ope_identifiant  IN (SELECT lot_ope_identifiant FROM lot); --9257

DELETE FROM t_operation_ope 
WHERE  ope_date_debut > '2024-02-08 '
AND ope_dic_identifiant = 5; --5054