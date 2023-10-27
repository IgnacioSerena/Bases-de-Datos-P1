# Version 1.0
# Por lo general no se requiere modificar el fichero

export PGDATABASE:=flight
export PGUSER :=alumnodb
export PGPASSWORD :=alumnodb
export PGCLIENTENCODING:=UTF8
export PGHOST:=localhost

DBNAME =$(PGDATABASE)
PSQL = psql
CREATEDB = createdb
DROPDB = dropdb --if-exists
PG_DUMP = pg_dump
PG_RESTORE = pg_restore

all: dropdb createdb restore shell
mycomando:
	@echo aqui va una descripcion
	@cat myfichero.sql | psql mibasededatos
createdb:
	@echo Creando BBDD
	@$(CREATEDB)
dropdb:
	@echo Eliminando BBDD
	@$(DROPDB) $(DBNAME)
	rm -f *.log
dump:
	@echo creando dumpfile
	@$(PG_DUMP) > $(DBNAME).sql
restore:
	@echo restore data base
	@cat $(DBNAME).sql | $(PSQL)  
psql: shell
shell:
	@echo create psql shell
	@$(PSQL)  

allqueries: query1 query2 query3 query4 query5 query6
	@cat query?.log > all_queries.log

query1:
	@echo query-1: "Ejecución query 1. Mostrando el código de los aeropuertos y sus números de reserva totales" | tee query1.log
	@cat query1.sql | $(PSQL) | tee -a query1.log
query2:
	@echo query-2: "Ejecución query 2. Mostrando el book_ref con sus correscodientes total_amount y calculated_amount" | tee query2.log
	@cat query2.sql | $(PSQL) | tee -a query2.log
query3:
	@echo query3: "Ejecución query 3. Mostrando el código del auropuerto y su correspondiente número de pasajeros" | tee query3.log
	@cat query3.sql | $(PSQL) | tee -a query3.log
query4:
	@echo query4: "Ejecución query 4. Mostrando los flight_id y sus correspondientes sitios vacios" | tee query4.log
	@cat query4.sql | $(PSQL) | tee -a query4.log
query5:
	@echo query5: "Ejecución query 5. Mostrando book_ref y flight_id con boarding_no nulos" | tee query5.log
	@cat query5.sql | $(PSQL) | tee -a query5.log
query6:
	@echo query6: "Ejecución query 6. Mostrando tabla con flight_no y su retraso promedio" | tee query6.log
	@cat query6.sql | $(PSQL) | tee -a query6.log

