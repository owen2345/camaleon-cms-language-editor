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
    args[:links] << link_to('Access to Editor', admin_plugins_cama_language_editor_index_url)
  end

  def cama_language_render_item_translations(groups, base_key = nil, res = [], p_keys = [])
    res_html = groups.map{|g| "" }
    all_attrs = PluginRoutes.static_system_info['available_languages'].map{|_l| cama_language_get_hash_value(I18n.backend.send(:translations)[_l.to_sym], base_key.split(':') + p_keys) }
    all_attrs.map{|g| g.keys || [] }.flatten.uniq.sort_by{|k| groups.map{|_g| _g[k].is_a?(Hash) ? 1 : 0 }.reduce(&:+) }.each do |key|
      key_ori = key; key = 'no' if key === false; key = 'yes' if key === true
      key = key.to_s
      has_children = false
      _groups = []
      groups.each_with_index do |g, index|
        res[index] = {} if res[index].nil?
        _g = p_keys.present? ? cama_language_get_hash_value(res[index], p_keys.dup) : res[index]
        _g[key] = g[key.to_sym] || g[key_ori] || {}
        _groups[index] = _g[key]
      end

      all_attrs.each{|_g| has_children = true if _g[key.to_sym].is_a?(Hash) } # check if there exist any key with sub items

      if has_children
        cama_language_render_item_translations(_groups, base_key, res, p_keys + [key]).each_with_index do |html_g, index|
          res_html[index] << "<li data-class='#{(p_keys+[key]).join('_')}' class='branch #{(p_keys+[key]).join('_')}'> <i class='indicator glyphicon glyphicon-minus-sign'></i>
                                  <label>#{'&nbsp;' * (((p_keys.size+1)*2)-1)}#{key}: </label>
                                  <ul class='list-group'> #{html_g} </ul>
                              </li>"
        end
      else
        _groups.each_with_index do |g_val, index|
          res_html[index] << "<li><div class='input-group form-control'><span class='input-group-addon' style='text-align: left !important;'><b>#{'&nbsp;' * ((p_keys.size+1)*2)}#{key}: </b></span><input type='text' class='form-control' value='#{(g_val.is_a?(Hash) ? '' : g_val).gsub("'", "\\\'") }'></div></li>"
        end
      end
    end
    # res
    res_html
  end

  # return the value of a hash with a recursive keys
  # keys: (Array of keys) [:a, :b, :c]
  # g: Hash with all values from where get the value
  def cama_language_get_hash_value(g, keys)
    k = keys.shift
    g = g[k.to_sym]
    (keys.any? ? cama_language_get_hash_value(g || {}, keys) : g) || {}
  end

  def cama_language_get_hash_value2(g, keys)
    k = keys.shift
    (keys.any? ? cama_language_get_hash_value(g[k] || {}, keys) : g[keys]) || {}
  end
end
