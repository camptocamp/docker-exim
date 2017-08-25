# Docker EXIM

This image provide an instance of exim designed only to send email directly to
internet or through a smarthost (smtp relay).

## Configuration

Following variables can be set to alter behaviour of exim:

  * `POSTMASTER`: Define email address of postmaster, it should be a valid email
    address. This var is mandatory.
  * `MAILNAME`: Hostname to use on SMTP HELO/EHLO command while connecting to
    remote SMTP servers. This var is mandatory.
  * `RELAY_HOST`: Hostname of external relay to use to send email through. (Optional)
  * `RELAY_PORT`: Port to use while connecting to relay host. (Optional, default: 25)
  * `RELAY_USERNAME`: Username used to authenticate on external relay host. (Optional)
  * `RELAY_PASSWORD`: Password used to authenticate on external relay host. (Optional)

For optional vars, you can :
  * only set `RELAY_HOST`
  * set `RELAY_HOST` and `RELAY_PORT`
  * set `RELAY_HOST`, `RELAY_PORT`, `RELAY_USERNAME` and `RELAY_PASSWORD`
  * set `RELAY_HOST`, `RELAY_USERNAME` and `RELAY_PASSWORD`

Any other combination should not work.
