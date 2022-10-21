//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_EXIT   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 999;
	condition   = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Emilio_PICKPOCKET (C_INFO)
{
	npc			= BDT_10015_Addon_Emilio;
	nr			= 900;
	condition	= DIA_Addon_Emilio_PICKPOCKET_Condition;
	information	= DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	C_Beklauen (76, 112);
};
 
FUNC VOID DIA_Addon_Emilio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
	
func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Hi   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Emilio_Hi_Info;
	permanent   = FALSE;
	description	= "Du siehst aus wie ein Buddler.";
};
FUNC INT DIA_Addon_Emilio_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Hi_15_00");//Du siehst aus wie ein Buddler.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Hi_10_01");//Ich BIN ein Buddler. Als ich das letzte mal in der Mine war, habe ich geschuftet wie ein Blöder.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//----------------------------------------------------------------------
//	Info Gold
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Gold   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 2;
	condition   = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent   = FALSE;
	description	= "Was passiert mit dem Gold aus der Mine?";
};
FUNC INT DIA_Addon_Emilio_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Gold_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Gold_15_00");//Was passiert mit dem Gold aus der Mine?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_01");//Thorus sammelt es ein und verteilt es. Keiner darf behalten, was er geschürft hat.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_02");//Jeder bekommt nur einen Teil des Goldes - damit auch die Jäger und Wachen nicht leer ausgehen.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_03");//Ich find's okay. Seit dieser Regelung gibt's weniger Tote und die Schürfer bekommen immer noch mehr als die Typen, die draußen rumhängen.
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Stein   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 3;
	condition   = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent   = FALSE;
	description	= "Was hat es mit diesen roten Steinen auf sich?";
};
FUNC INT DIA_Addon_Emilio_Stein_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Stein_15_00");//Was hat es mit diesen roten Steinen auf sich?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_01");//Das ist 'ne Sache die sich Thorus und Esteban ausgedacht haben.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_02");//Thorus kümmert sich um die Goldverteilung und Esteban organsisiert die Arbeiter für die Mine.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_03");//Er will natürlich nicht jedesmal zu Thorus rennen, wenn er jemanden in die Mine schickt.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_04");//Deshalb drückt er uns einfach eine dieser roten Steintafeln in die Hand und Thorus lässt uns dann rein. Ist wie 'ne Eintrittskarte.
};
//---------------------------------------------------------------------
//	Info Attentat 
//---------------------------------------------------------------------
var int Emilio_Switch;

INSTANCE DIA_Addon_Emilio_Attentat   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 4;
	condition   = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent   = TRUE;
	description	= "Was weißt du über das Attentat?";
};
FUNC INT DIA_Addon_Emilio_Attentat_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio)) 
	&& (Npc_IsDead (Senyan))
	{
		return FALSE;		//selbe Condition wie 'Hilf mir...'
	}
	else if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
FUNC VOID DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Emilio_Attentat_15_00"); //Was weißt du über das Attentat?
	if (Emilio_Switch == 0)
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_01"); //(ängstlich) Hey Mann, damit habe ich nichts zu tun!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_02"); //(ängstlich) GAR NICHTS!
		Emilio_Switch = 0;
	};
};

//----------------------------------------------------------------------
//	Info Senyan 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Senyan   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Emilio_Senyan_Condition()
{	
	if Npc_IsDead (Senyan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Senyan_Info()
{	
	if (Senyan_Called == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_00");//(forschend) Sag mal, WARUM hat Senyan gerufen 'Seht mal, wen wir hier haben'?
		AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_01");//(trocken) Unbezahlte Rechnungen.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_02"); //Du hast Senyan umgelegt!
	};
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_03");//Hast du damit ein Problem?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_04");//(eilig) Nein Mann, damit hab ich kein Problem.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_05");//Ganz im Gegenteil. (abfällig) Der Mistkerl hat für Esteban gearbeitet.
	
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry (Topic_Addon_Esteban, "Emilio steht nicht auf Estebans Seite.");
};

