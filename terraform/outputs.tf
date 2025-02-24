output "event_store" {
  description = "The full ID of the BigQuery table acting as the Octue Twined services event store."
  value       = module.octue_twined_core.bigquery_events_table_id
}


output "storage_bucket_url" {
  description = "The `gs://` URL of the storage bucket used to store service inputs, outputs, and diagnostics."
  value = module.octue_twined_core.storage_bucket_url
}


output "service_registry_url" {
  description = "The URL of the service registry."
  value       = module.octue_twined_cluster.service_registry
}


output "services_topic" {
  description = "The Pub/Sub topic that all Octue Twined service events are published to."
  value       = module.octue_twined_cluster.services_topic
}
