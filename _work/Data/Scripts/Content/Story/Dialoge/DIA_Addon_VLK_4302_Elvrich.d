///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Elvrich_EXIT   (C_INFO)
{
	npc         = VLK_4302_Addon_Elvrich;
	nr          = 999;
	condition   = DIA_Addon_Elvrich_EXIT_Condition;
	information = DIA_Addon_Elvrich_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Elvrich_PICKPOCKET (C_INFO)
{
	npc			= VLK_4302_Addon_Elvrich;
	nr			= 900;
	condition	= DIA_Addon_Elvrich_PICKPOCKET_Condition;
	information	= DIA_Addon_Elvrich_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Elvrich_PICKPOCKET_Condition()
{
	C_Beklauen (62, 110);
};
 
FUNC VOID DIA_Addon_Elvrich_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Elvrich_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Elvrich_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Elvrich_PICKPOCKET_DoIt);
};

func void DIA_Addon_Elvrich_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Elvrich_PICKPOCKET);
};
	
func void DIA_Addon_Elvrich_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Elvrich_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info BanditsThere
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_BanditsThere		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_BanditsThere_Condition;
	information	 = 	DIA_Addon_Elvrich_BanditsThere_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
var int DIA_Addon_Elvrich_BanditsThere_NoPerm;
func int DIA_Addon_Elvrich_BanditsThere_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Addon_Elvrich_BanditsThere_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_BanditsThere_Info ()
{
	if (Npc_IsDead(BDT_10307_Addon_RangerBandit_M))
	&& (Npc_IsDead(BDT_10308_Addon_RangerBandit_L))	
	&& (Npc_IsDead(BDT_10309_Addon_RangerBandit_L))	
	&& (Npc_IsDead(BDT_10310_Addon_RangerBandit_M))	
	{
		AI_Output	(self, other, "DIA_Addon_Elvrich_BanditsThere_04_00"); //Díky bohùm, banditi jsou pryè. Zachránils mi krk.
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE;
	}
	else
	{
		B_Say (self, other, "$NOTNOW");
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Wer		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_Wer_Condition;
	information	 = 	DIA_Addon_Elvrich_Wer_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Addon_Elvrich_Wer_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info ()
{
	AI_Output (other, self, "DIA_Addon_Elvrich_Wer_15_00"); //Kdo jsi?
	AI_Output (self, other, "DIA_Addon_Elvrich_Wer_04_01"); //Jmenuju se Elvrich. Jdu z mêsta.
	if (MIS_Thorben_BringElvrichBack == LOG_RUNNING)
	{
		AI_Output (other, self, "DIA_Addon_Elvrich_Wer_15_02"); //Mistr Thorben mi âíkal, že jsi zmizel.
	};
	AI_Output (self, other, "DIA_Addon_Elvrich_Wer_04_03"); //Tyhle zatracení šmejdi mê sem dovlekli a drželi mê v zajetí.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_MissingPeople_Condition;
	information	 = 	DIA_Addon_Elvrich_MissingPeople_Info;

	description	 = 	"Ve mêstê se pohâešuje spousta lidí.";
};

func int DIA_Addon_Elvrich_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_Wer))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_MissingPeople_15_00"); //Ve mêstê se pohâešuje spousta lidí.
	AI_Output	(self, other, "DIA_Addon_Elvrich_MissingPeople_04_01"); //O žádnejch pohâešovanejch nic nevím. Mùžu ti akorát âíct, co se stalo MNÊ.
};

///////////////////////////////////////////////////////////////////////
//	Info WhatExactly
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhatExactly		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WhatExactly_Condition;
	information	 = 	DIA_Addon_Elvrich_WhatExactly_Info;

	description	 = 	"Co pâesnê se ti stalo?";
};

