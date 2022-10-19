// ***********************************************************
// 						 	EXIT
// ***********************************************************
INSTANCE DIA_Meldor_EXIT   (C_INFO)
{
	npc         = VLK_415_Meldor;
	nr          = 999;
	condition   = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 						 	Hallo
// ***********************************************************
instance DIA_Meldor_Hallo		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Hallo_Condition;
	information	= DIA_Meldor_Hallo_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Meldor_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Meldor_Hallo_07_00"); //Czego chcesz?
	AI_Output (other, self, "DIA_Meldor_Hallo_15_01"); //Chcia�em si� tutaj rozejrze�...
	AI_Output (self, other, "DIA_Meldor_Hallo_07_02"); //A dok�d dok�adnie si� udajesz?
};

// ***********************************************************
// 						 	Interessantes
// ***********************************************************
instance DIA_Meldor_Interessantes		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Interessantes_Condition;
	information	= DIA_Meldor_Interessantes_Info;
	permanent 	= FALSE;
	description	= "Czy s� tutaj jakie� interesuj�ce rzeczy?";
};

func int DIA_Meldor_Interessantes_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Interessantes_15_00"); //Czy s� tutaj jakie� interesuj�ce rzeczy?
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_01"); //Jest burdel i knajpa. W�a�ciciel nazywa si� Kardif. Je�li potrzebne ci s� jakie� informacje, powiniene� uda� si� do niego.
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_02"); //Tak przy okazji, potrzebujesz got�wki?
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, w�a�ciciel knajpy, sprzedaje informacje.");
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************
instance DIA_Meldor_Lehmar		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 3;
	condition	= DIA_Meldor_Lehmar_Condition;
	information	= DIA_Meldor_Lehmar_Info;
	permanent 	= FALSE;
	description	= "A co, rozdajesz pieni�dze?";
};

func int DIA_Meldor_Lehmar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Lehmar_15_00"); //A co, rozdajesz pieni�dze?
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_01"); //Nie. Ale po drugiej stronie ulicy mieszka Lehmar. Po�ycza pieni�dze na procent.
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_02"); //Jestem pewien, �e po�yczy ci par� sztuk z�ota.
	Npc_ExchangeRoutine (self, "START");
};


// ***********************************************************
// 						 	Arbeitest
// ***********************************************************
instance DIA_Meldor_Arbeitest		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 4;
	condition	= DIA_Meldor_Arbeitest_Condition;
	information	= DIA_Meldor_Arbeitest_Info;
	permanent 	= FALSE;
	description	= "Pracujesz dla Lehmara?";
};

func int DIA_Meldor_Arbeitest_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Arbeitest_15_00"); //Pracujesz dla Lehmara?
	AI_Output (self, other, "DIA_Meldor_Arbeitest_07_01"); //Hmm... Zgad�e�, geniuszu.
};

// ***********************************************************
// 						 	InsOV
// ***********************************************************
instance DIA_Meldor_InsOV		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_InsOV_Condition;
	information	= DIA_Meldor_InsOV_Info;
	permanent 	= FALSE;
	description	= "W�a�ciwie to id� do g�rnego miasta.";
};

func int DIA_Meldor_InsOV_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info ()
{
	AI_Output (other, self, "DIA_Meldor_InsOV_15_00"); //W�a�ciwie to id� do g�rnego miasta.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_01"); //Tak, oczywi�cie. A ja w�a�nie mia�em wsi��� na statek, kt�ry zawiezie mnie prosto na audiencj� u Kr�la.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_02"); //Od kiedy pojawili si� paladyni, takich jak ty czy ja nie wpuszcza si� do g�rnego miasta.
};

// ***********************************************************
// 						 	Citizen
// ***********************************************************
instance DIA_Meldor_Citizen		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 6;
	condition	= DIA_Meldor_Citizen_Condition;
	information	= DIA_Meldor_Citizen_Info;
	permanent 	= FALSE;
	description	= "Czy jeste� obywatelem tego miasta?";
};

