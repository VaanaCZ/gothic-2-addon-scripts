///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Tengron_EXIT   (C_INFO)
{
	npc         = Pal_280_Tengron;
	nr          = 999;
	condition   = DIA_Tengron_EXIT_Condition;
	information = DIA_Tengron_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Tengron_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Tengron_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_First		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	2;
	condition	 = 	DIA_Tengron_First_Condition;
	information	 = 	DIA_Tengron_First_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tengron_First_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_ScoutMine != LOG_RUNNING)
	&& (MIS_ScoutMine != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Tengron_First_Info ()
{
	AI_Output (self, other, "DIA_Tengron_First_07_00"); //Was machst du hier?
	AI_Output (other, self, "DIA_Tengron_First_15_01"); //Ich bin im Auftrag von Lord Hagen unterwegs.
	AI_Output (self, other, "DIA_Tengron_First_07_02"); //Du musst unbedingt versuchen, die Burg zu erreichen und mit Kommandant Garond sprechen.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HALLO		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	2;
	condition	 = 	DIA_Tengron_HALLO_Condition;
	information	 = 	DIA_Tengron_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tengron_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_ScoutMine == LOG_RUNNING)
	|| (MIS_ScoutMine == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Tengron_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Tengron_HALLO_07_00"); //Innos sei mit dir! Bringst du Nachrichten aus der Burg? Kommt bald Verstärkung?
	
	if (Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output (other, self, "DIA_Tengron_HALLO_15_01"); //Ich bin nicht hier, um Nachricht zu bringen, sondern um welche abzuholen.
		AI_Output (self, other, "DIA_Tengron_HALLO_07_02"); //Dann sprich mit Fajeth. Er hat hier das Kommando. Aber wenn du Neuigkeiten aus der Burg hast, dann lass es mich wissen.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_News		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	7;
	condition	 = 	DIA_Tengron_News_Condition;
	information	 = 	DIA_Tengron_News_Info;
	permanent 	 =  FALSE;
	description	 = 	"Wegen der Neuigkeiten...";
};

func int DIA_Tengron_News_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_News_Info ()
{
	AI_Output (other, self, "DIA_Tengron_News_15_00"); //Wegen der Neuigkeiten...
	AI_Output (self, other, "DIA_Tengron_News_07_01"); //Ja - wie ist die Situation in der Burg?
	AI_Output (other, self, "DIA_Tengron_News_15_02"); //Die Orks halten ihre Belagerung aufrecht und sie ist nach wie vor den Angriffen der Drachen ausgeliefert.
	AI_Output (self, other, "DIA_Tengron_News_07_03"); //Verdammt, hoffentlich werden die Jungs durchhalten.
	AI_Output (self, other, "DIA_Tengron_News_07_04"); //Pass auf, in der Burg sitzt ein Freund von mir. Er heißt Udar. Wir kennen uns schon sehr lange und haben manche Schlacht Seite an Seite geschlagen.
	AI_Output (self, other, "DIA_Tengron_News_07_05"); //Ich möchte, dass du ihm diesen Ring bringst. Er soll ihn für mich aufbewahren. Sag ihm, ich werde ihn abholen, wenn ich wieder zurück bin.
	
	Info_ClearChoices (DIA_Tengron_News);
	
	Info_AddChoice (DIA_Tengron_News,"Dafür habe ich keine Zeit",DIA_Tengron_News_No);
	Info_AddChoice (DIA_Tengron_News,"Kein Problem...",DIA_Tengron_News_Yes);
};
FUNC VOID DIA_Tengron_News_No()
{
	AI_Output (other, self, "DIA_Tengron_News_No_15_00"); //Dafür habe ich keine Zeit.
	AI_Output (self, other, "DIA_Tengron_News_No_07_01"); //Verstehe.
	
	Info_ClearChoices (DIA_Tengron_News);
};
FUNC VOID DIA_Tengron_News_Yes()
{
	AI_Output (other, self, "DIA_Tengron_News_Yes_15_00"); //Kein Problem. Wenn ich in die Burg komme, gebe ich den Ring Udar.
	AI_Output (self, other, "DIA_Tengron_News_Yes_07_01"); //Gut. Die Magie des Ringes wird Udar neue Kraft schenken. Und sag ihm, dass ich ihn mir wieder abholen werde!
	
	B_GiveInvItems (self,other,ItRi_Tengron,1);
	Info_ClearChoices (DIA_Tengron_News);
	
	Log_CreateTopic (Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus (Topic_TengronRing,LOG_RUNNING);
	B_LogEntry (Topic_TengronRing,"Tengron hat mir einen Ring gegeben, den ich Udar in der Burg übergeben soll. ");
};
///////////////////////////////////////////////////////////////////////
//	Info Situation
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_Situation		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	70;
	condition	 = 	DIA_Tengron_Situation_Condition;
	information	 = 	DIA_Tengron_Situation_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wie ist eure Situation hier?";
};
func int DIA_Tengron_Situation_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};
func void DIA_Tengron_Situation_Info ()
{
	AI_Output (other, self, "DIA_Tengron_Situation_15_00"); //Wie ist eure Situation hier?
	AI_Output (self, other, "DIA_Tengron_Situation_07_01"); //Wir sind umgeben von Monstern und haben kaum Erz zu Tage gefördert. Zudem haben wir viele gute Männer verloren.
	AI_Output (self, other, "DIA_Tengron_Situation_07_02"); //Ich weiß nicht, wie lange wir durchhalten werden, aber wir geben nicht auf!
};
///////////////////////////////////////////////////////////////////////
//	Info NeedYourHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HELP		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	9;
	condition	 = 	DIA_Tengron_HELP_Condition;
	information	 = 	DIA_Tengron_HELP_Info;
	permanent 	 =  FALSE;
	description	 = 	"Ich könnte deine Hilfe brauchen..."; 
};
func int DIA_Tengron_HELP_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	&&  Npc_KnowsInfo(other, DIA_Tengron_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Tengron_HELP_Info ()
{
	AI_Output (other, self, "DIA_Tengron_HELP_15_00"); //Ich könnte deine Hilfe brauchen. Fajeth will, dass ich die Echsen jage und ...
	AI_Output (self, other, "DIA_Tengron_HELP_07_01"); //Ich empfange meine Befehle NUR von Fajeth. Und mein Befehl lautet, die Schürfstelle zu bewachen. Und genau das mache ich auch.
	AI_Output (self, other, "DIA_Tengron_HELP_07_02"); //Vielleicht hilft dir jemand anders.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Tengron_PICKPOCKET (C_INFO)
{
	npc			= Pal_280_Tengron;
	nr			= 900;
	condition	= DIA_Tengron_PICKPOCKET_Condition;
	information	= DIA_Tengron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Tengron_PICKPOCKET_Condition()
{
	C_Beklauen (32, 50);
};
 
FUNC VOID DIA_Tengron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Tengron_PICKPOCKET);
	Info_AddChoice		(DIA_Tengron_PICKPOCKET, DIALOG_BACK 		,DIA_Tengron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Tengron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Tengron_PICKPOCKET_DoIt);
};

func void DIA_Tengron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Tengron_PICKPOCKET);
};
	
func void DIA_Tengron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Tengron_PICKPOCKET);
};






