#!perl -w
use strict;
# Authen::SASL needed

use Net::SMTP;
use utf8;

my $from = "niejieqiang\@qq.com";
my @to = "niejieqiang\@qq.com";

my $title = "你好,你在卓越的订单取消因为没发工资";
my $text = "你可以不副法律责因";

my $mail_host = "smtp.qq.com" ;
my $user = "niejieqiang";
my $pwd = "123456";

my $smtp = Net::SMTP->new(
	$mail_host,
	Timeout=> 120,
	Debug=>1,
)or die $!;

$smtp->auth($user,$pwd);

for my $mail_to (@to) {
	$smtp->mail($from);
	$smtp->to($mail_to);
	$smtp->data;
	$smtp->datasend("To:$mail_to\n");
	$smtp->datasend("From:$from\n");
	$smtp->datasend("Subject: $title\n");
	$smtp->datasend("\n");
	$smtp->datasend($text);
	$smtp->datasend("\n");
	$smtp->dataend;
}
$smtp->quit;

