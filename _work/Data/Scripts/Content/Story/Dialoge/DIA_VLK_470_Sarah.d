///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sarah_EXIT   (C_INFO)
{
	npc         = VLK_470_Sarah;
	nr          = 999;
	condition   = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sarah_PICKPOCKET (C_INFO)
{
	npc			= VLK_470_Sarah;
	nr			= 900;
	condition	= DIA_Sarah_PICKPOCKET_Condition;
	information	= DIA_Sarah_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Sarah_PICKPOCKET_Condition()
{
	C_Beklauen (57, 60);
};
 
FUNC VOID DIA_Sarah_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sarah_PICKPOCKET);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_BACK 		,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};
	
func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Greet
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Greet		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  1;
	condition	 = 	DIA_Sarah_Greet_Condition;
	information	 = 	DIA_Sarah_Greet_Info;
	permanent 	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Sarah_Greet_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Greet_Info ()
{
	AI_Output (self, other, "DIA_Sarah_Add_16_07"); //Ach! To znowu ty!
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_HALLO		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	condition	 = 	DIA_Sarah_HALLO_Condition;
	information	 = 	DIA_Sarah_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Jak idzie interes?";
};

func int DIA_Sarah_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Sarah_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Sarah_HALLO_15_00"); //Jak idzie interes?
	AI_Output (self, other, "DIA_Sarah_HALLO_16_01"); //Kiedy pojawili siê paladyni, pomyœla³am, ¿e to dobra okazja na zarobek.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_02"); //Zlecili jednak produkcjê swojej broni Haradowi, wiêc ani Hakon, ani ja nie zarobiliœmy nawet sztuki z³ota.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_03"); //Co wiêcej, wieœniacy odciêli dostawy po¿ywienia i ceny bardzo posz³y w górê.
	AI_Output (self, other, "DIA_Sarah_Add_16_00"); //Pocieszam siê jeszcze tylko tym, ¿e paladyni p³ac¹ za moje pokoje w gospodzie.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Sara sprzedaje broñ na targowisku.");	
};
///////////////////////////////////////////////////////////////////////
//	Info Bauern
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Bauern		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  2;
	condition	 = 	DIA_Sarah_Bauern_Condition;
	information	 = 	DIA_Sarah_Bauern_Info;
	permanent	 =  FALSE;
	description	 = 	"Na czym polega problem z ch³opami?";
};

func int DIA_Sarah_Bauern_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_HALLO)
	{
			return TRUE;
	};
};
func void DIA_Sarah_Bauern_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Bauern_15_00"); //Na czym polega problem z ch³opami?
	AI_Output (self, other, "DIA_Sarah_Bauern_16_01"); //Odmawiaj¹ dostaw towarów.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_02"); //Teraz, kiedy szlaki morskie zosta³y zamkniête, miasto jest ca³kowicie zale¿ne od dostaw z okolicznych farm.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_03"); //A Onar, w³aœciciel ziemski, wynaj¹³ najemników, by chroniæ siê przed oddzia³ami stra¿y. Inaczej stra¿nicy sami zabraliby jedzenie.
	AI_Output (self, other, "DIA_Sarah_Add_16_01"); //Najemnicy jednak nie tylko broni¹ farmy Onara.
	AI_Output (self, other, "DIA_Sarah_Add_16_02"); //Zastraszaj¹ te¿ rolników, którzy prowadz¹ mniejsze gospodarstwa.
	AI_Output (self, other, "DIA_Sarah_Add_16_03"); //Widzia³am ich, kiedy mija³am farmê Akila. Nie chcia³abym byæ teraz na jego miejscu.
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  3;
	condition	 = 	DIA_Sarah_AkilsHof_Condition;
	information	 = 	DIA_Sarah_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Gdzie znajduje siê farma Akila?";
};

func int DIA_Sarah_AkilsHof_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_Bauern)
	{
		return TRUE;
	};
};
func void DIA_Sarah_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Sarah_AkilsHof_15_00"); //Gdzie znajduje siê farma Akila?
	AI_Output (self, other, "DIA_Sarah_Add_16_04"); //Jeœli wyjdziesz wschodni¹ bram¹, a potem skrêcisz w prawo, dojdziesz do schodów.
	AI_Output (self, other, "DIA_Sarah_Add_16_05"); //Prowadz¹ one na farmê Akila.
	AI_Output (self, other, "DIA_Sarah_Add_16_06"); //Jednak nie odwa¿y³abym siê tam teraz iœæ. Z pewnoœci¹ najemnicy jeszcze nie odeszli.
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Trade		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_Trade_Condition;
	information	 = 	DIA_Sarah_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 =	TRUE;
	description	 = 	"Poka¿ mi swoje towary.";
};

func int DIA_Sarah_Trade_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	&& (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Sarah_Trade_15_00"); //Poka¿ mi swoje towary.
	
	Sarah_WaffenGesehen = TRUE;
	
};
///////////////////////////////////////////////////////////////////////
//	Info ImKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_IMKNAST		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_IMKNAST_Condition;
	information	 = 	DIA_Sarah_IMKNAST_Info;
	permanent	 = 	TRUE;
	important 	 =  TRUE;
};

func int DIA_Sarah_IMKNAST_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)	
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Sarah_IMKNAST_Info ()
{
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_00"); //Ty! Jak œmiesz siê tu pokazywaæ! Nie mogê tego udowodniæ, ale jestem pewna, ¿e macza³eœ ³apska w tych brudnych machlojkach.
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_01"); //To przez ciebie teraz tu jestem. Przez ciebie, i tego cholernego Canthara - niech dosiêgnie was gniew Innosa!
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Success		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  4;
	condition	 = 	DIA_Sarah_Success_Condition;
	information	 = 	DIA_Sarah_Success_Info;
	permanent 	 =  FALSE;
	description	 = 	"Canthar próbowa³ ciê wrobiæ...";
};

func int DIA_Sarah_Success_Condition ()
{	
	if (Canthar_Ausgeliefert == TRUE)
	//|| (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Success_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Success_15_00"); //Canthar próbowa³ ciê wrobiæ i przej¹æ twój interes. Wyda³em go jednak stra¿y miejskiej.
	AI_Output (self, other, "DIA_Sarah_Success_16_01"); //W ten sposób sprowadzi³eœ na siebie gniew potê¿nego cz³owieka. Znam tego drania od dawna, zawsze chcia³ zaj¹æ moje miejsce.
	AI_Output (self, other, "DIA_Sarah_Success_16_02"); //Przyjmij tê broñ jako wyraz mojej wdziêcznoœci.
	
	B_GivePlayerXP (XP_CantharImKnast);
	B_GiveInvItems (self, other, ItMw_Piratensaebel,1);
	
};
	
	  
	  
	   





