var int B_RAVENSESCAPEINTOTEMPELAVI_OneTime;
func void B_RAVENSESCAPEINTOTEMPELAVI ()
{
	if (B_RAVENSESCAPEINTOTEMPELAVI_OneTime == FALSE)
	{
		PlayVideoEx	("PORTAL_RAVEN.BIK", TRUE,FALSE); 
		RavenIsInTempel = TRUE;
		
		Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RavenKDW,"Je suis entré dans l'antre de Raven et l'ai vu s'enfuir par une grande porte. Je n'ai pas pu le suivre. Je suppose que cette porte mène au temple d'Adanos. Je dois en informer Saturas."); 
		
		B_RAVENSESCAPEINTOTEMPELAVI_OneTime = TRUE;
	};
};
