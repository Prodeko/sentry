# Sentry :bug::mag:

Sentry on virheidenhallintatyökalu. Sentrystä on olemassa avoin versio (<https://github.com/getsentry/onpremise>), josta tämä repo on forkattu. Lue alkuperäinen [README](https://github.com/getsentry/onpremise/blob/master/README.md). Alkuperäisestä projektista poiketen tämä repo on konfiguroitu käyttämään Azuren PostgreSQL palvelua.

---

## Käyttöönotto

1. Aja infrastructure repossa [https://github.com/Prodeko/infrastructure/tree/master/ansible](https://github.com/Prodeko/infrastructure/tree/master/ansible) komento `ansible-playbook playbook.yml --extra-vars '@passwd.yml' --tags reinstall_sentry`.

## Upstream synkronointi

```
$ git fetch upstream
$ git merge upstream/master
# Fix possible merge conflicts
```
