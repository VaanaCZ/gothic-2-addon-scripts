///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nadja_EXIT   (C_INFO)
{
	npc         = VLK_435_Nadja;
	nr          = 999;
	condition   = DIA_Nadja_EXIT_Condition;
	information = DIA_Nadja_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nadja_EXIT_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Nadja_PICKPOCKET (C_INFO)
{
	npc			= VLK_435_Nadja;
	nr			= 900;
	condition	= DIA_Nadja_PICKPOCKET_Condition;
	information	= DIA_Nadja_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Nadja_PICKPOCKET_Condition()
{
	C_Beklauen (40, 40);
};
 
FUNC VOID DIA_Nadja_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nadja_PICKPOCKET);
	Info_AddChoice		(DIA_Nadja_PICKPOCKET, DIALOG_BACK 		,DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nadja_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nadja_PICKPOCKET);
};
	
func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nadja_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_STANDARD		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_STANDARD_Condition;
	information	 = 	DIA_Nadja_STANDARD_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Nadja_STANDARD_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Bromor_Pay == FALSE)
	{
		return TRUE;
	};
};
var int Nadja_LuciaInfo;
func void DIA_Nadja_STANDARD_Info ()
{
	if (Nadja_LuciaInfo == TRUE)
	{
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_00"); //Napâed si promluv s Bromorem, teprve pak se s tebou mùžu bavit.
	}
	else
	{
		AI_Output (self, other, "DIA_Nadja_STANDARD_16_00"); //Hele, teë zrovna se ti nemùžu vênovat, fešáku. Jestli se chceš pobavit, promluv si s Bromorem.
	};
	
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	&& (Nadja_LuciaInfo == FALSE) 
	{
		AI_Output (other, self, "DIA_ADDON_Nadja_STANDARD_15_01"); //Jen jsem ti chtêl položit pár otázek ohlednê têch zmizelých lidí.
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_02"); //Nêco ti âíct mùžu, ale tady ne, zlato.
		AI_Output (other, self, "DIA_ADDON_Nadja_STANDARD_15_03"); //Pojëme nahoru.
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_04"); //Fajn, ale napâed si to urovnej s Bromorem. Nechci mít žádný problémy.
		Nadja_LuciaInfo = TRUE;
	};	
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Danach		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  2;
	condition	 = 	DIA_Nadja_Danach_Condition;
	information	 = 	DIA_Nadja_Danach_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Nadja_Danach_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Bromor_Pay == FALSE)
	&& (Nadja_Nacht == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Nadja_Danach_Info ()
{
	AI_Output (self, other, "DIA_Nadja_Danach_16_00"); //Pâíštê pâijë zase!
	Nadja_Nacht = FALSE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_hochgehen		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_hochgehen_Condition;
	information	 = 	DIA_Nadja_hochgehen_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
	description	 =	"Pojëme nahoru!";
};

func int DIA_Nadja_hochgehen_Condition ()
{	
	if (Bromor_Pay == 1)
	{
		return TRUE;
	};
};
func void DIA_Nadja_hochgehen_Info ()
{
	AI_Output (other, self, "DIA_Nadja_hochgehen_15_00"); //Pojëme nahoru!
	AI_Output (self, other, "DIA_Nadja_hochgehen_16_01"); //Dneska máš šãastný den, fešáku. Pojëme.
	
	Bromor_Pay = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"DANCE");
};
///////////////////////////////////////////////////////////////////////
//	Info LuciaInfo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nadja_LuciaInfo		(C_INFO)
{
	npc		 = 	VLK_435_Nadja;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nadja_LuciaInfo_Condition;
	information	 = 	DIA_Addon_Nadja_LuciaInfo_Info;

	description	 = 	"Mùžeme si teë pomluvit?";
};
func int DIA_Addon_Nadja_LuciaInfo_Condition ()
{
	if (Bromor_Pay == 2)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) 
	&& (Nadja_LuciaInfo == TRUE)
		{
			return TRUE;
		};
};
var int Nadja_GaveLuciaInfo;
func void DIA_Addon_Nadja_LuciaInfo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_15_00"); //Tak TEË už si mùžeme promluvit?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_01"); //Tady už máme dostateèné soukromí.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_02"); //Bromor nemá rád, když v práci klábosíme s hostama a on z toho nic nemá.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_03"); //Tak ty by ses rád dozvêdêl nêco o têch lidech, co zmizeli tady v pâístavu?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_04"); //Asi ti moc nepomùžu, ale aspoà ti mùžu âíct, co se stalo s Lucií.

	Nadja_GaveLuciaInfo = TRUE;
	
	Info_ClearChoices	(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "A kam zmizela?", DIA_Addon_Nadja_LuciaInfo_wo );
	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Vyprávêj mi o Lucii.", DIA_Addon_Nadja_LuciaInfo_lucia );
};
func void DIA_Addon_Nadja_LuciaInfo_lucia ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_00"); //Tak mi povêz nêco o Lucii.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_01"); //Nikdo tu nelituje, že odešla.
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_02"); //Proè?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_03"); //Myslím, že tady nikomu k nièemu nebyla.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_04"); //Byla to fakt mrcha!
};
func void DIA_Addon_Nadja_LuciaInfo_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_wo_15_00"); //A kam tedy zmizela?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_01"); //Èasto se scházela s Elvrichem, uènêm tesaâe Thorbena z dolní èásti mêsta.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_02"); //Vsadím se, že utekla s tím mladíkem.

	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Prostitutka Lucia jedné noci náhle zmizela. Všichni si myslí, že uprchla s Elvrichem, uèedníkem tesaâe Thorbena."); 

	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "A kam ti dva mohli zmizet?", DIA_Addon_Nadja_LuciaInfo_Elvrich );
};
func void DIA_Addon_Nadja_LuciaInfo_Elvrich ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00"); //A kam se ti dva mohli ztratit?
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01"); //Jestli je nesežrali vlci, nejspíš zùstali u nêjakýho sedláka.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02"); //Kam jinam mohli jít?

	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Víš ještê nêco dalšího?", DIA_Addon_Nadja_LuciaInfo_sonst );
};
func void DIA_Addon_Nadja_LuciaInfo_sonst ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_sonst_15_00"); //Víš ještê nêco dalšího?
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_01"); //Povídá se, že tady v pâístavu zmizela spousta lidí.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_02"); //Ale nevím jistê, jestli jim vêâit.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_03"); //Mêl by sis promluvit s kupci tady dole.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_04"); //Víc už ti bohužel nepovím.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_05"); //A co my dva, zlato? Koneckoncù jsi za to zaplatil.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_06"); //Nechceš se trochu pobavit, ještê než pùjdeš?

	Info_ClearChoices (DIA_Addon_Nadja_LuciaInfo);
	
	//Zusatz 
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (Knows_Borka_Dealer == FALSE)
	{
		
		Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,PRINT_Addon_NadjaWait,DIA_Addon_Nadja_WAIT);
	};
	Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,"Díky, ale už musím jít.",DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,"Proè ne?",DIA_Nadja_Poppen_Start);
};
func void DIA_Addon_Nadja_LuciaInfo_weiter ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_weiter_15_00"); //Díky, ale už musím jít.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_weiter_16_01"); //Škoda. Tak možná pâíštê.
	
	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht +1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices (DIA_Addon_Nadja_LuciaInfo);
};


