///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Salandril_EXIT   (C_INFO)
{
	npc         = VLK_422_Salandril;
	nr          = 999;
	condition   = DIA_Salandril_EXIT_Condition;
	information = DIA_Salandril_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Salandril_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Salandril_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Salandril_PICKPOCKET (C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 900;
	condition	= DIA_Salandril_PICKPOCKET_Condition;
	information	= DIA_Salandril_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Украсть этот ключ будет легко)";
};
//----------------------------------------                       
var int DIA_Salandril_PICKPOCKET_perm;
//----------------------------------------
FUNC INT DIA_Salandril_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (DIA_Salandril_PICKPOCKET_perm == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Salandril_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Salandril_PICKPOCKET);
	Info_AddChoice		(DIA_Salandril_PICKPOCKET, DIALOG_BACK 		,DIA_Salandril_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Salandril_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Salandril_PICKPOCKET_DoIt);
};

func void DIA_Salandril_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		CreateInvItems (self, ItKe_Salandril, 1);
		B_GiveInvItems (self, other, ItKe_Salandril, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		
		DIA_Salandril_PICKPOCKET_perm = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Salandril_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Salandril_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Salandril_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Hallo		(C_INFO)
{
	npc			 = 	VLK_422_Salandril;
	nr			 = 	2;
	condition	 = 	DIA_Salandril_Hallo_Condition;
	information	 = 	DIA_Salandril_Hallo_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};

func int DIA_Salandril_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_OLDWORLD != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Salandril_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Salandril_PERM_13_00"); //Добро пожаловать, путник. Ищешь хорошее зелье?
	AI_Output (self, other, "DIA_Salandril_PERM_13_01"); //У меня большой выбор и умеренные цены. Мои зелья лучше, чем та отрава, что продает Зурис.
	
	Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, "Саландрил торгует зельями. Его лавка находится в верхнем квартале."); 
};
///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Trank		(C_INFO)
{
	npc			 = 	VLK_422_Salandril;
	nr			 = 	2;
	condition	 = 	DIA_Salandril_Trank_Condition;
	information	 = 	DIA_Salandril_Trank_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Salandril_Trank_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_OLDWORLD == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Salandril_KLOSTER) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Salandril_Trank_Info ()
{
	AI_Output (self, other, "DIA_Salandril_Trank_13_00"); //Я слышал, ты был с паладинами в Долине Рудников. Я восхищен.
	AI_Output (self, other, "DIA_Salandril_Trank_13_01"); //Тебе стоит задержаться и взглянуть на мои товары. Вот, например, сейчас у меня есть совершенно особенное зелье. Только для тебя.
	
	CreateInvItems (self,ItPo_Perm_DEX,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Trade		(C_INFO)
{
	npc			 = 	VLK_422_Salandril;
	nr			 = 	9;
	condition	 = 	DIA_Salandril_Trade_Condition;
	information	 = 	DIA_Salandril_Trade_Info;
	permanent	 = 	TRUE;
	description	 =  "Покажи мне свои товары.";
	trade		 =  TRUE;
};

func int DIA_Salandril_Trade_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Salandril_KLOSTER) == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Salandril_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Salandril_Trade_15_00"); //Покажи мне свои товары.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Salandril_Trade_13_01"); //С удовольствием, преподобный брат.
		if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
		{
			SC_KnowsProspektorSalandril = TRUE;
		};
	};
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Salandril_Trade_13_02"); //С удовольствием, о, благородный воин.
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

INSTANCE DIA_Salandril_KAP3_EXIT(C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 999;
	condition	= DIA_Salandril_KAP3_EXIT_Condition;
	information	= DIA_Salandril_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};     
                  
FUNC INT DIA_Salandril_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Salandril_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_KLOSTER		(C_INFO)
{
	npc		 = 	VLK_422_Salandril;
	nr		 = 	2;
	condition	 = 	DIA_Salandril_KLOSTER_Condition;
	information	 = 	DIA_Salandril_KLOSTER_Info;

	description	 = 	"Ты должен отправиться в монастырь, чтобы предстать перед судом.";
};

func int DIA_Salandril_KLOSTER_Condition ()
{
	if ((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Salandril_KLOSTER_Info ()
{
	AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_00"); //Ты должен отправиться в монастырь, чтобы предстать перед судом.
	AI_Output			(self, other, "DIA_Salandril_KLOSTER_13_01"); //Что? У тебя крыша поехала? Черта с два! У этих жалких магов нет никаких доказательств против меня.

	if (hero.guild == GIL_KDF)
	&& (SC_KnowsProspektorSalandril == TRUE)		
	{
		AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_02"); //А как насчет этих фальшивых акций, которыми ты наводнил всю страну? На них твоя подпись. Ты виновен.
	}
	else
	{
		AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_03"); //У меня есть приказ, и я выполню его. Так что, либо ты пойдешь сам, либо мне придется заставить тебя.
	};
	AI_Output			(self, other, "DIA_Salandril_KLOSTER_13_04"); //Что? Да я протащу тебя через весь город за шиворот, как паршивого щенка, и вышвырну за ворота.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info GehinsKloster
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_GehinsKloster		(C_INFO)
{
	npc		 = 	VLK_422_Salandril;
	nr		 = 	2;
	condition	 = 	DIA_Salandril_GehinsKloster_Condition;
	information	 = 	DIA_Salandril_GehinsKloster_Info;

	description	 = 	"Так ты пойдешь в монастырь, или тебя еще раз проучить?..";
};

func int DIA_Salandril_GehinsKloster_Condition ()
{
	if ((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Npc_KnowsInfo(other, DIA_Salandril_KLOSTER))
		{
				return TRUE;
		};
};

func void DIA_Salandril_GehinsKloster_Info ()
{
	AI_Output			(other, self, "DIA_Salandril_GehinsKloster_15_00"); //Так ты пойдешь в монастырь, или тебя еще раз проучить?..
	AI_Output			(self, other, "DIA_Salandril_GehinsKloster_13_01"); //Ты еще пожалеешь об этом. Да, черт тебя побери, я пойду в этот монастырь, но тебе это просто так с рук не сойдет.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"KlosterUrteil");
	MIS_Serpentes_BringSalandril_SLD = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Verschwinde		(C_INFO)
{
	npc		 = 	VLK_422_Salandril;
	nr		 = 	2;
	condition	 = 	DIA_Salandril_Verschwinde_Condition;
	information	 = 	DIA_Salandril_Verschwinde_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Salandril_Verschwinde_Condition ()
{
	if (MIS_Serpentes_BringSalandril_SLD == LOG_SUCCESS)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Salandril_Verschwinde_Info ()
{
	B_Verschwinde_Stimme13 ();
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Salandril_KAP4_EXIT(C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 999;
	condition	= DIA_Salandril_KAP4_EXIT_Condition;
	information	= DIA_Salandril_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Salandril_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Salandril_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Salandril_KAP5_EXIT(C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 999;
	condition	= DIA_Salandril_KAP5_EXIT_Condition;
	information	= DIA_Salandril_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Salandril_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Salandril_KAP5_EXIT_Info()
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


INSTANCE DIA_Salandril_KAP6_EXIT(C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 999;
	condition	= DIA_Salandril_KAP6_EXIT_Condition;
	information	= DIA_Salandril_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Salandril_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Salandril_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};































