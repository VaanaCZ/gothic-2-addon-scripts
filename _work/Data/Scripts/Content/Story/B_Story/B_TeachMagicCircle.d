// ******************
// B_TeachMagicCircle
// ******************

func int B_TeachMagicCircle (var C_NPC slf, var C_NPC oth, var int circle)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_MAGE, circle);
	
	
	// EXIT IF...
	
	// ------ falscher Parameter ------
	if (circle < 1) || (circle > 6)
	{
		Print ("*** ERROR: parámetro equivocado ***");
		return FALSE;
	};
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	{
		PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	
	// FUNC
	
	// ------ Lernpunkte abziehen ------			
	oth.lp = oth.lp - kosten;
	
	// ------ Kreis setzen ------
	Npc_SetTalentSkill (oth, NPC_TALENT_MAGE, circle);
	Log_CreateTopic (TOPIC_TalentMagicCircle,LOG_NOTE);
	B_LogEntry (TOPIC_TalentMagicCircle,"Las runas mágicas a las que he tenido acceso están divididas en círculos. No puedo usar un conjuro que requiera un círculo de más nivel que los que haya dominado."); 
	
	// ------ 1. Kreis ------
	if (circle == 1)
	{
		PrintScreen	(PRINT_LearnCircle_1, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Los conjuros del primer círculo son: luz, flecha de fuego, relámpago pequeño, curar heridas ligeras y convocar esqueleto de trasgo.");
		return TRUE;
	};
	
	// ------ 2. Kreis ------
	if (circle == 2)
	{
		PrintScreen	(PRINT_LearnCircle_2, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Los conjuros del segundo círculo son: bola de fuego, flecha de hielo, convocar lobo, puño de viento y dormir.");
		return TRUE;
	};
	
	// ------ 3. Kreis ------
	if (circle == 3)
	{
		PrintScreen	(PRINT_LearnCircle_3, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Los conjuros del primer círculo son: curar heridas normales, bola relampagueante, pequeña tormenta de fuego, crear esqueleto, miedo y bloque de hielo.");
		return TRUE;
	};
	
	// ------ 4. Kreis ------
	if (circle == 4)
	{
		PrintScreen	(PRINT_LearnCircle_4, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Los conjuros del cuarto círculo son: relámpago, crear gólem de piedra, destruir muerto viviente y bola de fuego grande.");
		return TRUE;
	};
	
	// ------ 5. Kreis ------
	if (circle == 5)
	{
		PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Los conjuros del quinto nivel son: gran tormenta de fuego, oleada de hielo, convocar demonio y curar heridas graves.");
		return TRUE;
	};
	
	// ------ 6. Kreis ------
	if (circle == 6)
	{
		PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Los conjuros del sexto nivel son: lluvia de fuego, aliento mortal, oleada de muerte, ejército de las tinieblas y encoger monstruo.");
		return TRUE;
	};
};






	
	
	
	
	
	
	

		
	
	
	

	
	
	
	
	

	
	
	

