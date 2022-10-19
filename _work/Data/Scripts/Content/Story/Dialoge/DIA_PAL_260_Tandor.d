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
	AI_Output (self, other, "DIA_Tandor_Hallo_08_00"); //Uda³o ci siê przedostaæ przez prze³êcz? Doskonale, straciliœmy tam ju¿ zbyt wielu dobrych ludzi.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_01"); //Wiem, jak tam jest. Przez krótki czas towarzyszy³em oddzia³om zwiadowczym.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_02"); //Masz jak¹œ broñ? Jeœli potrzebujesz dobrej broni, to œwietnie trafi³eœ.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor handluje na zamku broni¹.");
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
	description  =  "Co siê sta³o z oddzia³em?";
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
	AI_Output (other, self, "DIA_Tandor_Trupp_15_00"); //Co siê sta³o z oddzia³em?
	AI_Output (self, other, "DIA_Tandor_Trupp_08_01"); //Prowadziliœmy zwiad w terenie, chcieliœmy przedostaæ siê na wybrze¿e. Nasz obóz rozbiliœmy w jaskini.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_02"); //By³o ju¿ póŸno, kiedy pojawili siê orkowie. Zeszli po stoku jak lawina, oœwietlaj¹c sobie drogê pochodniami, i wal¹c w bêbny.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_03"); //Próbowaliœmy uciekaæ, ale uda³o siê tylko mnie...
	AI_Output (self, other, "DIA_Tandor_Trupp_08_04"); //Wkrótce po tym wydarzeniu orkowie otoczyli siê wielk¹ palisad¹, my zaœ wycofaliœmy siê do zamku.
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
	description	 = 	"Poka¿ mi swoje towary.";
};
func int DIA_Tandor_Trade_Condition ()
{
		return TRUE;
};
func void DIA_Tandor_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Tandor_Trade_15_00"); //Poka¿, co masz na sprzeda¿.
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
	description	 = 	"Przysy³a mnie Garond - potrzebujê wyposa¿enia.";
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
	AI_Output (other, self, "DIA_Tandor_Equipment_15_00"); //Przysy³a mnie Garond - potrzebujê wyposa¿enia.
	AI_Output (self, other, "DIA_Tandor_Equipment_08_01"); //Broñ do walki w zwarciu czy na dystans?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Do walki w zwarciu.",DIA_Tandor_Equipment_Nah);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Dystansowa.",DIA_Tandor_Equipment_Fern);
};
FUNC VOID DIA_Tandor_Equipment_Nah()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Nah_15_00"); //Do walki w zwarciu.
	AI_Output (self, other, "DIA_Tandor_Equipment_Nah_08_01"); //Jednorêczna czy dwurêczna?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Jednorêczna.",DIA_Tandor_Equipment_Ein);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Dwurêczna.",DIA_Tandor_Equipment_Zwei);
};
FUNC VOID DIA_Tandor_Equipment_Fern()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Fern_15_00"); //Dystansowa.
	AI_Output (self, other, "DIA_Tandor_Equipment_Fern_08_01"); //£uk czy kusza?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"£uk.",DIA_Tandor_Equipment_Bow);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Kusza.",DIA_Tandor_Equipment_Crossbow);
};	
FUNC VOID DIA_Tandor_Equipment_Ein()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Ein_15_00"); //Jednorêczna.
	AI_Output (self, other, "DIA_Tandor_Equipment_Ein_08_01"); //W takim razie na pewno przyda ci siê taka broñ!
	B_GiveInvItems (self,other, ItMw_Steinbrecher,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Zwei()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Zwei_15_00"); //Dwurêczna.
	AI_Output (self, other, "DIA_Tandor_Equipment_Zwei_08_01"); //Z t¹ broni¹ bêdziesz œwietnie zabezpieczony.
	B_GiveInvItems (self,other,ItMw_Zweihaender1 ,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Bow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Bow_15_00"); //£uk.
	AI_Output (self, other, "DIA_Tandor_Equipment_Bow_08_01"); //Ten ³uk myœliwski z pewnoœci¹ ci siê spodoba. Dam ci te¿ kilka strza³.
	B_GiveInvItems (self,other,ItRw_Bow_L_03 ,1);
	B_GiveInvItems (self,other, ItRw_Arrow,50);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Crossbow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Crossbow_15_00"); //Kusza.
	AI_Output (self, other, "DIA_Tandor_Equipment_Crossbow_08_01"); //WeŸ proszê tê lekk¹ kuszê. Dorzucê te¿ do niej be³ty.
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
	description	 = 	"Masz jakieœ wieœci?";
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
	AI_Output (other, self, "DIA_Tandor_News_15_00"); //Masz jakieœ wieœci?

	if (hero.guild == GIL_DJG)
		{
			AI_Output (self, other, "DIA_Tandor_News_08_01"); //Jedyna godna uwagi informacja to fakt, ¿e zmierzaj¹ tu ³owcy smoków.
		}
	else
		{
			AI_Output (self, other, "DIA_Tandor_News_08_02"); //Przybyli do nas ³owcy smoków.
			AI_Output (self, other, "DIA_Tandor_News_08_03"); //Wygl¹daj¹ na twardych skurczybyków i lepiej, ¿eby tak by³o, bo d³ugo nie poci¹gn¹.
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

	description	 = 	"Czemu jesteœ taki przybity?";
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
	AI_Output			(other, self, "DIA_Tandor_WASISTLOS_15_00"); //Czemu jesteœ taki przybity?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_01"); //To przez orków, tych kreatur jest coraz wiêcej, w koñcu wszystkich nas pozabijaj¹.
	}
	else
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_02"); //Od tygodni nie otrzymaliœmy przyzwoitego jedzenia, zdechniemy tu z g³odu.
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







































