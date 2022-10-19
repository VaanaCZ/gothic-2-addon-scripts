///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fenia_EXIT   (C_INFO)
{
	npc         = VLK_476_Fenia;
	nr          = 999;
	condition   = DIA_Fenia_EXIT_Condition;
	information = DIA_Fenia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fenia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fenia_EXIT_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Fenia_EXIT_17_00"); //Mi�ego dnia, panie paladynie.
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Fenia_EXIT_17_01"); //Bezpiecznej podr�y, wielki magu.
	};
	
	AI_StopProcessInfos (self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fenia_PICKPOCKET (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 900;
	condition	= DIA_Fenia_PICKPOCKET_Condition;
	information	= DIA_Fenia_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Fenia_PICKPOCKET_Condition()
{
	C_Beklauen (50, 75);
};
 
FUNC VOID DIA_Fenia_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fenia_PICKPOCKET);
	Info_AddChoice		(DIA_Fenia_PICKPOCKET, DIALOG_BACK 		,DIA_Fenia_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fenia_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fenia_PICKPOCKET_DoIt);
};

func void DIA_Fenia_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fenia_PICKPOCKET);
};
	
func void DIA_Fenia_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fenia_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fenia_Hallo   (C_INFO)
{
	npc         = VLK_476_Fenia;
	nr          = 3;
	condition   = DIA_Fenia_Hallo_Condition;
	information = DIA_Fenia_Hallo_Info;
	important	 = 	TRUE;
};

FUNC INT DIA_Fenia_Hallo_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Fenia_Hallo_Info()
{
		if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Fenia_Hallo_17_00"); //Wygl�dasz na strasznie zm�czonego. Chyba d�ugo nie spa�e�, prawda?
			AI_Output			(other, self, "DIA_Fenia_Hallo_15_01"); //Zbyt d�ugo, zdecydowanie zbyt d�ugo.
		};
	AI_Output			(self, other, "DIA_Fenia_Hallo_17_02"); //Chod�, podejd� bli�ej. U mnie znajdziesz to, czego ci potrzeba!
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Fenia sprzedaje jedzenie przy drodze do portu.");
};


///////////////////////////////////////////////////////////////////////
//	Info Handeln
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_HANDELN		(C_INFO)
{
	npc			 = 	VLK_476_Fenia;
	nr			 = 	10;
	condition	 = 	DIA_Fenia_HANDELN_Condition;
	information	 = 	DIA_Fenia_HANDELN_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Poka� mi swoje towary.";
};

func int DIA_Fenia_HANDELN_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Fenia_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fenia_HANDELN_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Fenia_HANDELN_15_00"); //Poka� mi swoje towary.
};

///////////////////////////////////////////////////////////////////////
//	Info Infos
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Infos		(C_INFO)
{
	npc			 = 	VLK_476_Fenia;
	nr			 = 	10;
	condition	 = 	DIA_Fenia_Infos_Condition;
	information	 = 	DIA_Fenia_Infos_Info;
	permanent 	 =  FALSE;
	description	 = 	"Powiedzia�a�, �e masz wszystko... Czy to dotyczy r�wnie� informacji?";
};

func int DIA_Fenia_Infos_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Fenia_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fenia_Infos_Info ()
{
	AI_Output			(other, self, "DIA_Fenia_Infos_15_00"); //Powiedzia�a�, �e masz wszystko, czego mog� potrzebowa�. Czy to dotyczy r�wnie� informacji?
	AI_Output			(self, other, "DIA_Fenia_Infos_17_01"); //Ale� oczywi�cie! A co ci� interesuje?
};

///////////////////////////////////////////////////////////////////////
//	MoreTraders
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_MoreTraders (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 11;
	condition	= DIA_Fenia_MoreTraders_Condition;
	information	= DIA_Fenia_MoreTraders_Info;
	permanent 	= FALSE;
	description	= "Czy tu, w porcie, s� jeszcze jacy� inni handlarze?";
};

