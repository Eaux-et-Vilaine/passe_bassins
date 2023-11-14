-- connexion en localhost à la base test puis au serveur de production
--SET seach_path to iav,public,"ref" ;
SELECT * FROM iav.t_periodefonctdispositif_per tpp JOIN
iav.tg_dispositif_dis ON per_dis_identifiant = dis_identifiant
WHERE dis_identifiant=5

-- je mets à jour la dernière date
UPDATE iav.t_periodefonctdispositif_per tpp SET (per_date_fin, per_commentaires)=('2020-09-03 08:06:00', 'fonctionnement normal') WHERE 
per_date_fin='2020-07-20 00:00:00' AND per_dis_identifiant=5;
-- A FAIRE CONVERTIR FICHIER EN CSV SEPARATEUR ; csv UTF8 pose un problème d'encodage
-- LANCER UNE COMMANDE DANS LA CONSOLE (pour pouvoir écrire sur le serveur distant)
-- Connexion
psql -U postgres -h 185.135.126.250 bd_contmig_nat_iav
-- COPY avec psql permet d'écrire sur le serveur distant
 \copy iav.t_periodefonctdispositif_per (per_dis_identifiant,per_date_debut,per_date_fin,per_commentaires,per_etat_fonctionnement,per_tar_code,	per_org_code) FROM 'C:/temp/t_periode_fonc.csv' WITH DELIMITER AS ';' CSV
 -- Quitte
 \q 
 
 
 GRANT CONNECT ON DATABASE bd_contmig_nat TO iav;
 ALTER USER iav WITH PASSWORD 'iav'