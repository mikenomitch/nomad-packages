## Dynamic Application Sizing

This sets up a demo of dynamic application sizing.

## Dependencies

- Nomad Enterprise binary being used

- Telemetry set up on all the nodes

```
telemetry {
  publish_allocation_metrics = true
  publish_node_metrics       = true
  prometheus_metrics         = true
}
```

- Priviledged docker setup with volumes enabled

```
plugin "docker" {
  config {
    allow_privileged = true

    volumes {
      enabled = true
    }
  }
}
```

- A host volume in the client config

```
client {
  enabled = true
  host_volume "grafana" {
    path = "/var/lib/grafana"
    read_only = false
  }
}
```

Note: if the dir isn't there on the client, make it like so before launching the Nomad Agent

```
sudo mkdir -p /var/lib/grafana
sudo chmod -R a+rwX /var/lib/grafana
```

Except don't `chmod -R a+rwX` cause that is bad.
