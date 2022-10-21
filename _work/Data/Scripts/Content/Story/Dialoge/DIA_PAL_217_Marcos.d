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
	AI_Output (self, other, "DIA_Marcos_Hallo_04_00");//HALT - im Namen Innos'! Ich bin Marcos, Paladin des Königs. Sag, was du willst, und sprich wahr!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_01");//Ein Erwählter Innos' spricht immer wahr.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_02");//Verzeih mir, ehrwürdiger Magier. Ich habe nicht erkannt, mit wem ich spreche.
		AI_Output (other, self, "DIA_Marcos_Hallo_15_03");//Ja ja, schon gut.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_04");//Wenn mir die Frage gestattet ist - was verschlägt dich in diese Gegend?
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_05");//Bleib ruhig - ich stehe im Dienst von Lord Hagen.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_06");//Du gehörst zur Truppe. Welcher Befehl verschlägt dich hier her?
	}
	else //SLD
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_07");//Bleib ruhig, wir arbeiten für den gleichen Boss - Lord Hagen.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_08");//Seit wann heuert Lord Hagen Söldner an? Sprich - was willst du hier?
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
	description	= "Ich muss Lord Hagen Beweise für die Existenz der Drachen bringen.";
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
	AI_Output (other, self, "DIA_Marcos_Hagen_15_00");//Ich muss Lord Hagen Beweise für die Existenz der Drachen bringen.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_01");//Dann solltest du keine Zeit verlieren und dein Leben nicht leichtfertig aufs Spiel setzen.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_02");//Glaubst du etwa, du findest hier eine Drachenschuppe, die du ihm bringen kannst?
	AI_Output (self, other, "DIA_Marcos_Hagen_04_03");//Versuch, die Burg zu erreichen, und sprich mit Kommandant Garond.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_04");//Er muss erfahren, dass du im Auftrag von Lord Hagen kommst! Und er wird sich auch um deinen Auftrag kümmern.
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
	description	= "Ich komme von Garond...";
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
	AI_Output (other, self, "DIA_Marcos_Garond_15_00");//Ich komme von Garond - er muss wissen, wieviel Erz zum Transport bereit steht.
	AI_Output (self, other, "DIA_Marcos_Garond_04_01");//Sag Garond, dass ich die Schürfstelle verlassen musste, weil die Ork-Angriffe zu heftig wurden.
	AI_Output (self, other, "DIA_Marcos_Garond_04_02");//Ich habe versucht, mit ein paar Leuten die Burg zu erreichen, doch ich bin der einzige Überlebende.
	AI_Output (self, other, "DIA_Marcos_Garond_04_03");//Das Erz habe ich sicher gestellt. Es sind VIER Kisten. Geh zu Garond und berichte ihm das.
	AI_Output (self, other, "DIA_Marcos_Garond_04_04");//Sag ihm, dass ich das Erz mit meinen Leben schützen werde. Doch weiß ich nicht, wie lange es dauern wird, bis mich die Orks hier aufspüren.
	AI_Output (self, other, "DIA_Marcos_Garond_04_05");//Er soll mir Unterstützung schicken.
	AI_Output (other, self, "DIA_Marcos_Garond_15_06");//Ich werd's ihm ausrichten.
	
	B_LogEntry (TOPIC_ScoutMine,"Der Paladin Marcos bewacht in einem kleinen Tal VIER Kisten mit Erz.");
	
	Log_CreateTopic (Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus (Topic_MarcosJungs,LOG_RUNNING);
	B_LogEntry (Topic_MarcosJungs,"Marcos will, das Garond ihm Unterstützung schickt.");
	
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
	description	= "Wie ist die Lage?";
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

	AI_Output (other, self, "DIA_Marcos_Perm_15_00");//Wie ist die Lage?
	
	if (self.attribute [ATR_HITPOINTS]) < (self.attribute [ATR_HITPOINTS_MAX] /2)  
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_01");//Ich brauche mal einen kräftigen Schluck Heiltrank!
		B_UseItem (self, ItPo_Health_03);  
		
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_02");//Ich harre aus - und ich hoffe, Garond schickt mir bald die Unterstützung.
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_03");//Ich danke dir für die Unterstützung. Innos wird uns die Kraft geben durchzuhalten.
		
		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_04");//Ich werde hier durchhalten, denn Innos ist mit mir!
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


	
	
	
	
	
	

	

	
	
