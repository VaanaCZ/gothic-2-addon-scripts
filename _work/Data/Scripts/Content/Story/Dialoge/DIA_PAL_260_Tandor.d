///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Tandor_EXIT   (C_INFO)
{
	npc         = PAL_260_Tandor;
	nr          = 999;
	condition   = DIA_Tandor_EXIT_Condition;
	information = DIA_Tandor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Tandor_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Tandor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Hallo		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	2;
	condition	 = 	DIA_Tandor_Hallo_Condition;
	information	 = 	DIA_Tandor_Hallo_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tandor_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
			return TRUE;
	};
};
func void DIA_Tandor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Tandor_Hallo_08_00"); //Udało ci się przedostać przez przełęcz? Doskonale, straciliśmy tam już zbyt wielu dobrych ludzi.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_01"); //Wiem, jak tam jest. Przez krótki czas towarzyszyłem oddziałom zwiadowczym.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_02"); //Masz jakąś broń? Jeśli potrzebujesz dobrej broni, to świetnie trafiłeś.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor handluje na zamku bronią.");
};
///////////////////////////////////////////////////////////////////////
//	Info Spähtrupp
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trupp		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	2;
	condition	 = 	DIA_Tandor_Trupp_Condition;
	information	 = 	DIA_Tandor_Trupp_Info;
	permanent 	 =  FALSE;
	description  =  "Co się stało z oddziałem?";
};
func int DIA_Tandor_Trupp_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Tandor_Hallo)
	{
			return TRUE;
	};
};
func void DIA_Tandor_Trupp_Info ()
{
	AI_Output (other, self, "DIA_Tandor_Trupp_15_00"); //Co się stało z oddziałem?
	AI_Output (self, other, "DIA_Tandor_Trupp_08_01"); //Prowadziliśmy zwiad w terenie, chcieliśmy przedostać się na wybrzeże. Nasz obóz rozbiliśmy w jaskini.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_02"); //Było już późno, kiedy pojawili się orkowie. Zeszli po stoku jak lawina, oświetlając sobie drogę pochodniami, i waląc w bębny.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_03"); //Próbowaliśmy uciekać, ale udało się tylko mnie...
	AI_Output (self, other, "DIA_Tandor_Trupp_08_04"); //Wkrótce po tym wydarzeniu orkowie otoczyli się wielką palisadą, my zaś wycofaliśmy się do zamku.
};	
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trade		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	900;
	condition	 = 	DIA_Tandor_Trade_Condition;
	information	 = 	DIA_Tandor_Trade_Info;
	permanent 	 =  TRUE;
	trade		 =	TRUE;
	description	 = 	"Pokaż mi swoje towary.";
};
func int DIA_Tandor_Trade_Condition ()
{
		return TRUE;
};
func void DIA_Tandor_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Tandor_Trade_15_00"); //Pokaż, co masz na sprzedaż.
};		
///////////////////////////////////////////////////////////////////////
//	Info DIA_Tandor_Equipment
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Equipment		(C_INFO)
{
	npc		 	 = 	PAL_260_Tandor;
	nr		 	 =  3;
	condition	 = 	DIA_Tandor_Equipment_Condition;
	information	 = 	DIA_Tandor_Equipment_Info;
	description	 = 	"Przysyła mnie Garond - potrzebuję wyposażenia.";
};

