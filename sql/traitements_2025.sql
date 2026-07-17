SELECT * FROM iav.t_periodefonctdispositif_per AS tpp 
WHERE per_dis_identifiant = 1 
AND per_date_debut > '2024-04-22 00:00:00'
AND per_date_fin <'2024-04-23 00:00:00'

SELECT * FROM iav.t_periodefonctdispositif_per AS tpp 
WHERE per_dis_identifiant = 1 
AND per_date_debut > '2024-05-21 00:00:00'
AND per_date_fin <'2024-05-22 00:00:00';

SET search_path TO 'iav', 'public';


SELECT * FROM tj_caracteristiquelot_car AS tcc 
JOIN t_lot_lot ON car_lot_identifiant =lot_identifiant 
JOIN t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_date_debut > '2025-05-24 '
AND ope_dic_identifiant = 5


SELECT * FROM t_operation_ope 
WHERE ope_date_debut > '2025-05-24 13:50:00'
AND ope_dic_identifiant = 5

SELECT * FROM t_lot_lot
JOIN t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_date_debut >= '2025-05-24 13:50:00'
AND ope_dic_identifiant = 5



WITH tj AS (
SELECT distinct car_lot_identifiant FROM tj_caracteristiquelot_car AS tcc 
JOIN t_lot_lot ON car_lot_identifiant =lot_identifiant 
JOIN t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_date_debut >= '2025-05-24 13:50:00'
AND ope_dic_identifiant = 5)
DELETE FROM tj_caracteristiquelot_car WHERE car_lot_identifiant  IN (SELECT car_lot_identifiant FROM tj); --0


WITH lot AS (
SELECT DISTINCT lot_ope_identifiant  FROM
 t_lot_lot JOIN t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_date_debut >= '2025-05-24 13:50:00'
AND ope_dic_identifiant = 5)
DELETE FROM t_lot_lot WHERE lot_ope_identifiant  IN (SELECT lot_ope_identifiant FROM lot); --9257

DELETE FROM t_operation_ope 
WHERE  ope_date_debut >= '2025-05-24 13:50:00'
AND ope_dic_identifiant = 5; --5054



-- Une alose de 4 pixels pas mesurée correctement
WITH troppetite AS (
SELECT *  FROM iav.tj_caracteristiquelot_car AS tcc 
JOIN iav.t_lot_lot ON car_lot_identifiant =lot_identifiant 
JOIN iav.t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_dic_identifiant =5 AND lot_tax_code='2055'
AND car_valeur_quantitatif <200)

UPDATE iav.tj_caracteristiquelot_car SET 
(car_valeur_quantitatif, car_commentaires)= (450, 'Correction le poisson loin en haut fait 66 pixels') 
WHERE car_lot_identifiant = 498711; --1



SELECT * FROM iav.t_operation_ope WHERE ope_identifiant = 310574;
SELECT * FROM iav.t_lot_lot WHERE lot_identifiant = 498710;


WITH tropgrande AS (
SELECT *  FROM iav.tj_caracteristiquelot_car AS tcc 
JOIN iav.t_lot_lot ON car_lot_identifiant =lot_identifiant 
JOIN iav.t_operation_ope ON lot_ope_identifiant = ope_identifiant 
WHERE ope_dic_identifiant =5 AND lot_tax_code='2055'
AND car_valeur_quantitatif >700)
SELECT * FROM tropgrande


UPDATE iav.tj_caracteristiquelot_car SET 
(car_valeur_quantitatif, car_commentaires)= (505, 'Correction le poisson ne fait pas 110 pixel mais 70') 
WHERE car_lot_identifiant = 498322; --1