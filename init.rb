require 'redmine'

Redmine::Plugin.register :redmine_dashboard do
  name 'Redmine Dashboard plugin'
  author 'Jan Graichen'
  description 'Add an issue dashboard to Redmine'
  version '1.2.1'
  url 'https://github.com/jgraichen/redmine_dashboard'
  author_url 'mailto:jg@altimos.de'

  project_module :dashboard do
    permission :view_dashboard, { :dashboard => [:index, :update] }
  end
  menu :project_menu, :dashboard, { :controller => 'dashboard', :action => 'index' }

end
