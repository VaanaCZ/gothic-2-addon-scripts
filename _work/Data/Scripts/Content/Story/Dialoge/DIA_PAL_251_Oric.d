///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Oric_EXIT   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 999;
	condition   = DIA_Oric_EXIT_Condition;
	information = DIA_Oric_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Oric_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_HALLO		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_HALLO_Condition;
	information	 = 	DIA_Oric_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"Co je tvoje práce?";
};

func int DIA_Oric_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Oric_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Oric_HALLO_15_00"); //Co máš za úkol?
	AI_Output (self, other, "DIA_Oric_HALLO_11_01"); //Jsem královský důstojník pro strategické záležitosti a momentálnę podléhám velení ctihodného velitele Garonda.
	AI_Output (self, other, "DIA_Oric_HALLO_11_02"); //Jsme poslední paladinové tady na hradę. Všichni ostatní odešli nebo padli.
	AI_Output (self, other, "DIA_Oric_HALLO_11_03"); //Na našich bedrech teë spočívá úspęch celé výpravy. A my se o to postaráme. U Innose - postaráme se o to.

};

///////////////////////////////////////////////////////////////////////
//	Info Bruder
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Bruder		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_Bruder_Condition;
	information	 = 	DIA_Oric_Bruder_Info;
	permanent	 =  FALSE;
	description	 = 	"Mám pro tebe zprávu.";
};

func int DIA_Oric_Bruder_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Jergan_Burg)
	&& Npc_KnowsInfo (other, DIA_Oric_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Oric_Bruder_Info ()
{
	AI_Output (other, self, "DIA_Oric_Bruder_15_00"); //Mám pro tebe zprávu.
	AI_Output (self, other, "DIA_Oric_Bruder_11_01"); //Co je?
	AI_Output (other, self, "DIA_Oric_Bruder_15_02"); //Tvůj bratr zemâel. Dostal se až do průsmyku.
	AI_Output (self, other, "DIA_Oric_Bruder_11_03"); //(šeptá)...můj bratr
	AI_Output (self, other, "DIA_Oric_Bruder_11_04"); //Innos mę krutę zkouší. Ale zemâel jako jeho služebník...
	AI_Output (self, other, "DIA_Oric_Bruder_11_05"); //Tahle zpráva je jako šíp, který se mi zabodává do srdce. Budu hledat novou sílu v modlitbách.
	OricBruder = TRUE;
	
	B_GivePlayerXP (XP_Ambient);
};

	
//*****************************************
//	Minen Auftrag
//*****************************************

INSTANCE DIA_Oric_ScoutMine   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 1;
	condition   = DIA_Oric_ScoutMine_Condition;
	information = DIA_Oric_ScoutMine_Info;
	permanent   = FALSE;
	description = "Mám se vydat k dolům.";
};

FUNC INT DIA_Oric_ScoutMine_Condition()
{
	if 	(MIS_ScoutMine == LOG_RUNNING)
	&&	(Kapitel < 3)
	&& 	(Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&&  (Fajeth_Ore == FALSE)
	&&  (Marcos_Ore == FALSE)
	&&  (Silvestro_Ore == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_ScoutMine_Info()
{
	AI_Output (other,self ,"DIA_Oric_ScoutMine_15_00"); //Mám se vydat k dolům.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_01"); //Dej si pozor, nebude to žádná hračka. Nejdâíve ze všeho vyhledej paladiny. Oni vedou ty tâi skupiny.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_02"); //Pokud bys o tom chtęl vędęt víc, promluv si s Parcivalem.
};	
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Perm		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	99;
	condition	 = 	DIA_Oric_Perm_Condition;
	information	 = 	DIA_Oric_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak se vede?";
};

func int DIA_Oric_Perm_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Oric_Perm_Info ()
{
	
	AI_Output (other, self, "DIA_Oric_Perm_15_00"); //Jak to vypadá?
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_01"); //Musíš najít všechny horníky a navíc i jejich rudu. Potom zkusíme pâijít na způsob, jak tohle údolí opustit.
	}
	else if (MIS_ScoutMine == LOG_SUCCESS)
 	{
		AI_Output (self, other, "DIA_Oric_Perm_11_02"); //Nadęje výpravy klesly na úplné dno. Ale nevzdáme to, protože Innos je s námi. Vyvede nás bezpečnę z údolí.
	}
	else //noch nicht angenommen
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_03"); //Tvůj pâíchod je pro nás znamením nadęje.
		AI_Output (self, other, "DIA_Oric_Perm_11_04"); //Potâebujeme tę. Bęž si promluvit s Garondem - on ti všechno vysvętlí.
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Oric_KAP3_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP3_EXIT_Condition;
	information	= DIA_Oric_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Oric_KAP4_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP4_EXIT_Condition;
	information	= DIA_Oric_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*****************************************
//	Kann ich irgendwie helfen?
//*****************************************

INSTANCE DIA_Oric_IAmBack   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_IAmBack_Condition;
	information = DIA_Oric_IAmBack_Info;

	description = "Už jsem zpęt.";
};

FUNC INT DIA_Oric_IAmBack_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_HALLO))
		{
				return TRUE;
		};
};

