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
		Print ("*** Błąd: Zły parametr ***");
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
	B_LogEntry (TOPIC_TalentMagicCircle,"Magiczne runy, do których mam dostęp, są podzielone na kręgi. Nie mogę korzystać z zaklęć wymagających stopnia wtajemniczenia przekraczającego moją aktualną wiedzę."); 
	
	// ------ 1. Kreis ------
	if (circle == 1)
	{
		PrintScreen	(PRINT_LearnCircle_1, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Zaklęcia z pierwszego kręgu to: światło, Ognista strzała, Mała błyskawica, Leczenie lekkich ran i Przyzwanie szkieletu-goblina.");
		return TRUE;
	};
	
	// ------ 2. Kreis ------
	if (circle == 2)
	{
		PrintScreen	(PRINT_LearnCircle_2, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Zaklęcia z drugiego kręgu to: Kula ognia, Lodowa strzała, Przyzwanie wilka, Pięść wichru i Sen.");
		return TRUE;
	};
	
	// ------ 3. Kreis ------
	if (circle == 3)
	{
		PrintScreen	(PRINT_LearnCircle_3, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Zaklęcia z trzeciego kręgu to: Leczenie średnich ran, Piorun kulisty, Mała burza ognista, Tworzenie szkieletu, Strach i Bryła lodu.");
		return TRUE;
	};
	
	// ------ 4. Kreis ------
	if (circle == 4)
	{
		PrintScreen	(PRINT_LearnCircle_4, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Zaklęcia z czwartego kręgu to: Błyskawica, Tworzenie kamiennego golema, Zniszczenie ożywieńca i Duża kula ognia.");
		return TRUE;
	};
	
	// ------ 5. Kreis ------
	if (circle == 5)
	{
		PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Zaklęcia z piątego kręgu to: Duża burza ognista, Lodowa fala, Przyzwanie demona i Leczenie ciężkich ran.");
		return TRUE;
	};
	
	// ------ 6. Kreis ------
	if (circle == 6)
	{
		PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
		B_LogEntry (TOPIC_TalentMagicCircle,"Zaklęcia z szóstego kręgu to: Deszcz ognia, Tchnienie śmierci, Śmiertelna fala, Armia ciemności i Zmniejszenie potwora.");
		return TRUE;
	};
};






	
	
	
	
	
	
	

		
	
	
	

	
	
	
	
	

	
	
	

