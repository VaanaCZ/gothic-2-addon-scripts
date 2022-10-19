
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Isgaroth_EXIT   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 999;
	condition   = DIA_Isgaroth_EXIT_Condition;
	information = DIA_Isgaroth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Isgaroth_EXIT_Info()
{
	AI_Output	(self ,other,"DIA_Isgaroth_EXIT_01_00"); //Möge Innos allzeit über dich wachen.
	AI_StopProcessInfos (self);
};
//****************************************************************************
//	Begrüssung
//****************************************************************************

INSTANCE DIA_Isgaroth_Hello   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 2;
	condition   = DIA_Isgaroth_Hello_Condition;
	information = DIA_Isgaroth_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Isgaroth_Hello_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Isgaroth_Hello_Info()
{
	AI_Output (self ,other,"DIA_Isgaroth_Hello_01_00"); //Innos zum Gruß. Was kann ich für dich tun, Wanderer?
}; 
//****************************************************************************
//	Segen
//****************************************************************************
INSTANCE DIA_Isgaroth_Segen   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 10;
	condition   = DIA_Isgaroth_Segen_Condition;
	information = DIA_Isgaroth_Segen_Info;
	permanent   = TRUE;
	description	= "Segne mich!";
};
FUNC INT DIA_Isgaroth_Segen_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Isgaroth_Segen_Info()
{
	AI_Output (other ,self,"DIA_Isgaroth_Segen_15_00"); //Segne mich!
	AI_Output (self ,other,"DIA_Isgaroth_Segen_01_01"); //Ich segne dich im Namen Innos'. Der Herr lasse sein Feuer in deinem Herzen brennen und gebe dir die Kraft, nach seinem Recht zu handeln.
	
	Isgaroth_Segen = TRUE;
}; 
//********************************************************************************
//	Sergio schickt mich  (Wolf Mission)
//********************************************************************************
INSTANCE DIA_Isgaroth_Wolf   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 2;
	condition   = DIA_Isgaroth_Wolf_Condition;
	information = DIA_Isgaroth_Wolf_Info;
	permanent   = FALSE;
	description	= "Sergio schickt mich...";
};
FUNC INT DIA_Isgaroth_Wolf_Condition()
{	
	if (MIS_KlosterArbeit == LOG_RUNNING)
	&& (Sergio_Sends == TRUE) 
	&& (Kapitel == 1)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Isgaroth_Wolf_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_Wolf_15_00"); //Sergio schickt mich. Ich habe seine Aufgabe übernommen. Also, was gibt's?
	AI_Output (self ,other,"DIA_Isgaroth_Wolf_01_01"); //Hier in der Gegend streift seit kurzer Zeit ein dunkler Wolf herum. Spüre ihn auf und erlege ihn.

	MIS_IsgarothWolf = LOG_RUNNING;
	B_LogEntry (Topic_IsgarothWolf,"Am Schrein treibt sich ein dunkler Wolf herum. Ich soll ihn aufspüren und erlegen.");
	
};
//********************************************************************************
// Wolf tot
//********************************************************************************
INSTANCE DIA_Isgaroth_tot   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 2;
	condition   = DIA_Isgaroth_tot_Condition;
	information = DIA_Isgaroth_tot_Info;
	permanent   = TRUE;
	description	= "Ich habe den Wolf erlegt.";
};
FUNC INT DIA_Isgaroth_tot_Condition()
{	
	Wolfi = Hlp_GetNpc (BlackWolf);
	
	if (MIS_IsgarothWolf == LOG_RUNNING)
	&& Npc_IsDead (Wolfi)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Isgaroth_tot_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_tot_15_00"); //Ich habe den Wolf erlegt.
	AI_Output (self ,other,"DIA_Isgaroth_tot_01_01"); //Gute Arbeit, Novize. Du bist ein mutiger Mann. Doch nun geh wieder zurück ins Kloster und verrichte deine Arbeit.
	
	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP (XP_IsgarothWolf);
	AI_StopProcessInfos (self);
	
};
//********************************************************************************
//	Was machst Du hier
//********************************************************************************

