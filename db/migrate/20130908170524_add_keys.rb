class AddKeys < ActiveRecord::Migration[4.2]
  def change
    # turn off Foreign Key checks
    if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
      ActiveRecord::Migration.execute "SET CONSTRAINTS ALL DEFERRED;"
    elsif ActiveRecord::Base.connection.adapter_name.downcase.starts_with? 'mysql'
      ActiveRecord::Migration.execute "SET FOREIGN_KEY_CHECKS=0;"
    end
    add_foreign_key "architectures_operatingsystems", "architectures", :name => "architectures_operatingsystems_architecture_id_fk"
    add_foreign_key "architectures_operatingsystems", "operatingsystems", :name => "architectures_operatingsystems_operatingsystem_id_fk"
    add_foreign_key "audits", "users", :name => "audits_user_id_fk"
    add_foreign_key "config_templates_operatingsystems", "config_templates", :name => "config_templates_operatingsystems_config_template_id_fk"
    add_foreign_key "config_templates_operatingsystems", "operatingsystems", :name => "config_templates_operatingsystems_operatingsystem_id_fk"
    add_foreign_key "config_templates", "template_kinds", :name => "config_templates_template_kind_id_fk"
    add_foreign_key "domains", "smart_proxies", :name => "domains_dns_id_fk", :column => "dns_id"
    add_foreign_key "environment_classes", "environments", :name => "environment_classes_environment_id_fk"
    add_foreign_key "environment_classes", "lookup_keys", :name => "environment_classes_lookup_key_id_fk"
    add_foreign_key "environment_classes", "puppetclasses", :name => "environment_classes_puppetclass_id_fk"
    add_foreign_key "fact_values", "fact_names", :name => "fact_values_fact_name_id_fk"
    add_foreign_key "fact_values", "hosts", :name => "fact_values_host_id_fk"
    add_foreign_key "features_smart_proxies", "features", :name => "features_smart_proxies_feature_id_fk"
    add_foreign_key "features_smart_proxies", "smart_proxies", :name => "features_smart_proxies_smart_proxy_id_fk"
    add_foreign_key "host_classes", "hosts", :name => "host_classes_host_id_fk"
    add_foreign_key "host_classes", "puppetclasses", :name => "host_classes_puppetclass_id_fk"
    add_foreign_key "hostgroup_classes", "hostgroups", :name => "hostgroup_classes_hostgroup_id_fk"
    add_foreign_key "hostgroup_classes", "puppetclasses", :name => "hostgroup_classes_puppetclass_id_fk"
    add_foreign_key "hostgroups", "architectures", :name => "hostgroups_architecture_id_fk"
    add_foreign_key "hostgroups", "domains", :name => "hostgroups_domain_id_fk"
    add_foreign_key "hostgroups", "environments", :name => "hostgroups_environment_id_fk"
    add_foreign_key "hostgroups", "media", :name => "hostgroups_medium_id_fk"
    add_foreign_key "hostgroups", "operatingsystems", :name => "hostgroups_operatingsystem_id_fk"
    add_foreign_key "hostgroups", "ptables", :name => "hostgroups_ptable_id_fk"
    add_foreign_key "hostgroups", "smart_proxies", :name => "hostgroups_puppet_ca_proxy_id_fk", :column => "puppet_ca_proxy_id"
    add_foreign_key "hostgroups", "smart_proxies", :name => "hostgroups_puppet_proxy_id_fk", :column => "puppet_proxy_id"
    add_foreign_key "hostgroups", "subnets", :name => "hostgroups_subnet_id_fk"
    add_foreign_key "hosts", "architectures", :name => "hosts_architecture_id_fk"
    add_foreign_key "hosts", "compute_resources", :name => "hosts_compute_resource_id_fk"
    add_foreign_key "hosts", "domains", :name => "hosts_domain_id_fk"
    add_foreign_key "hosts", "environments", :name => "hosts_environment_id_fk"
    add_foreign_key "hosts", "hostgroups", :name => "hosts_hostgroup_id_fk"
    add_foreign_key "hosts", "images", :name => "hosts_image_id_fk"
    add_foreign_key "hosts", "media", :name => "hosts_medium_id_fk"
    add_foreign_key "hosts", "models", :name => "hosts_model_id_fk"
    add_foreign_key "hosts", "operatingsystems", :name => "hosts_operatingsystem_id_fk"
    add_foreign_key "hosts", "ptables", :name => "hosts_ptable_id_fk"
    add_foreign_key "hosts", "smart_proxies", :name => "hosts_puppet_ca_proxy_id_fk", :column => "puppet_ca_proxy_id"
    add_foreign_key "hosts", "smart_proxies", :name => "hosts_puppet_proxy_id_fk", :column => "puppet_proxy_id"
    add_foreign_key "hosts", "subnets", :name => "hosts_subnet_id_fk"
    add_foreign_key "hosts", "taxonomies", :name => "hosts_location_id_fk", :column => "location_id"
    add_foreign_key "hosts", "taxonomies", :name => "hosts_organization_id_fk", :column => "organization_id"
    add_foreign_key "images", "architectures", :name => "images_architecture_id_fk"
    add_foreign_key "images", "compute_resources", :name => "images_compute_resource_id_fk"
    add_foreign_key "images", "operatingsystems", :name => "images_operatingsystem_id_fk"
    add_foreign_key "key_pairs", "compute_resources", :name => "key_pairs_compute_resource_id_fk"
    add_foreign_key "lookup_keys", "puppetclasses", :name => "lookup_keys_puppetclass_id_fk"
    add_foreign_key "lookup_values", "lookup_keys", :name => "lookup_values_lookup_key_id_fk"
    add_foreign_key "media_operatingsystems", "media", :name => "media_operatingsystems_medium_id_fk"
    add_foreign_key "media_operatingsystems", "operatingsystems", :name => "media_operatingsystems_operatingsystem_id_fk"
    add_foreign_key "nics", "domains", :name => "nics_domain_id_fk"
    add_foreign_key "nics", "hosts", :name => "nics_host_id_fk"
    add_foreign_key "nics", "subnets", :name => "nics_subnet_id_fk"
    add_foreign_key "operatingsystems_ptables", "operatingsystems", :name => "operatingsystems_ptables_operatingsystem_id_fk"
    add_foreign_key "operatingsystems_ptables", "ptables", :name => "operatingsystems_ptables_ptable_id_fk"
    add_foreign_key "operatingsystems_puppetclasses", "operatingsystems", :name => "operatingsystems_puppetclasses_operatingsystem_id_fk"
    add_foreign_key "operatingsystems_puppetclasses", "puppetclasses", :name => "operatingsystems_puppetclasses_puppetclass_id_fk"
    add_foreign_key "os_default_templates", "config_templates", :name => "os_default_templates_config_template_id_fk"
    add_foreign_key "os_default_templates", "operatingsystems", :name => "os_default_templates_operatingsystem_id_fk"
    add_foreign_key "os_default_templates", "template_kinds", :name => "os_default_templates_template_kind_id_fk"
    add_foreign_key "reports", "hosts", :name => "reports_host_id_fk"
    add_foreign_key "subnet_domains", "domains", :name => "subnet_domains_domain_id_fk"
    add_foreign_key "subnet_domains", "subnets", :name => "subnet_domains_subnet_id_fk"
    add_foreign_key "subnets", "smart_proxies", :name => "subnets_dhcp_id_fk", :column => "dhcp_id"
    add_foreign_key "subnets", "smart_proxies", :name => "subnets_dns_id_fk", :column => "dns_id"
    add_foreign_key "subnets", "smart_proxies", :name => "subnets_tftp_id_fk", :column => "tftp_id"
    add_foreign_key "taxable_taxonomies", "taxonomies", :name => "taxable_taxonomies_taxonomy_id_fk"
    add_foreign_key "template_combinations", "config_templates", :name => "template_combinations_config_template_id_fk"
    add_foreign_key "template_combinations", "environments", :name => "template_combinations_environment_id_fk"
    add_foreign_key "template_combinations", "hostgroups", :name => "template_combinations_hostgroup_id_fk"
    add_foreign_key "tokens", "hosts", :name => "tokens_host_id_fk"
    add_foreign_key "trend_counters", "trends", :name => "trend_counters_trend_id_fk"
    add_foreign_key "user_compute_resources", "compute_resources", :name => "user_compute_resources_compute_resource_id_fk"
    add_foreign_key "user_compute_resources", "users", :name => "user_compute_resources_user_id_fk"
    add_foreign_key "user_domains", "domains", :name => "user_domains_domain_id_fk"
    add_foreign_key "user_domains", "users", :name => "user_domains_user_id_fk"
    add_foreign_key "user_facts", "fact_names", :name => "user_facts_fact_name_id_fk"
    add_foreign_key "user_facts", "users", :name => "user_facts_user_id_fk"
    add_foreign_key "user_hostgroups", "hostgroups", :name => "user_hostgroups_hostgroup_id_fk"
    add_foreign_key "user_hostgroups", "users", :name => "user_hostgroups_user_id_fk"
    add_foreign_key "user_notices", "notices", :name => "user_notices_notice_id_fk"
    add_foreign_key "user_notices", "users", :name => "user_notices_user_id_fk"
    add_foreign_key "user_roles", "roles", :name => "user_roles_role_id_fk"
    add_foreign_key "user_roles", "users", :name => "user_roles_user_id_fk"
    add_foreign_key "usergroup_members", "usergroups", :name => "usergroup_members_usergroup_id_fk"
    add_foreign_key "users", "auth_sources", :name => "users_auth_source_id_fk"
    # turn on Foreign Key checks in MySQL only
    if ActiveRecord::Base.connection.adapter_name.downcase.starts_with? 'mysql'
      ActiveRecord::Migration.execute "SET FOREIGN_KEY_CHECKS=1;"
    end
  end
end
