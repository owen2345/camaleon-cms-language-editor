module Plugins::CamaLanguageEditor::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  # here all actions on going to active
  # you can run sql commands like this:
  # results = ActiveRecord::Base.connection.execute(query);
  # plugin: plugin model
  def cama_language_editor_on_active(plugin)
  end

  # here all actions on going to inactive
  # plugin: plugin model
  def cama_language_editor_on_inactive(plugin)
  end

  # here all actions to upgrade for a new version
  # plugin: plugin model
  def cama_language_editor_on_upgrade(plugin)
  end

  def cama_language_plugin_options(args)
    args[:links] << link_to('Start Compare', admin_plugins_cama_language_editor_index_url)
  end

  def cama_language_render_item_yml(keys, parent_key = [], group1, group2)
    res1 = ''
    res2 = ''
    keys.uniq.each do |k|
      _parent_key = (parent_key + [k])
      a = instance_eval("group1['#{_parent_key.join("']['")}']") rescue nil
      b = instance_eval("group2['#{_parent_key.join("']['")}']") rescue nil
      _keys = []
      _keys += a.keys if a.is_a?(Hash)
      _keys += b.keys if b.is_a?(Hash)
      if _keys.present?
        r1, r2 = cama_language_render_item_yml(_keys, _parent_key, group1, group2)
        res1 << "<li class='list-group-item'>
                    <label>#{k}: </label>
                    <ul class='list-group'> #{r1} </ul>
                </li>"

        res2 << "<li class='list-group-item'>
                    <label>#{k}: </label>
                    <ul class='list-group'> #{r2} </ul>
                </li>"
      else
        res1 << "<li class='list-group-item'><div class='input-group'><span class='input-group-addon' style='text-align: left !important;'><b>#{k}: </b></span><input type='text' class='form-control' value='#{a}'></div></li>"
        res2 << "<li class='list-group-item'><div class='input-group'><span class='input-group-addon' style='text-align: left !important;'><b>#{k}: </b></span><input type='text' class='form-control' value='#{b}'></div></li>"
      end
    end
    [res1, res2]
  end
end
