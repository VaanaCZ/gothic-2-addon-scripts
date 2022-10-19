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
	description	 = 	"Na czym polega twoje zadanie?";
};

func int DIA_Oric_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Oric_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Oric_HALLO_15_00"); //Na czym polega twoje zadanie?
	AI_Output (self, other, "DIA_Oric_HALLO_11_01"); //Jestem oficerem strategicznym Króla, aktualnie podlegam wielmo¿nemu kapitanowi Garondowi.
	AI_Output (self, other, "DIA_Oric_HALLO_11_02"); //Jesteœmy ostatnimi paladynami na zamku. Pozostali albo uciekli, albo polegli.
	AI_Output (self, other, "DIA_Oric_HALLO_11_03"); //Naszym zadaniem jest doprowadziæ tê ekspedycjê do szczêœliwego koñca i tak te¿ uczynimy. Na Innosa, tak uczynimy.

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
	description	 = 	"Mam dla ciebie wiadomoœæ.";
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
	AI_Output (other, self, "DIA_Oric_Bruder_15_00"); //Mam dla ciebie wiadomoœæ.
	AI_Output (self, other, "DIA_Oric_Bruder_11_01"); //O co chodzi?
	AI_Output (other, self, "DIA_Oric_Bruder_15_02"); //Twój brat nie ¿yje.
	AI_Output (self, other, "DIA_Oric_Bruder_11_03"); //...mój brat...
	AI_Output (self, other, "DIA_Oric_Bruder_11_04"); //Innos wystawia mnie na ciê¿k¹ próbê. Mój brat zgin¹³ jako jego oddany s³uga.
	AI_Output (self, other, "DIA_Oric_Bruder_11_05"); //Ta wiadomoœæ przeszy³a me serce jak strza³a. Jedynie w modlitwie odnajdê si³ê.
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
	description = "Wybieram siê w okolice kopalni.";
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
	AI_Output (other,self ,"DIA_Oric_ScoutMine_15_00"); //Wybieram siê w okolice kopalni.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_01"); //Uwa¿aj, to nie przelewki. Przede wszystkim, postaraj siê odnaleŸæ paladynów. Dowodz¹ trzema grupami.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_02"); //Jeœli chcesz siê dowiedzieæ wiêcej na ten temat, porozmawiaj z Parcivalem.
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
	description	 = 	"Jak wygl¹da sytuacja?";
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
	
	AI_Output (other, self, "DIA_Oric_Perm_15_00"); //Jak wygl¹da sytuacja?
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_01"); //Musisz odnaleŸæ krety i rudê. Potem zastanowimy siê nad drog¹ odwrotu.
	}
	else if (MIS_ScoutMine == LOG_SUCCESS)
 	{
		AI_Output (self, other, "DIA_Oric_Perm_11_02"); //Ekspedycja ponios³a klêskê. Ale nie poddamy siê, Innos jest z nami. On bezpiecznie wyprowadzi nas z doliny.
	}
	else //noch nicht angenommen
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_03"); //To, ¿e siê pojawi³eœ, daje nam nadziejê.
		AI_Output (self, other, "DIA_Oric_Perm_11_04"); //Potrzebujemy ciê. IdŸ porozmawiaæ z Garondem, on wszystko ci wyjaœni.
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

	description = "Wróci³em.";
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
	AI_Output (other,self ,"DIA_Oric_IAmBack_15_00"); //Wróci³em.
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_01"); //Nie przypuszcza³em, ¿e jeszcze ciê tu zobaczê, szczególnie po tym, co siê sta³o podczas twojej poprzedniej wizyty.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_02"); //W imieniu naszego zakonu, b¹dŸ pozdrowiony.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_03"); //Widzê, ¿e zosta³eœ magiem. Przyjmij wyrazy szacunku.
	};
	
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_04"); //Byæ mo¿e twoje pojawienie siê tutaj to dobry znak.
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

	description = "Czy mogê jakoœ pomóc?";
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
	AI_Output (other,self ,"DIA_Oric_CanHelp_15_00"); //Czy mogê jakoœ pomóc?
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_01"); //Wydaje mi siê, ¿e uczyniliœmy ju¿ wszystko, co by³o mo¿na.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_02"); //Jest jednak pewna sprawa. Móg³byœ siê nam przydaæ poza murami zamku.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_03"); //Planujemy urwaæ ³eb hydrze.
	
	Info_ClearChoices (DIA_Oric_CanHelp);
	Info_AddChoice (DIA_Oric_CanHelp,"Poszukaj lepiej kogoœ innego.",DIA_Oric_CanHelp_NotYourMan); 
	Info_AddChoice (DIA_Oric_CanHelp,"Co przez to rozumiesz?",DIA_Oric_CanHelp_WhatYouMean);

};

