# Sentry :bug::mag:

Sentry on virheidenhallintatyökalu, josta on olemassa open-source self-hosted versio (<https://github.com/getsentry/onpremise>), josta tämä repo on forkattu. Lue alkuperäinen [README](https://github.com/getsentry/onpremise/blob/master/README.md). Alkuperäisestä projektista poiketen tämä repo on konfiguroitu käyttämään Azuren PostgreSQL palvelua.

---

## Käyttöönotto

1. Aja infrastructure repossa [https://github.com/Prodeko/infrastructure/tree/master/ansible](https://github.com/Prodeko/infrastructure/tree/master/ansible) komento `ansible-playbook playbook.yml --extra-vars '@passwd.yml' --tags sentry`.

## Upstream synkronointi

```
$ git fetch upstream
$ git merge upstream/master
# Fix possible merge conflicts
```

Synkronoinnin jälkeen tarkista seuraavat asiat:

1. `postgres` ja `smtp` containerit on kommentoitu pois docker-compose.yml tiedostosta.
2. Tarkista, että docker-compose.yml redis container sisältää `container_name: "sentry_redis"` määrittelyn ja että [sentry/sentry.conf.example.py](sentry/sentry.conf.example.py) sisältää `"host": "sentry_redis"` määrittelyn SENTRY_OPTIONS["redis.clusters"] parametrissä.
   - Muissakin Prodekon palveluissa on käytetty redis-containeria ja näin varmistetaan että Sentry käyttää oikeaa konttia välimuistittamiseen.
