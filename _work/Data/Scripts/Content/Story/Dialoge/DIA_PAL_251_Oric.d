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
	AI_Output (self, other, "DIA_Oric_HALLO_11_01"); //Jestem oficerem strategicznym Kr�la, aktualnie podlegam wielmo�nemu kapitanowi Garondowi.
	AI_Output (self, other, "DIA_Oric_HALLO_11_02"); //Jeste�my ostatnimi paladynami na zamku. Pozostali albo uciekli, albo polegli.
	AI_Output (self, other, "DIA_Oric_HALLO_11_03"); //Naszym zadaniem jest doprowadzi� t� ekspedycj� do szcz�liwego ko�ca i tak te� uczynimy. Na Innosa, tak uczynimy.

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
	description	 = 	"Mam dla ciebie wiadomo��.";
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
	AI_Output (other, self, "DIA_Oric_Bruder_15_00"); //Mam dla ciebie wiadomo��.
	AI_Output (self, other, "DIA_Oric_Bruder_11_01"); //O co chodzi?
	AI_Output (other, self, "DIA_Oric_Bruder_15_02"); //Tw�j brat nie �yje.
	AI_Output (self, other, "DIA_Oric_Bruder_11_03"); //...m�j brat...
	AI_Output (self, other, "DIA_Oric_Bruder_11_04"); //Innos wystawia mnie na ci�k� pr�b�. M�j brat zgin�� jako jego oddany s�uga.
	AI_Output (self, other, "DIA_Oric_Bruder_11_05"); //Ta wiadomo�� przeszy�a me serce jak strza�a. Jedynie w modlitwie odnajd� si��.
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
	description = "Wybieram si� w okolice kopalni.";
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
	AI_Output (other,self ,"DIA_Oric_ScoutMine_15_00"); //Wybieram si� w okolice kopalni.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_01"); //Uwa�aj, to nie przelewki. Przede wszystkim, postaraj si� odnale�� paladyn�w. Dowodz� trzema grupami.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_02"); //Je�li chcesz si� dowiedzie� wi�cej na ten temat, porozmawiaj z Parcivalem.
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
	description	 = 	"Jak wygl�da sytuacja?";
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
	
	AI_Output (other, self, "DIA_Oric_Perm_15_00"); //Jak wygl�da sytuacja?
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_01"); //Musisz odnale�� krety i rud�. Potem zastanowimy si� nad drog� odwrotu.
	}
	else if (MIS_ScoutMine == LOG_SUCCESS)
 	{
		AI_Output (self, other, "DIA_Oric_Perm_11_02"); //Ekspedycja ponios�a kl�sk�. Ale nie poddamy si�, Innos jest z nami. On bezpiecznie wyprowadzi nas z doliny.
	}
	else //noch nicht angenommen
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_03"); //To, �e si� pojawi�e�, daje nam nadziej�.
		AI_Output (self, other, "DIA_Oric_Perm_11_04"); //Potrzebujemy ci�. Id� porozmawia� z Garondem, on wszystko ci wyja�ni.
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

	description = "Wr�ci�em.";
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
	AI_Output (other,self ,"DIA_Oric_IAmBack_15_00"); //Wr�ci�em.
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_01"); //Nie przypuszcza�em, �e jeszcze ci� tu zobacz�, szczeg�lnie po tym, co si� sta�o podczas twojej poprzedniej wizyty.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_02"); //W imieniu naszego zakonu, b�d� pozdrowiony.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_03"); //Widz�, �e zosta�e� magiem. Przyjmij wyrazy szacunku.
	};
	
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_04"); //By� mo�e twoje pojawienie si� tutaj to dobry znak.
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

	description = "Czy mog� jako� pom�c?";
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
	AI_Output (other,self ,"DIA_Oric_CanHelp_15_00"); //Czy mog� jako� pom�c?
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_01"); //Wydaje mi si�, �e uczynili�my ju� wszystko, co by�o mo�na.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_02"); //Jest jednak pewna sprawa. M�g�by� si� nam przyda� poza murami zamku.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_03"); //Planujemy urwa� �eb hydrze.
	
	Info_ClearChoices (DIA_Oric_CanHelp);
	Info_AddChoice (DIA_Oric_CanHelp,"Poszukaj lepiej kogo� innego.",DIA_Oric_CanHelp_NotYourMan); 
	Info_AddChoice (DIA_Oric_CanHelp,"Co przez to rozumiesz?",DIA_Oric_CanHelp_WhatYouMean);

};

