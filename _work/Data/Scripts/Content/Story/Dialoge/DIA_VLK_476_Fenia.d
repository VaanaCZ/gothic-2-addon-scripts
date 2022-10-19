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
		AI_Output			(self, other, "DIA_Fenia_EXIT_17_00"); //Mi³ego dnia, panie paladynie.
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Fenia_EXIT_17_01"); //Bezpiecznej podró¿y, wielki magu.
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
			AI_Output			(self, other, "DIA_Fenia_Hallo_17_00"); //Wygl¹dasz na strasznie zmêczonego. Chyba d³ugo nie spa³eœ, prawda?
			AI_Output			(other, self, "DIA_Fenia_Hallo_15_01"); //Zbyt d³ugo, zdecydowanie zbyt d³ugo.
		};
	AI_Output			(self, other, "DIA_Fenia_Hallo_17_02"); //ChodŸ, podejdŸ bli¿ej. U mnie znajdziesz to, czego ci potrzeba!
	
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
	description	 = 	"Poka¿ mi swoje towary.";
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
	AI_Output			(other, self, "DIA_Fenia_HANDELN_15_00"); //Poka¿ mi swoje towary.
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
	description	 = 	"Powiedzia³aœ, ¿e masz wszystko... Czy to dotyczy równie¿ informacji?";
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
	AI_Output			(other, self, "DIA_Fenia_Infos_15_00"); //Powiedzia³aœ, ¿e masz wszystko, czego mogê potrzebowaæ. Czy to dotyczy równie¿ informacji?
	AI_Output			(self, other, "DIA_Fenia_Infos_17_01"); //Ale¿ oczywiœcie! A co ciê interesuje?
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
	description	= "Czy tu, w porcie, s¹ jeszcze jacyœ inni handlarze?";
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
	AI_Output			(other, self, "DIA_Fenia_Infos_haendler_15_00"); //Czy tu, w porcie, s¹ jeszcze jacyœ inni handlarze?
	AI_Output			(self, other, "DIA_Fenia_Infos_haendler_17_01"); //Trzymaj siê lewej strony nabrze¿a, a spotkasz Halvora, mojego mê¿a. Sprzedaje ryby.
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
	description	= "Znasz kogoœ z górnego miasta?";
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
	AI_Output			(other, self, "DIA_Fenia_Infos_oberesViertel_15_00"); //Znasz kogoœ z górnego miasta?
	AI_Output			(self, other, "DIA_Fenia_Infos_oberesViertel_17_01"); //Gdybym zna³a kogoœ stamt¹d, na pewno byœ mnie tu nie znalaz³, ch³opcze.
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
	description	= "Co ciekawego mo¿na znaleŸæ w okolicach portu?";
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
	AI_Output (other, self, "DIA_Fenia_Infos_interessantes_15_00"); //S¹ tu jakieœ interesuj¹ce rzeczy, które powinienem zobaczyæ?
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_01"); //Jeœli szukasz mocnych wra¿eñ, udaj siê do knajpy Kardifa na nabrze¿u. Tam zawsze coœ siê dzieje.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_02"); //Nie sposób tam nie trafiæ. Przed wejœciem stoi facet, który z pewnoœci¹ przykuje twoj¹ uwagê.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_03"); //Poza tym jest te¿ wielki okrêt paladynów. Warto go zobaczyæ!
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_04"); //Nietrudno tam trafiæ. Trzymaj siê tylko lewej strony nabrze¿a, a potem przejdŸ pod wielk¹ kamienn¹ twarz¹.
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
	description	= "Czy ostatnio wydarzy³o siê tu coœ niezwyk³ego?";
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
	AI_Output (other, self, "DIA_Fenia_Add_15_00"); //Czy ostatnio wydarzy³o siê tu coœ niezwyk³ego?
	AI_Output (self, other, "DIA_Fenia_Add_17_01"); //Mo¿na tak powiedzieæ. To nie by³o dawno temu.
	AI_Output (self, other, "DIA_Fenia_Add_17_02"); //Ucieka³ têdy z³odziej. NajwyraŸniej ukrad³ ³uk w dolnej czêœci miasta.
	AI_Output (self, other, "DIA_Fenia_Add_17_03"); //Oczywiœcie, stra¿ przyby³a jak zwykle za póŸno.
	AI_Output (self, other, "DIA_Fenia_Add_17_04"); //Uciek³ im bez problemu - po prostu wskoczy³ do wody i tyle go widzieli.
};






