system_users = search("users", "platform:#{node['platform']}")

system_users.each do |user_data|
  user user_data['id'] do
    comment user_data['comment']
    action :create
  end
end
