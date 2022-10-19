// ************************
// B_TeachPlayerTalentRunes
// ************************

func int B_TeachPlayerTalentRunes (var C_NPC slf, var C_NPC oth, var int spell)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_RUNES, spell);
	
	
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
	
	Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry (TOPIC_TalentRunes,"Um eine Rune zu erschaffen, benötige ich, neben der Spruchrolle des gewünschten Spruches, für jede Rune unterschiedliche Zutaten. Mit diesen Zutaten und einem Runenrohling kann ich dann die gewünschte Rune am Runentisch erschaffen.");
	
	var C_NPC ScrollTrader;
	
	if	(Npc_IsDead(Gorax)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Gorax);
	}
	else if (Npc_IsDead(Isgaroth)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Isgaroth);
	}
	else if	(Npc_IsDead(Engor)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Engor);
	}
	else if	(Npc_IsDead(Orlan)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Orlan);
	}
	else if (Npc_IsDead (Cronos_ADW) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Cronos_ADW);
	};
	
	// ------ Rune lernen ------
	if (spell == SPL_PalLight)				{	PLAYER_TALENT_RUNES[SPL_PalLight] 				= TRUE;	};		
	if (spell == SPL_PalLightHeal)			{	PLAYER_TALENT_RUNES[SPL_PalLightHeal] 			= TRUE;	};		
	if (spell == SPL_PalHolyBolt)			{	PLAYER_TALENT_RUNES[SPL_PalHolyBolt] 			= TRUE; };		
	if (spell == SPL_PalMediumHeal)			{	PLAYER_TALENT_RUNES[SPL_PalMediumHeal] 			= TRUE;	};		
	if (spell == SPL_PalRepelEvil)			{	PLAYER_TALENT_RUNES[SPL_PalRepelEvil] 			= TRUE;	};		
	if (spell == SPL_PalFullHeal)			{	PLAYER_TALENT_RUNES[SPL_PalFullHeal] 			= TRUE;	};		
	if (spell == SPL_PalDestroyEvil)		{	PLAYER_TALENT_RUNES[SPL_PalDestroyEvil]			= TRUE;	};		
	if (spell == SPL_PalTeleportSecret)		{	PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE;	};		
	if (spell == SPL_TeleportSeaport)		{	PLAYER_TALENT_RUNES[SPL_TeleportSeaport] 		= TRUE;	};		
	if (spell == SPL_TeleportMonastery)		{	PLAYER_TALENT_RUNES[SPL_TeleportMonastery] 		= TRUE;	};		
	if (spell == SPL_TeleportFarm)			{	PLAYER_TALENT_RUNES[SPL_TeleportFarm] 			= TRUE;	};		
	if (spell == SPL_TeleportXardas)		{	PLAYER_TALENT_RUNES[SPL_TeleportXardas] 		= TRUE;	};		
	if (spell == SPL_TeleportPassNW)		{	PLAYER_TALENT_RUNES[SPL_TeleportPassNW] 		= TRUE;	};		
	if (spell == SPL_TeleportPassOW)		{	PLAYER_TALENT_RUNES[SPL_TeleportPassOW] 		= TRUE;	};		
	if (spell == SPL_TeleportOC)			{	PLAYER_TALENT_RUNES[SPL_TeleportOC] 			= TRUE;	};		
	// Teleport-Joker fehlen
	if (spell == SPL_LIGHT)					{	PLAYER_TALENT_RUNES[SPL_LIGHT] 					= TRUE;	CreateInvItems (ScrollTrader, ItSc_LIGHT, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´LICHT´: 1 Goldmünze.");	};		
	if (spell == SPL_Firebolt)				{	PLAYER_TALENT_RUNES[SPL_Firebolt] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Firebolt, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´FEUERPFEIL´: 1 Schwefel.");	};		
	if (spell == SPL_Icebolt)				{	PLAYER_TALENT_RUNES[SPL_Icebolt] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Icebolt, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´EISPFEIL´: 1 Gletscherquartz");};		
	if (spell == SPL_LightHeal)				{	PLAYER_TALENT_RUNES[SPL_LightHeal] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_LightHeal, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´LEICHTE WUNDEN HEILEN´:1 Heilpflanze.");	};		
	if (spell == SPL_SummonGoblinSkeleton)	{	PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] 	= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumGobSkel, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´GOBLINSKELETT ERSCHAFFEN´:1 Goblinknochen.");	};		
	if (spell == SPL_InstantFireball)		{	PLAYER_TALENT_RUNES[SPL_InstantFireball] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_InstantFireball, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´FEUERBALL ´: 1 Pech");	};	
	if (spell == SPL_Zap)					{	PLAYER_TALENT_RUNES[SPL_Zap] 					= TRUE;	CreateInvItems (ScrollTrader, ItSc_Zap, 1);						
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´BLITZ`:1 Bergkristall.");	};		
	if (spell == SPL_SummonWolf)			{	PLAYER_TALENT_RUNES[SPL_SummonWolf]				= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumWolf, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´WOLF RUFEN´: 1 Wolfsfell.");	};		
	if (spell == SPL_WINDFIST)				{	PLAYER_TALENT_RUNES[SPL_WINDFIST] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_WINDFIST, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´WINDFAUST´:1 Stück Kohle.");	};		
	if (spell == SPL_Sleep)					{	PLAYER_TALENT_RUNES[SPL_Sleep] 					= TRUE;	CreateInvItems (ScrollTrader, ItSc_Sleep, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´SCHLAF`:1 Sumpfkraut. Auch eine Methode das Zeug zu verwenden.");	};		
	if (spell == SPL_MediumHeal)			{	PLAYER_TALENT_RUNES[SPL_MediumHeal] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_MediumHeal, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´MITTLERE WUNDEN HEILEN´:1 Heilkraut.");	};		
	if (spell == SPL_LightningFlash)		{	PLAYER_TALENT_RUNES[SPL_LightningFlash] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_LightningFlash, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´BLITZSCHLAG´: 1 Bergkristall und 1 Gletscher Quartz.");	};	
	if (spell == SPL_ChargeFireball)		{	PLAYER_TALENT_RUNES[SPL_ChargeFireball] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_ChargeFireball, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´GROSSER FEUERBALL´: 1 Schwefel und 1 Pech.");	};		
	if (spell == SPL_SummonSkeleton)		{	PLAYER_TALENT_RUNES[SPL_SummonSkeleton] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumSkel, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´SKELET BESCHWÖREN´: 1 Skelettknochen.");	};		
	if (spell == SPL_Fear)					{	PLAYER_TALENT_RUNES[SPL_Fear] 					= TRUE;	CreateInvItems (ScrollTrader, ItSc_Fear, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´ANGST´: 1 schwarze Perle.");	};		
	if (spell == SPL_IceCube)				{	PLAYER_TALENT_RUNES[SPL_IceCube] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_IceCube, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´EISBLOCK´: 1 Gletscher Quartz und 1 Aquamarin.");	};		
	if (spell == SPL_ChargeZap)				{	PLAYER_TALENT_RUNES[SPL_ChargeZap] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_ThunderBall, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´KUGELBLITZ´: 1 Schwefel und 1 Bergkristall.");	};		
	if (spell == SPL_SummonGolem)			{	PLAYER_TALENT_RUNES[SPL_SummonGolem] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumGol, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune `STEINGOLEM ERSCHAFFEN`:1 Steingolemherz.");	};	
	if (spell == SPL_DestroyUndead)			{	PLAYER_TALENT_RUNES[SPL_DestroyUndead] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_HarmUndead, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´UNTOTE VERNICHTEN´:1 heiliges Wasser .");	};		
	if (spell == SPL_Pyrokinesis)			{	PLAYER_TALENT_RUNES[SPL_Pyrokinesis] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_Pyrokinesis, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune `GROSSER FEUERSTURM´: 1 Schwefel und 1 Zunge eines Feuerwarans.");	};		
	if (spell == SPL_Firestorm)				{	PLAYER_TALENT_RUNES[SPL_Firestorm] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Firestorm, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´FEUERSTURM´: 1 Schwefel und 1 Pech.");	};		
	if (spell == SPL_IceWave)				{	PLAYER_TALENT_RUNES[SPL_IceWave] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_IceWave, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´EISWELLE´: 1 Gletscher Quartz und 1 Aquamarin");	};		
	if (spell == SPL_SummonDemon)			{	PLAYER_TALENT_RUNES[SPL_SummonDemon] 			= TRUE;	CreateInvItems (ScrollTrader, ItSc_SumDemon, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´DÄMON BESCHWÖREN´: 1 Dämonenherz");	};		
	if (spell == SPL_FullHeal)				{	PLAYER_TALENT_RUNES[SPL_FullHeal] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_FullHeal, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´SCHWERE WUNDEN HEILEN´ 1 Heilwurzel");	};	
	if (spell == SPL_Firerain)				{	PLAYER_TALENT_RUNES[SPL_Firerain] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Firerain, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´FEUERREGEN´: 1 Pech und eine Zunge von einem Feuerwaran");	};		
	if (spell == SPL_BreathOfDeath)			{	PLAYER_TALENT_RUNES[SPL_BreathOfDeath]			= TRUE;	CreateInvItems (ScrollTrader, ItSc_BreathOfDeath, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´TODESHAUCH´: 1 Kohle und 1 schwarze Perle");	};		
	if (spell == SPL_MassDeath)				{	PLAYER_TALENT_RUNES[SPL_MassDeath] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_MassDeath, 1);				
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´MASSENTOD´: 1 Skelettknochen und 1 schwarze Perle");	};		
	if (spell == SPL_ArmyOfDarkness)		{	PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] 		= TRUE;	CreateInvItems (ScrollTrader, ItSc_ArmyOfDarkness, 1);			
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´ARMEE DER FINSTERNIS´: 1 Skelettknochen, 1 schwarze Perle, 1 Herz eines Steingolems und 1 Dämonenherz. ");	};		
	if (spell == SPL_Shrink)				{	PLAYER_TALENT_RUNES[SPL_Shrink] 				= TRUE;	CreateInvItems (ScrollTrader, ItSc_Shrink, 1);					
	B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´MONSTER SCHRUMPFEN´: 1 Goblinknochen und 1 Trollzahn");	};		
	
	//Addon
	
	if (spell == SPL_Whirlwind)				{	PLAYER_TALENT_RUNES[SPL_Whirlwind]				= TRUE; CreateInvItems (ScrollTrader, ItSc_Whirlwind, 1);				
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Whirlwind);	};
	if (spell == SPL_WaterFist)				{	PLAYER_TALENT_RUNES[SPL_WaterFist]				= TRUE; CreateInvItems (ScrollTrader, ItSc_Waterfist, 1);				
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Waterfist);	};
	if (spell == SPL_IceLance)				{	PLAYER_TALENT_RUNES[SPL_IceLance]				= TRUE; CreateInvItems (ScrollTrader, ItSc_Icelance, 1);				
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Icelance);	};
	if (spell == SPL_Geyser)				{	PLAYER_TALENT_RUNES[SPL_Geyser]					= TRUE; CreateInvItems (ScrollTrader, ItSc_Geyser, 1);					
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Geyser);	};
	if (spell == SPL_Thunderstorm)			{	PLAYER_TALENT_RUNES[SPL_Thunderstorm]			= TRUE; CreateInvItems (ScrollTrader, ItSc_Thunderstorm, 1);			
	B_LogEntry (TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Thunderstorm);	};
	
	// Scrolls und Runen-Joker fehlen
							
	PrintScreen			(PRINT_LearnRunes, -1, -1, FONT_Screen, 2);
	
	// ------ bei jeder Rune: Runen-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_RUNES, 1);
	return TRUE;
};
