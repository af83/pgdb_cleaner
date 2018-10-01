# Introduction

When many test databases are created in a mutualized PG server during CI tests (we use Jenkins here), and when they are not cleand-up after the tests are finished, this tool is regularly scheduled by our CI to cleanup garbage databases. In order to do that, created databases must follow a naming convention : `build_$(date +%Y%m%d%H%M)_anything_you_want`

# Usage :

`docker run --rm -e PGHOST=mypgserver.local -e PGUSER=myuser -e PGPASSWORD=imapassword pgdb_cleaner`

# Environment variables

`PGHOST`, `PGUSER`, `PGPORT`, `PGPASSWORD` : connection informations for PostgreSQL tools (`psql` and `pgdrop`)
`DRYRUN` : Do not perform ̀`pgdrop`, but simply list DBs eligible for deletion
`AGE` : number of seconds before Ruby's `Time.now` before which db name timestamps are eligible for deletion. Defaults to `7200`