func int DIA_Tandor_Equipment_Condition ()
{
	if  Npc_KnowsInfo (hero, DIA_Garond_Equipment)
	&& (other.guild == GIL_MIL)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Tandor_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_15_00"); //Przysyła mnie Garond - potrzebuję wyposażenia.
	AI_Output (self, other, "DIA_Tandor_Equipment_08_01"); //Broń do walki w zwarciu czy na dystans?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Do walki w zwarciu.",DIA_Tandor_Equipment_Nah);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Dystansowa.",DIA_Tandor_Equipment_Fern);
};
FUNC VOID DIA_Tandor_Equipment_Nah()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Nah_15_00"); //Do walki w zwarciu.
	AI_Output (self, other, "DIA_Tandor_Equipment_Nah_08_01"); //Jednoręczna czy dwuręczna?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Jednoręczna.",DIA_Tandor_Equipment_Ein);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Dwuręczna.",DIA_Tandor_Equipment_Zwei);
};
FUNC VOID DIA_Tandor_Equipment_Fern()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Fern_15_00"); //Dystansowa.
	AI_Output (self, other, "DIA_Tandor_Equipment_Fern_08_01"); //Łuk czy kusza?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Łuk.",DIA_Tandor_Equipment_Bow);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Kusza.",DIA_Tandor_Equipment_Crossbow);
};	
FUNC VOID DIA_Tandor_Equipment_Ein()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Ein_15_00"); //Jednoręczna.
	AI_Output (self, other, "DIA_Tandor_Equipment_Ein_08_01"); //W takim razie na pewno przyda ci się taka broń!
	B_GiveInvItems (self,other, ItMw_Steinbrecher,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Zwei()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Zwei_15_00"); //Dwuręczna.
	AI_Output (self, other, "DIA_Tandor_Equipment_Zwei_08_01"); //Z tą bronią będziesz świetnie zabezpieczony.
	B_GiveInvItems (self,other,ItMw_Zweihaender1 ,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Bow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Bow_15_00"); //Łuk.
	AI_Output (self, other, "DIA_Tandor_Equipment_Bow_08_01"); //Ten łuk myśliwski z pewnością ci się spodoba. Dam ci też kilka strzał.
	B_GiveInvItems (self,other,ItRw_Bow_L_03 ,1);
	B_GiveInvItems (self,other, ItRw_Arrow,50);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Crossbow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Crossbow_15_00"); //Kusza.
	AI_Output (self, other, "DIA_Tandor_Equipment_Crossbow_08_01"); //Weź proszę tę lekką kuszę. Dorzucę też do niej bełty.
	B_GiveInvItems (self,other, ItRw_Crossbow_L_02,1);
	B_GiveInvItems (self,other, ItRw_Bolt,50);
	Info_ClearChoices (DIA_Tandor_Equipment);
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

INSTANCE DIA_Tandor_KAP3_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP3_EXIT_Condition;
	information	= DIA_Tandor_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP3_EXIT_Info()
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

INSTANCE DIA_Tandor_KAP4_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP4_EXIT_Condition;
	information	= DIA_Tandor_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_News		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	40;
	condition	 = 	DIA_Tandor_News_Condition;
	information	 = 	DIA_Tandor_News_Info;
	permanent	 = 	TRUE;
	description	 = 	"Masz jakieś wieści?";
};

func int DIA_Tandor_News_Condition ()
{
	if (Kapitel	== 4)
	&& (Npc_KnowsInfo (hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_News_Info ()
{
	AI_Output (other, self, "DIA_Tandor_News_15_00"); //Masz jakieś wieści?

	if (hero.guild == GIL_DJG)
		{
			AI_Output (self, other, "DIA_Tandor_News_08_01"); //Jedyna godna uwagi informacja to fakt, że zmierzają tu łowcy smoków.
		}
	else
		{
			AI_Output (self, other, "DIA_Tandor_News_08_02"); //Przybyli do nas łowcy smoków.
			AI_Output (self, other, "DIA_Tandor_News_08_03"); //Wyglądają na twardych skurczybyków i lepiej, żeby tak było, bo długo nie pociągną.
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

INSTANCE DIA_Tandor_KAP5_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP5_EXIT_Condition;
	information	= DIA_Tandor_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_WASISTLOS		(C_INFO)
{
	npc		 = 	PAL_260_Tandor;
	nr		 = 	51;
	condition	 = 	DIA_Tandor_WASISTLOS_Condition;
	information	 = 	DIA_Tandor_WASISTLOS_Info;
	permanent	 = 	TRUE;

	description	 = 	"Czemu jesteś taki przybity?";
};

func int DIA_Tandor_WASISTLOS_Condition ()
{
	if (Kapitel == 5)	
		&& (Npc_KnowsInfo (hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_WASISTLOS_Info ()
{
	AI_Output			(other, self, "DIA_Tandor_WASISTLOS_15_00"); //Czemu jesteś taki przybity?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_01"); //To przez orków, tych kreatur jest coraz więcej, w końcu wszystkich nas pozabijają.
	}
	else
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_02"); //Od tygodni nie otrzymaliśmy przyzwoitego jedzenia, zdechniemy tu z głodu.
	};
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


INSTANCE DIA_Tandor_KAP6_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP6_EXIT_Condition;
	information	= DIA_Tandor_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Tandor_PICKPOCKET (C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 900;
	condition	= DIA_Tandor_PICKPOCKET_Condition;
	information	= DIA_Tandor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Tandor_PICKPOCKET_Condition()
{
	C_Beklauen (47, 90);
};
 
FUNC VOID DIA_Tandor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Tandor_PICKPOCKET);
	Info_AddChoice		(DIA_Tandor_PICKPOCKET, DIALOG_BACK 		,DIA_Tandor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Tandor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Tandor_PICKPOCKET_DoIt);
};

func void DIA_Tandor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Tandor_PICKPOCKET);
};
	
func void DIA_Tandor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Tandor_PICKPOCKET);
};







