FUNC VOID DIA_Oric_IAmBack_Info()
{
	AI_Output (other,self ,"DIA_Oric_IAmBack_15_00"); //Už jsem zpęt.
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_01"); //Nikdy bych neâekl, že tę tu ještę uvidím - ne potom, čeho jsem byl svędkem, když jsi tu byl pâed nękolika dny.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_02"); //Vítám tę jménem našeho âádu.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_03"); //Vidím, že se z tebe stal mág. Máš mé uznání.
	};
	
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_04"); //Kéž by byl tvůj pâíchod dobrým znamením.
};

//***********************************************
//	Kann ich helfen?
//***********************************************

INSTANCE DIA_Oric_CanHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_CanHelp_Condition;
	information = DIA_Oric_CanHelp_Info;

	description = "Mohu nęjak pomoci?";
};

FUNC INT DIA_Oric_CanHelp_Condition()
{
	if 	(Kapitel >= 4)
	&&	(Npc_KnowsInfo (other,DIA_Oric_IAmBack))
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_15_00"); //Mohu nęjak pomoci?
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_01"); //Momentálnę se zdá, že jsme udęlali všechno, co bylo v našich silách.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_02"); //Ale pâesto je tady jedna vęc. Nęco velice důležitého, co bys pro nás mohl udęlat vnę tęchto zdí.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_03"); //Chceme useknout hadovi jeho hlavu.
	
	Info_ClearChoices (DIA_Oric_CanHelp);
	Info_AddChoice (DIA_Oric_CanHelp,"Myslím, že se budeš muset poohlédnout po nękom jiném.",DIA_Oric_CanHelp_NotYourMan); 
	Info_AddChoice (DIA_Oric_CanHelp,"Co tím myslíš?",DIA_Oric_CanHelp_WhatYouMean);

};

FUNC VOID DIA_Oric_CanHelp_NotYourMan ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_NotYourMan_15_00"); //Myslím, že byste si męli najít nękoho jiného.
	AI_Output (self ,other,"DIA_Oric_CanHelp_NotYourMan_11_01"); //Nemůžu postrádat jediného ze svých lidí - jsi naše jediná nadęje.
};

FUNC VOID DIA_Oric_CanHelp_WhatYouMean ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_00"); //Co tím myslíš?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_01"); //Víme o jednom z jejich vůdců. Jmenuje se Hosh-Pak.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_02"); //Je to jeden z nejvlivnęjších šamanů mezi skâety.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_03"); //A co mám udęlat?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_04"); //Zabij ho.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_05"); //Žertuješ!?

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_06"); //Jsi jediný, koho můžeme postrádat. Všechny ostatní rytíâe potâebujeme tady.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_07"); //Není pro mę snadné chtít po tobę nęco takového, mistâe. Ale jsi pro tenhle úkol nejvhodnęjší ze všech.
	}
	else
	{	
		AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_08"); //Chceš nám pâece pomoci, ne? V tom pâípadę...
	};
	
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_09"); //Hosh-Pakův stan je za nepâátelskou linií, na ostrohu na jih odsud.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_10"); //Skoro ho můžeš vidęt z okna.
	

	Info_ClearChoices (DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};

//***********************************************
//	Ich brauche noch Ausrüstung.
//***********************************************

INSTANCE DIA_Oric_NeedStuff   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 6;
	condition   = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;

	description = "Budu potâebovat nęco výbavy.";
};

