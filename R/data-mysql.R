if( !is.element("RMySQL",rownames(installed.packages() ) ) ){
  install.packages("RMySQL")
}
library(DBI)
library(RMySQL)

## data from MySQL
metadata_sql <- function(netlab){
  
  con <- dbConnect(MySQL(),
                   user = 'ingreso',
                   password = '123ingreso321',
                   host = 'localhost',
                   dbname = 'seqcoviddb')
  
  
  query = paste0("SELECT NUMERACION_PLACA,NETLAB,OFICIO,CT,FECHA_TM,PROCEDENCIA,APELLIDO_NOMBRE,DNI_CE,VACUNADO,MOTIVO FROM `metadata` WHERE `NETLAB` ='",netlab,"' ;")

  dbSendQuery(con, "SET NAMES utf8mb4;")
  on.exit(dbDisconnect(con))
  rs = dbSendQuery(con, query);
  df = fetch(rs, -1);
  dbClearResult(rs)
  return(df)
}

metadataSendquery <- function(netlab, oficio){
  
  con <- dbConnect(MySQL(),
                   user = 'ingreso',
                   password = '123ingreso321',
                   host = 'localhost',
                   dbname = 'seqcoviddb')
  query = paste0("INSERT INTO `metadata` (`NETLAB`, `OFICIO`, `CT`, `CT2`, `FECHA_TM`, `REGION`, `PROCEDENCIA`, `PROVINCIA`, `DISTRITO`, `APELLIDO_NOMBRE`, `DNI_CE`, `EDAD`, `SEXO`, `VACUNADO`, `MARCA_PRIMERAS_DOSIS`, `1DOSIS`, `2DOSIS`, `MARCA_3DOSIS`, `3DOSIS`, `HOSPITALIZACION`, `MOTIVO`, `FALLECIDO`, `NUMERACION_PLACA`, `PLACA`, `CORRIDA`, `RECEPCIONADA`, `CODIGO`, `VERIFICADO`, `FECHA_INGRESO_BASE`) VALUES ('",
                 netlab,"','",oficio,"', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CURRENT_TIMESTAMP);")
  on.exit(dbDisconnect(con))
  rs = dbSendQuery(con, query);
  dbClearResult(rs)
}


metadaupdate <- function(oficio){
  
  con <- dbConnect(MySQL(),
                   user = 'ingreso',
                   password = '123ingreso321',
                   host = 'localhost',
                   dbname = 'seqcoviddb')
  query = paste0("SELECT NETLAB, OFICIO, CT, CT2, FECHA_TM, MOTIVO FROM `metadata`  WHERE `OFICIO` = '",oficio,"' ORDER BY `metadata`.`FECHA_INGRESO_BASE` ASC;")
  on.exit(dbDisconnect(con))
  rs = dbSendQuery(con, query);
  df = fetch(rs, -1);
  dbClearResult(rs)
  return(df)
}

delete_sql <- function(query){
  
  con <- dbConnect(MySQL(),
                   user = 'ingreso',
                   password = '123ingreso321',
                   host = 'localhost',
                   dbname = 'seqcoviddb')
  #query = paste0("SELECT NETLAB, OFICIO, CT, CT2, FECHA_TM, MOTIVO, CODIGO  FROM `metadata`  WHERE `OFICIO` = '",oficio,"' ORDER BY `metadata`.`FECHA_TM` DESC;")
  on.exit(dbDisconnect(con))
  rs = dbSendQuery(con, query);
  df = fetch(rs, -1);
  dbClearResult(rs)
  return(df)
}

library(utils)

update_sql <- function(sql_id, ct, ct2, fecha_tm,motivo){
  
  if(is.null(ct) | is.na(ct)){
    ct <- 'NULL'
  }
  
  if(is.null(ct2) | is.na(ct2)){
    ct2 <- 'NULL'
  }
  
  if( length(fecha_tm) == 0){
    fecha_tm <- 'NULL'
  }
  
  con <- dbConnect(MySQL(),
                   user = 'ingreso',
                   password = '123ingreso321',
                   host = 'localhost',
                   dbname = 'seqcoviddb')
  query <- paste0("UPDATE `metadata` SET `CT` = '",
                  ct,"', `CT2` = '",ct2,"', `FECHA_TM` = '",
                  fecha_tm,"', `MOTIVO` = '",motivo,
                  "' WHERE `metadata`.`NETLAB` = \'",sql_id,"\'")
  query <- gsub("'NULL'", "NULL", query, fixed = TRUE)
  on.exit(dbDisconnect(con))
  rs = dbSendQuery(con, query);
  df = fetch(rs, -1);
  dbClearResult(rs)
  return(df)
}

#DELETE FROM `metadata2` WHERE `metadata2`.`NETLAB` = \'AAA2\'"
#data <- metadata_sql(corrida = 1028, placa = 'placa1')
