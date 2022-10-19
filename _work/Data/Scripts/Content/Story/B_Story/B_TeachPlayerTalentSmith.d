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
	B_LogEntry (TOPIC_TalentSmith,"K vykování takové zbranì potøebuji hlavnì kousek surové oceli. Tu pak doruda rozžhavím v kováøské výhni a pak ji budu kout na kovadlinì. K výrobì nìkterých zbraní potøebuji i další substance, které jim propùjèí jedineèné vlastnosti.");
	
	// ------ Waffe schmieden lernen ------
	//Bennet
	if (waffe == WEAPON_Common)				{	PLAYER_TALENT_SMITH[WEAPON_Common] 			= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vytvoøení samokovného meèe už nepotøebuji žádné další ingredience.   ");};
	if (waffe == WEAPON_1H_Special_01)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování dlouhého meèe z rudy potøebuji 1 hrudku rudy.                ");};
	if (waffe == WEAPON_2H_Special_01)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování obouruèního meèe z rudy potøebuji 2 hrudky rudy.");};
	if (waffe == WEAPON_1H_Special_02)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování meèe bastardu z rudy potøebuji 2 hrudky rudy.                     ");};
	if (waffe == WEAPON_2H_Special_02)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování tìžkého obouruèního meèe z rudy potøebuji 3 hrudky rudy.");};
	if (waffe == WEAPON_1H_Special_03)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování váleèné èepele z rudy potøebuji 3 hrudky rudy.                                          ");};
	if (waffe == WEAPON_2H_Special_03)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"K vykování tìžké váleèné èepele z rudy potøebuji 4 hrudky rudy.");};
	if (waffe == WEAPON_1H_Special_04)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Pøidám-li 4 kousky rudy a pìtkrát draèí krev, mohu vykovat DRAKOBIJCE.");};
	if (waffe == WEAPON_2H_Special_04)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Když použiji 5 kouskù rudy a pìtkrát draèí krev, vykovám VELKÉHO DRAKOBIJCE.");};
	
	//Harad - Addon
	if (waffe == WEAPON_1H_Harad_01)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Nyní umím vykovat kvalitní meè."); };
	if (waffe == WEAPON_1H_Harad_02)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Nyní umím vykovat kvalitní dlouhý meè."); };
	if (waffe == WEAPON_1H_Harad_03)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Nyní mohu vykovat i rubínovou èepel."); };
	if (waffe == WEAPON_1H_Harad_04)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] 	= TRUE;	B_LogEntry (TOPIC_TalentSmith,"Harad mì nauèil vykovat 'El Bastardo', nejlepší jednoruèní meè, jaký se dá sehnat!"); };
	
	PrintScreen			(PRINT_LearnSmith, -1, -1, FONT_Screen, 2);
	
	// ------ bei jeder Waffe: Waffen-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_SMITH, 1);
	return TRUE;
};
	

	
	
	
	
	
	
	

	
	

	
	
	
	
	

	
	
	

