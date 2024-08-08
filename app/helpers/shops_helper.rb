module ShopsHelper
  def label_for_cleanliness(value)
    case value
    when -3 then "ヴィンテージ"
    when -2 then "ややヴィンテージ"
    when -1 then "少しヴィンテージ"
    when 0 then "どちらとも言えない"
    when 1 then "少しピカピカ"
    when 2 then "ややピカピカ"
    when 3 then "ピカピカ"
    end
  end

  def label_for_lighting(value)
    case value
    when -3 then "暗い"
    when -2 then "やや暗い"
    when -1 then "少し暗い"
    when 0 then "どちらとも言えない"
    when 1 then "少し明るい"
    when 2 then "やや明るい"
    when 3 then "明るい"
    end
  end

  def label_for_music(value)
    case value
    when -3 then "クラシック"
    when -2 then "ややクラシック"
    when -1 then "少しクラシック"
    when 0 then "どちらとも言えない"
    when 1 then "少しモダン"
    when 2 then "ややモダン"
    when 3 then "モダン"
    end
  end

  def label_for_space(value)
    case value
    when -3 then "狭い"
    when -2 then "やや狭い"
    when -1 then "少し狭い"
    when 0 then "どちらとも言えない"
    when 1 then "少し広い"
    when 2 then "やや広い"
    when 3 then "広い"
    end
  end

  def label_for_vibrancy(value)
    case value
    when -3 then "しっとり"
    when -2 then "ややしっとり"
    when -1 then "少ししっとり"
    when 0 then "どちらとも言えない"
    when 1 then "少しワイワイ"
    when 2 then "ややワイワイ"
    when 3 then "ワイワイ"
    end
  end

  def label_for_order_speed(value)
    case value
    when -3 then "ゆったり"
    when -2 then "ややゆったり"
    when -1 then "少しゆったり"
    when 0 then "どちらとも言えない"
    when 1 then "少しテキパキ"
    when 2 then "ややテキパキ"
    when 3 then "テキパキ"
    end
  end

  def label_for_service_style(value)
    case value
    when -3 then "ジェントル"
    when -2 then "ややジェントル"
    when -1 then "少しジェントル"
    when 0 then "どちらとも言えない"
    when 1 then "少しフレンドリー"
    when 2 then "ややフレンドリー"
    when 3 then "フレンドリー"
    end
  end

  def label_for_conversation(value)
    case value
    when -3 then "寡黙"
    when -2 then "やや寡黙"
    when -1 then "少し寡黙"
    when 0 then "どちらとも言えない"
    when 1 then "少しおしゃべり"
    when 2 then "ややおしゃべり"
    when 3 then "おしゃべり"
    end
  end
end
