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
	description	 = 	"Eh, ¿cómo estás?";
};

func int DIA_Parlaf_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Parlaf_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_HALLO_15_00"); //Eh, ¿cómo estás?
	AI_Output (self, other, "DIA_Parlaf_HALLO_03_01"); //¿Tú qué crees? Me paso todo el día en la amoladera, afilando hojas.
	if ((Npc_IsDead(Engor))== FALSE)
	{
		AI_Output (self, other, "DIA_Parlaf_HALLO_03_02"); //Y ayer Engor volvió a reducir nuestras raciones. Si sigue así, nos vamos a morir todos de hambre.
		AI_Output (self, other, "DIA_Parlaf_HALLO_03_03"); //O nos matarán los orcos. No es un futuro muy agradable.
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
	description	 = 	"¿Quién es Engor?";
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
	AI_Output (other, self, "DIA_Parlaf_ENGOR_15_00"); //¿Quién es Engor?
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_01"); //Engor gestiona las provisiones y distribuye las raciones. Y cada semana son más pequeñas.
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_02"); //Bueno, puedes negociar con él, pero solo con dinero contante y sonante.
	AI_Output (other, self, "DIA_Parlaf_ENGOR_15_03"); //¿Y no te lo puedes permitir?
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_04"); //¡Lo máximo que puedo conseguir por la paga piojosa que nos dan es un par de nabos!
	
	Log_CreateTopic (TOPIC_Trader_OC, LOG_NOTE);
	Log_AddEntry(TOPIC_Trader_OC, "Engor gestiona los suministros del castillo y, de paso, hace algún que otro negocio.");     
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
	description	 = 	"¿Dónde puedo encontrar a este Engor?";
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
	AI_Output (other, self, "DIA_Parlaf_Wo_15_00"); //¿Dónde puedo encontrar a este Engor?
	AI_Output (self, other, "DIA_Parlaf_Wo_03_01"); //En la casa de los caballeros. Nada más cruzar la entrada abierta, junto a la herrería.
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
	description	 = 	"¿Qué hay de nuevo?";
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
	AI_Output (other, self, "DIA_Parlaf_HUNGRIG_15_00"); //¿Qué pasa?
	AI_Output (self, other, "DIA_Parlaf_HUNGRIG_03_01"); //¡Ese maldito Engor debería entregar más raciones!
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
	description	 = 	"¿Qué hay de nuevo?";
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
	AI_Output (other, self, "DIA_Parlaf_SATT_15_00"); //¿Qué pasa?
	
	if (DIA_Parlaf_SATT_OneTime == FALSE)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		AI_Output (self, other, "DIA_Parlaf_SATT_03_01"); //Engor ha repartido una nueva ración de carne. Tío, nos hacía muchísima falta.
		DIA_Parlaf_SATT_OneTime = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Parlaf_SATT_03_02"); //Tu llegada es la única noticia nueva.
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















