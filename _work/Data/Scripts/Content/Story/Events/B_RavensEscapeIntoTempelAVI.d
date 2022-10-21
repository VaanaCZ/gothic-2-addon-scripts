var int B_RAVENSESCAPEINTOTEMPELAVI_OneTime;
func void B_RAVENSESCAPEINTOTEMPELAVI ()
{
	if (B_RAVENSESCAPEINTOTEMPELAVI_OneTime == FALSE)
	{
		PlayVideoEx	("PORTAL_RAVEN.BIK", TRUE,FALSE); 
		RavenIsInTempel = TRUE;
		
		Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RavenKDW,"Sono entrato nelle stanze di Raven e ho fatto appena in tempo a vederlo scomparire dietro una grande porta. Non ho potuto seguirlo. Suppongo che quella porta conduca al tempio di Adanos. Devo riferirlo a Saturas."); 
		
		B_RAVENSESCAPEINTOTEMPELAVI_OneTime = TRUE;
	};
};
