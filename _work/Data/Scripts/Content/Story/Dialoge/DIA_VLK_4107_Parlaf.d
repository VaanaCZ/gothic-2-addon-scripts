///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlaf_EXIT   (C_INFO)
{
	npc         = VLK_4107_Parlaf;
	nr          = 999;
	condition   = DIA_Parlaf_EXIT_Condition;
	information = DIA_Parlaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Parlaf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Parlaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4107_Parlaf;
	nr		 	 = 	1;
	condition	 = 	DIA_Parlaf_HALLO_Condition;
	information	 = 	DIA_Parlaf_HALLO_Info;
	description	 = 	"Ehi, come va?";
};

func int DIA_Parlaf_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Parlaf_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_HALLO_15_00"); //Ehi, come va?
	AI_Output (self, other, "DIA_Parlaf_HALLO_03_01"); //Come pensi che stia? Trascorro l'intera giornata alla mola, affilando le lame.
	if ((Npc_IsDead(Engor))== FALSE)
	{
		AI_Output (self, other, "DIA_Parlaf_HALLO_03_02"); //E ieri Engor ha nuovamente ridotto le razioni. Se continua così, finiremo per morire tutti di fame.
		AI_Output (self, other, "DIA_Parlaf_HALLO_03_03"); //O saremo tutti uccisi dagli orchi. Una prospettiva non proprio piacevole.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info ENGOR
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_ENGOR		(C_INFO)
{
	npc		 	 = 	VLK_4107_Parlaf;
	nr			 = 	2;
	condition	 = 	DIA_Parlaf_ENGOR_Condition;
	information	 = 	DIA_Parlaf_ENGOR_Info;
	description	 = 	"Chi è Engor?";
};

func int DIA_Parlaf_ENGOR_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Parlaf_HALLO)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlaf_ENGOR_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_ENGOR_15_00"); //Chi è Engor?
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_01"); //Engor si occupa delle provviste e divide le razioni. Ed esse si riducono ogni settimana.
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_02"); //Certo, puoi contrattare con lui, ma solo per il freddo, duro denaro.
	AI_Output (other, self, "DIA_Parlaf_ENGOR_15_03"); //E non puoi permettertelo?
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_04"); //Tutto quello che posso permettermi con questa paga ridicola è un paio di rape!
	
	Log_CreateTopic (TOPIC_Trader_OC, LOG_NOTE);
	Log_AddEntry(TOPIC_Trader_OC, "Engor gestisce i rifornimenti al castello e ci fa degli affari extra.");     
};
///////////////////////////////////////////////////////////////////////
//	Info Wo Engor
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_Wo		(C_INFO)
{
	npc		 	 = 	VLK_4107_Parlaf;
	nr		 	 = 	3;
	condition	 = 	DIA_Parlaf_Wo_Condition;
	information	 = 	DIA_Parlaf_Wo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dove si trova questo Engor?";
};

func int DIA_Parlaf_Wo_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Parlaf_ENGOR)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlaf_Wo_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_Wo_15_00"); //Dove si trova questo Engor?
	AI_Output (self, other, "DIA_Parlaf_Wo_03_01"); //Negli alloggi dei cavalieri. Vai dritto nell'entrata di fianco alla fucina.
};
///////////////////////////////////////////////////////////////////////
//	Info HUNGRIG
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_HUNGRIG		(C_INFO)
{
	npc		     = 	VLK_4107_Parlaf;
	nr		     = 	2;
	condition	 = 	DIA_Parlaf_HUNGRIG_Condition;
	information	 = 	DIA_Parlaf_HUNGRIG_Info;
	permanent	 = 	TRUE;
	description	 = 	"Novità?";
};

func int DIA_Parlaf_HUNGRIG_Condition ()
{
	if (MIS_Engor_BringMeat != LOG_SUCCESS)
	&& Npc_KnowsInfo (hero,DIA_Parlaf_HALLO)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlaf_HUNGRIG_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_HUNGRIG_15_00"); //Cosa succede?
	AI_Output (self, other, "DIA_Parlaf_HUNGRIG_03_01"); //Quel dannato Engor dovrebbe darci più razioni!
};
///////////////////////////////////////////////////////////////////////
//	Info SATT
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_SATT		(C_INFO)
{
	npc		 	 = 	VLK_4107_Parlaf;
	nr		 	 = 	3;
	condition	 = 	DIA_Parlaf_SATT_Condition;
	information	 = 	DIA_Parlaf_SATT_Info;
	permanent	 = 	TRUE;
	description	 = 	"Novità?";
};

func int DIA_Parlaf_SATT_Condition ()
{
	if ((MIS_Engor_BringMeat == LOG_SUCCESS) || (Npc_IsDead(Engor)))
	&& (Npc_KnowsInfo (hero,DIA_Parlaf_HALLO))
	{
		return TRUE;
	};
};
var int DIA_Parlaf_SATT_OneTime;
func void DIA_Parlaf_SATT_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_SATT_15_00"); //Cosa succede?
	
	if (DIA_Parlaf_SATT_OneTime == FALSE)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		AI_Output (self, other, "DIA_Parlaf_SATT_03_01"); //Engor ci ha dato una nuova razione di carne. Ah, ci voleva proprio.
		DIA_Parlaf_SATT_OneTime = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Parlaf_SATT_03_02"); //Il tuo arrivo è l'unica notizia veramente recente.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Parlaf_PICKPOCKET (C_INFO)
{
	npc			= VLK_4107_Parlaf;
	nr			= 900;
	condition	= DIA_Parlaf_PICKPOCKET_Condition;
	information	= DIA_Parlaf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Parlaf_PICKPOCKET_Condition()
{
	C_Beklauen (34, 12);
};
 
FUNC VOID DIA_Parlaf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Parlaf_PICKPOCKET);
	Info_AddChoice		(DIA_Parlaf_PICKPOCKET, DIALOG_BACK 		,DIA_Parlaf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Parlaf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Parlaf_PICKPOCKET_DoIt);
};

func void DIA_Parlaf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Parlaf_PICKPOCKET);
};
	
func void DIA_Parlaf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Parlaf_PICKPOCKET);
};















