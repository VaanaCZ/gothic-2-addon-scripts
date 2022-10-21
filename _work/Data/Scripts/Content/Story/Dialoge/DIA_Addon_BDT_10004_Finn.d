//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_EXIT   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 999;
	condition   = DIA_Addon_Finn_EXIT_Condition;
	information = DIA_Addon_Finn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Finn_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Finn_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Finn_PICKPOCKET (C_INFO)
{
	npc			= BDT_10004_Addon_Finn;
	nr			= 900;
	condition	= DIA_Addon_Finn_PICKPOCKET_Condition;
	information	= DIA_Addon_Finn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Finn_PICKPOCKET_Condition()
{
	C_Beklauen (35, 50);
};
 
FUNC VOID DIA_Addon_Finn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Finn_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Finn_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Finn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Finn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Finn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Finn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Finn_PICKPOCKET);
};
	
func void DIA_Addon_Finn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Finn_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Hacker   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 9;
	condition   = DIA_Addon_Finn_Hacker_Condition;
	information = DIA_Addon_Finn_Hacker_Info;
	permanent   = TRUE;
	description = "Wieder bei der Arbeit?"; 
};
FUNC INT DIA_Addon_Finn_Hacker_Condition()
{	
	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hacker_15_00"); //Wieder bei der Arbeit?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hacker_07_01"); //Ja, jetzt hole ich auch noch das letzte Stück Gold aus dieser Mine.
};
//----------------------------------------------------------------------
//	Info Hacke
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Hi   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 1;
	condition   = DIA_Addon_Finn_Hi_Condition;
	information = DIA_Addon_Finn_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE; 
};
FUNC INT DIA_Addon_Finn_Hi_Condition()
{	
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hi_15_00"); //Hi!
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hi_07_01"); //(brummig) Was willst du?
};

//----------------------------------------------------------------------
//	Info Hacke
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Hacke   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 2;
	condition   = DIA_Addon_Finn_Hacke_Condition;
	information = DIA_Addon_Finn_Hacke_Info;
	permanent   = FALSE;
	description = "Wo kriege ich 'ne Spitzhacke her?";
};
FUNC INT DIA_Addon_Finn_Hacke_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Finn_Hacke_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Hacke_15_00"); //Wo kriege ich 'ne Spitzhacke her?
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_01"); //Geh zu Huno dem Schmied. Aber selbst wenn du eine Hacke hast, heißt das noch nicht, dass du auch in die Mine kommst.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_02"); //Wenn du rein willst, musst du mit Esteban sprechen.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_03"); //Zu Thorus brauchst du gar nicht erst zu gehen - der lässt dich nur rein, wenn du 'nen roten Stein hast.
};

//----------------------------------------------------------------------
//	Info Esteban
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Esteban   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 3;
	condition   = DIA_Addon_Finn_Esteban_Condition;
	information = DIA_Addon_Finn_Esteban_Info;
	permanent   = FALSE;
	description = "Sag mal, was hältst du von Esteban?";
};
FUNC INT DIA_Addon_Finn_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Finn_Hacke)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Esteban_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Esteban_15_00"); //Sag mal, was hältst du von Esteban?
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_01"); //(vorsichtig) Er ist der Boss hier ... er ... ist ganz okay, denke ich.
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_02"); //(zögernd) Die guten Jungs lässt er immer in die Mine. Die was vom Schürfen verstehen, meine ich.
};

