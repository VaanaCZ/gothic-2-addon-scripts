// ************************************************************
// 			  					EXIT 
// ************************************************************
INSTANCE DIA_Elena_EXIT   (C_INFO)
{
	npc         = BAU_911_Elena;
	nr          = 999;
	condition   = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Elena_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo 
// ************************************************************
instance DIA_Elena_HALLO		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 1;
	condition	= DIA_Elena_HALLO_Condition;
	information	= DIA_Elena_HALLO_Info;
	permanent	= FALSE;
	description	= "Witaj, piêkna nieznajoma.";
};

func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Elena_HALLO_15_00"); //Witaj, piêkna nieznajoma.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_01"); //Hmmm. Sk¹d uciek³eœ?
	}
	else
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_02"); //Czego chcesz?
	};
};


// ************************************************************
// 			  					Aufstand
// ************************************************************
instance DIA_Elena_Aufstand		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 2;
	condition	= DIA_Elena_Aufstand_Condition;
	information	= DIA_Elena_Aufstand_Info;
	permanent	= FALSE;
	description	= "Podobno buntujecie siê przeciwko Królowi?";
};

func int DIA_Elena_Aufstand_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info ()
{
	AI_Output (other, self, "DIA_Elena_Aufstand_15_00"); //Podobno buntujecie siê przeciwko Królowi?
	AI_Output (self, other, "DIA_Elena_Aufstand_16_01"); //Mój ojciec zadecydowa³, ¿e najwy¿szy czas zadbaæ o nasze bezpieczeñstwo.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Elena_Aufstand_16_02"); //Stra¿ i tak nigdy nam nie pomog³a. Interesowa³a ich tylko nasza spi¿arnia.
	};
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Arbeit		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 3;
	condition	= DIA_Elena_Arbeit_Condition;
	information	= DIA_Elena_Arbeit_Info;
	permanent	= FALSE;
	description	= "Jakiego rodzaju prace prowadzone s¹ na farmie?";
};

func int DIA_Elena_Arbeit_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Elena_Arbeit_15_00"); //Jakiego rodzaju prace prowadzone s¹ na farmie?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_01"); //Mój ojciec p³aci wszystkim mê¿czyznom, którzy zgodz¹ siê broniæ farmy.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_02"); //Jesteœ zainteresowany? Nie wygl¹dasz na osobê, której marzeniem jest praca na roli.
	AI_Output (other, self, "DIA_Elena_Arbeit_15_03"); //Ile p³aci twój ojciec?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_04"); //Musisz to z nim uzgodniæ.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_05"); //Wiem tylko, ¿e ka¿dy najemnik codziennie dostaje pieni¹dze.
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Regeln		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 4;
	condition	= DIA_Elena_Regeln_Condition;
	information	= DIA_Elena_Regeln_Info;
	permanent	= FALSE;
	description	= "Czy panuj¹ tutaj jakieœ zasady, o których powinienem pamiêtaæ?";
};

func int DIA_Elena_Regeln_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Elena_Regeln_15_00"); //Czy panuj¹ tutaj jakieœ zasady, o których powinienem pamiêtaæ?
	AI_Output (self, other, "DIA_Elena_Regeln_16_01"); //Nie dotykaj niczego, co nie nale¿y do ciebie.
	AI_Output (self, other, "DIA_Elena_Regeln_16_02"); //Trzymaj siê z daleka od nie swoich spraw.
	AI_Output (self, other, "DIA_Elena_Regeln_16_03"); //Jeœli wdasz siê w walkê, trzymaj siê najemników.
	AI_Output (self, other, "DIA_Elena_Regeln_16_04"); //Jeœli rozpoczniesz bójkê z miejscowymi ch³opami, wszyscy obróc¹ siê przeciwko tobie.
};


// ************************************************************
// 			  					Aufgabe 
// ************************************************************
instance DIA_Elena_AUFGABE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 5;
	condition	= DIA_Elena_AUFGABE_Condition;
	information	= DIA_Elena_AUFGABE_Info;
	permanent 	= FALSE;
	description	= "Czym siê zajmujesz?";
};

