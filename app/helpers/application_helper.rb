
module ApplicationHelper

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-warning"
    end
  end

  def get_stylesheets
    @direction = (rtl?) ? 'rtl/' : ''
    stylesheets = [] unless stylesheets
    if controller_name == 'users' and action_name == 'dashboard'
      stylesheets << "#{@direction}_layouts/dashboard"
    elsif controller_name == 'users' and (action_name == 'login' or action_name == 'set_new_password' )
      stylesheets << "#{@direction}_layouts/login"
    else
      stylesheets << "#{@direction}application"
      stylesheets << "#{@direction}popup.css"
    end
    stylesheets << "#{@direction}_styles/ui.all.css"
    stylesheets << "#{@direction}modalbox"
    stylesheets << "#{@direction}autosuggest-menu.css"
    stylesheets << 'calendar'
    ["#{@direction}#{controller.controller_name}/#{action_name}"].each do |ss|
      stylesheets << ss
    end
    plugin_css_overrides = FedenaPlugin::CSS_OVERRIDES["#{controller_name}_#{action_name}"]
    stylesheets << plugin_css_overrides.collect{|p| "#{@direction}plugin_css/#{p}"}
    stylesheets.flatten
  end

  def get_forgotpw_stylesheets
    @direction = (rtl?) ? 'rtl/' : ''
    stylesheets = [] unless stylesheets
    stylesheets << @direction+"_layouts/forgotpw"
    stylesheets << @direction+"_styles/style"
  end

  def get_pdf_stylesheets
    @direction = (rtl?) ? 'rtl/' : ''
    stylesheets = [] unless stylesheets
    ["#{@direction}#{controller.controller_path}/#{controller.action_name}"].each do |ss|
      stylesheets << ss
    end
    plugin_css_overrides = FedenaPlugin::CSS_OVERRIDES["#{controller.controller_path}_#{controller.action_name}"]
    stylesheets << plugin_css_overrides.collect{|p| "#{@direction}plugin_css/#{p}"}
  end

  def observe_fields(fields, options)
    with = ""                          #prepare a value of the :with parameter
    for field in fields
      with += "'"
      with += "&" if field != fields.first
      with += field + "='+escape($('" + field + "').value)"
      with += " + " if field != fields.last
    end

    ret = "";      #generate a call of the observer_field helper for each field
    for field in fields
      ret += observe_field(field, options.merge( { :with => with }))
    end
    ret
  end

  def shorten_string(string, count)
    if string.length >= count
      shortened = string[0, count]
      splitted = shortened.split(/\s/)
      words = splitted.length
      splitted[0, words-1].join(" ") + ' ...'
    else
      string
    end
  end

  def currency
    Setting.find_by_config_key("CurrencyType").config_value
  end

  def pdf_image_tag(image, options = {})
    options[:src] = File.expand_path(RAILS_ROOT) + "/public/images"+ image
    tag(:img, options)
  end

  def available_language_options
    options = []
    AVAILABLE_LANGUAGES.each do |locale, language|
      options << [language, locale]
    end
    options.sort_by { |o| o[0] }
  end

  def rtl?
    @rtl ||= RTL_LANGUAGES.include? I18n.locale.to_sym
  end

  def main_menu
    Rails.cache.fetch("user_main_menu#{session[:user_id]}"){
      render :partial=>'layouts/main_menu'
    }
  end

  def current_school_detail
    SchoolDetail.first||SchoolDetail.new
  end

  def current_school_name
    Rails.cache.fetch("current_school_name#{session[:user_id]}"){
      Settings.get_config_value('InstitutionName')
    }
  end

  def generic_hook(cntrl,act)
    FedenaPlugin::ADDITIONAL_LINKS[:generic_hook].flatten.compact.each do |mod|
      if cntrl.to_s == mod[:source][:controller].to_s && act.to_s == mod[:source][:action].to_s
        if permitted_to? mod[:destination][:action].to_sym,mod[:destination][:controller].to_sym
          return link_to(mod[:title], :controller=>mod[:destination][:controller].to_sym,:action=>mod[:destination][:action].to_sym)
        end
      end
    end
    return ""
  end

  def generic_dashboard_hook(cntrl,act)
    dashboard_links = ""
    FedenaPlugin::ADDITIONAL_LINKS[:generic_hook].compact.flatten.each do |mod|
      if cntrl.to_s == mod[:source][:controller].to_s && act.to_s == mod[:source][:action].to_s
        if can_access_request? mod[:destination][:action].to_sym,mod[:destination][:controller].to_sym

          dashboard_links += <<-END_HTML
             <div class="link-box">
                <div class="link-heading">#{link_to t(mod[:title]), :controller=>mod[:destination][:controller].to_sym, :action=>mod[:destination][:action].to_sym}</div>
                <div class="link-descr">#{t(mod[:description])}</div>
             </div>
          END_HTML
        end
      end
    end
    return dashboard_links
  end

  def render_generic_hook
    hooks =  []
    FedenaPlugin::ADDITIONAL_LINKS[:generic_hook].compact.flatten.select{|h| h if (h[:source][:controller] == controller_name.to_s && h[:source][:action] == action_name.to_s)}.each do |hook|
      if can_access_request? hook[:destination][:action].to_sym,hook[:destination][:controller].to_sym
        h = Marshal.load(Marshal.dump(hook))
        h[:title] = t(hook[:title])
        h[:description] = t(hook[:description])
        hooks << h
      end
    end
    return hooks.to_json
  end

  def flash_message
    string = ''
    flash.each do |name, msg|
      string += content_tag :div, msg, class: "alert alert-info"
    end
    string
  end

  # This method generate link for back button.
  def back_button
    link_to image_tag("buttons/back.png", border: 0), 'javascript:void(0);', onclick: "history.back()"
  end

  # This method generate link for all select button
  def select_all(class_name)
    link_to t('all'), 'javascript:void(0);', onclick: "selectAll('#{class_name}')"
  end

  # This method generate link for de-select all
  def select_none(class_name)
    link_to t('none'), 'javascript:void(0);', onclick: "selectNone('#{class_name}')"
  end

end