//----------------------------------------------------------------------
//	Info Esteban
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Profi (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 4;
	condition   = DIA_Addon_Finn_Profi_Condition;
	information = DIA_Addon_Finn_Profi_Info;
	permanent   = FALSE;
	description = "Und du verstehst was vom Schürfen?";
};
FUNC INT DIA_Addon_Finn_Profi_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Finn_Esteban)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Profi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Profi_15_00"); //Und du verstehst was vom Schürfen?
	AI_Output (self, other, "DIA_Addon_Finn_Profi_07_01"); //Ich bin der Beste!
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10004_Finn_Mine   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 5;
	condition   = DIA_Addon_Finn_Mine_Condition;
	information = DIA_Addon_Finn_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Finn_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_00"); //Alles klar, Chef. Du willst den Besten in der Mine sehen? Dann will ich mal wieder ...
	
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_01");//Ach, noch was. Ich verrate dir mal ein Buddlergeheimnis.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_02");//Ab und zu bietet es sich an, einen Trümmerschlag anzusetzen.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_03");//Wenn du ein paar mal gehackt hast und es ist nichts dabei rumgekommen, dann zieh die Spitze der Hacke quer über den Fels.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_04");//Mit etwas Glück kriegst du so gleich mehrere Brocken.
	
	B_Upgrade_hero_HackChance(10);
	Knows_Truemmerschlag = TRUE;
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Gold   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 6;
	condition   = DIA_Addon_Finn_Gold_Condition;
	information = DIA_Addon_Finn_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Finn_Gold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_00");//Na, da gibt's einiges zu wissen. Gold ist kein Erz. Das ist ein verdammt wichtiger Unterschied.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_01");//Ich meine, welche Frau hängt sich schon 'ne Kette aus Erz um den Hals? (lacht)
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_02");//Beim Hacken arbeitet man von oben nach unten. So kannst du die Nuggets am besten freilegen.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_03");//Es gibt auch Buddler, die es umgekehrt machen - aber das ist ungleich schwieriger.

	B_Upgrade_hero_HackChance(10);
};
//---------------------------------------------------------------------
//	Info einschätzen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_ein   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 7;
	condition   = DIA_Addon_Finn_ein_Condition;
	information = DIA_Addon_Finn_ein_Info;
	permanent   = TRUE;
	description = "Kannst du meine Fähigkeit im Goldhacken einschätzen?";
};
FUNC INT DIA_Addon_Finn_ein_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};
var int Finn_einmal;
var int Finn_Gratulation;
FUNC VOID DIA_Addon_Finn_ein_Info()
{
	AI_Output (other, self, "DIA_Addon_Finn_ein_15_00");//Kannst du meine Fähigkeit im Goldhacken einschätzen?
	
	if (Finn_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_01");//Klar. Ich mache das schon seit über 35 Jahren. Es gibt nichts, das ich nicht erkenne!
		Finn_einmal = TRUE;
	};
	AI_Output (self, other, "DIA_Addon_Finn_ein_07_02");//Bei dir würde ich sagen, du bist ein ...

	if (Hero_HackChance < 20)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_03"); //blutiger Anfänger.
	}
	else if (Hero_HackChance < 40)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_04"); //ganz passabler Schürfer.
	}
	else if (Hero_HackChance < 55)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_05"); //erfahrener Goldschürfer.
	}
	else if (Hero_HackChance < 75)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_06"); //wachechter Buddler.
	}
	else if (Hero_HackChance < 90)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_07"); //verdammt guter Buddler.
	}
	else if (Hero_HackChance < 98)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_08"); //Meister Buddler.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_09"); //Guru - unter den Buddlern.
		
		if (Finn_Gratulation == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Finn_ein_07_10");//Damit bist du jetzt so gut wie ich. Herzlichen Glückwunsch, Partner!
			B_GivePlayerXP (XP_Ambient*2);
			Snd_Play ("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};
	
	
	var string ConcatText;
	
	ConcatText = ConcatStrings ("Goldhacken: ", IntToString (Hero_HackChance));
	ConcatText = ConcatStrings (ConcatText, " Prozent");
	PrintScreen (concatText, -1, -1, FONT_ScreenSmall,2);
};

//----------------------------------------------------------------------
//	Attentat
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Attentat   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 8;
	condition   = DIA_Addon_Finn_Attentat_Condition;
	information = DIA_Addon_Finn_Attentat_Info;
	permanent   = FALSE;
	description	= "Wegen des Attentats auf Esteban...";
};
FUNC INT DIA_Addon_Finn_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentats auf Esteban
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_00"); //(misstrauisch) Ja?
	AI_Output (other, self, "DIA_Addon_Finn_Attentat_15_01"); //Hast du 'ne Ahnung, wer dahinter steckt?
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_02"); //Warum willst du das wissen?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Ich will mit dem Typen reden...",DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Esteban will ihn tot sehen!",DIA_Addon_Finn_Attentat_ForTheBoss);
};
	
