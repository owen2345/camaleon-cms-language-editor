Rails.application.routes.draw do

    scope PluginRoutes.system_info["relative_url_root"] do
      #Admin Panel
      scope :admin, as: 'admin', path: PluginRoutes.system_info['admin_path_name'] do
        namespace 'plugins' do
          namespace 'cama_language_editor' do
            match 'index' => 'admin#index', via: [:get, :post]
          end
        end
      end

      # main routes
      #scope 'cama_language_editor', module: 'plugins/cama_language_editor/', as: 'cama_language_editor' do
      #  Here my routes for main routes
      #end
    end
  end
