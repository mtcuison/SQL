SELECT a.post_date `post date`
	, a.post_content `event details`
	, a.post_name `post event title`
	, a.guid `post link`
	, c.guid `event image link`
FROM wp_posts a
	LEFT JOIN wp_postmeta b ON a.ID = b.post_id AND b.meta_key = '_thumbnail_id'
	LEFT JOIN wp_posts c ON b.meta_value = c.ID
WHERE a.post_type = 'mec-events'
	AND a.post_status = 'publish'
