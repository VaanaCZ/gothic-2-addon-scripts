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
	AI_Output (self, other, "DIA_Marcos_Hallo_04_00");//FERMO, nel nome di Innos! Io sono Marcos, paladino del re. Dimmi cosa vuoi, e non mentire!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_01");//L'Eletto di Innos dice sempre la verità.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_02");//Perdonami, venerabile mago. Non avevo capito con chi stavo parlando.
		AI_Output (other, self, "DIA_Marcos_Hallo_15_03");//D'accordo, tutto a posto, non preoccuparti.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_04");//Se mi è permesso chiederlo, cosa ti porta qui?
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_05");//Rilassati, sono al servizio di Lord Hagen.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_06");//Sei una delle truppe. Quali ordini ti portano qui?
	}
	else //SLD
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_07");//Rilassati, lavoriamo per lo stesso capo, Lord Hagen.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_08");//Da quando Lord Hagen assolda dei mercenari? Parla, cosa cerchi qui?
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
	description	= "Devo portare a Lord Hagen la prova che i draghi esistono.";
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
	AI_Output (other, self, "DIA_Marcos_Hagen_15_00");//Devo portare a Lord Hagen la prova che i draghi esistono.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_01");//Allora non dovresti perdere tempo e rischiare la tua vita inutilmente.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_02");//Pensi forse di trovare una scaglia di drago da portargli proprio qui?
	AI_Output (self, other, "DIA_Marcos_Hagen_04_03");//Prova a raggiungere il castello e parlare con il comandante Garond.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_04");//Dev'essere informato della tua missione da parte di Lord Hagen! E si occuperà anche del tuo incarico.
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
	description	= "Sono stato da Garond...";
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
	AI_Output (other, self, "DIA_Marcos_Garond_15_00");//Vengo da parte di Garond, ha bisogno di sapere quanto metallo è pronto per il trasporto.
	AI_Output (self, other, "DIA_Marcos_Garond_04_01");//Di' a Garond che abbiamo abbandonato la miniera poiché gli attacchi degli orchi erano diventati troppo violenti.
	AI_Output (self, other, "DIA_Marcos_Garond_04_02");//Ho provato a raggiungere il castello con qualche uomo, ma sono l'unico sopravvissuto.
	AI_Output (self, other, "DIA_Marcos_Garond_04_03");//Ho nascosto il metallo in un posto sicuro. Ci sono QUATTRO forzieri. Vai da Garond a riferirglielo.
	AI_Output (self, other, "DIA_Marcos_Garond_04_04");//Digli che proteggerò i forzieri a costo della mia vita. Ma non so quanto ci metteranno gli orchi a trovarmi.
	AI_Output (self, other, "DIA_Marcos_Garond_04_05");//Digli di mandarmi dei rinforzi.
	AI_Output (other, self, "DIA_Marcos_Garond_15_06");//Glielo farò sapere.
	
	B_LogEntry (TOPIC_ScoutMine,"Il paladino Marcos è di guardia a QUATTRO casse di metallo in una piccola valle.");
	
	Log_CreateTopic (Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus (Topic_MarcosJungs,LOG_RUNNING);
	B_LogEntry (Topic_MarcosJungs,"Marcos vuole che Garond gli mandi qualcuno in aiuto.");
	
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
	description	= "Come vanno le cose?";
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

	AI_Output (other, self, "DIA_Marcos_Perm_15_00");//Come vanno le cose?
	
	if (self.attribute [ATR_HITPOINTS]) < (self.attribute [ATR_HITPOINTS_MAX] /2)  
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_01");//Ho bisogno di un buon sorso di una pozione guaritrice!
		B_UseItem (self, ItPo_Health_03);  
		
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_02");//Resisterò e spero che Garond mi manderà presto dei rinforzi.
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_03");//Grazie per l'aiuto. Innos ci darà la forza per resistere.
		
		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_04");//Resisterò, poiché Innos è con me!
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


	
	
	
	
	
	

	

	
	
