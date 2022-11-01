// ************************
// B_TeachPlayerTalentSmith
// ************************

func int B_TeachPlayerTalentSmith (var C_NPC slf, var C_NPC oth, var int waffe)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_SMITH, waffe);
	
	
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
	
	Log_CreateTopic (TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry (TOPIC_TalentSmith,"K vykování takové zbraně potřebuji hlavně kousek surové oceli. Tu pak doruda rozžhavím v kovářské výhni a pak ji budu kout na kovadlině. K výrobě některých zbraní potřebuji i další substance, které jim propůjčí jedinečné vlastnosti.");
	
	// ------ Waffe schmieden lernen ------
	//Bennet
	if (waffe == WEAPON_Common)				{	PLAYER_TALENT_SMITH[WEAPON_Common] 			= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vytvoření samokovného meče už nepotřebuji žádné další ingredience.   ");};
	if (waffe == WEAPON_1H_Special_01)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování dlouhého meče z rudy potřebuji 1 hrudku rudy.                ");};
	if (waffe == WEAPON_2H_Special_01)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování obouručního meče z rudy potřebuji 2 hrudky rudy.");};
	if (waffe == WEAPON_1H_Special_02)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování meče bastardu z rudy potřebuji 2 hrudky rudy.                     ");};
	if (waffe == WEAPON_2H_Special_02)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování těžkého obouručního meče z rudy potřebuji 3 hrudky rudy.");};
	if (waffe == WEAPON_1H_Special_03)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování válečné čepele z rudy potřebuji 3 hrudky rudy.                                          ");};
	if (waffe == WEAPON_2H_Special_03)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování těžké válečné čepele z rudy potřebuji 4 hrudky rudy.");};
	if (waffe == WEAPON_1H_Special_04)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Přidám-li 4 kousky rudy a pětkrát dračí krev, mohu vykovat DRAKOBIJCE.");};
	if (waffe == WEAPON_2H_Special_04)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Když použiji 5 kousků rudy a pětkrát dračí krev, vykovám VELKÉHO DRAKOBIJCE.");};
	
	//Harad - Addon
	if (waffe == WEAPON_1H_Harad_01)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Nyní umím vykovat kvalitní meč."); };
	if (waffe == WEAPON_1H_Harad_02)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Nyní umím vykovat kvalitní dlouhý meč."); };
	if (waffe == WEAPON_1H_Harad_03)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Nyní mohu vykovat i rubínovou čepel."); };
	if (waffe == WEAPON_1H_Harad_04)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] 	= TRUE;	B_LogEntry (TOPIC_TalentSmith,"Harad mě naučil vykovat 'El Bastardo', nejlepší jednoruční meč, jaký se dá sehnat!"); };
	
	PrintScreen			(PRINT_LearnSmith, -1, -1, FONT_Screen, 2);
	
	// ------ bei jeder Waffe: Waffen-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_SMITH, 1);
	return TRUE;
};
	

	
	
	
	
	
	
	

	
	

	
	
	
	
	

	
	
	