///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Poppen	(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_Poppen_Condition;
	information	 = 	DIA_Nadja_Poppen_Info;
	permanent	 = 	TRUE;
	description  = "(Užijem si)";
};

func int DIA_Nadja_Poppen_Condition ()
{	
	if (Bromor_Pay == 2)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 300) 
	
	/* Das ist böse - wenn ich direkt mit Bromor spreche passiert nix mehr. M.F.
	&&  (
		((Nadja_LuciaInfo != 0) && (Nadja_GaveLuciaInfo == 0))
		|| (Nadja_GaveLuciaInfo == TRUE)
		)
	*/	
	
	{
		return TRUE;
	};
};
func void DIA_Nadja_Poppen_Info ()
{
	AI_Output (self, other, "DIA_Nadja_Poppen_16_00"); //Dalších pár hodin patâí jen a jen nám.
	AI_Output (self, other, "DIA_Nadja_Poppen_16_01"); //Jen se hezky uvolni. Lehni si a užij si to!

	Info_ClearChoices (DIA_Nadja_Poppen);
	Info_AddChoice (DIA_Nadja_Poppen,"Fajn...",DIA_Nadja_Poppen_Start);
};
FUNC VOID DIA_Nadja_Poppen_Start()
{
	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht +1);
	
	PlayVideo ("LOVESCENE.BIK");
		
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	/*	
	if Wld_IsTime (00,00,06,00)
	{
		Wld_SetTime (09,00);
	}
	else if Wld_IsTime (06,00,12,00)
	{
		Wld_SetTime (15,00);
	}
	else if Wld_IsTime (12,00,18,00)
	{
		Wld_SetTime (21,00);
	}
	else 
	{
		Wld_SetTime (03,00);	
	};
	*/
	
};

