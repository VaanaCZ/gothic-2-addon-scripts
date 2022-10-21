// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Marcos_EXIT(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 999;
	condition	= DIA_Marcos_EXIT_Condition;
	information	= DIA_Marcos_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Marcos_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Marcos_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};	
// ************************************************************
// 			  Hallo				 
// ************************************************************
INSTANCE DIA_Marcos_Hallo(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Hallo_Condition;
	information	= DIA_Marcos_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Marcos_Hallo_Condition()
{	
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Marcos_Hallo_04_00");//�ALTO, en nombre de Innos! Soy Marcos, palad�n del rey. �Dime qu� es lo que quieres y no mientas!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_01");//Un elegido de Innos siempre dice la verdad.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_02");//Perdonadme, reverendo mago. No me hab�a dado cuenta de con qui�n estaba hablando.
		AI_Output (other, self, "DIA_Marcos_Hallo_15_03");//S�, de acuerdo, no te preocupes.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_04");//Si se me permite la pregunta, �qu� le trae por esta zona?
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_05");//Tranquilo, estoy al servicio de lord Hagen.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_06");//Eres uno de sus soldados. �Qu� �rdenes has recibido?
	}
	else //SLD
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_07");//Tranquilo, trabajamos para el mismo, para lord Hagen.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_08");//�Desde cuando contrata lord Hagen a mercenarios? Habla, �qu� est�s buscando aqu�?
	};

};
// ************************************************************
// 			  Hagen			 
// ************************************************************
INSTANCE DIA_Marcos_Hagen(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Hagen_Condition;
	information	= DIA_Marcos_Hagen_Info;
	permanent	= FALSE;
	description	= "Debo llevarle pruebas a lord Hagen de la existencia de los dragones.";
};                       

FUNC INT DIA_Marcos_Hagen_Condition()
{	
	if (Kapitel == 2)
	&& (Garond.aivar [AIV_TalkedToPlayer] == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Hagen_Info()
{	
	AI_Output (other, self, "DIA_Marcos_Hagen_15_00");//Debo llevarle pruebas a lord Hagen de la existencia de los dragones.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_01");//Entonces no deber�as perder tiempo ni arriesgar la vida de manera innecesaria.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_02");//�Crees que vas a encontrar aqu� una escama de drag�n para poder llev�rsela?
	AI_Output (self, other, "DIA_Marcos_Hagen_04_03");//Intenta llegar al castillo y habla con el comandante Garond.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_04");//�Tiene que saber que est�s en una misi�n por encargo de lord Hagen! �l se encargar� de tu tarea.
};	

// ************************************************************
// 			  Garond			 
// ************************************************************
INSTANCE DIA_Marcos_Garond(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Garond_Condition;
	information	= DIA_Marcos_Garond_Info;
	permanent	= FALSE;
	description	= "Vengo de parte de Garond...";
};                       

FUNC INT DIA_Marcos_Garond_Condition()
{	
	if (Kapitel == 2)
	&& (MIS_OLDWORLD == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Garond_Info()
{	
	AI_Output (other, self, "DIA_Marcos_Garond_15_00");//Vengo de parte de Garond. Necesita saber cu�nto mineral est� listo para el transporte.
	AI_Output (self, other, "DIA_Marcos_Garond_04_01");//Dile a Garond que tuve que salir de la mina porque los ataques orcos se hicieron demasiado intensos.
	AI_Output (self, other, "DIA_Marcos_Garond_04_02");//Intent�, con otros pocos, llegar al castillo, pero soy el �nico superviviente.
	AI_Output (self, other, "DIA_Marcos_Garond_04_03");//He puesto a salvo el mineral. Hay CUATRO cofres. Ve a informar a Garond de ello.
	AI_Output (self, other, "DIA_Marcos_Garond_04_04");//Dile que proteger� el mineral con mi vida. Pero no s� cu�nto van a tardar en encontrarme los orcos.
	AI_Output (self, other, "DIA_Marcos_Garond_04_05");//Dile que me env�e refuerzos.
	AI_Output (other, self, "DIA_Marcos_Garond_15_06");//Se lo dir�.
	
	B_LogEntry (TOPIC_ScoutMine,"Marcos, el palad�n, custodia CUATRO cajones de mineral en un peque�o valle.");
	
	Log_CreateTopic (Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus (Topic_MarcosJungs,LOG_RUNNING);
	B_LogEntry (Topic_MarcosJungs,"Marcos quiere que Garond le env�e algo de ayuda.");
	
	MIS_Marcos_Jungs = LOG_RUNNING;
	Marcos_Ore = TRUE;
	self.flags = 0;
};	
	
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Marcos_Perm(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 9;
	condition	= DIA_Marcos_Perm_Condition;
	information	= DIA_Marcos_Perm_Info;
	permanent	= TRUE;
	description	= "�C�mo van las cosas?";
};                       

FUNC INT DIA_Marcos_Perm_Condition()
{	
	if (Kapitel >= 2)
	&& (Npc_KnowsInfo (other, DIA_Marcos_Hagen)
	|| Npc_KnowsInfo (other, DIA_Marcos_Garond))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Perm_Info()
{	

	AI_Output (other, self, "DIA_Marcos_Perm_15_00");//�Cu�l es la situaci�n?
	
	if (self.attribute [ATR_HITPOINTS]) < (self.attribute [ATR_HITPOINTS_MAX] /2)  
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_01");//�Se me acaban las reservas de pociones de curaci�n!
		B_UseItem (self, ItPo_Health_03);  
		
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_02");//Aguantar�. Espero que Garond me env�e refuerzos deprisa.
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_03");//Gracias por la ayuda. Innos me dar� fuerza para aguantar.
		
		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_04");//�Resistir� porque Innos est� conmigo!
	};
	
	AI_StopProcessInfos (self);
};		
	

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Marcos_PICKPOCKET (C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 900;
	condition	= DIA_Marcos_PICKPOCKET_Condition;
	information	= DIA_Marcos_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Marcos_PICKPOCKET_Condition()
{
	C_Beklauen (65, 380);
};
 
FUNC VOID DIA_Marcos_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Marcos_PICKPOCKET);
	Info_AddChoice		(DIA_Marcos_PICKPOCKET, DIALOG_BACK 		,DIA_Marcos_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Marcos_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Marcos_PICKPOCKET_DoIt);
};

func void DIA_Marcos_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Marcos_PICKPOCKET);
};
	
func void DIA_Marcos_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Marcos_PICKPOCKET);
};


	
	
	
	
	
	

	

	
	
