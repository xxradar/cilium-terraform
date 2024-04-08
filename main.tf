resource "kind_cluster" "this" {
  name = "cilium-testing-terraform"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
      image = "kindest/node:v1.29.2"
    }

    node {
      role = "worker"
      image = "kindest/node:v1.29.2"
    }

    node {
      role = "worker"
      image = "kindest/node:v1.29.2"
    }



    networking {
      disable_default_cni = true
    }
  }
}

resource "cilium" "this" {
  set = [
    "ipam.mode=kubernetes",
    "operator.replicas=1",
    "tunnel=vxlan",
  ]
  version = "1.15.3"
}
