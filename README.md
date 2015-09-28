USDA National Nutrition Database for Standard Reference
http://www.ars.usda.gov/services/docs.htm?docid=8964

Background:
Importer for USDA nutrient database into a MySQL database via the ASCII files provided.

The following command to generate schema.sql: `mdb-schema srXX.mdb mysql > schema.sql`. Feel free to edit schema.sql accordingly to your needs

This project used Erik Garrison's `USDA-SR22-importer` for inspiration: https://github.com/ekg/USDA-SR22-importer

Run:
`docker-compose up` after cloning

Output:
db_dump.sql to import into your MySQL server via `mysql -h[host] -P[port] -u[user] -p[root_password] [db_name] < db_dump.sql`