INSTANCE DIA_Isgaroth_Job   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 4;
	condition   = DIA_Isgaroth_Job_Condition;
	information = DIA_Isgaroth_Job_Info;
	permanent   = FALSE;
	description	= "Was machst du hier?";
};
FUNC INT DIA_Isgaroth_Job_Condition()
{
	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Isgaroth_Job_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_Job_15_00"); //Was machst du hier?
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_01"); //Ich bin ein Magier des Feuers. Ein Priester unseres Gottes Innos'.
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_02"); //Dieser Schrein ist IHM, dem obersten Gott, dem Schöpfer des Feuers und Herrn der Gerichtsbarkeit geweiht.
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_03"); //Zu mir kommen die Menschen, um zu Innos zu beten und sich segnen zu lassen.
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_04"); //Und für eine kleine Spende bekommst du bei mir verschiedene nützliche Dinge.
	
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Meister Isgaroth handelt mit nützlichen, magischen Gegenständen, am Schrein vor dem Kloster.");
};
//****************************************************************************
//	Trade
//****************************************************************************
INSTANCE DIA_Isgaroth_Trade   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 99;
	condition   = DIA_Isgaroth_Trade_Condition;
	information = DIA_Isgaroth_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description	= "Zeig mir deine Ware.";
};
FUNC INT DIA_Isgaroth_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Isgaroth_Job)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Isgaroth_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Isgaroth_Trade_15_00"); //Zeig mir deine Ware.
};
//********************************************************************************
//	Kloster
//********************************************************************************
INSTANCE DIA_Isgaroth_Kloster   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 3;
	condition   = DIA_Isgaroth_Kloster_Condition;
	information = DIA_Isgaroth_Kloster_Info;
	permanent   = FALSE;
	description	= "Wohin komme ich, wenn ich diesen Weg weitergehe?";
};
FUNC INT DIA_Isgaroth_Kloster_Condition()
{	
	if (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Isgaroth_Kloster_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_Kloster_15_00"); //Wohin komme ich, wenn ich diesen Weg weitergehe?
	AI_Output (self ,other,"DIA_Isgaroth_Kloster_01_01"); //Der Weg führt zum Kloster der Feuermagier. Doch der Zutritt ist nur den Dienern Innos' gestattet.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Isgaroth_Kloster_01_02"); //Und wenn du als Novize im Kloster aufgenommen werden willst, musst du ein Schaf mitbringen und ...
		B_Say_Gold (self, other,Summe_Kloster);
		
		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Um im Innos - Kloster als Novize aufgenommen zu werden, brauche ich ein Schaf und 1000 Goldstücke.");
	}
	else 
	{
		AI_Output (self ,other,"DIA_Isgaroth_Kloster_01_03"); //Da du dich bereits einer anderen Gruppe angeschlossen hast, wird dir der Zugang verwehrt bleiben.
	};
};



//******************************************************************************************
//	Vatras Auftrag
//******************************************************************************************
INSTANCE DIA_Isgaroth_Vatras   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 3;
	condition   = DIA_Isgaroth_Vatras_Condition;
	information = DIA_Isgaroth_Vatras_Info;
	permanent   = TRUE;
	description	= "Ich habe eine Botschaft von Vatras.";
};
FUNC INT DIA_Isgaroth_Vatras_Condition()
{
	if (MIS_Vatras_Message == LOG_RUNNING)
	&& ((Npc_HasItems (other,ItWr_VatrasMessage) == 1)
	||  (Npc_HasItems (other,ItWr_VatrasMessage_open) == 1))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Isgaroth_Vatras_Info()
{
	AI_Output (other,self ,"DIA_ISgaroth_Vatras_15_00"); //Ich habe eine Botschaft von Vatras.
	AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_01"); //Wie lautet diese Botschaft?
	AI_Output (other,self ,"DIA_Isgaroth_Vatras_15_02"); //Es ist ein Brief. Hier.
	
	if (Npc_HasItems (other,ItWr_VatrasMessage) == 1)
	{
		if B_GiveInvItems (other,self ,ItWr_VatrasMessage,1)
		{
			Npc_RemoveInvItems (self,ItWr_VatrasMessage,1); 
		};
		B_UseFakeScroll();
	
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_03"); //Gut, du kannst Vatras ausrichten, dass ich die Nachricht erhalten habe.
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_04"); //Als Belohnung für deine Dienste nimm diese Tränke, sie werden dir sicher noch nützlich sein.
		
		CreateInvItems (self, ItPo_Health_02,2);
		B_GiveInvItems (self,other,ItPo_Health_02,2);
		
		B_GivePlayerXP ((XP_Ambient)*2);
		
	}
	else if (Npc_HasItems (other,ItWr_VatrasMessage_open) == 1)
	{
		if B_GiveInvItems (other,self ,ItWr_VatrasMessage_open,1)
		{
			Npc_RemoveInvItems (self,ItWr_VatrasMessage_open,1); 
		};
		B_UseFakeScroll ();
	
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_05"); //Das Siegel ist gebrochen. Was fällt dir ein, du Narr.
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_06"); //Geh und sage Vatras, dass ich seine Nachricht erhalten habe.
		AI_StopProcessInfos (self);
	};	
	Vatras_Return = TRUE;
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Isgaroth_PICKPOCKET (C_INFO)
{
	npc			= KDF_509_Isgaroth;
	nr			= 900;
	condition	= DIA_Isgaroth_PICKPOCKET_Condition;
	information	= DIA_Isgaroth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Isgaroth_PICKPOCKET_Condition()
{
	C_Beklauen (48, 50);
};
 
FUNC VOID DIA_Isgaroth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Isgaroth_PICKPOCKET);
	Info_AddChoice		(DIA_Isgaroth_PICKPOCKET, DIALOG_BACK 		,DIA_Isgaroth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Isgaroth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Isgaroth_PICKPOCKET_DoIt);
};

func void DIA_Isgaroth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Isgaroth_PICKPOCKET);
};
	
func void DIA_Isgaroth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Isgaroth_PICKPOCKET);
};