func int DIA_Fenia_MoreTraders_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};
func void DIA_Fenia_MoreTraders_Info ()
{
	AI_Output			(other, self, "DIA_Fenia_Infos_haendler_15_00"); //Czy tu, w porcie, s� jeszcze jacy� inni handlarze?
	AI_Output			(self, other, "DIA_Fenia_Infos_haendler_17_01"); //Trzymaj si� lewej strony nabrze�a, a spotkasz Halvora, mojego m�a. Sprzedaje ryby.
	AI_Output			(self, other, "DIA_Fenia_Infos_haendler_17_02"); //Po drugiej stronie znajdziesz Brahima, kartografa.
};

///////////////////////////////////////////////////////////////////////
//	OV
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_OV (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 13;
	condition	= DIA_Fenia_OV_Condition;
	information	= DIA_Fenia_OV_Info;
	permanent 	= FALSE;
	description	= "Znasz kogo� z g�rnego miasta?";
};

func int DIA_Fenia_OV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Fenia_OV_Info ()
{
	AI_Output			(other, self, "DIA_Fenia_Infos_oberesViertel_15_00"); //Znasz kogo� z g�rnego miasta?
	AI_Output			(self, other, "DIA_Fenia_Infos_oberesViertel_17_01"); //Gdybym zna�a kogo� stamt�d, na pewno by� mnie tu nie znalaz�, ch�opcze.
};

///////////////////////////////////////////////////////////////////////
//	Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Interesting (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 14;
	condition	= DIA_Fenia_Interesting_Condition;
	information	= DIA_Fenia_Interesting_Info;
	permanent 	= FALSE;
	description	= "Co ciekawego mo�na znale�� w okolicach portu?";
};

func int DIA_Fenia_Interesting_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};
func void DIA_Fenia_Interesting_Info ()
{
	AI_Output (other, self, "DIA_Fenia_Infos_interessantes_15_00"); //S� tu jakie� interesuj�ce rzeczy, kt�re powinienem zobaczy�?
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_01"); //Je�li szukasz mocnych wra�e�, udaj si� do knajpy Kardifa na nabrze�u. Tam zawsze co� si� dzieje.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_02"); //Nie spos�b tam nie trafi�. Przed wej�ciem stoi facet, kt�ry z pewno�ci� przykuje twoj� uwag�.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_03"); //Poza tym jest te� wielki okr�t paladyn�w. Warto go zobaczy�!
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_04"); //Nietrudno tam trafi�. Trzymaj si� tylko lewej strony nabrze�a, a potem przejd� pod wielk� kamienn� twarz�.
};

///////////////////////////////////////////////////////////////////////
//	Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Aufregend (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 15;
	condition	= DIA_Fenia_Aufregend_Condition;
	information	= DIA_Fenia_Aufregend_Info;
	permanent 	= FALSE;
	description	= "Czy ostatnio wydarzy�o si� tu co� niezwyk�ego?";
};

func int DIA_Fenia_Aufregend_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};
func void DIA_Fenia_Aufregend_Info ()
{
	AI_Output (other, self, "DIA_Fenia_Add_15_00"); //Czy ostatnio wydarzy�o si� tu co� niezwyk�ego?
	AI_Output (self, other, "DIA_Fenia_Add_17_01"); //Mo�na tak powiedzie�. To nie by�o dawno temu.
	AI_Output (self, other, "DIA_Fenia_Add_17_02"); //Ucieka� t�dy z�odziej. Najwyra�niej ukrad� �uk w dolnej cz�ci miasta.
	AI_Output (self, other, "DIA_Fenia_Add_17_03"); //Oczywi�cie, stra� przyby�a jak zwykle za p�no.
	AI_Output (self, other, "DIA_Fenia_Add_17_04"); //Uciek� im bez problemu - po prostu wskoczy� do wody i tyle go widzieli.
};






