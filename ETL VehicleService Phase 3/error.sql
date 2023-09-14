/****** Script de la commande SelectTopNRows à partir de SSMS  ******/



  /*** RECHERCHE DES ERREURS 
  Msg 8114, Niveau 16, État 5, Ligne 52
Erreur de conversion du type de données varchar en float.
  ***/

  Select *
  FROM [DSTRAINING].[dbo].[Raw_VehicleService]
  WHERE ISNUMERIC([2014]) = 0 --pas numerique
  AND [2014] <> '' --non vide
  --pas erreur pour  [2014]

  Select *
  FROM [DSTRAINING].[dbo].[Raw_VehicleService]
  WHERE ISNUMERIC([2015]) = 0 --pas numerique
  AND [2015] <> ''
  --error: 1 rows 