name "haystack"
description "Haystack"
default_attributes :active_applications => {"haystack" => {"env" => "production"}},
                   :applications => {
                     :haystack => {
                       :domains => ["haystack.com"],
                       :gems => ['fast_xs', 'xml-simple', 'right_aws', 'bcrypt-ruby', 'erubis', 'aws-s3'],
                       :packages => ["imagemagick"],
                       :syslog_send_to_host => ("192.168.2.138"),
                       :delayed_job => true,
                       :aws => {:aki => "AKIAJK4ZAYISOG7BFE7A",
                                :sak => "PRrjr0wxbS8R6ZHdyQAKMQ6b4ZBcKgRAssEDu3sg"
                       }
                     }
                   },
                   :rails => {:web_server => "nginx", :app_server => "unicorn"},
                   :sysctl => {
                     :settings => {
                       "net.ipv4.tcp_window_scaling" => "1"
                       }
                   },
                   :postfix => {:relay_host => "192.168.0.8:22001"}
                  
