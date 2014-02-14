module ApplicationHelper

  def logo_for(video_format)
    if video_format == 'vhs'
      image_tag('VHS-logo.png', alt: 'VHS', class: 'vhs')
    elsif video_format =='8mm'
      "<span class='eight-mm'>8</span><span class='eight-mm eight-mm-small'>mm</span>"
    else
      video_format
    end
  end

end
