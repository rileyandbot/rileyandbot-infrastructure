resource "aws_route53_zone" "rileyandbot_www" {
  name = "${var.website_subdomain}.rileyandbot.com"
}

resource "aws_acm_certificate" "www_rileyandbot_com" {
  domain_name       = "${var.website_subdomain}.rileyandbot.com"
  validation_method = "DNS"
}

resource "aws_route53_record" "www_rileyandbot_com_acm_validation" {
  name    = "${aws_acm_certificate.www_rileyandbot_com.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.www_rileyandbot_com.domain_validation_options.0.resource_record_type}"
  zone_id = "${aws_route53_zone.rileyandbot_www.zone_id}"
  records = ["${aws_acm_certificate.www_rileyandbot_com.domain_validation_options.0.resource_record_value}"]
  ttl     = "60"
}

resource "aws_acm_certificate_validation" "www_rileyandbot_com" {
  certificate_arn = "${aws_acm_certificate.www_rileyandbot_com.arn}"
  validation_record_fqdns = [
    "${aws_route53_record.www_rileyandbot_com_acm_validation.fqdn}",
  ]
}
