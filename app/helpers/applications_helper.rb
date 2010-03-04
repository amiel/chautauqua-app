module ApplicationsHelper
  def abilities_to_sentence application
    abilities = application.abilities.to_h.reject{|k,v| !v }
    
    if abilities[:other] and application.other_abilities?
      abilities[application.other_abilities] = true
    end
    
    abilities.keys.collect(&:to_s).collect(&:humanize).to_sentence(:last_word_connector => ', ', :two_words_connector => ', ')
  end
  
  def formtastic_label(name)
    t(:"formtastic.labels.application.#{name}", :default => name.to_s.titleize)
  end
  
  def basic_attribute(name, options = {})
    attribute name, options do |name|
      v = h(@application.send(name))
      options[:simple_format] ? simple_format(v) : v
    end
  end
  
  def attribute(name, options = {})
    content_tag(:dt, formtastic_label(name), options[:dt]) +
    content_tag(:dd, yield(name), options[:dd])
  end
end
