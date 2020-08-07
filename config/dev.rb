##############################################################################################
# This configuration file overrides the configuration values based on the current environment
# this file is loaded when the environment variable PIPELINE_ENV is dev
##############################################################################################

##############################################################################################
# APPLICATION DEPLOYMENT
##############################################################################################

# What input variables should be passed to the :vpc sub-project?
#
#  - HCAP DevSecOps allows you to dynamically define the values of input variables,
#    based on any logic that you can define using Ruby.
set :vpc_vars do
#   ^^
#   By using a "do" "end" block, HCAP DevSecOps allows you to "lazily" declare the values of
#   input variables, so that they are not calculated until the exact time that they are needed.
  {
    # myvar: env!('MYVAR'),
    #                 ^^^
    #                 HCAP DevSecOps allows you to explicitly throw an error when a required
    #                 environment variable does not exist.
    environment: fetch(:pipeline_env),
    project: fetch(:application),
    prefix: "#{fetch(:pipeline_env)}-#{fetch(:application)}",
    expiration_date: (Time.now + 86_400 * 7).strftime('%Y-%m-%d')
    #                ^^^
    #                You can write expressions in ruby to dynamically calculate layer inputs,
    #                such as:  how many days before my deployed infrastructure expires?
  }
end

# Declare the HCAP Deploy deployment name for the application sub-project named :vpc
set :vpc_dep_name, 'development'

# Declare HCAP Deploy deployment configuration for the application sub-project named :vpc
#
#  - HCAP DevSecOps allows you to dynamically define the values of deployment configuration,
#    based on any logic that you can define using Ruby.
#  - HCAP DevSecOps allows you to "lazily" declare the values of deployment configuration,
#    so that they are not calculated until the exact time that they are needed.
set :vpc_deploy_config do
  {
    deployment_name: fetch(:vpc_dep_name),
    deployment_description: 'vpc - Development'
  }
end
# What input variables should be passed to the :db sub-project?
#
#  - HCAP DevSecOps allows you to dynamically define the values of input variables,
#    based on any logic that you can define using Ruby.
set :db_vars do
#   ^^
#   By using a "do" "end" block, HCAP DevSecOps allows you to "lazily" declare the values of
#   input variables, so that they are not calculated until the exact time that they are needed.
  {
    # myvar: env!('MYVAR'),
    #                 ^^^
    #                 HCAP DevSecOps allows you to explicitly throw an error when a required
    #                 environment variable does not exist.
    environment: fetch(:pipeline_env),
    project: fetch(:application),
    prefix: "#{fetch(:pipeline_env)}-#{fetch(:application)}",
    expiration_date: (Time.now + 86_400 * 7).strftime('%Y-%m-%d')
    #                ^^^
    #                You can write expressions in ruby to dynamically calculate layer inputs,
    #                such as:  how many days before my deployed infrastructure expires?
  }
end

# Declare the HCAP Deploy deployment name for the application sub-project named :db
set :db_dep_name, 'development'

# Declare HCAP Deploy deployment configuration for the application sub-project named :db
#
#  - HCAP DevSecOps allows you to dynamically define the values of deployment configuration,
#    based on any logic that you can define using Ruby.
#  - HCAP DevSecOps allows you to "lazily" declare the values of deployment configuration,
#    so that they are not calculated until the exact time that they are needed.
set :db_deploy_config do
  {
    deployment_name: fetch(:db_dep_name),
    deployment_description: 'db - Development'
  }
end
# What input variables should be passed to the :app sub-project?
#
#  - HCAP DevSecOps allows you to dynamically define the values of input variables,
#    based on any logic that you can define using Ruby.
set :app_vars do
#   ^^
#   By using a "do" "end" block, HCAP DevSecOps allows you to "lazily" declare the values of
#   input variables, so that they are not calculated until the exact time that they are needed.
  {
    # myvar: env!('MYVAR'),
    #                 ^^^
    #                 HCAP DevSecOps allows you to explicitly throw an error when a required
    #                 environment variable does not exist.
    environment: fetch(:pipeline_env),
    project: fetch(:application),
    prefix: "#{fetch(:pipeline_env)}-#{fetch(:application)}",
    expiration_date: (Time.now + 86_400 * 7).strftime('%Y-%m-%d')
    #                ^^^
    #                You can write expressions in ruby to dynamically calculate layer inputs,
    #                such as:  how many days before my deployed infrastructure expires?
  }
end

# Declare the HCAP Deploy deployment name for the application sub-project named :app
set :app_dep_name, 'development'

# Declare HCAP Deploy deployment configuration for the application sub-project named :app
#
#  - HCAP DevSecOps allows you to dynamically define the values of deployment configuration,
#    based on any logic that you can define using Ruby.
#  - HCAP DevSecOps allows you to "lazily" declare the values of deployment configuration,
#    so that they are not calculated until the exact time that they are needed.
set :app_deploy_config do
  {
    deployment_name: fetch(:app_dep_name),
    deployment_description: 'app - Development'
  }
end

##############################################################################################
# INFRASTRUCTURE VALIDATION
##############################################################################################

