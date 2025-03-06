SET SEARCH_PATH TO iav;


SELECT * FROM iav.vue_lot_ope AS vlocq  
WHERE ope_dic_identifiant =5 AND lot_tax_code='2014'
AND ope_date_debut>'2023-08-01'

SELECT * FROM iav.vue_lot_ope_car_qan AS vlocq  
WHERE ope_dic_identifiant =5 AND lot_tax_code='2014'
AND ope_date_debut>'2023-08-01'

UPDATE t_lot_lot SET lot_effectif = 0 WHERE lot_identifiant = 440274;--1

-- Lamproies fluviatiles


WITH troppetite AS (
SELECT lot_identifiant FROM iav.vue_lot_ope_car_qan  
WHERE ope_dic_identifiant =5 AND lot_tax_code='2014'
AND car_valeur_quantitatif <500)
UPDATE iav.t_lot_lot SET lot_tax_code =2011
WHERE lot_identifiant IN (
SELECT lot_identifiant FROM troppetite); --7


-- suppression des operations lots et caractéristiques de lots de 2023 à refaire car 
-- un des jours était le 143 .....
SET search_path TO 'iav', 'public';

WITH tj AS (
SELECT distinct car_lot_identifiant FROM tj_caracteristiquelot_car AS tcc 
JOIN t_lot_lot ON car_lot_identifiant =lot_identifiant 
JOIN t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_date_debut > '2023-01-01'
AND ope_dic_identifiant = 5)
DELETE FROM tj_caracteristiquelot_car WHERE car_lot_identifiant  IN (SELECT car_lot_identifiant FROM tj); --3498


WITH lot AS (
SELECT DISTINCT lot_ope_identifiant  FROM
 t_lot_lot JOIN t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_date_debut > '2023-01-01'
AND ope_dic_identifiant = 5)
DELETE FROM t_lot_lot WHERE lot_ope_identifiant  IN (SELECT lot_ope_identifiant FROM lot); --7120

DELETE FROM t_operation_ope 
WHERE  ope_date_debut > '2023-01-01'
AND ope_dic_identifiant = 5; --2964



# 