resource "cloudflare_record" "sites" {
  for_each = {
    for site in var.dns_records : site.name => site
  }
  zone_id         = each.value.zone_id
  name            = each.value.name
  value           = each.value.value
  type            = each.value.type
  ttl             = each.value.ttl
  proxied         = each.value.proxied
  allow_overwrite = each.value.allow_overwrite
}
