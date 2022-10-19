// ***********************************
// B_TeachPlayerTalentForeignLanguage
// ***********************************

func int B_TeachPlayerTalentForeignLanguage (var C_NPC slf, var C_NPC oth, var int Language)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_FOREIGNLANGUAGE, Language);
	
	
	//EXIT IF...
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall, 2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
			
	// FUNC
				
	// ------ Lernpunkte abziehen ------			
	oth.lp = oth.lp - kosten;
	
	Log_CreateTopic (TOPIC_Language,LOG_NOTE);
	
	// ------ Körperteil nehmen lernen ------
	
	if (Language == LANGUAGE_1) {	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;	B_LogEntry (TOPIC_Language,LogText_Addon_Language_1); };
	if (Language == LANGUAGE_2) {	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;	B_LogEntry (TOPIC_Language,LogText_Addon_Language_2); };  
	if (Language == LANGUAGE_3) {	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;   B_LogEntry (TOPIC_Language,LogText_Addon_Language_3); };  

	PrintScreen			(PRINT_LearnForeignLanguage, -1, -1, FONT_Screen, 2);
	
	// ------ bei jedem Körperteil: ForeignLanguage-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_FOREIGNLANGUAGE , 1);
	return TRUE;
};
