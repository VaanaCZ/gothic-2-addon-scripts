// ***********************************
// B_TeachPlayerTalentTakeAnimalTrophy
// ***********************************

func int B_TeachPlayerTalentTakeAnimalTrophy (var C_NPC slf, var C_NPC oth, var int trophy)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_TAKEANIMALTROPHY, trophy);
	
	
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
	
	Log_CreateTopic (TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry (TOPIC_TalentAnimalTrophy,"Now I can:");
	
	// ------ Körperteil nehmen lernen ------
	
	if (trophy == TROPHY_Teeth) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove teeth from dead animals.");};
	if (trophy == TROPHY_Claws) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove claws from dead animals.");};
	if (trophy == TROPHY_Fur) 				{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] 				= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove fur from dead animals.");};
	if (trophy == TROPHY_ReptileSkin) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] 		= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove skin from reptiles.");}; //ADDON
	if (trophy == TROPHY_Heart) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove heart from dead golems and dead demons.");};
	if (trophy == TROPHY_ShadowHorn) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] 		= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove horn from dead shadowbeasts.");};
	if (trophy == TROPHY_FireTongue) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] 		= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove tongue from dead fire lizards.");};
	if (trophy == TROPHY_BFWing) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove wings from dead bloodflys.");};
	if (trophy == TROPHY_BFSting) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove sting from dead bloodflys.");};
	if (trophy == TROPHY_Mandibles) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] 		= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove mandibles from dead animals.");};
	if (trophy == TROPHY_CrawlerPlate) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] 	= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove plates from dead minecrawler.");};
	if (trophy == TROPHY_DrgSnapperHorn)	{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] 	= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...remove horn from dead dragon snapper.");};
	if (trophy == TROPHY_DragonScale) 		{	
												PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] 		= TRUE;	
												CreateInvItems (Swampdragon, ItAt_DragonScale, 12);	
												CreateInvItems (Rockdragon, ItAt_DragonScale, 12);	
												CreateInvItems (Firedragon, ItAt_DragonScale, 12);	
												CreateInvItems (Icedragon, 	ItAt_DragonScale, 12);
												
												B_LogEntry (TOPIC_TalentAnimalTrophy,"... remove dragon scales from the hide of dead dragons.");	
											};
	if (trophy == TROPHY_DragonBlood)		{	
												PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] 		= TRUE;	
												CreateInvItems (Swampdragon, ItAt_DragonBlood, 2);	
												CreateInvItems (Rockdragon, ItAt_DragonBlood, 2);	
												CreateInvItems (Firedragon, ItAt_DragonBlood, 2);	
												CreateInvItems (Icedragon, ItAt_DragonBlood, 2);	
											
												B_LogEntry (TOPIC_TalentAnimalTrophy,"... collect the blood from a dead dragon.");
											};

	PrintScreen			(PRINT_LearnTakeAnimalTrophy, -1, -1, FONT_Screen, 2);
	
	// ------ bei jedem Körperteil: TakeAnimalTrophy-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_TAKEANIMALTROPHY, 1);
	return TRUE;
};
	


	
	
	
	

	
	

	
	
	
	
	

	
	
	

