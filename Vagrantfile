# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # define default values
   default_chef_json = {
    :mysql =>  {
      :server_root_password => "iloverandompasswordsbutthiswilldo",
      :server_repl_password => "iloverandompasswordsbutthiswilldo",
      :server_debian_password => "iloverandompasswordsbutthiswilldo"
    },
    :postgresql => {
      :password => {
        :postgres => "iloverandompasswordsbutthiswilldo"
      }
    },
    :owncloud => {
      :config => {
        :dbpassword => "owncloud"
      },
      :admin => {
        :user => "admin",
        :pass => "admin"
      }
    }
  }

  # Use a debian wheezy box
  config.vm.box = "debian-70rc1"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vbox4210.box"

  # Enable berkshelf
  config.berkshelf.enabled = true

  # First vm
  config.vm.define "master_on_apache_with_sqlite" do |app|
    app.vm.network :private_network, :ip => "33.33.33.10"
    app.vm.hostname = "apache01.local"
    app.vm.provision :chef_solo do |chef|
      # define our setup
      chef.json = default_chef_json.merge( {} )

      # let the recipe do all the rest
      chef.add_recipe "owncloud-testing"
    end
  end

#   #============================================================================
#   # Github master (33.33.x.x)
#   #============================================================================
#   #----------------------------------------------------------------------------
#   # Apache boxes
#   #----------------------------------------------------------------------------
#   config.vm.define "master_on_apache_with_sqlite" do |app|
#     app.vm.network :hostonly, "33.33.33.10"
#     app.vm.host_name = "apache01.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {} )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "master_on_apache_with_mysql" do |app|
#     app.vm.network :hostonly, "33.33.33.11"
#     app.vm.host_name = "apache02.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :config => {
#             :dbtype => "mysql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "master_on_apache_with_postgresql" do |app|
#     app.vm.network :hostonly, "33.33.33.12"
#     app.vm.host_name = "apache03.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :config => {
#             :dbtype => "pgsql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   #----------------------------------------------------------------------------
#   # Lighttpd boxes
#   #----------------------------------------------------------------------------
#   config.vm.define "master_on_lighttpd_with_sqlite" do |app|
#     app.vm.network :hostonly, "33.33.34.10"
#     app.vm.host_name = "lighttpd01.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :webserver => "lighttpd"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "master_on_lighttpd_with_mysql" do |app|
#     app.vm.network :hostonly, "33.33.34.11"
#     app.vm.host_name = "lighttpd02.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :webserver => "lighttpd"
#           },
#           :config => {
#             :dbtype => "mysql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "master_on_lighttpd_with_postgresql" do |app|
#     app.vm.network :hostonly, "33.33.34.12"
#     app.vm.host_name = "lighttpd03.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :webserver => "lighttpd"
#           },
#           :config => {
#             :dbtype => "pgsql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   #----------------------------------------------------------------------------
#   # Nginx boxes
#   #----------------------------------------------------------------------------
#   config.vm.define "master_on_nginx_with_sqlite" do |app|
#     app.vm.network :hostonly, "33.33.35.10"
#     app.vm.host_name = "nginx01.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :webserver => "nginx"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "master_on_nginx_with_mysql" do |app|
#     app.vm.network :hostonly, "33.33.35.11"
#     app.vm.host_name = "nginx02.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :webserver => "nginx"
#           },
#           :config => {
#             :dbtype => "mysql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "master_on_nginx_with_postgresql" do |app|
#     app.vm.network :hostonly, "33.33.35.12"
#     app.vm.host_name = "nginx03.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :webserver => "nginx"
#           },
#           :config => {
#             :dbtype => "pgsql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   #============================================================================
#   # Github stable5 (33.34.x.x)
#   #============================================================================
#   # TBD
#
#   #============================================================================
#   # Github stable55 (33.35.x.x)
#   #============================================================================
#   # TBD
#
#   #============================================================================
#   # Local repositories (33.99.x.x)
#   #============================================================================
#   #----------------------------------------------------------------------------
#   # Apache boxes
#   #----------------------------------------------------------------------------
#   config.vm.define "local_on_apache_with_sqlite" do |app|
#     app.vm.network :hostonly, "33.99.33.10"
#     app.vm.host_name = "apache01.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :source => "local"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "local_on_apache_with_mysql" do |app|
#     app.vm.network :hostonly, "33.99.33.11"
#     app.vm.host_name = "apache02.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :source => "local"
#           },
#           :config => {
#             :dbtype => "mysql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "local_on_apache_with_postgresql" do |app|
#     app.vm.network :hostonly, "33.99.33.12"
#     app.vm.host_name = "apache03.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :source => "local"
#           },
#           :config => {
#             :dbtype => "pgsql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   #----------------------------------------------------------------------------
#   # Lighttpd boxes
#   #----------------------------------------------------------------------------
#   config.vm.define "local_on_lighttpd_with_sqlite" do |app|
#     app.vm.network :hostonly, "33.99.34.10"
#     app.vm.host_name = "lighttpd01.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :source => "local",
#             :webserver => "lighttpd"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "local_on_lighttpd_with_mysql" do |app|
#     app.vm.network :hostonly, "33.99.34.11"
#     app.vm.host_name = "lighttpd02.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :source => "local",
#             :webserver => "lighttpd"
#           },
#           :config => {
#             :dbtype => "mysql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "local_on_lighttpd_with_postgresql" do |app|
#     app.vm.network :hostonly, "33.99.34.12"
#     app.vm.host_name = "lighttpd03.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :source => "local",
#             :webserver => "lighttpd"
#           },
#           :config => {
#             :dbtype => "pgsql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   #----------------------------------------------------------------------------
#   # Nginx boxes
#   #----------------------------------------------------------------------------
#   config.vm.define "local_on_nginx_with_sqlite" do |app|
#     app.vm.network :hostonly, "33.99.35.10"
#     app.vm.host_name = "nginx01.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :source => "local",
#             :webserver => "nginx"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "local_on_nginx_with_mysql" do |app|
#     app.vm.network :hostonly, "33.99.35.11"
#     app.vm.host_name = "nginx02.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :source => "local",
#             :webserver => "nginx"
#           },
#           :config => {
#             :dbtype => "mysql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
#
#   config.vm.define "local_on_nginx_with_postgresql" do |app|
#     app.vm.network :hostonly, "33.99.35.12"
#     app.vm.host_name = "nginx03.local"
#     app.vm.provision :chef_solo do |chef|
#       # define our setup
#       chef.json = default_chef_json.merge( {
#         :owncloud => {
#           :setup => {
#             :source => "local",
#             :webserver => "nginx"
#           },
#           :config => {
#             :dbtype => "pgsql"
#           }
#         }
#       } )
#
#       # let the recipe do all the rest
#       chef.add_recipe "owncloud"
#     end
#   end
end