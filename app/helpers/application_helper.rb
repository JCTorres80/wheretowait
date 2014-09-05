module ApplicationHelper

  def title(page_title, options={})
    content_for(:title, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end

  def sub_title(page_title, options={})
    content_for(:sub_title, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end

  def title_class(page_title, options={})
    content_for(:title_class, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end

  def header_class(page_title, options={})
    content_for(:header_class, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        'alert-success'
      when :error
        'alert-danger'
      when :alert
        'alert-warning'
      when :notice
        'alert-info'
      else
        flash_type.to_s
    end
  end

  def us_states
    [
        ['Alabama', 'al'],
        ['Alaska', 'ak'],
        ['Arizona', 'az'],
        ['Arkansas', 'ar'],
        ['California', 'ca'],
        ['Colorado', 'co'],
        ['Connecticut', 'ct'],
        ['Delaware', 'de'],
        ['District of Columbia', 'dc'],
        ['Florida', 'fl'],
        ['Georgia', 'ga'],
        ['Hawaii', 'hi'],
        ['Idaho', 'id'],
        ['Illinois', 'il'],
        ['Indiana', 'in'],
        ['Iowa', 'ia'],
        ['Kansas', 'ks'],
        ['Kentucky', 'ky'],
        ['Louisiana', 'la'],
        ['Maine', 'me'],
        ['Maryland', 'md'],
        ['Massachusetts', 'ma'],
        ['Michigan', 'mi'],
        ['Minnesota', 'mn'],
        ['Mississippi', 'ms'],
        ['Missouri', 'mo'],
        ['Montana', 'mt'],
        ['Nebraska', 'ne'],
        ['Nevada', 'nv'],
        ['New Hampshire', 'nh'],
        ['New Jersey', 'nj'],
        ['New Mexico', 'nm'],
        ['New York', 'ny'],
        ['North Carolina', 'nc'],
        ['North Dakota', 'nd'],
        ['Ohio', 'oh'],
        ['Oklahoma', 'ok'],
        ['Oregon', 'or'],
        ['Pennsylvania', 'pa'],
        ['Puerto Rico', 'pr'],
        ['Rhode Island', 'ri'],
        ['South Carolina', 'sc'],
        ['South Dakota', 'sd'],
        ['Tennessee', 'tn'],
        ['Texas', 'tx'],
        ['Utah', 'ut'],
        ['Vermont', 'vt'],
        ['Virginia', 'va'],
        ['Washington', 'wa'],
        ['West Virginia', 'wv'],
        ['Wisconsin', 'wi'],
        ['Wyoming', 'wy']
    ]
  end

end
