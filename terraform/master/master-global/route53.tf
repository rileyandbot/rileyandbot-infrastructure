resource "aws_route53_zone" "rileyandbot_root" {
  name = "rileyandbot.com"
}

# for delegations, route53 subdomain zones must be created first, then their
# NS records set here as delegations off the root

# delegate www-dev subdomain to the root zone
resource "aws_route53_record" "delegate_ns_rileyandbot_www_dev" {
  zone_id = "${aws_route53_zone.rileyandbot_root.id}"
  name    = "www-dev.rileyandbot.com"
  type    = "NS"
  ttl     = "600"

  records = [
    "ns-1052.awsdns-03.org",
    "ns-2010.awsdns-59.co.uk",
    "ns-82.awsdns-10.com",
    "ns-921.awsdns-51.net",
  ]
}

# delegate www (prod) subdomain to the root zone
resource "aws_route53_record" "delegate_ns_rileyandbot_www_prod" {
  zone_id = "${aws_route53_zone.rileyandbot_root.id}"
  name    = "www.rileyandbot.com"
  type    = "NS"
  ttl     = "600"

  records = [
    "ns-627.awsdns-14.net",
    "ns-70.awsdns-08.com",
    "ns-1524.awsdns-62.org",
    "ns-1666.awsdns-16.co.uk",
  ]
}
