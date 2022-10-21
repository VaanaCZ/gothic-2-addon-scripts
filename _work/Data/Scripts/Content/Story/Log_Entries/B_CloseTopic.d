// ***************************************************
//  	B_CloseTopic ()	(verschiebt Topics in den zugehörigen Log-Ordner bei FAILED oder SUCCESS)	
// ***************************************************

func void B_CloseTopic (var string Topic, var int MissionVar, var int CommonVar, var int EndChapter)	
{	
	if ((MissionVar == LOG_SUCCESS)
	|| (CommonVar == TRUE))
		{
			Log_SetTopicStatus(Topic, LOG_SUCCESS);
		}
	else if (MissionVar == LOG_OBSOLETE)
		{
			Log_SetTopicStatus(Topic, LOG_OBSOLETE);
		}	
	else if (MissionVar == LOG_FAILED)
		{
			Log_SetTopicStatus(Topic, LOG_FAILED);
		}		
	else if (Kapitel >= EndChapter)
	&& 	((MissionVar == LOG_RUNNING)||(CommonVar == FALSE))
		{
			Log_SetTopicStatus(Topic, LOG_OBSOLETE);
		};												
};