func int DIA_Addon_Elvrich_WhatExactly_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_Wer))
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_WhatExactly_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_WhatExactly_15_00"); //A co se ti pâesnê stalo?
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_01"); //Zrovna jsem mêl schùzku se svou dívkou.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_02"); //Jmenuje se Lucia. Chtêli jsme spolu utéct do hor, daleko od mêsta a od têch, co tam žijou.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_03"); //Akorát jsem dorazil na místo srazu, když se z kâoví najednou vynoâili tihle banditi a oba nás zajali.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_04"); //Samozâejmê že jsem bojoval, ale nebylo to k nièemu. Bylo jich moc. Nevidêls je náhodou?

	Info_ClearChoices	(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Co po tobê ty banditi chtêli?", DIA_Addon_Elvrich_WhatExactly_Want );
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Vyprávêj mi o Lucii.", DIA_Addon_Elvrich_WhatExactly_lucia );
};
func void DIA_Addon_Elvrich_WhatExactly_Want ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Want_15_00"); //Co s tebou ti banditi zamýšleli?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Want_04_01"); //Obèas jsem je v noci slyšel, jak se baví. Nic jsem sice z jejich hovoru nepochytil, ale myslím, že z nás chtêli udêlat otroky.

	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Kam tê chtêli odvléct?", DIA_Addon_Elvrich_WhatExactly_Pirates );
};
func void DIA_Addon_Elvrich_WhatExactly_Pirates ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Pirates_15_00"); //Kam tê to vlekli?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_01"); //Nêkam sem na ostrovê Khorinidu, ale myslím, že bez lodi se tam nedá dostat.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_02"); //Odtáhli mê k nêjakýmu kotvišti na pobâeží, kde táboâili nêjací piráti.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_03"); //Jeden z banditù k nim šel vyjednávat. Docela fest se hádali.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_04"); //Myslím, že chtêl, aby nás piráti nêkam odvezli.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_05"); //Ale piráti nechtêli. Tak se banditi stáhli a od tý doby jsme trèeli tady.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_06"); //Âek bych, že to prohráli. A pak jsi pâišel ty.
	
	Elvrich_SCKnowsPirats = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Elvricha, uèedníka khorinidského tesaâe Thorbena, unesli bandité, kteâí se nejspíš spolèili s piráty."); 
	
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Piráti? Tady v Khorinidu?", DIA_Addon_Elvrich_WhatExactly_Here );
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Kde ti  piráti kotví?", DIA_Addon_Elvrich_WhatExactly_pirat );
};
func void DIA_Addon_Elvrich_WhatExactly_Here ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Here_15_00"); //V Khorinidu a piráti?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_01"); //Moc toho o nich nevím. Poprvé jsem je vidêl na tom kotvišti.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_02"); //Vždycky se držej vzadu a jsou to samí v Khorinidu hledaní zloèinci.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_03"); //Bojej se šibenice, a proto se taky nestýkaj s nikým z mêsta.
};
func void DIA_Addon_Elvrich_WhatExactly_lucia ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_lucia_15_00"); //Vyprávêj mi o Lucii.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_lucia_04_01"); //Je to holka z pâístavní ètvrti. Pracovala pro toho dêsnýho Bromora. Je vážnê pêkná.
};
func void DIA_Addon_Elvrich_WhatExactly_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_pirat_15_00"); //Kde mají piráti to kotvištê?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_01"); //Nedaleko khorinidskýho pâístavu.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_02"); //Když se postavíš na pobâeží a budeš koukat na moâe, je to doprava podél pobâeží. Ale potâebuješ loë.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_03"); //První malá zátoka, na kterou narazíš, je to kotvištê, o kterým jsem mluvil.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Zjistil jsem, jak se dostat k pirátskému kotvišti. Když se postavím k molu v khorinidském pâístavu èelem k moâi, musím plavat doprava podél pobâeží."); 

	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, DIALOG_BACK, DIA_Addon_Elvrich_WhatExactly_Back );
};
func void DIA_Addon_Elvrich_WhatExactly_Back ()
{
	Info_ClearChoices	(DIA_Addon_Elvrich_WhatExactly);
};

///////////////////////////////////////////////////////////////////////
//	Info Bromor
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Bromor		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_Bromor_Condition;
	information	 = 	DIA_Addon_Elvrich_Bromor_Info;

	description	 = 	"Bromor tvrdí, že Lucia odešla i se zlatou mísou.";
};

func int DIA_Addon_Elvrich_Bromor_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Bromor_LuciaStoleGold == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_Bromor_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_Bromor_15_00"); //Bromor âíká, že Lucia odešla se zlatou mísou.
	AI_Output	(self, other, "DIA_Addon_Elvrich_Bromor_04_01"); //No, Lucia ji opravdu Bromorovi ukradla, ale banditi jí ji urèitê sebrali.

	Log_CreateTopic (TOPIC_Addon_BromorsGold, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BromorsGold,"Bromorùv zlatý pohár nejspíš teë mají bandité ze severních lesù za Sekobovým statkem."); 
};