FUNC VOID DIA_Oric_CanHelp_NotYourMan ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_NotYourMan_15_00"); //Chyba bêdziecie musieli poszukaæ kogoœ innego.
	AI_Output (self ,other,"DIA_Oric_CanHelp_NotYourMan_11_01"); //Nie mogê sobie pozwoliæ na stracenie chocia¿ jednego obroñcy, jesteœ nasz¹ jedyn¹ nadziej¹.
};

FUNC VOID DIA_Oric_CanHelp_WhatYouMean ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_00"); //Co masz na myœli?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_01"); //Znamy jednego z ich przywódców. Nazywa siê Hosh-Pak.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_02"); //To najbardziej wp³ywowy szaman wœród orków.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_03"); //A czego oczekujecie ode mnie?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_04"); //Musisz go zabiæ.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_05"); //To chyba jakiœ ¿art?!

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_06"); //Jesteœ jedyn¹ osob¹, której mo¿emy powierzyæ tê misjê. Wszyscy inni rycerze s¹ nam potrzebni na miejscu.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_07"); //Panie, nie jest mi ³atwo o to prosiæ. Jednak tylko ty mo¿esz sprostaæ temu zadaniu.
	}
	else
	{	
		AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_08"); //Chcesz nam pomóc, prawda? Wiêc masz okazjê...
	};
	
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_09"); //Namiot Hosh-Paka znajduje siê poza liniami oblê¿enia, na klifie na po³udnie st¹d.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_10"); //Niemal widaæ go z naszych okien.
	

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

	description = "Potrzebujê wyposa¿enia.";
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
	AI_Output (other,self ,"DIA_Oric_NeedStuff_15_00"); //Potrzebujê wyposa¿enia.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_01"); //Niewiele mo¿emy ci zaoferowaæ.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_02"); //Mam tylko to.
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
	Info_AddChoice (DIA_Oric_NeedStuff,"lub 1 eliksir zrêcznoœci",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice (DIA_Oric_NeedStuff,"lub 1 eliksir si³y",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice (DIA_Oric_NeedStuff,"lub 3 eliksiry many",DIA_Oric_NeedStuff_Mana);	
	Info_AddChoice (DIA_Oric_NeedStuff,"3 eliksiry lecznicze",DIA_Oric_NeedStuff_Health); 
};

FUNC VOID DIA_Oric_NeedStuff_Health ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Health_15_00"); //Wezmê mikstury lecznicze.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Health_11_01"); //Doskona³y wybór. Mam nadziejê, ¿e ci siê przydadz¹.
	
	CreateInvItems (self,ItPo_Health_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Mana ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Mana_15_00"); //Wezmê mikstury many.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Mana_11_01"); //Mam nadziejê, ¿e dobrze je wykorzystasz. Niech Innos ciê prowadzi.
	
	CreateInvItems (self,ItPo_Mana_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Strength ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Strength_15_00"); //Wezmê eliksir si³y.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Strength_11_01"); //Proszê, na pewno siê przyda. ¯yczê ci szczêœcia.

	CreateInvItems (self,ItPo_Perm_STR,1);
	B_GiveInvItems (self ,other,ItPo_Perm_STR,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Dexterity ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Dexterity_15_00"); //Wezmê eliksir zrêcznoœci.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Dexterity_11_01"); //Niech twe strza³y nigdy nie chybiaj¹ celu. Proszê.

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

	description = "Nie zamordujê Hosh-Paka jak ostatni tchórz.";
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
	AI_Output (other,self ,"DIA_Oric_NoMurder_15_00"); //Nie zamordujê Hosh-Paka jak ostatni tchórz.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_01"); //Czy zdajesz sobie sprawê w jak trudnej sytuacji siê znajdujemy?
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_02"); //Oblê¿enie trwa, armia orków jest nieugiêta. Nasze zapasy s¹ na wyczerpaniu.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_03"); //Jeœli nie uda nam siê przetransportowaæ rudy na statek, orkowie zetr¹ w py³ ca³e królestwo.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_04"); //Wszystko, czego broniliœmy, zostanie zapomniane.
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
	description = "Dobrze. Zg³adzê Hosh-Paka.";
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
	AI_Output (other,self ,"DIA_Oric_WillHelp_15_00"); //Dobrze. Zg³adzê Hosh-Paka.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_01"); //Mi³o mi to s³yszeæ.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_02"); //Namiot Hosh-Paka stoi na niewielkim klifie. Na pewno ju¿ go widzia³eœ.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_03"); //To niedaleko œcie¿ki prowadz¹cej do kopalni. W cieniu wielkiej góry.
	
	Log_CreateTopic (TOPIC_KillHoshPak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak, LOG_RUNNING);
	B_LogEntry (TOPIC_KillHoshPak,"Orik chce rozprawiæ siê z orkowym szamanem Hosh-Pakiem. Jego namiot znajduje siê na niewielkim klifie niedaleko zamku."); 

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
	description = "Hosh-Pak nie ¿yje.";
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
	AI_Output (other,self ,"DIA_Oric_HoshDead_15_00"); //Hosh-Pak nie ¿yje.
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_01"); //Wspaniale, to powinno zasiaæ zamêt wœród orków. Mo¿e, mimo wszystko, jest jeszcze dla nas nadzieja.
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_02"); //Mam nadziejê, ¿e to wydarzenie pozwoli nam nadrobiæ straty ostatniego tygodnia.
	
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

	description = "Jakieœ wieœci?";
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

	AI_Output (other,self ,"DIA_Oric_AnyNews_15_00"); //Jakieœ wieœci?
	
	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_01"); //Poza tym, ¿e najechali na nas orkowie?
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_02"); //Tak. Jesteœ tu bohaterem. Pozbycie siê smoków to niew¹tpliwie nie³atwe zadanie.
	}
	else if (MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_03"); //Po œmierci Hosh-Paka w orkowych szeregach zapanowa³ chaos.
	}
	else
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_04"); //Orków jest coraz wiêcej, to z³y znak.
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
	description	 = 	"Potrzebujê wiêcej informacji o smokach.";
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
	AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_00"); //Potrzebujê wiêcej informacji o smokach.
	
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_01"); //Jednego uda³o mi siê zg³adziæ. Czy mo¿esz mi powiedzieæ, gdzie szukaæ nastêpnych?
	}
	else if (MIS_KilledDragons != 0) 
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_02"); //Wydaje mi siê, ¿e nie dotar³em jeszcze do wszystkich smoków. Mo¿e coœ usz³o mojej uwadze?
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
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_03"); //W ci¹gu kilku ostatnich dni na zachód od zamku pojawi³o siê wielkie bagno. Jest w tym coœ podejrzanego, nie s¹dzisz?
			B_LogEntry (TOPIC_DRACHENJAGD,"Orik da³ mi wskazówkê: kilka dni temu na zachód od zamku pojawi³o siê wielkie bagno. Ca³a ta sprawa jest doœæ podejrzana."); 
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(Rockdragon))==FALSE)
		&& (Oric_RockdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_04"); //Na po³udnie st¹d, daleko za wulkanem, wznosi siê kamienna forteca.
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_05"); //Nasi szpiedzy donieœli, ¿e jest silnie strze¿ona. Byæ mo¿e tam ukrywa siê jeden ze smoków?
			B_LogEntry (TOPIC_DRACHENJAGD,"Zwiadowcy donieœli Orikowi, ¿e skalna forteca za wulkanem na po³udniu jest dobrze chroniona. Orik podejrzewa, ¿e mo¿e tam przebywaæ smok."); 
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(FireDragon))==FALSE)
		&& (Oric_FiredragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_06"); //Po ostatnim ataku dosz³y mnie wieœci, jakoby jeden ze smoków znikn¹³ gdzieœ na po³udniu, za wulkanem. Wydaje mi siê, ¿e tam powinieneœ skierowaæ swe kroki.
			B_LogEntry (TOPIC_DRACHENJAGD,"Podobno smok, który zaatakowa³ zamek w Górniczej Dolinie, pojawi³ siê póŸniej w okolicach wulkanu."); 
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(IceDragon))==FALSE)
		&& (Oric_IcedragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_07"); //Na zachód st¹d rozci¹ga siê wielka po³aæ pokrytych lodem pustkowi. Nie zdziwi³oby mnie, gdyby jeden ze smoków ukry³ siê w³aœnie tam.
			B_LogEntry (TOPIC_DRACHENJAGD,"Orik twierdzi, ¿e lodowe pustkowie na zachodzie mo¿e byæ siedzib¹ smoka."); 
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_08"); //W tej chwili nie mam dla ciebie ¿adnych informacji.
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
	description = "(Kradzie¿ tego zwoju bêdzie bardzo trudna)";
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

