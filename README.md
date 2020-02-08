# homebus-component-aggregate

This is a simple HomeBus component which aggregates data from multiple sources together. Sources may use the same or different schema.

## Usage

On its first run, `homebus-component-aggregate` needs to know how to find the HomeBus provisioning server.

```
bundle exec homebus-component-aggregatei -b homebus-server-IP-or-domain-name -P homebus-server-port
```

The port will usually be 80 (its default value).

Once it's provisioned it stores its provisioning information in `.env.provisioning`.

`homebus-component-aggregate` is configured via its `.env`  file:
- `UUIDS` - whitespace-separated list of UUIDS to aggregate

