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
	B_LogEntry (TOPIC_TalentAlchemy,"Para destilar una poci�n necesito un frasco de laboratorio vac�o y los ingredientes requeridos para crear la poci�n. Si uso los ingredientes en la mesa de trabajo del alquimista podr� preparar la poci�n deseada."); 
	
	// ------ Trank brauen lernen ------
	if (potion == POTION_Health_01)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_01] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes ''ESENCIA DE CURACI�N'': 2 plantas curativas y 1 maleza de llanura."); };
	
	if (potion == POTION_Health_02)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_02] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''EXTRACTO DE CURACI�N'': 2 hierbas curativas y 1 maleza de llanura.");  };
	
	if (potion == POTION_Health_03)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_03] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''ELIXIR DE CURACI�N'': 2 ra�ces curativas y 1 maleza de llanura.");  };
	
	if (potion == POTION_Mana_01)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_01] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''ESENCIA DE MAN�'': 2 ortigas de fuego y 1 maleza de llanura.");  };
	
	if (potion == POTION_Mana_02)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_02] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''EXTRACTO DE MAN�'': 2 hierbas del fuego y 1 maleza de llanura.");  };
	
	if (potion == POTION_Mana_03)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_03] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''ELIXIR DE MAN�'': 2 ra�ces de fuego y 1 maleza de llanura.");  };
	
	if (potion == POTION_Speed)			{	PLAYER_TALENT_ALCHEMY[POTION_Speed] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''POCI�N DE VELOCIDAD'': 1 malas hierbas de chasqueador y 1 maleza de llanura.");  };
	
	if (potion == POTION_Perm_STR)		{	PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''ELIXIR DE FUERZA'': 1 ra�ces de drag�n y 1 acedera.");  };
	
	if (potion == POTION_Perm_DEX)		{	PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''ELIXIR DE DESTREZA'': 1 baya de trasgo y 1 acedera.");  };
	
	if (potion == POTION_Perm_Mana)		{	PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''ELIXIR DE ESP�RITU'': 1 ra�z de drag�n y 1 acedera.");  };
	
	if (potion == POTION_Perm_Health)	{	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Ingredientes de ''ELIXIR DE VIDA'': 1 ra�z curativa y 1 acedera.");  };

	PrintScreen			(PRINT_LearnAlchemy, -1, -1, FONT_Screen, 2);
	
	// ------ bei jedem Trank: Alchemy-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_ALCHEMY, 1);
	
	return TRUE;
};
	

		

	
	



	
	
	
	

	
	

	
	
	
	
	

	
	
	