FUNC VOID DIA_Oric_CanHelp_NotYourMan ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_NotYourMan_15_00"); //Chyba b�dziecie musieli poszuka� kogo� innego.
	AI_Output (self ,other,"DIA_Oric_CanHelp_NotYourMan_11_01"); //Nie mog� sobie pozwoli� na stracenie chocia� jednego obro�cy, jeste� nasz� jedyn� nadziej�.
};

FUNC VOID DIA_Oric_CanHelp_WhatYouMean ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_00"); //Co masz na my�li?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_01"); //Znamy jednego z ich przyw�dc�w. Nazywa si� Hosh-Pak.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_02"); //To najbardziej wp�ywowy szaman w�r�d ork�w.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_03"); //A czego oczekujecie ode mnie?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_04"); //Musisz go zabi�.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_05"); //To chyba jaki� �art?!

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_06"); //Jeste� jedyn� osob�, kt�rej mo�emy powierzy� t� misj�. Wszyscy inni rycerze s� nam potrzebni na miejscu.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_07"); //Panie, nie jest mi �atwo o to prosi�. Jednak tylko ty mo�esz sprosta� temu zadaniu.
	}
	else
	{	
		AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_08"); //Chcesz nam pom�c, prawda? Wi�c masz okazj�...
	};
	
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_09"); //Namiot Hosh-Paka znajduje si� poza liniami obl�enia, na klifie na po�udnie st�d.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_10"); //Niemal wida� go z naszych okien.
	

	Info_ClearChoices (DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};

//***********************************************
//	Ich brauche noch Ausr�stung.
//***********************************************

