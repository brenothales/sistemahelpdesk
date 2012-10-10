module MetaHelper
  def meta_title(showTitulo)
	content_for :titles do
		  content_tag(:title, showTitulo)
    end
  end
  def meta_description(showContent)
    content_for :headers do
    	content_tag(:meta, showContent, :name => 'description')
    end
  end

  def meta_keywords(showKeywords)
    content_for :headers do
      content_tag(:meta, showContent, :name => 'keywords')
    end
  end
end