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
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_00"); //Scheiße, noch ein Neuer. (lacht) Auch wegen des Goldes hier, was?
	AI_Output (other,self,"DIA_Addon_Sancho_HI_15_01"); //Gold?
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_02"); //(lachend) Jetzt hör auf mich zu verarschen!
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_03"); //Alle Neuen, die herkommen, wollen in die Mine.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_04"); //Aber stell dir das bloß nicht so einfach vor!

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
	description = "Wie komme ich zum Lager?";
};
FUNC INT DIA_Addon_Sancho_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_Lager_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Lager_15_00"); //Wie komme ich zum Lager?
	AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_01"); //Folge einfach dem Steg!
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_02"); //Aber wenn du in die Mine willst, musst du an Franco vorbei.
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_03"); //Er erwartet von allen Neuen, dass sie sich erstmal 'ne Weile hier draußen abrackern!
	};
	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Alle Neuen müßen erst im Sumpf arbeiten, bevor sie Zugang zur Mine bekommen.");
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
	description = "Erzähl mir mehr über die Mine...";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Mine_15_00"); //Erzähl mir mehr über die Mine ...
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_01"); //Ich geb dir 'nen guten Rat: Wenn du rein willst, stell dich gut mit Franco. Er ist hier draußen der Boss.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_02"); //Er entscheidet, wer als Nächster rein darf.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_03"); //Aber er wird dich nur reinlassen, wenn du hier draußen nicht die Eier schaukelst.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_04"); //Also geh zu ihm, und lass dir 'ne Aufgabe geben!
	
	B_LogEntry (Topic_Addon_Franco,"FRANCO entscheidet wer in's Lager kommt. Er verteilt auch die Aufgaben.");
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
	description = "Wo finde ich diesen Franco?";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Franco_15_00"); //Wo finde ich diesen Franco?
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_01"); //Er hängt meistens auf dem Vorplatz zum Lager rum.
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_02"); //Stell dich bloß gut mit ihm, sonst bekommst du am Ende noch so'n Scheißjob wie ich!
	
	B_LogEntry (Topic_Addon_Franco,"Franco hält sich am Vorplatz zum Lager auf.");
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
	description = "Mußt du hier die ganze Zeit rumhängen?";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Spitzel_15_00");//Musst du hier die ganze Zeit rumhängen?
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_01");//Ich soll alle Neuen untersuchen, damit sich bei uns kein Spitzel einschleicht.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_02");//Aber das kannst du vergessen. Ich meine, wir sind hier am Ende der Welt - mitten im Sumpf.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_03");//Niemand kann uns finden, niemand wird uns finden - und warum sollte sich jemand die Mühe machen, einen Spitzel zu uns schicken.
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
	description = "Was gibt's neues?";
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
	AI_Output (other,self,"DIA_Addon_Sancho_Perm_15_00");//Was gibt's neues?
	
	if Npc_IsDead (Franco)
	&& (Comment_Franco == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_01");//Ich hab gehört, du hast Franco umgelegt. Saubere Arbeit ...
		
		if !Npc_IsDead (Carlos)
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_02");//... aber jetzt haben wir diesen Carlos am Hals. Mit dem ist auch nicht zu spaßen ...
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_03");//Und Carlos hast du auch umgebracht? Alter, du bist ein ganz übler Mörder, was? Lass mich bloß in Ruhe.
		};
		
		Comment_Franco = TRUE;
	}
	else if Npc_IsDead (Esteban)
	&& (Comment_Esteban == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_04");//Ich hab gehört, du hast Esteban umgelegt. Hey Mann, du hast es vor, was?
		
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_05");//Nee, im Moment gibt's nichts Neues.
	};
	
};





