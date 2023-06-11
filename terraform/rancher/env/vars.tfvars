rancher_url = "https://basil.blahaj.sh"

rancher_clusters = [
    {
        name = "personal"
        fleet_namespace = "fleet-default"

        kubernetes_version = "v1.25.9+k3s1"
    },
    {
        name = "public"
        fleet_namespace = "fleet-default"

        kubernetes_version = "v1.25.9+k3s1"
    },
    {
        name = "qc"
        fleet_namespace = "fleet-default"

        kubernetes_version = "v1.25.9+k3s1"
    },
]
