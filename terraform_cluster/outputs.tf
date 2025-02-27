output "service_registry_url" {
  description = "The URL of the service registry."
  value       = module.octue_twined_cluster.service_registry
}


output "services_topic" {
  description = "The Pub/Sub topic that all Octue Twined service events are published to."
  value       = module.octue_twined_cluster.services_topic
}