func void DIA_Addon_Nadja_LuciaInfo_Pop ()
{
	DIA_Nadja_Poppen_Start ();
};

///////////////////////////////////////////////////////////////////////
//	Info BUYHERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_BUYHERB		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 = 	2;
	condition	 = 	DIA_Nadja_BUYHERB_Condition;
	information	 = 	DIA_Nadja_BUYHERB_Info;
	permanent	 =	TRUE;
	description	 = 	"Kde bych tu koupil nêjakou trávu?";
};
func int DIA_Nadja_BUYHERB_Condition ()
{	
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&& (Npc_KnowsInfo (other,DIA_Nadja_WANT_HERB) == FALSE)
	&& (Nadja_Money == FALSE)
	&& (Undercover_Failed == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Nadja_BUYHERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Nadja_BUYHERB_15_00"); //Kde bych tu koupil nêjaké drogy?
	
	if  (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 500) 
	{	
		if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
		{
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_01"); //Jak to mám vêdêt? A i kdybych to vêdêla, urèitê bych to neâekla nêkomu od mêstské stráže.
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_02"); //Jestli ti vážnê mám nêco âíct, budeš se muset vytasit s àákou tou škvárou.
			AI_Output (other, self, "DIA_Nadja_BUYHERB_15_03"); //Kolik chceš?
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_04"); //Spravilo by to 50 zlaãákù.
			Nadja_Money = TRUE;
		};
	}
	else 
	{
		B_Say	(self, other,"$NOTNOW");
	};
};
///////////////////////////////////////////////////////////////////////
//	Info WANT_HERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_WANT_HERB		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 = 	2;
	condition	 = 	DIA_Nadja_WANT_HERB_Condition;
	information	 = 	DIA_Nadja_WANT_HERB_Info;
	permanent	 =  FALSE;
	description	 = 	"Tak teë mi âekni, kde bych mohl koupit nêjakou trávu (zaplatit 50 zlaãákù).";
};
func int DIA_Nadja_WANT_HERB_Condition ()
{	
	if 	(Npc_HasItems (other, ITmi_Gold) >= 50)
	&&  (Nadja_Money == TRUE)		
	&&  (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Nadja_WANT_HERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	AI_Output (other, self, "DIA_Nadja_WANT_HERB_15_00"); //A teë mi povêz, kde bych tu drogu koupil.
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Nadja_WANT_HERB_16_01"); //Je mi líto, ale prostê si to nepamatuju.
	}
	else
	{
		B_GiveInvItems	(other, self, ItMi_Gold, 50); 
		AI_Output (self, other, "DIA_Nadja_WANT_HERB_16_02"); //Promluv si s Borkou, fešáku. Ten by pro tebe mohl nêco mít.
		Knows_Borka_Dealer = TRUE;
	};
};




 












