///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulf_EXIT   (C_INFO)
{
	npc         = NOV_602_Ulf;
	nr          = 999;
	condition   = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info YOU
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Hallo		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	2;
	condition	 = 	DIA_Ulf_Hallo_Condition;
	information	 = 	DIA_Ulf_Hallo_Info;
	permanent	 =  FALSE;
	description	 = 	"Was machst du hier?";
};

func int DIA_Ulf_Hallo_Condition ()
{
	if (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	&& (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};	
};
func void DIA_Ulf_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Hallo_15_00"); //Was machst du hier?
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_01"); //Ich versuche, die Aufgaben, die das Kloster mir stellt, zu eurer Zufriedenheit zu erfüllen.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_02"); //Ich bin Novize und komme vom Kloster. Ich erledige die Botengänge für die Magier und auch die Paladine.
		AI_Output (self, other, "DIA_Ulf_Hallo_03_03"); //Ich habe die drei Wirte in der Stadt mit Wein aus dem Kloster versorgt.
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Wirte
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Wirte		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Wirte_Condition;
	information	 = 	DIA_Ulf_Wirte_Info;
	permanent	 = 	FALSE;
	description	 = 	"Wer sind die drei Wirte?";
};

func int DIA_Ulf_Wirte_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Wirte_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Wirte_15_00"); //Wer sind die drei Wirte?
	AI_Output (self, other, "DIA_Ulf_Wirte_03_01"); //Das ist zum einen der gute Mann hier hinter dem Tresen.
	AI_Output (self, other, "DIA_Ulf_Wirte_03_02"); //Dann gibt es noch Coragon, der seine Taverne am Tempelplatz hat, und Kardif, der Wirt von der Kneipe im Hafenviertel.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Kloster		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Kloster_Condition;
	information	 = 	DIA_Ulf_Kloster_Info;
	permanent	 = 	FALSE;
	description	 = 	"Was kannst du mir über das Kloster erzählen?";
};

func int DIA_Ulf_Kloster_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Kloster_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Kloster_15_00"); //Was kannst du mir über das Kloster erzählen?
	AI_Output (self, other, "DIA_Ulf_Kloster_03_01"); //Wir Novizen suchen Erleuchtung im Gebet zu Innos und lernen von den Magiern die Grundsätze des Glaubens.
	AI_Output (self, other, "DIA_Ulf_Kloster_03_02"); //Wir dienen ihnen, so wie wir Innos dienen und bereiten uns auf den Bund mit dem Feuer vor.
};
///////////////////////////////////////////////////////////////////////
//	bring mich zum Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Bringen	(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	4;
	condition	 = 	DIA_Ulf_Bringen_Condition;
	information	 = 	DIA_Ulf_Bringen_Info;
	permanent	 =  FALSE;
	description	 = 	"Bring mich zum Kloster.";
};

func int DIA_Ulf_Bringen_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Bringen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Bringen_15_00"); //Bring mich zum Kloster.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_01"); //Vergiss es. Weißt du, wie vielen Viechern ich auf dem Weg ausgewichen bin?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_02"); //Wenn ich an diese ganzen Blutfliegen, Wölfe und Goblins denke, dann bin ich froh, dass ich nicht mehr weg muss.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_03"); //Außerdem kannst du eh nicht ins Kloster.
	AI_Output (other, self, "DIA_Ulf_Bringen_15_04"); //Warum nicht?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_05"); //Der Zugang ist nur den Magiern, Paladinen und Novizen erlaubt.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Aufnahme		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Aufnahme_Condition;
	information	 = 	DIA_Ulf_Aufnahme_Info;
	permanent	 = 	FALSE;
	description	 = 	"Wie kann ich Novize werden?";
};

func int DIA_Ulf_Aufnahme_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Bringen)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Aufnahme_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_00"); //Wie kann ich Novize werden?
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_01"); //Wenn ein Mann den tiefen Wunsch verspürt ...
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_02"); //Hey - sag mir einfach nur, was die Bedingungen sind.
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_03"); //Du brauchst die Gaben. Ein Schaf und ...
	B_Say_Gold (self, other, Summe_Kloster);
	
	Log_CreateTopic (Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
	B_LogEntry (Topic_Kloster,"Um im Innos - Kloster als Novize aufgenommen zu werden, brauche ich ein Schaf und 1000 Goldstücke.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Gold		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	8;
	condition	 = 	DIA_Ulf_Gold_Condition;
	information	 = 	DIA_Ulf_Gold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Wo soll ich so viel Gold hernehmen?";
};

func int DIA_Ulf_Gold_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Gold_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Gold_15_00"); //Wo soll ich so viel Gold hernehmen?
	AI_Output (self, other, "DIA_Ulf_Gold_03_01"); //Da du offensichtlich niemanden kennst, der das mal eben für dich bezahlt, musst du halt arbeiten gehen.
};
///////////////////////////////////////////////////////////////////////
//	Info Schaf
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Schaf		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Schaf_Condition;
	information	 = 	DIA_Ulf_Schaf_Info;
	permanent	 = 	FALSE;
	description	 = 	"Woher kriege ich ein Schaf? ";
};

