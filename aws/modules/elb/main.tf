resource "aws_elb" "main" {
  name = "${var.env}-${var.name}-elb"
  subnets = ["${var.elb_subnets}"]
  security_groups = ["${var.elb_security_group}"]
  internal = false
  idle_timeout = "${var.elb_idle_timeout}"
  tags {
    Name =  "${var.env}-${var.name}-elb"
    Environment = "${var.env}"
  }
  lifecycle {
    create_before_destroy = true
  }

  health_check {
    interval = "${var.health_check_interval}"
    target = "${var.health_check_path}"
    healthy_threshold = "${var.health_check_h_threshold}"
    unhealthy_threshold = "${var.health_check_u_threshold}"
    timeout = "${var.health_check_timeout}"
  }

  listener {
    instance_port = "${var.elb_backend_port}"
    instance_protocol = "${upper(var.elb_backend_protocol)}"
    lb_port              = "${var.lb_http_port}"
    lb_protocol          = "${var.lb_http_protocol}"
  }

  listener {
    instance_port = "${var.elb_backend_port}"
    instance_protocol = "${upper(var.elb_backend_protocol)}"
    lb_port              = "${var.lb_https_port}"
    lb_protocol          = "${var.lb_https_protocol}"
    ssl_certificate_id = "${var.certificate_arn}"
  }
}

//resource "aws_lb_cookie_stickiness_policy" "main" {
//  name  = "${var.env}-${var.name}-elb-stickness-policy"
//  load_balancer = "${aws_elb.main.id}"
//  lb_port = 80
//  cookie_expiration_period = "${var.cookie_duration}"
//}
