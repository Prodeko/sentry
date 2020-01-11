# Sentry :bug::mag:

Sentry on virheidenhallintatyökalu. Sentrystä on olemassa avoin versio (https://github.com/getsentry/onpremise), josta tämä repo on forkattu. Lue alkuperäinen [readme](./readme_original.md). Alkuperäisestä projektista poiketen tämä repo on konfiguroitu käyttämään Azuren PostgreSQL palvelua.

---

## Käyttöönotto

1. Asenna Docker ja Docker Compose
2. Poista sentry/ kansion tiedostojen nimistä .example.
3. Hanki SSL-sertifikaatit. Sertifikaattien tulee olla host-koneen kansiossa /etc/nginx/certs.
4. Konfiguroi citext lisäosa Azuren Postgresiin. Kirjaudu ensin sisään psql avulla ja aja `\c sentry` ja `CREATE EXTENSION IF NOT EXISTS citext;`.
   - Ohjeet tietokantayhteyden muodostamiseen: https://github.com/Prodeko/infrastructure/tree/master/modules/db
   - Saatavilla olevat lisäosat: https://docs.microsoft.com/en-us/azure/postgresql/concepts-extensions
5. Aja `./install.sh`
6. Aja `docker-compose up -d`
7. Aja `docker-compose restart nginx` (tarvittaessa)

Jos nginx service on päällä host-koneessa, nginx container ei pysty yhdistämään portteihin 80 tai 443. Tässä tapauksessa aja `systemctl disable nginx && systemctl stop nginx`

Ajamalla `docker-compose down` containerit saa suljettua.