///////////////////////////////////////////////////////////////////////
//	Info WhereIsLucia
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhereIsLucia		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information	 = 	DIA_Addon_Elvrich_WhereIsLucia_Info;

	description	 = 	"Kde je Lucie teë?";
};

func int DIA_Addon_Elvrich_WhereIsLucia_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_LuciasLetter != LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_WhereIsLucia_15_00"); //Kde je Lucia teë?
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_01"); //Rozdêlili jsme na velký kâižovatce pâed Onarovým statkem.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_02"); //Banditi Lucii odtáhli do lesa za Sekobovým statkem.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_03"); //Kéž ji Innos ochraàuje.

	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Bandité Lucii unesli až do lesù za Sekobovým statkem kdesi na severu."); 

	SC_KnowsLuciaCaughtByBandits = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWaffen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_FernandosWaffen		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information	 = 	DIA_Addon_Elvrich_FernandosWaffen_Info;

	description	 = 	"Dostali ti bandité, kteâí tê vêznili, zásilku zbraní?";
};

func int DIA_Addon_Elvrich_FernandosWaffen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_FernandosWaffen_15_00"); //Nenesli ti banditi, co tê tu drželi, nêjakou zásobu zbraní?
	AI_Output	(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_01"); //Jojo, bylo jich tolik, že je sotva unesli.
	AI_Output	(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_02"); //Táhli jich celou hromadu a zmizeli smêrem k Sekobovê statku.
	B_GivePlayerXP (XP_Ambient);

	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"Cesta mê zavedla na sever, do lesù za Sekobovým statkem. Nêkde tu prý sídlí bandité, kteâí obdrželi spoustu zbraní."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LuciaLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_LuciaLetter		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Elvrich_LuciaLetter_Condition;
	information	 = 	DIA_Addon_Elvrich_LuciaLetter_Info;

	description	 = 	"Našel jsem dopis od tvé Lucie.";
};

func int DIA_Addon_Elvrich_LuciaLetter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_LuciaLetter_15_00"); //Našel jsem dopis od Lucie.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_01"); //(nadšenê) Cože? Dej ho sem!
	B_UseFakeScroll ();
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_02"); //(zoufale) NE! Tomu nevêâím! Ne, tomu prostê nemùžu uvêâit.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_03"); //(zoufale) Pâece mê takhle neopustí!
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_04"); //(zoufale) Vem si ten dopis, nechci ho. Pevnê vêâím, že se ke mnê jednou pâece jenom vrátí.
	
	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Elvrich nechce vêâit, že Lucie odešla s bandity dobrovolnê. Stále doufá, že se vrátí, a to i pâesto, že mu poslala dopis na rozlouèenou."); 

	B_GivePlayerXP (XP_Addon_LuciasLetter);
	MIS_LuciasLetter = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info WasNun
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WasNun		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WasNun_Condition;
	information	 = 	DIA_Addon_Elvrich_WasNun_Info;
	permanent	 = 	FALSE;

	description	 = 	"Mêl by ses rychle vrátit do mêsta!";
};

func int DIA_Addon_Elvrich_WasNun_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhereIsLucia))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info ()
{
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_00"); //Mêl by ses rychle vrátit do mêsta.
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_01"); //Co jinýho mùžu dêlat? Vrátím se rovnou k mistru Thorbenovi.
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_02"); //Podíváš se po têch banditech?
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_03"); //No ano, myslím, že jo.
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_04"); //Kdybys našel Lucii, pâivedeš ji do mêsta, že jo?
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_05"); //Uvidím, co se dá dêlat.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich se vrátil zpátky ke svému mistrovi, tesaâi Thorbenovi."); 

	Elvrich_GoesBack2Thorben = TRUE;
	Npc_ExchangeRoutine	(self,"BACKINTHECITY");
	EquipItem	(self, ItMw_1h_Bau_Mace);
};

///////////////////////////////////////////////////////////////////////
// PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_PERM		(C_INFO)
{
	npc		 	= VLK_4302_Addon_Elvrich;
	nr		 	= 5;
	condition	= DIA_Addon_Elvrich_PERM_Condition;
	information	= DIA_Addon_Elvrich_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Addon_Elvrich_PERM_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (MIS_LuciasLetter != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Elvrich_PERM_Info ()
{
	AI_Output (self, other, "DIA_Addon_Elvrich_PERM_04_00"); //Díky za záchranu!
};


