CMADMIN_DIR = Pathname.new(File.dirname(__FILE__))
require CMADMIN_DIR.join('lib', 'cm_admin.rb')

require_dependency CMADMIN_DIR.join('app', 'mailers', 'cm_admin', 'mailer').to_s


config.i18n.load_path += Dir[Pathname.new(File.dirname(__FILE__)).join('config', 'locales', '*.{rb,yml}')]
config.after_initialize {
  Less::More.source_path = Rails.root.join('**', 'app', 'stylesheets')
}


config.to_prepare do
  # ApplicationController.send :include, CMAdmin::AuthenticationHandling
  Spreadhead::PagesController.send :include, CMAdmin::Controller
  CMAdmin::Mailer.template_root = CMADMIN_DIR.join('app', 'views').to_s
end