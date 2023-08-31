create database esercizio_d6_m3_parte2;

use esercizio_d6_m3_parte2
-- STUDENTE(matricola_studente,nome_studente,anno_laurea,titolo_studio,voto_laurea)
/*
DIPARTIMENTO(codice_dipartimento,nome_dipartimento,settore_scientifico,numero_docenti)
CONCORSOMASTER(codice_master,codice_dipartimento,data_pubblicazione,data_scadenza,numero_posti_disponibili)
PARTECIPACONCORSOMASTER(codice_dipartimento,codice_master,matricola_studente,data_invio_domanda)
*/

select STUDENTE.nome_studente, STUDENTE.matricola_studente,DIPARTIMENTO.settore_scientifico
from STUDENTE,DIPARTIMENTO,PARTECIPACONCORSOMASTER
WHERE STUDENTE.matricola_studente=PARTECIPACONCORSOMASTER.matricola_studente AND DIPARTIMENTO.codice_dipartimento=PARTECIPACONCORSOMASTER.codice_dipartimento
group by STUDENTE.matricola_studente,STUDENTE.nome_studente
having count(PARTECIPACONCORSOMASTER.codice_master)>=3
order by STUDENTE.nome_studente;

select DIPARTIMENTO.nome_dipartimento,DIPARTIMENTO.settore_scientifico,count(CONCORSOMASTER.codice_master)
from DIPARTIMENTO
inner join CONCORSOMASTER ON DIPARTIMENTO.codice_dipartimento=CONCORSOMASTER.codice_dipartimento
WHERE DIPARTIMENTO.codice_dipartimento NOT IN (SELECT CONCORSOMASTER.codice_dipartimento
												from CONCORSOMASTER
												WHERE CONCORSOMASTER.numero_posti_disponibili<=7)
group by DIPARTIMENTO.nome_dipartimento,DIPARTIMENTO.settore_scientifico;

select STUDENTE.matricola_studente, STUDENTE.nome_studente
FROM STUDENTE
inner join PARTECIPACONCORSOMASTER on PARTECIPACONCORSOMASTER.matricola_studente=STUDENTE.matricola_studente
INNER JOIN CONCORSOMASTER ON CONCORSO.codice_master=PARTECIPACONCORSOMASTER.codice_master
WHERE STUDENTE.voto_laurea>100
GROUP BY STUDENTE.matricola_studente, STUDENTE.nome_studente
HAVING count(CONCORSOMASTER.codice_master)>=2 AND count(distinct CONCORSOMASTER.data_pubblicazione)<count(CONCORSOMASTER.codice_master);


                                                