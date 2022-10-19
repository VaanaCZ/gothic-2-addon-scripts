var int B_RAVENSESCAPEINTOTEMPELAVI_OneTime;
func void B_RAVENSESCAPEINTOTEMPELAVI ()
{
	if (B_RAVENSESCAPEINTOTEMPELAVI_OneTime == FALSE)
	{
		PlayVideoEx	("PORTAL_RAVEN.BIK", TRUE,FALSE); 
		RavenIsInTempel = TRUE;
		
		Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RavenKDW,"Sice se mi podaâilo proniknout do Havranových komnat, ale stihl mi zmizet za velkými dveâmi, kam jsem se za ním nedostal. Pravdêpodobnê jimi prošel do Adanova chrámu. Musím to ohlásit Saturasovi."); 
		
		B_RAVENSESCAPEINTOTEMPELAVI_OneTime = TRUE;
	};
};
