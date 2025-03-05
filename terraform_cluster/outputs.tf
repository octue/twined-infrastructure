output "service_registry_url" {
  value       = module.octue_twined_cluster.service_registry_url
  description = "The URL of the service registry."
}


output "services_topic_name" {
  value       = module.octue_twined_cluster.services_topic_name
  description = "The Pub/Sub topic that all Octue Twined service events are published to."
}
