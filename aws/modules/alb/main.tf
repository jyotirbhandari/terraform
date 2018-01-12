resource "aws_alb" "main" {
  name = "${var.env}-${var.name}-alb"
  subnets = ["${var.alb_subnets}"]
  security_groups = ["${var.alb_security_group}"]
  internal = false
  tags {
    Name =  "${var.env}-${var.name}-alb"
    Environment = "${var.env}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_alb_target_group" "main" {
  name = "${var.env}-${var.name}-alb-tg"
  port = "${var.alb_backend_port}"
  protocol = "${upper(var.alb_backend_protocol)}"
  vpc_id = "${var.vpc_id}"

  health_check {
    interval = "${var.health_check_interval}"
    path = "${var.health_check_path}"
    port = "traffic-port"
    healthy_threshold = "${var.health_check_h_threshold}"
    unhealthy_threshold = "${var.health_check_u_threshold}"
    timeout = "${var.health_check_timeout}"
    protocol = "${upper(var.alb_backend_protocol)}"
  }
  stickiness {
    type  = "lb_cookie"
    cookie_duration = "${var.cookie_duration}"
    enabled = "${var.cookie_duration == 1 ? false : true}"
  }
  tags {
    Name =  "${var.env}-${var.name}-alb-tg"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_alb_listener" "front_end_http" {
  load_balancer_arn = "${aws_alb.main.arn}"
  port              = "${var.lb_http_port}"
  protocol          = "${var.lb_http_protocol}"

  default_action {
    target_group_arn = "${aws_alb_target_group.main.id}"
    type             = "forward"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_alb_listener" "front_end_https" {
  load_balancer_arn = "${aws_alb.main.arn}"
  //port              = "443"
  //protocol          = "HTTPS"
  port              = "${var.lb_https_port}"
  protocol          = "${var.lb_https_protocol}"
  certificate_arn   = "${var.certificate_arn}"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    target_group_arn = "${aws_alb_target_group.main.id}"
    type             = "forward"
  }
  lifecycle {
    create_before_destroy = true
  }
}
