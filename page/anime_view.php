<?php
	include('sql/sql_login.php');

	if(isset($_GET['anime']))
	{
		$anime_title = $_GET['anime'];
		
		include('module/anime/common_details.php'); // Article showing core details for anime.
		include('module/anime/session_details.php'); // Article showing all avalible sessions for anime.
		include('module/anime/all_stream_volume_details.php'); // Article showing entries for all stream's and volumes avalible.
		include('module/anime/episode_grid.php'); // Article showing all episodes for anime.
	}
?>