func int DIA_Meldor_Citizen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Citizen_15_00"); //Czy jeste� obywatelem tego miasta?
	AI_Output (self, other, "DIA_Meldor_Citizen_07_01"); //Je�li chodzi ci o to, czy tu mieszkam, to odpowied� brzmi - tak. Co nie znaczy, �e mog� wchodzi� do g�rnego miasta.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_02"); //Tylko arystokracja ma tam wst�p, no i oczywi�cie handlarze, i rzemie�lnicy z dolnej cz�ci miasta.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_03"); //W dzielnicy portowej raczej nie znajdziesz nikogo spo�r�d �mietanki Khorinis. Tu nie ma nawet regularnych patroli stra�y miejskiej.

};
// ***********************************************************
// 						 Smoke
// ***********************************************************
instance DIA_Meldor_Smoke		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_Smoke_Condition;
	information	= DIA_Meldor_Smoke_Info;
	permanent 	= FALSE;
	description	= "Wiesz mo�e, gdzie mog� kupi� troch� ziela?";
};

func int DIA_Meldor_Smoke_Condition ()
{	
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Meldor_Smoke_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Meldor_Smoke_15_00"); //Wiesz mo�e, gdzie mog� kupi� troch� ziela?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_01"); //Nie, nie mam poj�cia.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_02"); //Na twoim miejscu spr�bowa�bym szcz�cia w Czerwonej Latarni.
	};
};

// ***********************************************************
// 						 	PERM
// ***********************************************************
var int Meldor_DGNews;
// --------------------

instance DIA_Meldor_PERM		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 7;
	condition	= DIA_Meldor_PERM_Condition;
	information	= DIA_Meldor_PERM_Info;
	permanent 	= TRUE;
	description	= "Czy ostatnio wydarzy�o si� tu co� niezwyk�ego?";
};

func int DIA_Meldor_PERM_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info ()
{
	AI_Output (other, self, "DIA_Meldor_PERM_15_00"); //Czy ostatnio wydarzy�o si� tutaj co� ciekawego?
	
	if (Kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_01"); //Nie tak dawno temu stra� miejska wywr�ci�a ca�� dzielnic� portow� do g�ry nogami.
		AI_Output (self, other, "DIA_Meldor_PERM_07_02"); //Szukali skradzionych kosztowno�ci. Ostatnio zdarzy�o si� tu sporo kradzie�y. Szczeg�lnie w lepszych dzielnicach.
		AI_Output (self, other, "DIA_Meldor_PERM_07_03"); //Najwyra�niej pr�buj� zwali� win� na biedot� z portu.
	}
	else if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	&&		(Meldor_DGNews == FALSE)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_04"); //Podobno znale�li w kana�ach z�odziejsk� kryj�wk�. Wszyscy przest�pcy zostali zabici.
		Meldor_DGNews = TRUE;
	}
	else if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_05"); //Podobno w G�rniczej Dolinie s� smoki. Ciekaw jestem, kiedy nasi paladyni zostan� wys�ani do walki.
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_06"); //Podobno wszystkie smoki s� martwe.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_07"); //Nie.
	};
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************

instance DIA_Meldor_VonLehmar		(C_INFO)
{
	npc			 = 	VLK_415_Meldor;
	nr			 =  1;
	condition	 = 	DIA_Meldor_VonLehmar_Condition;
	information	 = 	DIA_Meldor_VonLehmar_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Meldor_VonLehmar_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Meldor_VonLehmar_Info ()
{
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_00"); //Hej, zaczekaj...
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_01"); //Mam dla ciebie wiadomo�� od Lehmara.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Meldor_PICKPOCKET (C_INFO)
{
	npc			= VLK_415_Meldor;
	nr			= 900;
	condition	= DIA_Meldor_PICKPOCKET_Condition;
	information	= DIA_Meldor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Meldor_PICKPOCKET_Condition()
{
	C_Beklauen (34, 55);
};
 
FUNC VOID DIA_Meldor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Meldor_PICKPOCKET);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_BACK 		,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
	
func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
































