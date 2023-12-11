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