func void B_Addon_Finn_TellAll()
{
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_00"); //(erzählt) Als das Attentat passierte, wollte ich mir von Huno, dem Schmied, meine Spitzhacke abholen.
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_01"); //Aber er war nicht da.
	AI_Output (other, self, "DIA_Addon_Finn_TellAll_15_02"); //Und?
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_03"); //Er ist sonst IMMER da. SEHR verdächtig, wenn du mich fragst.
	
	Finn_TellAll = TRUE;
	B_LogEntry (Topic_Addon_Esteban, "Finn erzählt, das Huno während des Attentats nicht anwesend war.");
};
	
func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output (other, self, "DIA_Addon_Finn_ForTheBoss_15_00"); //Esteban will ihn tot sehen!
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_01"); //Oh! Du arbeitest für den Boss?
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_02"); //Dann werd' ich dir sagen, was ich weiß.
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
};
	
func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output (other, self, "DIA_Addon_Finn_WannaTalk_15_00"); //Ich will mit dem Typen reden ...
	AI_Output (self, other, "DIA_Addon_Finn_WannaTalk_07_01"); //(misstrauisch) So? Und was willst du von ihm?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Das geht dich nichts an!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Ich habe interessante Informationen für ihn!",DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Ich will Esteban umlegen und suche einen Verbündeten!",DIA_Addon_Finn_Attentat_KillEsteban);
};	
		
func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output (other, self, "DIA_Addon_Finn_KillEsteban_15_00"); //Ich will Esteban umlegen und suche einen Verbündeten!
	AI_Output (self, other, "DIA_Addon_Finn_KillEsteban_07_01"); //Damit will ich nichts zu tun haben!
	
	Finn_Petzt = TRUE;
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output (other, self, "DIA_Addon_Finn_HaveInfos_15_00"); //Ich habe interessante Informationen für ihn!
	AI_Output (self, other, "DIA_Addon_Finn_HaveInfos_07_01"); //Du steckst doch nicht etwa mit dem Auftraggeber unter einer Decke, was?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Ich will Esteban umlegen und suche einen Verbündeten!",DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Das geht dich nichts an!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Auf keinen Fall!",DIA_Addon_Finn_Attentat_NoNo);
};

	func void DIA_Addon_Finn_Attentat_NoNo()
	{
		AI_Output (other, self, "DIA_Addon_Finn_NoNo_15_00"); //Auf keinen Fall!
		AI_Output (self, other, "DIA_Addon_Finn_NoNo_07_01"); //(abschätzend) Gut! Ich werde dir sagen, was ich weiß.
		
		B_Addon_Finn_TellAll();
		Info_ClearChoices (DIA_Addon_Finn_Attentat);
	};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{	
	AI_Output (other, self, "DIA_Addon_Finn_ForgetIt_15_00"); //Das geht dich nichts an!
	AI_Output (self, other, "DIA_Addon_Finn_ForgetIt_07_01"); //So? Tja, dann weiß ich auch nichts über die Sache.
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
};

//----------------------------------------------------------------------
//	Nochmal Attentat
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Again  (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 9;
	condition   = DIA_Addon_Finn_Again_Condition;
	information = DIA_Addon_Finn_Again_Info;
	permanent   = TRUE;
	description	= "Nochmal wegen des Attentats...";
};
FUNC INT DIA_Addon_Finn_Again_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Finn_Attentat))
	&& (!Npc_IsDead(Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Again_Info()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_15_00"); //Nochmal wegen des Attentats ...
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_01"); //Ich hab dir alles gesagt, was ich weiß.
		
		Info_ClearChoices (DIA_Addon_Finn_Again);
		Info_AddChoice (DIA_Addon_Finn_Again, "Okay... (zurück)", DIA_Addon_Finn_Again_Exit);
		Info_AddChoice (DIA_Addon_Finn_Again, "Dann erzähl's mir nochmal!", DIA_Addon_Finn_Again_Nochmal);		
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_02"); //Lass mich bloß in Ruhe mit der Scheiße!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Exit_15_00"); //(abschätzend) Okay ...
	Info_ClearChoices (DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Nochmal_15_00"); //Dann erzähl's mir noch mal!
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Again);	
};


