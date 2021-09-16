name "production"
description "Production Servers"
cookbook_versions({
   'webserver' => '= 0.2.0'
})
default_attributes({
  'messages' => {
    'welcome' => 'Hello and Welcome to Chef. This is from the production environment.'
  }
})
