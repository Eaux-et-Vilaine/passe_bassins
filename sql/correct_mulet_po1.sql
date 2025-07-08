-- VERIF
select sum(lot_effectif),extract('year' FROM ope_date_debut) AS year from iav.t_lot_lot
JOIN iav.t_operation_ope ON ope_identifiant = lot_ope_identifiant
where lot_tax_code='2031'
GROUP BY extract('year' FROM ope_date_debut);


-- A LANCER POUR MODIF IMPORT
update iav.t_lot_lot set lot_effectif = lot_effectif * 10 where lot_tax_code='2031';
update iav.t_lot_lot set lot_tax_code='2183' where lot_tax_code='2031';


select sum(lot_effectif),extract('year' FROM ope_date_debut) AS year from iav.t_lot_lot
JOIN iav.t_operation_ope ON ope_identifiant = lot_ope_identifiant
where lot_tax_code='2031'
GROUP BY extract('year' FROM ope_date_debut)



SELECT ope_commentaires,
 lot_commentaires FROM iav.t_operation_ope 
JOIN iav.t_lot_lot ON lot_ope_identifiant = ope_identifiant
WHERE ope_dic_identifiant = 5
AND lot_tax_code='2183'
AND extract('year' FROM ope_date_debut) = 2024