func int DIA_Ulf_Schaf_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Schaf_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Schaf_15_00"); //Woher kriege ich ein Schaf?
	AI_Output (self, other, "DIA_Ulf_Schaf_03_01"); //Von den Bauern natürlich. Aber umsonst wirst du das nicht bekommen.
	
	B_LogEntry (Topic_Kloster,"Ein Schaf bekomme ich bei den Bauern.");
};
///////////////////////////////////////////////////////////////////////
//	Info Suche
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Suche		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Suche_Condition;
	information	 = 	DIA_Ulf_Suche_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Ulf_Suche_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Suche_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Suche_03_00"); //Hey, weißt du, was passiert ist?
	AI_Output (other, self, "DIA_Ulf_Suche_15_01"); //Du bist erwählt worden.
	AI_Output (self, other, "DIA_Ulf_Suche_03_02"); //Richtig. Gerade eben will ich noch einen kühlen Schluck Bier zu mir nehmen - da biegt Daron um die Ecke und erläutert mir, dass ich erwählt bin.
	AI_Output (self, other, "DIA_Ulf_Suche_03_03"); //Wer hätte das gedacht? Innos' Wille ist halt unergründlich. Und was führt dich her?
	AI_Output (other, self, "DIA_Ulf_Suche_15_04"); //Ich habe die Prüfung des Feuers gefordert.
	AI_Output (self, other, "DIA_Ulf_Suche_03_05"); //Nicht möglich?! Junge, du bist aber verdammt mutig. Heißt das, du suchst auch das, 'was der Gläubige hinter dem Pfad findet'?
	AI_Output (other, self, "DIA_Ulf_Suche_15_06"); //So sieht's aus.
};
///////////////////////////////////////////////////////////////////////
//	Info Rausgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Rausgefunden		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Rausgefunden_Condition;
	information	 = 	DIA_Ulf_Rausgefunden_Info;
	permanent	 = 	FALSE;
	description  = "Hast du schon was rausgefunden?";
};
func int DIA_Ulf_Rausgefunden_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Rausgefunden_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Rausgefunden_15_00"); //Hast du schon was rausgefunden?
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_01"); //Na ja, ich bin einfach mal Agon gefolgt - aber inzwischen habe ich ihn verloren.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_02"); //Und jetzt ... wie es hieß es noch? Folge den Zeichen Innos'. Aber das mit dem Pfad verstehe ich nicht ...
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_03"); //Was soll's, ich suche mal weiter.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "FOLLOW");
	
};
///////////////////////////////////////////////////////////////////////
//	Info Folgen
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Folgen		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Folgen_Condition;
	information	 = 	DIA_Ulf_Folgen_Info;
	permanent	 = 	FALSE;
	description  = "Folgst du mir etwa?";
};
func int DIA_Ulf_Folgen_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Folgen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Folgen_15_00"); //Folgst du mir etwa?
	AI_Output (self, other, "DIA_Ulf_Folgen_03_01"); //Quatsch. Ich gehe nur zufällig den gleichen Weg wie du.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Stop		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Stop_Condition;
	information	 = 	DIA_Ulf_Stop_Info;
	permanent	 = 	FALSE;
	description  = "Hör auf mir nachzulaufen!";
};
func int DIA_Ulf_Stop_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Folgen)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Stop_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Stop_15_00"); //Hör auf mir nachzulaufen!
	AI_Output (self, other, "DIA_Ulf_Stop_03_01"); //Ich laufe dir nicht nach. Aber bitte, wenn du das glaubst - dann gehe ich jetzt woanders lang.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SUCHE");
};
///////////////////////////////////////////////////////////////////////
//	Info Abrechnung
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Abrechnung		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Abrechnung_Condition;
	information	 = 	DIA_Ulf_Abrechnung_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};	
func int DIA_Ulf_Abrechnung_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_HasItems (other, ItmI_RuneBlank) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Abrechnung_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_00"); //So sieht man sich wieder. Weißt du - ich habe nachgedacht. Ich glaube, der Wunsch Magier zu sein, ist stark in mir.
	AI_Output (other, self, "DIA_Ulf_Abrechnung_15_01"); //Oh Mann - tu das nicht ...
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_02"); //Ich habe keine Wahl. Das Leben als Novize ist nichts für mich.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_03"); //Ich muss einfach Magier werden. Dann wird alles gut für mich. Und jetzt werde ich mir das nehmen, was mir zusteht.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_04"); //Hast du noch was zu sagen, bevor es zu Ende geht?
	
	Info_ClearChoices (DIA_Ulf_Abrechnung);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Lass es sein, ich will dich nicht töten. ",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Kommen wir direkt zur Sache - ich muss noch zum Kloster.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Hast du was zu rauchen?",DIA_Ulf_Abrechnung_Rauch);
};
FUNC VOID DIA_Ulf_Abrechnung_Lass()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //Lass es sein, ich will dich nicht töten.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //Große Worte. Aber du weißt, dass du keine Chance gegen mich hast! Auf geht's.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //Kommen wir direkt zur Sache - ich muss noch zum Kloster.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //Du wirst nirgendwo mehr hingehen!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //Hast du was zu rauchen?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //Du hast Glück. Ich hab tatsächlich was dabei.
	
	B_GiveInvItems (self, other, ITmi_Joint,1);
	B_UseItem (other, itmI_Joint);
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //Bringen wir es hinter uns.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Troll		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Troll_Condition;
	information	 = 	DIA_Ulf_Troll_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};
func int DIA_Ulf_Troll_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	&& ((Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_14") <= 1000)
	|| (Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_15") <= 1000))
	{
		return TRUE;
	};
};
func void DIA_Ulf_Troll_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Troll_03_00"); //Hey, glaubst du wirklich, dass wir hier richtig sind? Dahinten haust irgendwo ein Troll.
	AI_Output (self, other, "DIA_Ulf_Troll_03_01"); //Ich glaube, ich such mal lieber in einer anderen Richtung.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"WAIT");
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulf_PICKPOCKET (C_INFO)
{
	npc			= NOV_602_Ulf;
	nr			= 900;
	condition	= DIA_Ulf_PICKPOCKET_Condition;
	information	= DIA_Ulf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ulf_PICKPOCKET_Condition()
{
	C_Beklauen (34, 50);
};
 
FUNC VOID DIA_Ulf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulf_PICKPOCKET);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_BACK 		,DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};
	
func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};











