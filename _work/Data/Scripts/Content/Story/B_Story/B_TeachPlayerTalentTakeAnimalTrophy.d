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
	B_LogEntry (TOPIC_TalentAnimalTrophy,"Ich kann jetzt:");
	
	// ------ Körperteil nehmen lernen ------
	
	if (trophy == TROPHY_Teeth) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Tieren die Zähne entfernen.");};
	if (trophy == TROPHY_Claws) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Tieren die Krallen abnehmen.");};
	if (trophy == TROPHY_Fur) 				{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] 				= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Tieren das Fell abziehen.");};
	if (trophy == TROPHY_ReptileSkin) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] 		= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Reptilien häuten.");}; //ADDON
	if (trophy == TROPHY_Heart) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Golems und Dämonen ihr Herz entnehmen.");};
	if (trophy == TROPHY_ShadowHorn) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] 		= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Schattenläufern das Horn entfernen.");};
	if (trophy == TROPHY_FireTongue) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] 		= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Feuerwaranen die Zunge enfernen.");};
	if (trophy == TROPHY_BFWing) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...die Flügel von Blutfliegen vom Körper lösen.");};
	if (trophy == TROPHY_BFSting) 			{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] 			= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Blutfliegen den Stachen entfernen.");};
	if (trophy == TROPHY_Mandibles) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] 		= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Tieren ihre Greifzangen entfernen.");};
	if (trophy == TROPHY_CrawlerPlate) 		{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] 	= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Minecrawlern die Panzerplatten vom Körper lösen");};
	if (trophy == TROPHY_DrgSnapperHorn)	{	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] 	= TRUE;	
	B_LogEntry (TOPIC_TalentAnimalTrophy,"...Drachensnappern ihre Hörner entfernen.");};
	if (trophy == TROPHY_DragonScale) 		{	
												PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] 		= TRUE;	
												CreateInvItems (Swampdragon, ItAt_DragonScale, 12);	
												CreateInvItems (Rockdragon, ItAt_DragonScale, 12);	
												CreateInvItems (Firedragon, ItAt_DragonScale, 12);	
												CreateInvItems (Icedragon, 	ItAt_DragonScale, 12);
												
												B_LogEntry (TOPIC_TalentAnimalTrophy,"...Drachenschuppen vom Körper eines toten Drachen lösen.");	
											};
	if (trophy == TROPHY_DragonBlood)		{	
												PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] 		= TRUE;	
												CreateInvItems (Swampdragon, ItAt_DragonBlood, 2);	
												CreateInvItems (Rockdragon, ItAt_DragonBlood, 2);	
												CreateInvItems (Firedragon, ItAt_DragonBlood, 2);	
												CreateInvItems (Icedragon, ItAt_DragonBlood, 2);	
											
												B_LogEntry (TOPIC_TalentAnimalTrophy,"...toten Drachen ihr Blut abzapfen.");
											};

	PrintScreen			(PRINT_LearnTakeAnimalTrophy, -1, -1, FONT_Screen, 2);
	
	// ------ bei jedem Körperteil: TakeAnimalTrophy-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_TAKEANIMALTROPHY, 1);
	return TRUE;
};
	


	
	
	
	

	
	

	
	
	
	
	

	
	
	

