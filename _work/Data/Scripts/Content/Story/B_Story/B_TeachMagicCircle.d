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
		Print ("*** CHYBA: nesprávný parametr ***");
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
	B_LogEntry (TOPIC_TalentMagicCircle,"Magické runy, ke kterým mám nyní pâístup, jsou rozdęleny do jednotlivých kruhů. Nemohu použít kouzlo, jež vyžaduje vyšší kruh, než jaký již ovládám."); 
	
	// ------ 1. Kreis ------
	if (circle == 1)
	{
		PrintScreen	(PRINT_LearnCircle_1, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Kouzla prvního kruhu jsou: svętlo, ohnivý šíp, malý blesk, léčba lehkých zranęní a vyvolání gobliního kostlivce.");
		return TRUE;
	};
	
	// ------ 2. Kreis ------
	if (circle == 2)
	{
		PrintScreen	(PRINT_LearnCircle_2, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Ke kouzlům druhého kruhu patâí: ohnivá koule, ledový šíp, vyvolání vlka, vętrná pęst a spánek.");
		return TRUE;
	};
	
	// ------ 3. Kreis ------
	if (circle == 3)
	{
		PrintScreen	(PRINT_LearnCircle_3, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Kouzla 3. kruhu zahrnují: léčbu stâednę tęžkých zranęní, kulový blesk, malou ohnivou bouâi, vyvolání kostlivce, strach a ledový blok.");
		return TRUE;
	};
	
	// ------ 4. Kreis ------
	if (circle == 4)
	{
		PrintScreen	(PRINT_LearnCircle_4, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Ke kouzlům 4. kruhu náleží: blesk, vytvoâení kamenného golema, ničení nemrtvých a velká ohnivá koule.");
		return TRUE;
	};
	
	// ------ 5. Kreis ------
	if (circle == 5)
	{
		PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Kouzla 5. kruhu obsahují: velkou ohnivou bouâi, ledovou vlnu, vyvolání démona a léčbu tęžkých zranęní.");
		return TRUE;
	};
	
	// ------ 6. Kreis ------
	if (circle == 6)
	{
		PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Kouzla 6. kruhu čítají: ohnivý déšă, dech smrti, vlnu smrti, armádu temnot a zmenšení nestvůry.");
		return TRUE;
	};
};






	
	
	
	
	
	
	

		
	
	
	

	
	
	
	
	

	
	
	

