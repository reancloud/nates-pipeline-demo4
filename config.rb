##############################################################################################
# GENERAL CONFIGURATION
##############################################################################################

# A machine-readable name for your project.
#  - HCAP DevSecOps is able to derive other default settings from your project's name.
set :application, "nates-pipeline-demo4"

# The project's application type
#  - HCAP DevSecOps will be changing type :bootstrap to another name in a future release.
set :application_type, :bootstrap

# Opt out of externalized configuration.
#  - HCAP DevSecOps supports a separate config repo to avoid the need for customer forks.
#  - A future version of HCAP DevSecOps will likely convert this feature to "opt in" only.
set :external_config_type, :none

# Specify the primary cloud provider being used.
#  - HCAP DevSecOps is able to configure various default capabilities based on this setting,
#    such as Terraform remote state.
set :cloud_provider, "aws"


##############################################################################################
# APPLICATION DEPLOYMENT
##############################################################################################

# *UNNEEDED:* Declare that you are using HCAP Deploy as the application deployment tool.
#  - HCAP DevSecOps defaults to using HCAP Deploy as a deployment tool.
#  - HCAP DevSecOps also supports "per sub-project" deployment tool selection.
set :app_deploy_tool, :reandeploy

# A list of machine-readable sub-project names.  Each one represents an application
# sub-project to be deployed, regardless of the deployment tool being used.
#  - HCAP DevSecOps is able to derive many other default settings from a sub-project name.
#  - When you select Terraform as your deployment tool, the default sub-project directory
#    will be `terraform/MY-SUBPROJECT-NAME`.
set :app_envs, [:vpc, :db, :app]

# Define the HCAP Deploy environment ID for the application sub-project named :vpc
#  - HCAP DevSecOps will automatically refer to this variable when deploying the sub-project
set :vpc_reandeploy_id, :18878
# Define the HCAP Deploy environment ID for the application sub-project named :db
#  - HCAP DevSecOps will automatically refer to this variable when deploying the sub-project
set :db_reandeploy_id, :18879
# Define the HCAP Deploy environment ID for the application sub-project named :app
#  - HCAP DevSecOps will automatically refer to this variable when deploying the sub-project
set :app_reandeploy_id, :18880

##############################################################################################
# INFRASTRUCTURE VALIDATION
##############################################################################################

# Opt in to using HCAP Test as the infrastructure validation tool.
#  - HCAP DevSecOps also supports "per sub-project" validation tool selection,
#    such as `set :NAME_infra_test_tool, :reantest`.
set :infra_test_tool, :none

# NOTE: Because you usually want different infrastructure per environment, the HCAP Test
# infrastructure test variables are defined in environment specific configuration files:
#  - config/dev.rb
#  - config/prod.rb


##############################################################################################
# SERVER VALIDATION
##############################################################################################

# Specify which server testing tool to use.
set :server_test_tool, :none



##############################################################################################
# APPLICATION TESTING
##############################################################################################

# HCAP Test browser tests to be run, applied on top of default options.

# What websites should be tested by HCAP Test?
#  - HCAP DevSecOps supports a simple syntax for declaring websites to be tested by HCAP Test.
#  - HCAP DevSecOps will default to running all declared functional tests and load tests against
#    all declared websites, unless you specifically declare which tests to run against which websites.
website :mysite, protocol: :https, host: "www.example.com", path: ""

# A list of HCAP Test functional tests to be run, with a minimal number of options required.
#  - HCAP DevSecOps automatically applies default test execution options to each test in the list below,
#    unless you specifically provide an alternative value.
#  - HCAP DevSecOps automatically loads Git credentials from the GIT_USER and GIT_PASS environment
#    variables, unless you specifically provide alternative values.
set :functional_tests, [
  {
    command_to_run_test: "mvn test -Dcucumber.options=\"--tags @app_test\"",
    git_repository_url: "",
    chrome: "79",
    firefox: "75"
  }
]

# A list of HCAP Test load tests to be run, with a minimal number of options required.
#  - HCAP DevSecOps automatically applies default test execution options to each test in the list below,
#    unless you specifically provide an alternative value.
#  - HCAP DevSecOps automatically loads Git credentials from the GIT_USER and GIT_PASS environment
#    variables, unless you specifically provide alternative values.
set :load_tests, [
  {
    command_to_run_test: "mvn test -Dcucumber.options=\"--tags @app_test\"",
    git_repository_url: "",
    chrome: "79",
    firefox: "75"
  }
]

# A list of HCAP Test security tests to be run, with a minimal number of options required.
#  - HCAP DevSecOps automatically applies default test execution options to each test in the list below,
#    unless you specifically provide an alternative value.
set :security_tests, [
  {
    username_field_xpath: "//input[@id='login']",
    password_field_xpath: "//input[@id='password']",
    submit_button_xpath: "//input[@id='submit']"
  }
]

##############################################################################################
# SMOKE TESTING
##############################################################################################

# Specify an URL testing tool.
#  - HCAP DevSecOps also supports "per website" URL test tool selection,
#    such as `set :WEBSITE_infra_test_tool, :reantest`.
set :url_test_tool, :none

# A list of URL tests to be run, with a minimal number of options required.
#  - HCAP DevSecOps automatically applies default test execution options to each test in the list below,
#    unless you specifically provide an alternative value.
#  - By default, HCAP DevSecOps will run each URL test against every website that you have declared
#    in your configuration.  Optionally, you can specify exactly which sites a test should run against
#    by specifying a sites: option, with an array of site names.
#
set :url_tests, [
  { url: "/logout" },
]
