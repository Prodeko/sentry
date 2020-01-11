# Sentry :bug::mag:

Sentry on virheidenhallintatyökalu. Sentrystä on olemassa avoin versio (https://github.com/getsentry/onpremise), josta tämä repo on forkattu. Lue alkuperäinen [readme](./readme_original.md). Alkuperäisestä projektista poiketen tämä repo on konfiguroitu käyttämään Azuren PostgreSQL palvelua.

---

## Konfigurointi

[.env](./.env) tiedosto sisältää muuttujia jotka on konfiguroitava ennen deploymenttiä.

```
COMPOSE_PROJECT_NAME=sentry_onpremise
SENTRY_EVENT_RETENTION_DAYS=365

# Custom configuration
DB_USER=sentry@prodeko-postgres
DB_PASSWORD=replace-this-in-prod
POSTGRESQL_SSL_CA=/path/to/BaltimoreCyberTrustRoot.crt.pem
```

## Käyttöönotto

1. Asenna Docker ja Docker Compose
2. Poista sentry/ kansion tiedostojen nimistä .example.
3. Hanki SSL-sertifikaatit. Sertifikaattien tulee olla host-koneen kansiossa /etc/nginx/certs.

```
$ ./install.sh
$ docker-compose up -d
$ docker-compose restart nginx (tarvittaessa)
```

Jos nginx service on päällä host-koneessa, nginx container ei pysty yhdistämään portteihin 80 tai 443. Tässä tapauksessa aja `systemctl disable nginx && systemctl stop nginx`
