// ****************************
// EVT_TELEPORTSTATION_FUNC       
// ****************************
 
func void EVT_TELEPORTSTATION_FUNC ()
{	
  	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue (hero);	//Joly:wegen Seitwärts da durch rennen.
	
	SCUsed_TELEPORTER = TRUE;			//SC hat schon mal einen Teleporter benutzt
	
	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_CITY")<3000)
		{
			AI_Teleport	(hero, "NW_TELEPORTSTATION_TAVERNE"); 

			if (SCUsed_NW_TELEPORTSTATION_CITY == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_TeleportsNW,"Teleportační kámen v jeskyni východnę od pâístavu vede do hospody 'U Mrtvé harpyje'."); 
			};
			
			SCUsed_NW_TELEPORTSTATION_CITY = TRUE; 
		}
		else if (Npc_GetDistToWP(hero, "NW_TELEPORTSTATION_TAVERNE")<3000)
		{
		 	AI_Teleport	(hero, "NW_TELEPORTSTATION_MAYA");

			if (SCUsed_NW_TELEPORTSTATION_TAVERNE == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_TeleportsNW,"Teleportační kámen u hostince 'U Mrtvé harpyje' ústí u portálu záhadných stavitelů."); 
			};

			SCUsed_NW_TELEPORTSTATION_TAVERNE = TRUE; 
		}
		else if (Npc_GetDistToWP(hero, "NW_TELEPORTSTATION_MAYA")<3000)
		{
			AI_Teleport	(hero, "NW_TELEPORTSTATION_CITY"); 

			if (SCUsed_NW_TELEPORTSTATION_MAYA == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_TeleportsNW,"Teleportační kámen u portálu záhadných stavitelů ústí v jeskyni východnę od pâístavu."); 
			};

			SCUsed_NW_TELEPORTSTATION_MAYA = TRUE;
		}
		else	//else fall wird nicht benutzt, nur zur sicherheit
		{
			AI_Teleport	(hero, "MARKT"); 
		};
		
		
		if (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE)
		&& (SCUsed_NW_TELEPORTSTATION_TAVERNE == TRUE)
		&& (SCUsed_NW_TELEPORTSTATION_CITY == TRUE)
		&& (SCUsed_AllNWTeleporststones == FALSE)
		{
			SCUsed_AllNWTeleporststones = TRUE;
			B_GivePlayerXP (XP_Addon_AllNWTeleporststones);
		};			
	}
	else if (CurrentLevel == ADDONWORLD_ZEN)
	{
		if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_NORTH_WP")
		{
			AI_Teleport	(hero, "ADW_PORTALTEMPEL_TELEPORTSTATION"); 

			if (SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_TeleportsADW, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_TeleportsADW,"Aktivoval jsem teleportační kámen u portálu, který vede do Khorinidu."); 
				B_GivePlayerXP (XP_Ambient);
			};	

			SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_EAST_WP")
		{
			AI_Teleport	(hero, "ADW_ADANOSTEMPEL_TELEPORTSTATION");  
	
			if (SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_TeleportsADW, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_TeleportsADW,"Podaâilo se mi aktivovat teleportační kámen v horní části tábora banditů."); 
				B_GivePlayerXP (XP_Ambient);
			};	
	
			SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHEAST_WP")
		{
			AI_Teleport	(hero, "ADW_SOUTHEAST_TELEPORTSTATION");  
	
			if (SCUsed_ADW_TELEPORTSTATION_SOUTHEAST == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_TeleportsADW, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_TeleportsADW,"Podaâilo se mi aktivovat teleportační kámen v bažinách jižnę od tábora banditů."); 
				B_GivePlayerXP (XP_Ambient);
			};	
	
			SCUsed_ADW_TELEPORTSTATION_SOUTHEAST = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHWEST_WP")
		{
			AI_Teleport	(hero, "ADW_SOUTHWEST_TELEPORTSTATION");  
	
			if (SCUsed_ADW_TELEPORTSTATION_SOUTHWEST == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_TeleportsADW, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_TeleportsADW,"Na jihozápadę jsem našel teleportační kámen."); 
				B_GivePlayerXP (XP_Ambient);
			};	
	
			SCUsed_ADW_TELEPORTSTATION_SOUTHWEST = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_WEST_WP")
		{
			AI_Teleport	(hero, "ADW_PIRATES_TELEPORTSTATION");  

			if (SCUsed_ADW_TELEPORTSTATION_PIRATES == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_TeleportsADW, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_TeleportsADW,"V jeskyni v kaŕonu je teleportační kámen. Aktivoval jsem jej."); 
				B_GivePlayerXP (XP_Ambient);
			};	

			if (MIS_KrokoJagd == LOG_SUCCESS)
			&& (SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER == FALSE)
			{
				// Monster, die bei der Jagd mit Alligator Jack stören
				Wld_InsertNpc  	(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc 	(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc 	(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc 	(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_07");
				Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_07");	
				SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER = TRUE;
			};	
	
			SCUsed_ADW_TELEPORTSTATION_PIRATES = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ADANOSTEMPEL_RAVENTELEPORT_OUT")
		{
			AI_Teleport	(hero, "ADW_ADANOSTEMPEL_TELEPORTSTATION");  

			if (SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT == FALSE)
			{
			};	
			SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT = TRUE;
		}
		else	//immer zurück zum ADW_ENTRANCE für alle anderen Teleportstations
		{
			AI_Teleport	(hero, "ADW_ENTRANCE"); 
		};
	};	
};
var int TriggeredTeleporterADW;
var int ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime;
func void ADW_PORTALTEMPEL_FOCUS_FUNC ()//Joly: kommt, wenn ein Focusstein in ein Sockel eingesetzt wird.
{	
	Npc_RemoveInvItems	(hero ,ItMi_Focus, 1);
	TriggeredTeleporterADW = (TriggeredTeleporterADW + 1);
	Snd_Play ("MFX_TELEKINESIS_STARTINVEST");
	
	if (TriggeredTeleporterADW >= 5)
	{
		SC_ADW_ActivatedAllTelePortStones = TRUE;
	};
	

	if (ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime == FALSE)
	&& (Npc_GetDistToWP(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION") < 3000)
	{
		if ((Npc_IsDead(Stoneguardian_NailedPortalADW1))== FALSE)
		&& (Stoneguardian_NailedPortalADW1.aivar[AIV_EnemyOverride] == TRUE)
		{
			Snd_Play ("THRILLJINGLE_02"); 
		};
		B_AWAKE_STONEGUARDIAN (Stoneguardian_NailedPortalADW1);
		ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime = TRUE;
	};
};  
    
    
   
