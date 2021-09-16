name "application"
description "Apache Webserver with PHP"
run_list "recipe[git::default]", "recipe[webserver]"
