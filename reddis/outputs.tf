output "test_redis_cache_name" {
  description = "Name of the test Redis Cache instance"
  value       = azurerm_redis_cache.test.name
}

output "test_redis_cache_host" {
  description = "Host name of the test Redis Cache instance"
  value       = azurerm_redis_cache.test.hostname
}

output "prod_redis_cache_name" {
  description = "Name of the production Redis Cache instance"
  value       = azurerm_redis_cache.prod.name
}

output "prod_redis_cache_host" {
  description = "Host name of the production Redis Cache instance"
  value       = azurerm_redis_cache.prod.hostname
}