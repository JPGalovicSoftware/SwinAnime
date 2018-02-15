<?php
	// Gets core event data for a given event, Version 1.0, JAN18, JPGalovic
	// Flags: this_event_time: datetime, event_time: datetime, next_event: bool
	if(!isset($next_event)) // if next event is not set then give default value of ???
		$next_event = true;

	if(isset($this_event_time)) // if this event time is set means page accessing has an event time set
	{
		if($next_event) // Call is to get next event
		{
			if(isset($event_time)) // if event time is set then seek next event after event with event_time
			{
				$get_core_event_query = 'SELECT EVENT_DATA.EVENT_TIME, EVENT_TYPE.EVENT_TYPE_DESCRIPTION, EVENT_DATA.EVENT_TITLE, EVENT_DATA.EVENT_SUBTITLE, EVENT_LOCATION.CAMPUS, EVENT_LOCATION.ROOM, EVENT_LOCATION.ADDRESS, EVENT_LOCATION.LAT, EVENT_LOCATION.LNG, EVENT_LOCATION.ZOOM, EVENT_DATA.EVENT_FACEBOOK_ID, EVENT_DATA.EVENT_UNIONE_URL FROM EVENT_DATA LEFT JOIN EVENT_TYPE ON EVENT_DATA.EVENT_TYPE_ID = EVENT_TYPE.EVENT_TYPE_ID LEFT JOIN EVENT_LOCATION ON EVENT_DATA.EVENT_LOCATION = EVENT_LOCATION.LOCATION_ID WHERE EVENT_DATA.EVENT_TIME > "'.$event_time.'" AND EVENT_DATA.EVENT_TIME != "'.$this_event_time.'" LIMIT 1';
			}
			else // seek next event from current time
			{
				$get_core_event_query = 'SELECT EVENT_DATA.EVENT_TIME, EVENT_TYPE.EVENT_TYPE_DESCRIPTION, EVENT_DATA.EVENT_TITLE, EVENT_DATA.EVENT_SUBTITLE, EVENT_LOCATION.CAMPUS, EVENT_LOCATION.ROOM, EVENT_LOCATION.ADDRESS, EVENT_LOCATION.LAT, EVENT_LOCATION.LNG, EVENT_LOCATION.ZOOM, EVENT_DATA.EVENT_FACEBOOK_ID, EVENT_DATA.EVENT_UNIONE_URL FROM EVENT_DATA LEFT JOIN EVENT_TYPE ON EVENT_DATA.EVENT_TYPE_ID = EVENT_TYPE.EVENT_TYPE_ID LEFT JOIN EVENT_LOCATION ON EVENT_DATA.EVENT_LOCATION = EVENT_LOCATION.LOCATION_ID WHERE EVENT_DATA.EVENT_TIME >= "'.$time.'" AND EVENT_DATA.EVENT_TIME != "'.$this_event_time.'" LIMIT 1';
			}
		}
		else // Call is for data for event with time stored in this_event_time
		{
			$get_core_event_query = 'SELECT EVENT_DATA.EVENT_TIME, EVENT_TYPE.EVENT_TYPE_DESCRIPTION, EVENT_DATA.EVENT_TITLE, EVENT_DATA.EVENT_SUBTITLE, EVENT_LOCATION.CAMPUS, EVENT_LOCATION.ROOM, EVENT_LOCATION.ADDRESS, EVENT_LOCATION.LAT, EVENT_LOCATION.LNG, EVENT_LOCATION.ZOOM, EVENT_DATA.EVENT_FACEBOOK_ID, EVENT_DATA.EVENT_UNIONE_URL FROM EVENT_DATA LEFT JOIN EVENT_TYPE ON EVENT_DATA.EVENT_TYPE_ID = EVENT_TYPE.EVENT_TYPE_ID LEFT JOIN EVENT_LOCATION ON EVENT_DATA.EVENT_LOCATION = EVENT_LOCATION.LOCATION_ID WHERE EVENT_DATA.EVENT_TIME = "'.$this_event_time.'" LIMIT 1';
		}
	}
	else
	{
		if(isset($event_time)) // if event time is set then seek next event after event with event_time
		{
			$get_core_event_query = 'SELECT EVENT_DATA.EVENT_TIME, EVENT_TYPE.EVENT_TYPE_DESCRIPTION, EVENT_DATA.EVENT_TITLE, EVENT_DATA.EVENT_SUBTITLE, EVENT_LOCATION.CAMPUS, EVENT_LOCATION.ROOM, EVENT_LOCATION.ADDRESS, EVENT_LOCATION.LAT, EVENT_LOCATION.LNG, EVENT_LOCATION.ZOOM, EVENT_DATA.EVENT_FACEBOOK_ID, EVENT_DATA.EVENT_UNIONE_URL FROM EVENT_DATA LEFT JOIN EVENT_TYPE ON EVENT_DATA.EVENT_TYPE_ID = EVENT_TYPE.EVENT_TYPE_ID LEFT JOIN EVENT_LOCATION ON EVENT_DATA.EVENT_LOCATION = EVENT_LOCATION.LOCATION_ID WHERE EVENT_DATA.EVENT_TIME > "'.$event_time.'" LIMIT 1';
		}
		else // seek next event from current time
		{
			$get_core_event_query = 'SELECT EVENT_DATA.EVENT_TIME, EVENT_TYPE.EVENT_TYPE_DESCRIPTION, EVENT_DATA.EVENT_TITLE, EVENT_DATA.EVENT_SUBTITLE, EVENT_LOCATION.CAMPUS, EVENT_LOCATION.ROOM, EVENT_LOCATION.ADDRESS, EVENT_LOCATION.LAT, EVENT_LOCATION.LNG, EVENT_LOCATION.ZOOM, EVENT_DATA.EVENT_FACEBOOK_ID, EVENT_DATA.EVENT_UNIONE_URL FROM EVENT_DATA LEFT JOIN EVENT_TYPE ON EVENT_DATA.EVENT_TYPE_ID = EVENT_TYPE.EVENT_TYPE_ID LEFT JOIN EVENT_LOCATION ON EVENT_DATA.EVENT_LOCATION = EVENT_LOCATION.LOCATION_ID WHERE EVENT_DATA.EVENT_TIME >= "'.$time.'" LIMIT 1';
		}
	}

	if(!$get_core_event_data = $DB->query($get_core_event_query))
	{
		$error_text = $DB->error + $get_core_event_query;
		$error_no = $DB->error_no;
		include('code_gen/error_report.php');
	}
?>