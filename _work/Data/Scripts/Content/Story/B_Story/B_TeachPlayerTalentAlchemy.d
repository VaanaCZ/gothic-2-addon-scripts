// **************************
// B_TeachPlayerTalentAlchemy
// **************************

func int B_TeachPlayerTalentAlchemy (var C_NPC slf, var C_NPC oth, var int potion)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_ALCHEMY, potion);
	
	
	//EXIT IF...
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
			
	// FUNC
				
	// ------ Lernpunkte abziehen ------			
	oth.lp = oth.lp - kosten;
	
	Log_CreateTopic (TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry (TOPIC_TalentAlchemy,"Per preparare una pozione ho bisogno di una fiaschetta da laboratorio vuota e gli ingredienti necessari per la pozione. Utilizzando questi ingredienti sul banco dell'alchimista posso preparare la pozione desiderata."); 
	
	// ------ Trank brauen lernen ------
	if (potion == POTION_Health_01)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_01] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ESSENZA CURATIVA': 2 piante curative e 1 groviglio della prateria."); };
	
	if (potion == POTION_Health_02)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_02] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ESTRATTO CURATIVO': 2 erbe curative e 1 groviglio della prateria.");  };
	
	if (potion == POTION_Health_03)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_03] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ELISIR CURATIVO': 2 radici curative e 1 groviglio della prateria.");  };
	
	if (potion == POTION_Mana_01)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_01] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ESSENZA DI MANA': 2 ortiche del fuoco e 1 groviglio della prateria.");  };
	
	if (potion == POTION_Mana_02)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_02] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ESTRATTO DI MANA': 2 erbe del fuoco e 1 groviglio della prateria.");  };
	
	if (potion == POTION_Mana_03)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_03] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ELISIR DI MANA': 2 radici del fuoco e 1 groviglio della prateria.");  };
	
	if (potion == POTION_Speed)			{	PLAYER_TALENT_ALCHEMY[POTION_Speed] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'POZIONE DI VELOCITÀ': 1 erba dello squartatore e 1 groviglio della prateria.");  };
	
	if (potion == POTION_Perm_STR)		{	PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ELISIR DELLA FORZA': 1 radice del drago e 1 acetosella del re.");  };
	
	if (potion == POTION_Perm_DEX)		{	PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ELISIR DELLA DESTREZZA': 1 bacche dei goblin e 1 acetosella del re.");  };
	
	if (potion == POTION_Perm_Mana)		{	PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ELISIR DELLO SPIRITO': 1 radice del fuoco e 1 acetosella del re.");  };
	
	if (potion == POTION_Perm_Health)	{	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredienti per 'ELISIR DELLA VITA': 1 radice curativa e 1 acetosella del re.");  };

	PrintScreen			(PRINT_LearnAlchemy, -1, -1, FONT_Screen, 2);
	
	// ------ bei jedem Trank: Alchemy-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_ALCHEMY, 1);
	
	return TRUE;
};
	

		

	
	



	
	
	
	

	
	

	
	
	
	
	

	
	
	