func int DIA_Elena_AUFGABE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info ()
{
	AI_Output (other, self, "DIA_Elena_AUFGABE_15_00"); //Na czym polega twoja praca?
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_01"); //Sprzedajê towary produkowane na farmie. Gdybyœ chcia³ coœ kupiæ, daj mi znaæ.
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_02"); //Pozwól jednak, ¿e ciê ostrzegê. Nie znoszê z³odziei, jasne?
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Elena handluje na farmie Onara.");
};

// ************************************************************
// 			  					TRADE 
// ************************************************************

//---------------------------------
var int Elena_Trade_mit_mir;
//---------------------------------

instance DIA_Elena_TRADE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr          = 7;
	condition	= DIA_Elena_TRADE_Condition;
	information	= DIA_Elena_TRADE_Info;
	permanent	= TRUE;
	description	= "Poka¿ mi, co masz na sprzeda¿!";
	trade		= TRUE;
};

func int DIA_Elena_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_AUFGABE))
	|| (Elena_Trade_mit_mir == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Elena_TRADE_15_00"); //Poka¿ mi swoje towary!
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Elena_TRADE_16_01"); //Co mogê ci zaoferowaæ?
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Elena_PERM		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 900;
	condition	= DIA_Elena_PERM_Condition;
	information	= DIA_Elena_PERM_Info;
	permanent	= TRUE;
	description	= "Czy ostatnio zdarzy³o siê coœ wa¿nego?";
};

func int DIA_Elena_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Elena_PERM_15_00"); //Czy ostatnio zdarzy³o siê coœ wa¿nego?

	if (kapitel <= 1)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_01"); //Parê dni temu mój ojciec zadecydowa³, ¿e nie wolno nam sprzedawaæ niczego w mieœcie.
		AI_Output			(self, other, "DIA_Elena_PERM_16_02"); //Wiêc teraz trzymam siê w pobli¿u farmy i sprzedajê swoje towary przejezdnym.
	
		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_03"); //Ataki stra¿y na okoliczne farmy staj¹ siê coraz czêstsze. Interwencja mojego ojca jest tylko kwesti¹ czasu.
	}
	else if (Kapitel == 3)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_04"); //Okoliczne ziemie sta³y siê bardzo niebezpieczne. Nikt nie zapuszcza siê poza w³asne tereny. Up³ynê³o ju¿ bardzo du¿o czasu, od kiedy którekolwiek z nas by³o w mieœcie.
	}
	else if (kapitel == 4)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_05"); //Najemnicy staj¹ siê coraz bardziej niespokojni. Chocia¿ wydaje mi siê, ¿e od czasu jak opuœci³ nas Sylvio wraz ze swoj¹ dru¿yn¹, i tak s¹ w znacznie lepszej kondycji psychicznej.
	}
	else //Kapitel 5
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_06"); //Wszyscy mówi¹ o zbli¿aj¹cym siê ataku orków. Ale ja nie wierzê w te pog³oski. S¹dzê, ¿e tutaj, na farmie, jesteœmy bezpieczni.
	};
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Minenanteil
///////////////////////////////////////////////////////////////////////
instance DIA_Elena_MINENANTEIL		(C_INFO)
{
	npc		 = 	BAU_911_Elena;
	nr		 = 	2;
	condition	 = 	DIA_Elena_MINENANTEIL_Condition;
	information	 = 	DIA_Elena_MINENANTEIL_Info;

	description  =  "Sprzedajesz udzia³y w kopalni?";
};

func int DIA_Elena_MINENANTEIL_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Elena_Hallo))
		{
				return TRUE;
		};
};

func void DIA_Elena_MINENANTEIL_Info ()
{
	AI_Output			(other, self, "DIA_Elena_MINENANTEIL_15_00"); //Sprzedajesz udzia³y w kopalni?
	AI_Output			(self, other, "DIA_Elena_MINENANTEIL_16_01"); //No i co z tego? Sama zap³aci³am za nie maj¹tek.
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Elena_PICKPOCKET (C_INFO)
{
	npc			= BAU_911_Elena;
	nr			= 900;
	condition	= DIA_Elena_PICKPOCKET_Condition;
	information	= DIA_Elena_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Elena_PICKPOCKET_Condition()
{
	C_Beklauen (30, 35);
};
 
FUNC VOID DIA_Elena_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Elena_PICKPOCKET);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_BACK 		,DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};
	
func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};





