FUNC INT DIA_Oric_NeedStuff_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NeedStuff_Info()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_15_00"); //Budu potâebovat pár vęcí.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_01"); //Už toho nemáme moc, co bychom ti mohli dát.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_02"); //No, ale mohu ti nabídnout toto.
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
	Info_AddChoice (DIA_Oric_NeedStuff,"nebo 1 elixír obratnosti",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice (DIA_Oric_NeedStuff,"nebo 1 elixír síly",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice (DIA_Oric_NeedStuff,"nebo 3 elixíry many",DIA_Oric_NeedStuff_Mana);	
	Info_AddChoice (DIA_Oric_NeedStuff,"3 elixíry hojivé síly",DIA_Oric_NeedStuff_Health); 
};

FUNC VOID DIA_Oric_NeedStuff_Health ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Health_15_00"); //Vezmu si ty léčivé lektvary.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Health_11_01"); //Dobrá volba. Aă ti jsou k užitku.
	
	CreateInvItems (self,ItPo_Health_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Mana ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Mana_15_00"); //Vezmu si ty lektvary s manou.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Mana_11_01"); //Doufám, že ti pomohou. Nechă tę Innos ochraŕuje.
	
	CreateInvItems (self,ItPo_Mana_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Strength ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Strength_15_00"); //Vezmu si elixír síly.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Strength_11_01"); //Tady je, určitę se ti bude hodit. Pâeji ti hodnę štęstí.

	CreateInvItems (self,ItPo_Perm_STR,1);
	B_GiveInvItems (self ,other,ItPo_Perm_STR,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Dexterity ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Dexterity_15_00"); //Vezmu si elixír obratnosti.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Dexterity_11_01"); //Nechă tvoje šípy nikdy neminou cíl. Tady ho máš.

	CreateInvItems (self,ItPo_Perm_DEX,1);
	B_GiveInvItems (self ,other,ItPo_Perm_DEX,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

//***********************************************
//	ich werde keinen feigen Mord begehen.
//***********************************************

INSTANCE DIA_Oric_NoMurder   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 7;
	condition   = DIA_Oric_NoMurder_Condition;
	information = DIA_Oric_NoMurder_Info;

	description = "Nezavraždím Hosh-Paka tak zbabęlým způsobem.";
};

FUNC INT DIA_Oric_NoMurder_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NoMurder_Info()
{
	AI_Output (other,self ,"DIA_Oric_NoMurder_15_00"); //Nezavraždím Hosh-Paka tak zbabęlým způsobem.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_01"); //Dokážeš si vůbec pâedstavit, v jak strašné pozici se nacházíme?
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_02"); //Obléhá nás obrovská armáda skâetů. Docházejí nám zásoby.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_03"); //Pokud se nám nepodaâí dostat rudu na loë, zpustoší skâeti celé království.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_04"); //Všechno bude zničeno.
};

//***********************************************
//	Ich werde dir helfen
//***********************************************

INSTANCE DIA_Oric_WillHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 5;
	condition   = DIA_Oric_WillHelp_Condition;
	information = DIA_Oric_WillHelp_Info;
	permanent   = FALSE;
	description = "Dobrá. Zabiju Hosh-Paka.";
};

FUNC INT DIA_Oric_WillHelp_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	MIS_KillHoshPak == FALSE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_WillHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_WillHelp_15_00"); //Dobrá. Zabiju Hosh-Paka.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_01"); //To rád slyším.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_02"); //Hosh-Pakův stan je na malém ostrohu. Už jsi ho musel vidęt.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_03"); //Není daleko od cesty vedoucí k našemu dolu. Pâímo ve stínu té velké hory.
	
	Log_CreateTopic (TOPIC_KillHoshPak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak, LOG_RUNNING);
	B_LogEntry (TOPIC_KillHoshPak,"Oric chce, abych odstranil skâetího šamana Hosh-Paka. Jeho stan najdu na malém útesu kousek za hradem."); 

	MIS_KillHoshPak = LOG_RUNNING;
};

//***********************************************
//	Hosh-Pak ist tot!
//***********************************************

INSTANCE DIA_Oric_HoshDead   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 8;
	condition   = DIA_Oric_HoshDead_Condition;
	information = DIA_Oric_HoshDead_Info;
	permanent   = FALSE;
	description = "Hosh-Pak je mrtvý!";
};

FUNC INT DIA_Oric_HoshDead_Condition()
{
	if 	(Npc_IsDead (Hosh_Pak))
	&& 	(MIS_KillHoshPak == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_HoshDead_Info()
{
	AI_Output (other,self ,"DIA_Oric_HoshDead_15_00"); //Hosh-Pak je mrtvý!
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_01"); //Výbornę, to by męlo zasadit skâetům slušnou ránu. Možná máme pâece jenom nęjakou šanci.
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_02"); //Myslím, že bychom tím męli získat alespoŕ týden času.
	
	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillHosh_Pak);
};



//***********************************************
//	Irgendwelche Neuigkeiten?
//***********************************************

INSTANCE DIA_Oric_AnyNews   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 9;
	condition   = DIA_Oric_AnyNews_Condition;
	information = DIA_Oric_AnyNews_Info;
	permanent	 = 	TRUE;

	description = "Co je nového?";
};