INSTANCE DIA_Oric_NeedStuff   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 6;
	condition   = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;

	description = "Potrzebuj� wyposa�enia.";
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
	AI_Output (other,self ,"DIA_Oric_NeedStuff_15_00"); //Potrzebuj� wyposa�enia.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_01"); //Niewiele mo�emy ci zaoferowa�.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_02"); //Mam tylko to.
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
	Info_AddChoice (DIA_Oric_NeedStuff,"lub 1 eliksir zr�czno�ci",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice (DIA_Oric_NeedStuff,"lub 1 eliksir si�y",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice (DIA_Oric_NeedStuff,"lub 3 eliksiry many",DIA_Oric_NeedStuff_Mana);	
	Info_AddChoice (DIA_Oric_NeedStuff,"3 eliksiry lecznicze",DIA_Oric_NeedStuff_Health); 
};

FUNC VOID DIA_Oric_NeedStuff_Health ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Health_15_00"); //Wezm� mikstury lecznicze.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Health_11_01"); //Doskona�y wyb�r. Mam nadziej�, �e ci si� przydadz�.
	
	CreateInvItems (self,ItPo_Health_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Mana ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Mana_15_00"); //Wezm� mikstury many.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Mana_11_01"); //Mam nadziej�, �e dobrze je wykorzystasz. Niech Innos ci� prowadzi.
	
	CreateInvItems (self,ItPo_Mana_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Strength ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Strength_15_00"); //Wezm� eliksir si�y.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Strength_11_01"); //Prosz�, na pewno si� przyda. �ycz� ci szcz�cia.

	CreateInvItems (self,ItPo_Perm_STR,1);
	B_GiveInvItems (self ,other,ItPo_Perm_STR,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Dexterity ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Dexterity_15_00"); //Wezm� eliksir zr�czno�ci.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Dexterity_11_01"); //Niech twe strza�y nigdy nie chybiaj� celu. Prosz�.

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

	description = "Nie zamorduj� Hosh-Paka jak ostatni tch�rz.";
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
	AI_Output (other,self ,"DIA_Oric_NoMurder_15_00"); //Nie zamorduj� Hosh-Paka jak ostatni tch�rz.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_01"); //Czy zdajesz sobie spraw� w jak trudnej sytuacji si� znajdujemy?
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_02"); //Obl�enie trwa, armia ork�w jest nieugi�ta. Nasze zapasy s� na wyczerpaniu.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_03"); //Je�li nie uda nam si� przetransportowa� rudy na statek, orkowie zetr� w py� ca�e kr�lestwo.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_04"); //Wszystko, czego bronili�my, zostanie zapomniane.
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
	description = "Dobrze. Zg�adz� Hosh-Paka.";
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
	AI_Output (other,self ,"DIA_Oric_WillHelp_15_00"); //Dobrze. Zg�adz� Hosh-Paka.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_01"); //Mi�o mi to s�ysze�.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_02"); //Namiot Hosh-Paka stoi na niewielkim klifie. Na pewno ju� go widzia�e�.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_03"); //To niedaleko �cie�ki prowadz�cej do kopalni. W cieniu wielkiej g�ry.
	
	Log_CreateTopic (TOPIC_KillHoshPak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak, LOG_RUNNING);
	B_LogEntry (TOPIC_KillHoshPak,"Orik chce rozprawi� si� z orkowym szamanem Hosh-Pakiem. Jego namiot znajduje si� na niewielkim klifie niedaleko zamku."); 

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
	description = "Hosh-Pak nie �yje.";
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
	AI_Output (other,self ,"DIA_Oric_HoshDead_15_00"); //Hosh-Pak nie �yje.
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_01"); //Wspaniale, to powinno zasia� zam�t w�r�d ork�w. Mo�e, mimo wszystko, jest jeszcze dla nas nadzieja.
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_02"); //Mam nadziej�, �e to wydarzenie pozwoli nam nadrobi� straty ostatniego tygodnia.
	
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

	description = "Jakie� wie�ci?";
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

	AI_Output (other,self ,"DIA_Oric_AnyNews_15_00"); //Jakie� wie�ci?
	
	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_01"); //Poza tym, �e najechali na nas orkowie?
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_02"); //Tak. Jeste� tu bohaterem. Pozbycie si� smok�w to niew�tpliwie nie�atwe zadanie.
	}
	else if (MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_03"); //Po �mierci Hosh-Paka w orkowych szeregach zapanowa� chaos.
	}
	else
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_04"); //Ork�w jest coraz wi�cej, to z�y znak.
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
	description	 = 	"Potrzebuj� wi�cej informacji o smokach.";
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
	AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_00"); //Potrzebuj� wi�cej informacji o smokach.
	
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_01"); //Jednego uda�o mi si� zg�adzi�. Czy mo�esz mi powiedzie�, gdzie szuka� nast�pnych?
	}
	else if (MIS_KilledDragons != 0) 
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_02"); //Wydaje mi si�, �e nie dotar�em jeszcze do wszystkich smok�w. Mo�e co� usz�o mojej uwadze?
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
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_03"); //W ci�gu kilku ostatnich dni na zach�d od zamku pojawi�o si� wielkie bagno. Jest w tym co� podejrzanego, nie s�dzisz?
			B_LogEntry (TOPIC_DRACHENJAGD,"Orik da� mi wskaz�wk�: kilka dni temu na zach�d od zamku pojawi�o si� wielkie bagno. Ca�a ta sprawa jest do�� podejrzana."); 
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(Rockdragon))==FALSE)
		&& (Oric_RockdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_04"); //Na po�udnie st�d, daleko za wulkanem, wznosi si� kamienna forteca.
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_05"); //Nasi szpiedzy donie�li, �e jest silnie strze�ona. By� mo�e tam ukrywa si� jeden ze smok�w?
			B_LogEntry (TOPIC_DRACHENJAGD,"Zwiadowcy donie�li Orikowi, �e skalna forteca za wulkanem na po�udniu jest dobrze chroniona. Orik podejrzewa, �e mo�e tam przebywa� smok."); 
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(FireDragon))==FALSE)
		&& (Oric_FiredragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_06"); //Po ostatnim ataku dosz�y mnie wie�ci, jakoby jeden ze smok�w znikn�� gdzie� na po�udniu, za wulkanem. Wydaje mi si�, �e tam powiniene� skierowa� swe kroki.
			B_LogEntry (TOPIC_DRACHENJAGD,"Podobno smok, kt�ry zaatakowa� zamek w G�rniczej Dolinie, pojawi� si� p�niej w okolicach wulkanu."); 
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(IceDragon))==FALSE)
		&& (Oric_IcedragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_07"); //Na zach�d st�d rozci�ga si� wielka po�a� pokrytych lodem pustkowi. Nie zdziwi�oby mnie, gdyby jeden ze smok�w ukry� si� w�a�nie tam.
			B_LogEntry (TOPIC_DRACHENJAGD,"Orik twierdzi, �e lodowe pustkowie na zachodzie mo�e by� siedzib� smoka."); 
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_08"); //W tej chwili nie mam dla ciebie �adnych informacji.
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
	description = "(Kradzie� tego zwoju b�dzie bardzo trudna)";
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

