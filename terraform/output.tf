output cluster_name {
  value = module.cluster.k8scluster.name
}

output cluster_resource_group {
  value = module.core.resource_group.name
}

output "acr_id"{
    value = module.acr.acr.id
}