FUNC INT DIA_Oric_AnyNews_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_AnyNews_Info()
{

	AI_Output (other,self ,"DIA_Oric_AnyNews_15_00"); //Co je nového?
	
	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_01"); //Myslíš kromę toho, že nás napadli skâeti?
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_02"); //Ano. Jsi náš hrdina. Zabít všechny draky není žádná procházka růžovým sadem, âekl bych.
	}
	else if (MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_03"); //Zdá se, že skâetů se hluboce dotkla Hosh-Pakova smrt.
	}
	else
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_04"); //Skâetů je čím dál tím víc. To není dobré.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_DragonPlettBericht		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	3;
	condition	 = 	DIA_Oric_DragonPlettBericht_Condition;
	information	 = 	DIA_Oric_DragonPlettBericht_Info;
	permanent	 = 	TRUE;
	description	 = 	"Potâebuju víc informací o dracích.";
};

func int DIA_Oric_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	&& (MIS_AllDragonsDead == FALSE)
	{
		return TRUE;
	};
};

var int Oric_SwampdragonInfo_OneTime;
var int Oric_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Oric_DragonCounter;
var int Oric_FirstQuestion;
func void DIA_Oric_DragonPlettBericht_Info ()
{
	AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_00"); //Potâebuju víc informací o dracích.
	
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_01"); //Jednoho jsem už zabil. Můžeš mi âíct, kde najdu ty ostatní?
	}
	else if (MIS_KilledDragons != 0) 
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_02"); //Mám pocit, že jsem se ještę nedostal ke všem drakům. Že bych nęco pâehlédl?
	};
	
	if ((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE))
	&& 	((Oric_SwampdragonInfo_OneTime == FALSE)
		||	(Oric_RockdragonInfo_OneTime == FALSE)
		||	(Oric_FiredragonInfo_OneTime == FALSE)
		||	(Oric_IcedragonInfo_OneTime == FALSE))
	{
		if ((Npc_IsDead(Swampdragon))== FALSE)
		&& (Oric_SwampdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_03"); //Na západ od starého hradu vznikla bęhem nękolika posledních dnů velká bažina. Nezdá se ti to nęjak podezâelé?
			B_LogEntry (TOPIC_DRACHENJAGD,"Oric mi dal aspoŕ nęjakou stopu: západnę od hradu se pâed nękolika dny zničehonic objevila hluboká bažina. To je opravdu podezâelé."); 
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(Rockdragon))==FALSE)
		&& (Oric_RockdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_04"); //Daleko za sopkou na jihu je skalní pevnost.
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_05"); //Naši špehové hlásí, že ta pevnost je silnę stâežená. Možná se tam ukrývá jeden z nich.
			B_LogEntry (TOPIC_DRACHENJAGD,"Paladinští zvędové sdęlili Oricovi, že kamenná tvrz za sopkou na jihu je silnę stâežena. Oric se domnívá, že tam nękde bude i drak."); 
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(FireDragon))==FALSE)
		&& (Oric_FiredragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_06"); //Když draci naposledy zaútočili, âíkalo se, že jeden zmizel poblíž sopky na jih odsud. Męl bys to tam prozkoumat.
			B_LogEntry (TOPIC_DRACHENJAGD,"Poslední drak, který napadl hrad v Hornickém údolí, byl poté spatâen poblíž sopky."); 
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(IceDragon))==FALSE)
		&& (Oric_IcedragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_07"); //Na západ odsud je zamrzlý kraj. Nepâekvapilo by mę, kdyby se tam ukrýval jeden z draků.
			B_LogEntry (TOPIC_DRACHENJAGD,"Podle Orica by drak mohl sídlit v zamrzlé oblasti na západę."); 
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_08"); //V tuto chvíli pro tebe bohužel nic nemám.
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Oric_KAP5_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP5_EXIT_Condition;
	information	= DIA_Oric_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Oric_KAP6_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP6_EXIT_Condition;
	information	= DIA_Oric_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Oric_PICKPOCKET (C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 900;
	condition	= DIA_Oric_PICKPOCKET_Condition;
	information	= DIA_Oric_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Krádež tohoto svitku bude zatracenę tęžká.)";
};                       

FUNC INT DIA_Oric_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (85 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Oric_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Oric_PICKPOCKET);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_BACK 		,DIA_Oric_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Oric_PICKPOCKET_DoIt);
};

func void DIA_Oric_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 85)
	{
		B_GiveInvItems (self, other, ITSc_PalRepelEvil, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Oric_PICKPOCKET);
	}
	else
	{	
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Oric_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Oric_PICKPOCKET);
};

