class Plugins::CamaLanguageEditor::AdminController < CamaleonCms::Apps::PluginsAdminController
  include Plugins::CamaLanguageEditor::MainHelper
  breadcrumb_add('Translations Editor')
  def index
    # actions for admin panel
  end
end