//----------------------------------------------------------------------
//	Info Jetzt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Jetzt   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 5;
	condition   = DIA_Addon_Emilio_Jetzt_Condition;
	information = DIA_Addon_Emilio_Jetzt_Info;
	permanent   = FALSE;
	description	= "Warum bist du jetzt nicht in der Mine?";
};
FUNC INT DIA_Addon_Emilio_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Jetzt_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_Jetzt_15_00"); //Warum bist du jetzt nicht in der Mine?
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_01"); //(etwas unsicher) Ich war lang genug in der Mine und hab' bis zum Umfallen geackert. Jetzt brauche ich erst mal ein paar Tage Ruhe.
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_02"); //(seufzt, etwas unsicher) Bevor ich mir meinen nächsten roten Stein hole.
};

//----------------------------------------------------------------------
//	Info VonEmilio
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_VonEmilio (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 6;
	condition   = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent   = FALSE;
	description	= "Lennar hat mir ein bißchen was über dich erzählt...";
};
FUNC INT DIA_Addon_Emilio_VonEmilio_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_VonEmilio_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_00"); //Lennar hat mir ein bisschen was über dich erzählt ...
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_01"); //Lennar? Der Typ ist ein Idiot! Das musst du doch gemerkt haben.
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_02"); //Er sagt, du warst nicht mehr in der Mine, seit das Attentat passiert ist.
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_03"); //(eingeschüchtert) Ich ... weiß nichts!
	
	if (!Npc_IsDead (Senyan))
	{	
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_04"); //Du arbeitest doch mit diesem Senyan zusammen!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_05"); //Ihr steckt doch beide mit Esteban unter einer Decke! Ich hab genau gehört, was ihr gequatscht habt!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_06"); //Bisher hat Esteban sich einen Dreck um ums gekümmert. Warum sollte ich seinen Leuten trauen?
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_07"); //Lass mich in Ruhe!
		AI_StopProcessInfos(self);
	};
	B_LogEntry (Topic_Addon_Esteban, "Emilio meint das Lennar ein Idiot ist.");
};
//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_HilfMir (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 7;
	condition   = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent   = FALSE;
	description	= "Hilf mir, den Auftraggeber des Attentats zu finden!";
};
FUNC INT DIA_Addon_Emilio_HilfMir_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio))
	&& (Npc_IsDead (Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_HilfMir_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_00"); //Hilf mir, den Auftraggeber des Attentats zu finden!
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_01"); //Nein! Damit will ich nichts zu tun haben!
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_02"); //Wenn einem Idioten wie Lennar auffällt, dass du dich merkwürdig verhältst, kann es nicht mehr lange dauern, bis auch Esteban dahinter kommt.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_03"); //(windet sich) Ich ... Scheiße! Ich sag dir nur einen Namen. Mehr nicht.
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_04"); //Ich höre.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_05"); //Huno ... geh zu Huno. Er muss was über die Sache wissen.
	Emilio_TellAll = TRUE;
	
	B_LogEntry (Topic_Addon_Esteban, "Emilio hat endlich einen Namen ausgespuckt: Huno.");
};

//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_GegenEsteban (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 8;
	condition   = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent   = FALSE;
	description	= "Was hast du gegen Esteban?";
};
FUNC INT DIA_Addon_Emilio_GegenEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_GegenEsteban_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_GegenEsteban_15_00"); //Was hast du gegen Esteban?
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_01"); //Das Schwein denkt nur an's Abkassieren.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_02"); //Alle paar Tage wird einer von uns von einem Crawler gefressen.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_03"); //Aber Esteban will einfach keine Kämpfer in die Mine schicken.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_04"); //Und warum? Die Typen gehören zu 'Ravens Leibgarde' und Esteban hat Schiss, ihnen was zu sagen.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_05"); //Stattdessen lässt er uns lieber verrecken!
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Mine   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Emilio_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Mine_10_00");//So, du bist jetzt also der Boss hier. Okay, dann werde ich mal losziehen.
	
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
	
	
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Hacker   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent   = TRUE;
	Description = "Wie läuft's?"; 
};
FUNC INT DIA_Addon_Emilio_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Emilio_Hacker_15_00"); //Wie läuft's?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Emilio_Hacker_10_01"); //Ich rackere mich ganz schön ab, na Hauptsache, ich werd nicht von einem Crawler gefressen.
};




