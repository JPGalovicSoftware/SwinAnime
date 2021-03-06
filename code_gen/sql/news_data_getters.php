<?php
	// SQL getters for News & Newsletter Data, Version 1.0.2, FEB18, JPGalovic

	// Gets all details for all articles in a newsletter from a given date
	// $newsletter_date, datetime of newsletter.
	// $news_article_type_id, type id of newsletter, defaults to null
	function get_newsletter_articles($newsletter_date, $news_article_type_id = null)
	{
		if($news_article_type_id != null)
			$query = 'SELECT NEWS_ARTICLE.ARTICLE_HEADLINE, NEWS_ARTICLE.ARTICLE_IMAGE_URL, NEWS_ARTICLE.ARTICLE_TEXT, NEWS_ARTICLE.ARTICLE_LINK, NEWS_ARTICLE.ARTICLE_LINK_TEXT, NEWS_ARTICLE.ARTICLE_AUTHOR FROM NEWS_ARTICLE LEFT JOIN ARTICLE_LINKER ON (NEWS_ARTICLE.ARTICLE_DATE, NEWS_ARTICLE.ARTICLE_HEADLINE) = (ARTICLE_LINKER.ARTICLE_DATE, ARTICLE_LINKER.ARTICLE_HEADLINE) WHERE ARTICLE_LINKER.PUBLICATION_DATE = "'.$newsletter_date.'" AND ARTICLE_LINKER.ARTICLE_TYPE_ID = "'.$news_article_type_id.'"';
		else		
			$query = 'SELECT NEWS_ARTICLE.ARTICLE_HEADLINE, NEWS_ARTICLE.ARTICLE_IMAGE_URL, NEWS_ARTICLE.ARTICLE_TEXT, NEWS_ARTICLE.ARTICLE_LINK, NEWS_ARTICLE.ARTICLE_LINK_TEXT, NEWS_ARTICLE.ARTICLE_AUTHOR FROM NEWS_ARTICLE LEFT JOIN ARTICLE_LINKER ON (NEWS_ARTICLE.ARTICLE_DATE, NEWS_ARTICLE.ARTICLE_HEADLINE) = (ARTICLE_LINKER.ARTICLE_DATE, ARTICLE_LINKER.ARTICLE_HEADLINE) WHERE PUBLICATION_DATE = "'.$newsletter_date.'"';
		
		return run_query($query);
	}

	// Gets basic data for newsletter
	function get_newsletter_data($newsletter_date)
	{
		$query = 'SELECT PUBLICATION_TITLE, PUBLICATION_VOLUME FROM NEWSLETTER WHERE PUBLICATION_DATE = "'.$newsletter_date.'"';
		return run_query($query);
	}
?>