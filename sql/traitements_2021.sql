SET SEARCH_PATH TO iav;

SELECT * FROM t_periodefonctdispositif_per tpp WHERE per_dis_identifiant =1 AND per_date_debut >='2020-01-18'
AND per_date_debut <= '2020-03-17'

-- modification pour le mois de janvier
UPDATE t_periodefonctdispositif_per tpp SET (per_date_fin, per_etat_fonctionnement,per_tar_code)= ('2020-01-31 00:59:59', FALSE, 3) WHERE per_date_debut='2020-01-18 08:00:00.000';
-- insertion pour le mois de février
INSERT INTO t_periodefonctdispositif_per(
per_dis_identifiant,
per_date_debut,
per_date_fin,
per_commentaires,
per_etat_fonctionnement,
per_tar_code,
per_org_code)
VALUES (
1,
'2020-02-01 00:00:00',
'2020-02-29 23:59:59',
'insertion manuelle d''un arrêt de dispositif',
FALSE,
3,
'IAV');

-- insertion pour le mois de mars
INSERT INTO t_periodefonctdispositif_per(
per_dis_identifiant,
per_date_debut,
per_date_fin,
per_commentaires,
per_etat_fonctionnement,
per_tar_code,
per_org_code)
VALUES (
1,
'2020-03-01 00:00:00',
'2020-03-16 16:00:00',
'insertion manuelle d''un arrêt de dispositif',
FALSE,
3,
'IAV');
