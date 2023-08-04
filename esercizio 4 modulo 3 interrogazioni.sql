select città from aeroporto where numeropiste is null;
select tipoaereo from volo where cittàpartenza="Torino";
select cittàpartenza from volo where cittàarrivo="Bologna";
select cittàpartenza,cittàarrivo from volo where idvolo="AZ274";
select tipoaereo,giornosettimana,orapartenza from volo where cittàpartenza like "B%O%" and cittàarrivo like "%E%A";