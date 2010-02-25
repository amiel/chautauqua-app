module ApplicationsHelper
  def abilities_to_sentence application
    abilities = application.abilities.to_h.reject{|k,v| !v }
    
    if abilities[:other] and application.other_abilities?
      abilities[application.other_abilities] = true
    end
    
    truncate abilities.keys.collect(&:to_s).collect(&:humanize).to_sentence(:last_word_connector => ', ', :two_words_connector => ', ')
  end
end
