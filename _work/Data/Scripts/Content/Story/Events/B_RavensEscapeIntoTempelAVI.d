var int B_RAVENSESCAPEINTOTEMPELAVI_OneTime;
func void B_RAVENSESCAPEINTOTEMPELAVI ()
{
	if (B_RAVENSESCAPEINTOTEMPELAVI_OneTime == FALSE)
	{
		PlayVideoEx	("PORTAL_RAVEN.BIK", TRUE,FALSE); 
		RavenIsInTempel = TRUE;
		
		Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RavenKDW,"He entrado en los aposentos de Raven y lo he visto desaparecer tras una gran puerta. No he podido seguirle. Me imagino que la puerta conducirá al templo de Adanos. Tengo que informar a Saturas."); 
		
		B_RAVENSESCAPEINTOTEMPELAVI_OneTime = TRUE;
	};
};
