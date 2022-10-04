# Grafana Agent Buildpack

This is yet another Heroku buildpack for
[Grafana Agent](https://github.com/grafana/agent) deployments alongside heroku web apps.

## Buildpack Usage

```sh
# Add the buildpack to your application
heroku buildpacks:add https://github.com/jmherbst/agent-buildpack.git --app <your app name>

# Confirm the agent buildpack is indexed before your runtime buildpack
» heroku buildpacks --app <your app name>
=== <app name> Buildpack URLs
1. https://github.com/jmherbst/agent-buildpack.git
2. heroku/nodejs
```
### Buildpack Config
Default Configuration Options
| ENV VAR       | Details |
| ------------- | ------------- |
| GRAFANA_AGENT_VERSION | Agent version to install. Default is `v0.28.0`. https://github.com/grafana/agent/releases |

### Grafana Agent Config
A basic config file is provided with this buildpack (`config/grafana-agent-config.yml`).
The provided config file is configurable with ENV vars that heroku exports at runtime.

Default Configuration Options
| ENV VAR       | Details |
| ------------- | ------------- |
| `GRAFANA_AGENT_DASHBOARD_METRICS_KEY` | Value for `metricsKey` http param |
| `GRAFANA_AGENT_ENV` | Environment value for `env` label |
| `GRAFANA_AGENT_SCRAPE_INTERVAL` | Default: 20s |
| `GRAFANA_AGENT_PROMETHEUS_REMOTE_WRITE_URL` | Prometheus remote_write url |
| `GRAFANA_AGENT_PROMETHEUS_REMOTE_WRITE_USERNAME` | Prometheus remote_write basic auth username |
| `GRAFANA_AGENT_PROMETHEUS_REMOTE_WRITE_PASSWORD` | Prometheus remote_write basic auth password |
| `GRAFANA_AGENT_LOG_LEVEL` | Grafana Agent's server log level. Default: debug|
| `HEROKU_APP_NAME` | Heroku provided value for `heroku_app_name` label |
| `HEROKU_APP_ID` | Heroku provided value for `heroku_app_id` label |
| `HEROKU_DYNO_ID` | Heroku provided value for `heroku_dyno_id` label |
| `PORT` | Heroku provided $PORT where localhost web dyno is serving metrics |


To override the default config file, your application can include a custom config file at `grafana-agent/config.yml`

The agent will substitute any env variables using `-config.expand-env` command line flag.  Please refer to the [grafana documentation](https://grafana.com/docs/agent/latest/configuration/#variable-substitution) for that feature.


---
## Buildpack Explanation

