name "highrise"
description "Highrise production"
recipes "nfs::client"
default_attributes  :active_applications =>  {"highrise" =>  {"env" =>  "production"}},
                    :applications => {
                      :highrise => {
                        :nfs_mounts => {
                        "/u/nfs/file1/depot"  =>  {"device" => "172.28.1.66:/u/depot",  "owner"  => "app"},
                        "/u/nfs/file2/depot"  =>  {"device" => "172.28.1.67:/u/depot",  "owner"  => "app"},
                        "/u/nfs/file3/depot"  =>  {"device" => "172.28.1.70:/u/depot",  "owner"  => "app"},
                        "/u/nfs/netapp/depot" =>  {"device" => "172.28.2.6:/vol/depot", "owner" => "app"}},
                        :syslog_files => {:haproxy => true},
                        :gems => ['fast_xs','hpricot'],
                        :packages => ['imagemagick', 'zip'],
                        :symlinks => {
                        '/usr/local/bin/convert' => '/usr/bin/convert',
                        '/usr/local/bin/identify' => '/usr/bin/identify',
                        '/usr/local/bin/composite' => '/usr/bin/composite',
                        '/usr/local/bin/zip' => '/usr/bin/zip',
                        '/u/depot' => '/u/nfs/file1/depot',
                        '/u/apps/highrise/shared/data' => "/u/depot/highrise",
                        '/usr/local/bin/iconv' => '/usr/bin/iconv'},
                        :apache_modules => ["auth_token", "xsendfile", "rewrite"]
                      }
                    }
                    