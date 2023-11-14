SET SEARCH_PATH TO iav;

SELECT * FROM t_periodefonctdispositif_per_temp t1 JOIN t_periodefonctdispositif_per_temp t2 ON 
(t1.per_date_debut, t1.per_date_fin) OVERLAPS (t2.per_date_debut,t2.per_date_fin)
WHERE t1.per_date_debut!=t2.per_date_debut; --0


SELECT * FROM t_periodefonctdispositif_per_temp t JOIN iav.t_periodefonctdispositif_per p ON 
(t.per_date_debut, t.per_date_fin) OVERLAPS (p.per_date_debut,p.per_date_fin)
WHERE p.per_dis_identifiant=1;


SELECT * FROM t_operation_ope JOIN t_lot_lot ON lot_ope_identifiant = ope_identifiant
JOIN iav.tj_caracteristiquelot_car ON car_lot_identifiant = lot_identifiant 
WHERE lot_tax_code = '2234'
AND car_valeur_quantitatif > 1000
-- 86 pixels zone2 proche
/*           zone5            zone1            zone2            zone3 
      -4.3827160       -8.7160494       -7.6327160       -8.5493827 
           zone4            zone6            zone7            zone8 
      -5.5493827       -5.3827160       -6.0493827       -4.5493827 
           zone9  profondeurmoyen profondeurproche taille_theorique 
      -5.7160494        3.9722222        7.6666667        0.1536008 
*/
SELECT (86+7.6327160-7.6666667)/0.1536008 = 560


SELECT * FROM t_operation_ope JOIN t_lot_lot ON lot_ope_identifiant = ope_identifiant
JOIN iav.tj_caracteristiquelot_car ON car_lot_identifiant = lot_identifiant 
WHERE lot_tax_code = '2234'
AND car_valeur_quantitatif > 1000
SELECT * FROM iav.tj_caracteristiquelot_car WHERE car_lot_identifiant = 428968;
UPDATE iav.tj_caracteristiquelot_car SET car_valeur_quantitatif = 560 WHERE car_lot_identifiant = 428968; --1


SELECT * FROM t_operation_ope JOIN t_lot_lot ON lot_ope_identifiant = ope_identifiant
JOIN iav.tj_caracteristiquelot_car ON car_lot_identifiant = lot_identifiant 
WHERE lot_tax_code = '2234'
AND car_valeur_quantitatif < 100

/*
428489   65  P  zone3 (65+8.5493827-7.6666667)/0.1536008 429
429051   64  P  zone3 (64+8.5493827-7.6666667)/0.1536008 422
429056   55  P  zone1 (55+8.7160494-7.6666667)/0.1536008 365
429060   95  P  zone2 (95-7.6327160-7.6666667)/0.1536008 519
431888   A virer
*/
UPDATE iav.tj_caracteristiquelot_car SET car_valeur_quantitatif = 429 WHERE car_lot_identifiant = 428489; 
UPDATE iav.tj_caracteristiquelot_car SET car_valeur_quantitatif = 422 WHERE car_lot_identifiant = 429051; 
UPDATE iav.tj_caracteristiquelot_car SET car_valeur_quantitatif = 365 WHERE car_lot_identifiant = 429056; 
UPDATE iav.tj_caracteristiquelot_car SET car_valeur_quantitatif = 519 WHERE car_lot_identifiant = 429060; 
DELETE FROM iav.tj_caracteristiquelot_car WHERE car_lot_identifiant = 431888;

SELECT * FROM t_operation_ope JOIN t_lot_lot ON lot_ope_identifiant = ope_identifiant
JOIN iav.tj_caracteristiquelot_car ON car_lot_identifiant = lot_identifiant 
WHERE lot_tax_code = '2234'
AND lot_commentaires ILIKE '%AZ22-50553%'


