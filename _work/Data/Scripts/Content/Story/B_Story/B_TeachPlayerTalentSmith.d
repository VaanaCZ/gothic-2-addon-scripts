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
	B_LogEntry (TOPIC_TalentSmith,"Чтобы выковать оружие, прежде всего мне нужна сырая сталь. Я должен докрасна нагреть ее в огне кузнечного горна, а затем придать форму на наковальне. Особое оружие зачастую требует особых материалов, придающих оружию особые свойства. ");
	
	// ------ Waffe schmieden lernen ------
	//Bennet
	if (waffe == WEAPON_Common)				{	PLAYER_TALENT_SMITH[WEAPON_Common] 			= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Для 'кустарного меча' мне не нужно никаких ингредиентов.");};
	if (waffe == WEAPON_1H_Special_01)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Для 'длинного рудного меча' мне нужен 1 кусок руды.");};
	if (waffe == WEAPON_2H_Special_01)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Для 'двуручного рудного меча' мне нужно 2 куска руды.");};
	if (waffe == WEAPON_1H_Special_02)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Для 'полуторного рудного меча' мне нужно 2 куска руды.");};
	if (waffe == WEAPON_2H_Special_02)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Для 'тяжелого двуручного рудного меча' мне нужно 3 куска руды.");};
	if (waffe == WEAPON_1H_Special_03)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Для 'боевого рудного меча' мне нужно 3 куска руды.");};
	if (waffe == WEAPON_2H_Special_03)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Для 'тяжелого боевого рудного меча' мне нужно 4 куска руды.");};
	if (waffe == WEAPON_1H_Special_04)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Для 'рудного убийцы драконов' мне нужно 4 куска руды и 5 флаконов крови дракона.");};
	if (waffe == WEAPON_2H_Special_04)		{	PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Для 'большого рудного убийцы драконов' мне нужно 5 куска руды и 5 флаконов крови дракона.");};
	
	//Harad - Addon
	if (waffe == WEAPON_1H_Harad_01)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Теперь я могу выковать изысканный меч."); };
	if (waffe == WEAPON_1H_Harad_02)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Теперь я могу выковать изысканный длинный меч."); };
	if (waffe == WEAPON_1H_Harad_03)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] 	= TRUE;	
	B_LogEntry (TOPIC_TalentSmith,"Теперь я могу выковать рубиновый клинок."); };
	if (waffe == WEAPON_1H_Harad_04)		{	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] 	= TRUE;	B_LogEntry (TOPIC_TalentSmith,"Харад передал мне секрет ковки 'Эль Бастардо' - одного из лучших клинков в мире!"); };
	
	PrintScreen			(PRINT_LearnSmith, -1, -1, FONT_Screen, 2);
	
	// ------ bei jeder Waffe: Waffen-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_SMITH, 1);
	return TRUE;
};
	

	
	
	
	
	
	
	

	
	

	
	
	
	
	

	
	
	

