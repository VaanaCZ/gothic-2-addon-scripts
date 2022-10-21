///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Sancho_EXIT   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 999;
	condition   = DIA_Addon_Sancho_EXIT_Condition;
	information = DIA_Addon_Sancho_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Sancho_PICKPOCKET (C_INFO)
{
	npc			= BDT_1073_Addon_Sancho;
	nr			= 900;
	condition	= DIA_Addon_Sancho_PICKPOCKET_Condition;
	information	= DIA_Addon_Sancho_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Sancho_PICKPOCKET_Condition()
{
	C_Beklauen (50, 40);
};
 
FUNC VOID DIA_Addon_Sancho_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Sancho_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Sancho_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Sancho_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Sancho_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Sancho_PICKPOCKET_DoIt);
};

func void DIA_Addon_Sancho_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Sancho_PICKPOCKET);
};
	
func void DIA_Addon_Sancho_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Sancho_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_HI   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 2;
	condition   = DIA_Addon_Sancho_HI_Condition;
	information = DIA_Addon_Sancho_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Sancho_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_HI_Info()
{	
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_00"); //Mierda, otro chico nuevo. (risas) Vienes a por oro, �verdad?
	AI_Output (other,self,"DIA_Addon_Sancho_HI_15_01"); //�Oro?
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_02"); //(riendo) �No me tomes el pelo!
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_03"); //Todos los nuevos que llegan quieren entrar a la mina.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_04"); //�Pero no creas que es cosa f�cil!

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	
	SC_KnowsRavensGoldmine = TRUE;
};

//---------------------------------------------------------------------
//	Lager
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Lager   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 2;
	condition   = DIA_Addon_Sancho_Lager_Condition;
	information = DIA_Addon_Sancho_Lager_Info;
	permanent   = FALSE;
	description = "�C�mo se llega al campamento?";
};
FUNC INT DIA_Addon_Sancho_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_Lager_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Lager_15_00"); //�C�mo se llega al campamento?
	AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_01"); //�Sigue el paseo mar�timo!
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_02"); //Pero si quieres entrar a la mina, tendr�s que superar a Franco.
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_03"); //�Quiere que todos los nuevos se maten antes aqu� a trabajar!
	};
	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Todos los nuevos tienen que trabajar en la ci�naga antes de poder entrar en la mina.");
};

//---------------------------------------------------------------------
//	Mine
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Mine   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 3;
	condition   = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent   = FALSE;
	description = "H�blame m�s sobre la mina�";
};
FUNC INT DIA_Addon_Sancho_Mine_Condition()
{	
	if (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Mine_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Mine_15_00"); //H�blame sobre la mina
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_01"); //Te dar� un buen consejo: si quieres entrar, ll�vate bien con Franco. �l manda aqu� fuera.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_02"); //�l decide qui�n es el siguiente en pasar.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_03"); //Pero s�lo te dejar� entrar si no te dedicas a timar fuera.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_04"); //�As� que ve a verle y haz que te d� un trabajo!
	
	B_LogEntry (Topic_Addon_Franco,"FRANCO decide qui�n entra en el campamento. Tambi�n asigna las tareas.");
};

//---------------------------------------------------------------------
// Wo Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Franco (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 4;
	condition   = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent   = FALSE;
	description = "�D�nde puedo encontrar a ese tal Franco?";
};
FUNC INT DIA_Addon_Sancho_Franco_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Sancho_Mine))
	&& (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Franco_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Franco_15_00"); //�D�nde puedo encontrar a ese tal Franco?
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_01"); //Suele andar por el patio que hay frente al campamento.
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_02"); //�Ll�vate bien con �l o terminar�s con un curro asqueroso como el m�o!
	
	B_LogEntry (Topic_Addon_Franco,"Franco anda por el patio que hay al entrar al campamento.");
};

//---------------------------------------------------------------------
//	Spitzel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Spitzel (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 5;
	condition   = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent   = FALSE;
	description = "�Tienes que estar aqu� todo el rato?";
};
FUNC INT DIA_Addon_Sancho_Spitzel_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Sancho_Franco))
	|| (Npc_IsDead(Franco))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Spitzel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Spitzel_15_00");//�Tienes que estar por aqu� todo el rato?
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_01");//Tengo que controlar a todos los nuevos que llegan para asegurarme de que no son esp�as.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_02");//Pero puedes olvidarte Total, estamos en el fin del mundo, en medio de un pantano.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_03");//Nadie puede encontrarnos, y nadie nos encontrar�. �Por qu� se iba a molestar alguien en mandarnos un esp�a?
};

//---------------------------------------------------------------------
//	Info Perm
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Perm   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 99;
	condition   = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent   = TRUE;
	description = "�Qu� hay de nuevo?";
};
FUNC INT DIA_Addon_Sancho_Perm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Sancho_Spitzel)
	{	
		return TRUE;
	};
};
var int Comment_Franco;
var int Comment_Esteban;
FUNC VOID DIA_Addon_Sancho_Perm_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Perm_15_00");//�Alguna novedad?
	
	if Npc_IsDead (Franco)
	&& (Comment_Franco == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_01");//He o�do que has matado a Franco. Buen trabajo
		
		if !Npc_IsDead (Carlos)
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_02");//�pero ahora tenemos a ese Carlos vigil�ndonos. No es para tomarlo a broma
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_03");//�Y tambi�n has acabado con Carlos? Vaya, eres un asesino en serie, �no? D�jame en paz.
		};
		
		Comment_Franco = TRUE;
	}
	else if Npc_IsDead (Esteban)
	&& (Comment_Esteban == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_04");//He o�do que has matado a Esteban. T� andas tramando algo, �no es as�?
		
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_05");//Nah, ahora no hay nada nuevo.
	};
	
};





