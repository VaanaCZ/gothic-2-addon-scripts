///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pyrokar_EXIT   (C_INFO)
{
	npc         = KDF_500_Pyrokar;
	nr          = 999;
	condition   = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  2;
	condition	 = 	DIA_Pyrokar_WELCOME_Condition;
	information	 = 	DIA_Pyrokar_WELCOME_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_WELCOME_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //So, du bist also der neue Novize. Nun, du hast bestimmt schon eine Aufgabe von Meister Parlan zugewiesen bekommen.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(leicht vorwurfsvoll) Du weißt ja, dass jeder in der Gemeinschaft des Feuers seine Arbeit zu verrichten hat, so wie es Innos' Wille ist.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Hagen_Condition;
	information	 = 	DIA_Pyrokar_Hagen_Info;
	permanent	 =  FALSE;
	description	 =  "Ich muss dringend mit den Paladinen sprechen. ";
};
func int DIA_Pyrokar_Hagen_Condition ()
{	
	if (other.guild  == GIL_NOV) //muss kommen
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //Ich muss dringend mit den Paladinen sprechen.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //Willst du uns auch sagen, warum du mit ihnen sprechen willst?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //Ich habe eine wichtige Botschaft für sie.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //Was ist das für eine Botschaft?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //Im Minental versammelt sich eine Armee des Bösen unter der Führung von Drachen! Wir müssen sie aufhalten, so lange wir noch können.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Hm. Wir werden deine Worte überdenken, Novize. Wenn die Zeit gekommen ist, werden wir dir mitteilen, was wir beraten haben.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Solange tust du gut daran, deinen Pflichten als Novize nachzukommen.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //Dann wollen wir dich auch nicht länger von deinen Arbeiten abhalten - du darfst jetzt gehen.
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Auge_Condition;
	information	 = 	DIA_Pyrokar_Auge_Info;
	permanent	 =  FALSE;
	description	 =  "Ich suche das Auge Innos'.";
};
func int DIA_Pyrokar_Auge_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Auge_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //Ich suche das Auge Innos'.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Ein Narr ist der, der glaubt, er könne das heilige Amulett finden, geschweige denn anlegen.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //Das Amulett bestimmt seinen Träger selbst - niemals wird es ein anderer tragen können als der dafür bestimmte Mann.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Ich würd's auf einen Versuch ankommen lassen.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Demut ist die Pflicht des Novizen - nicht das Verlangen.
	
 	B_LogEntry (TOPIC_INNOSEYE, "Das hatte ich mir eigentlich ein bisschen einfacher vorgestellt, aber freiwillig und ohne Unterstützung der Paladine wird Pyrokar das Auge nicht rausrücken.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //Dann wollen wir dich auch nicht länger von deinen Arbeiten abhalten - Du darfst jetzt gehen.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Pyrokar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Pyrokar_MissingPeople_Info;

	description	 = 	"Einige Bürger von Khorinis sind auf seltsame Weise verschwunden.";
};
func int DIA_Addon_Pyrokar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Pyrokar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Einige Bürger von Khorinis sind auf seltsame Weise verschwunden.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //Das ist mir bekannt und sehr bedauerlich. Jedoch haben wir uns mit den Magiern des Wasser darauf geeinigt, dass sie sich der Sache annehmen.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //Gleiches gilt für die Untersuchung der eigenartigen Erdbeben in der nordöstlichen Region von Khorinis.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Bisher ist mir nicht zu Ohren gekommen, dass unser Einschreiten von Nöten wäre. Also werden wir auch nichts in dieser Sache unternehmen.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Ja, aber ...
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //Kein Aber! Wir werden verfahren, wie wir es für richtig halten, und ich hoffe, auch DU wirst das respektieren.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Die Feuermagier bedauern den Verlust der Bürger. Jedoch sagen sie, das sei die Aufgabe der Wassermagier. Im Kloster habe hierbei keine Hilfe zu erwarten."); 

	if (other.guild  == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		AI_StopProcessInfos (self); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_GOAWAY_Condition;
	information	 = 	DIA_Pyrokar_GOAWAY_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_GOAWAY_Condition ()
{
	//ADDON>
	if (Npc_KnowsInfo (hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return FALSE;
		};
	//ADDON<

	if (Npc_IsInState (self, ZS_Talk)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Hagen)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(ungehalten) Gehorsam ist eine Tugend, die du noch lernen wirst. Auf die eine oder andere Weise.
	
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 =  1;
	condition	 = 	DIA_Pyrokar_FIRE_Condition;
	information	 = 	DIA_Pyrokar_FIRE_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich will die Prüfung des Feuers ablegen.";
};
func int DIA_Pyrokar_FIRE_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild  == GIL_NOV)
	&&  Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_FIRE_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Ich will die Prüfung des Feuers ablegen.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(überrascht) Du weißt ... du willst die Prüfung des Feuers ablegen?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Ja, ich berufe mich auf das Gesetz des Feuers, das besagt ...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(unterbricht barsch) Wir kennen das Gesetz des Feuers. Wir sahen auch viele Novizen bei der Prüfung sterben. Diese Entscheidung hast du nicht reiflich überlegt.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //Doch, das habe ich. Ich will die Prüfung - und ich werde sie bestehen.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(warnend) Wenn du ausdrücklich darauf bestehst, dann wird der hohe Rat dich vor die Prüfung stellen.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Ich bestehe darauf, dass mir die Prüfung des Feuers gestellt wird.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //Dann - soll es sein. Wenn du bereit bist, wird dir jeder Magier aus dem hohen Rat eine Prüfung stellen, die du erfüllen musst.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Möge Innos sich deiner Seele erbarmen.
	
	B_LogEntry (TOPIC_FireContest,"Ich habe bei Pyrokar die Prüfung des Feuers gefordert. Jetzt muss ich die drei Aufgaben erfüllen, die mir der hohe Rat stellt.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_TEST_Condition;
	information	 = 	DIA_Pyrokar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich stelle mich deiner Prüfung, Meister";
};
func int DIA_Pyrokar_TEST_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Ich stelle mich deiner Prüfung, Meister.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //Und nur Innos alleine weiß, ob du sie auch bestehen wirst. Du wirst jene Prüfung ablegen, die auch die erwählten Novizen bestehen müssen.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //Die Prüfung der Magie. (überlegen) Du weißt ja sicherlich, das nur EINER der Novizen die Prüfung bestehen kann.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //Verstehe. Wer sind denn meine Konkurrenten?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //Innos hat in seiner Weisheit drei Novizen erwählt, die ebenfalls diese Prüfung zu bestehen haben: Agon, Igaraz und Ulf. Sie haben bereits die Suche begonnen.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(barsch) Doch genug davon! Höre die Worte der Prüfung: 'Folge den Zeichen Innos' und bringe uns das, was der Gläubige hinter dem Pfad findet.'
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Diesen Schlüssel wirst du brauchen.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //Wir haben dem nichts weiter hinzuzufügen.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar stellt mich vor die Prüfung der Magie. Die gleiche Prüfung, die auch den erwählten Noivzen, Ulf, Igaraz und Agon auferlegt wurde. ");
	
	B_LogEntry (TOPIC_Schnitzeljagd," Ich soll den Zeichen Innos folgen und ihm das bringen 'was der Gläubige hinter dem Pfad findet'. Dazu hat er mir einen Schlüssel gegeben.");
	
	CreateInvItems (self,ItKe_MagicChest,1);
	B_GiveInvItems (self,other,ItKe_MagicChest,1);
	
	//------------Igaraz klar machen------------------- 
	B_StartOtherRoutine (Igaraz,"CONTEST");
	AI_Teleport (Igaraz,"NW_TAVERNE_BIGFARM_05");	
	CreateInvItems (Igaraz, ItKe_MagicChest,1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;
	
	//---------Smalltalk Partner herbeirufen 
	B_StartOtherRoutine (NOV607,"EXCHANGE");
	
	//------------Agon klar machen-------------------
	B_StartOtherRoutine (Agon,"GOLEMDEAD");
	AI_Teleport (Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems (Agon, ItKe_MagicChest,1);		
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	//------------Ulf klar machen-------------------
	B_StartOtherRoutine (Ulf,"SUCHE");
	AI_Teleport (Ulf,"NW_TROLLAREA_PATH_42");	
	CreateInvItems (Ulf, ItKe_MagicChest,1);	
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	//-------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	20;
	condition	 = 	DIA_Pyrokar_RUNNING_Condition;
	information	 = 	DIA_Pyrokar_RUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Pyrokar_RUNNING_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&&  Npc_IsInState (self, ZS_Talk) 
	&& (other.guild  == GIL_NOV)
	&& (Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_RUNNING_Info ()
{
	var int randomizer;
	randomizer = Hlp_Random (3); 
	
	if  (randomizer == 0)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Solange du mit der Prüfung beschäftigt bist, haben wir dir nichts zu sagen.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //Warum stehst du hier herum? Stell dich deiner Prüfung!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Es ist an der Zeit, den großen Worten Taten folgen zu lassen. Meinst du nicht, Novize?
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SUCCESS_Condition;
	information	 = 	DIA_Pyrokar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich habe den Runenstein gefunden";
};
func int DIA_Pyrokar_SUCCESS_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild  == GIL_NOV)
	&& (!Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	&& (( Npc_HasItems (other,itmi_runeblank) >= 1)
	|| ( Npc_HasItems (other,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SUCCESS_Info ()
{
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //Ich habe den Runenstein gefunden.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(ungläubig) Du ... hast es geschafft?! Du bist den Zeichen gefolgt und hast du die geheime Pforte entdeckt ...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //... und habe all diese Monster besiegt, die mich schon auf ihren Speiseplan gesetzt hatten.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //Und die anderen Novizen? Was ist mit Agon? Haben sie es nicht vor dir geschafft?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Sie haben versagt. Es war ihnen wohl nicht bestimmt, die Prüfung zu bestehen.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Nun, dann erklären wir, dass du diese Prüfung bestanden hast. Der Runenstein soll auch weiterhin dir gehören.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Prüfung erfolgreich und die anderen noch nicht. 
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Todo_Condition;
	information	 = 	DIA_Pyrokar_Todo_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Pyrokar_Todo_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (other.guild  == GIL_NOV)
	&& ((MIS_RUNE  != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)) 

	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Todo_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Du hast die Prüfung, vor die ich dich gestellt habe, bestanden.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Aber ...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //... die Prüfung von Ulthar liegt noch vor dir.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //... Serpentes' Prüfung hast du noch nicht beendet.
	};
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	3;
	condition	 = 	DIA_Pyrokar_MAGICAN_Condition;
	information	 = 	DIA_Pyrokar_MAGICAN_Info;
	permanent	 =  FALSE;
	description	 = 	"Werde ich jetzt in die Gilde der Magier aufgenommen?";
};

func int DIA_Pyrokar_MAGICAN_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE  		  == LOG_SUCCESS)
	&& (MIS_GOLEM 		  == LOG_SUCCESS)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_MAGICAN_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //Werde ich jetzt in die Gilde der Magier aufgenommen?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Du hast es geschafft. Du hast die Prüfung des Feuers bestanden. Wir waren uns sicher, dass du es schaffen würdest.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(eindringlich) Ebenso wie wir sicher sind, dass du weiterhin alles daran setzen wirst, ein WÜRDIGER Diener Innos' zu werden.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Wenn du also bereit bist, den Schwur des Feuers zu leisten, wirst du als Magier in unseren Reihen empfangen.
	
};
///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	1;
	condition	 = 	DIA_Pyrokar_OATH_Condition;
	information	 = 	DIA_Pyrokar_OATH_Info;
	permanent 	 =  FALSE;
	description	 = 	"Ich bin bereit, in den Kreis des Feuers zu treten.";
};
func int DIA_Pyrokar_OATH_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_OATH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Ich bin bereit, in den Kreis des Feuers zu treten.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Gut, dann schwöre den heiligen Eid des Feuers.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(feierlich) Schwörst du, vor dem allmächtigen Herrn Innos, seiner Diener und der heiligen Flamme ...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //... dass von nun an und auf ewig dein Leben mit dem Feuer verbunden ist ...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //... bis dein Körper und dein Geist Ruhe finden in seinen heiligen Hallen und das Feuer des Lebens erlischt?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Ich schwöre es.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Mit den Worten des Schwurs bist du den Bund mit dem Feuer eingegangen.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Trage diese Robe als Zeichen des ewigen Bundes.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//fürs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Nun, da du in unsere Reihen aufgenommen wurdest, kannst du mit Lord Hagen, dem obersten Befehlshaber der Paladine, sprechen.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Wir sind ebenfalls sehr interessiert daran, wie er die Situation beurteilt. Also steht es dir nun frei, nach Khorinis zu gehen.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Wir erwarten, dass du uns unverzüglich seine Antwort bringst.
};
///////////////////////////////////////////////////////////////////////
//	Info  Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Lernen_Condition;
	information	 = 	DIA_Pyrokar_Lernen_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Was kann ich nun alles lernen?";
};
func int DIA_Pyrokar_Lernen_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Lernen_Info ()
{
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Was kann ich nun alles lernen?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Zunächst mal ist es dir nun möglich, die magischen Kreise zu erlernen. Sie gewähren dir die Macht, die Runen anzuwenden.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //Je höher du in den sechs magischen Kreisen aufsteigst, desto mächtigere Zauber kannst du wirken.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Die Formeln lernst du bei den Brüdern im Kloster. Jeder hat sich auf ein Gebiet spezialisiert, das er dich lehren wird.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //So ist Karras ein Meister der Anrufungen und Beschwörungen und Hyglas wird dich die Magie des Feuers lehren.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Niemand versteht sich besser auf die Mächte von Eis und Donner als Marduk. Parlan kann dich verschiedene andere Sprüche lehren - und er wird dich in die ersten Kreise aufnehmen.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Aber jeder von ihnen lehrt dich nur die Formel - die Runen musst du selbst erschaffen.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"Bruder Parlan wird mich in die ersten Kreise der Magie einweihen.");
	
	B_LogEntry (Topic_KlosterTeacher,"Bruder Karras unterrichtet die Formeln der Beschwörungen und Anrufungen.");
	B_LogEntry (Topic_KlosterTeacher,"Bruder Hyglas kann mich in die Geheimnisse des Feuers einweihen.");
	B_LogEntry (Topic_KlosterTeacher,"Bruder Marduk kann mir die Mächte von Eis und Donner beibringen.");
	B_LogEntry (Topic_KlosterTeacher,"Bruder Parlan unterrichtet verschiedene, andere Formeln.");
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Wunsch_Condition;
	information	 = 	DIA_Pyrokar_Wunsch_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Ich möchte einen Wunsch äußern...";
};
func int DIA_Pyrokar_Wunsch_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Wunsch_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Ich möchte einen Wunsch äußern...
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Jedem Magier steht nach seiner Aufnahme das Recht der ersten Tat zu.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Also, was soll deine erste Tat als Magier sein?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Keine.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Babo soll neuer Klostergärtner werden.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Der Novize Opolos soll Zugang zur Bibliothek bekommen.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Dyrian soll erlaubt werden im Kloster zu bleiben.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Keine.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(verwundert) So soll es geschehen. Der neue Magier verzichtet auf seine Tat.
	
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	
	
};

FUNC VOID DIA_Pyrokar_Wunsch_Dyrian ()
{
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //Der Novize Dyrian soll im Kloster bleiben.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //So soll es geschehen.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Dem Novizen wird erlaubt, im Kloster zu bleiben, er wird die freigewordene Stelle des Gärtners besetzen.
	
	B_GivePlayerXP (XP_HelpDyrian);
	
	B_StartOtherRoutine (Dyrian,"FAVOUR");
	
	MIS_HelpDyrian = LOG_SUCCESS;
	
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Babo ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //Der Novize Babo soll die Leitung des Klostergartens übernehmen.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //So soll es geschehen.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //Mit sofortiger Wirkung wird dem Novizen Babo die Obhut des Klostergartens übertragen.
	
	B_GivePlayerXP (XP_HelpBabo);
	
	B_StartOtherRoutine (Babo,"FAVOUR");
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	MIS_HelpBabo = LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Opolos ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //Der Novize Opolos soll Zugang zur Bibliothek bekommen.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //So soll es geschehen.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //Der Novize Opolos wird ab sofort die Schriften Innos' studieren.
	
	B_GivePlayerXP (XP_HelpOpolos);
	
	B_StartOtherRoutine (Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	
	MIS_HelpOpolos 	= LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};
///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Nachricht_Condition;
	information	 = 	DIA_Pyrokar_Nachricht_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich bringe Nachricht von Lord Hagen...";
};
func int DIA_Pyrokar_Nachricht_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Nachricht_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //Ich bringe Nachricht von Lord Hagen. Er will Beweise für die Anwesenheit der Drachen und die Armee des Bösen.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //Also werde ich ins Minental gehen und ihm die Beweise bringen.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Gut. Dann wirst du diesem Befehl folgen. Der Paladin Sergio soll dich bis zum Pass geleiten.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Möge Innos dich schützen.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Also habe ich mich direkt auf den Weg ins Minental gemacht.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Gut, da du schon den Weg ins Tal kennst, wirst du wohl ohne Begleitung auskommen.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Erledige diese Sache für Lord Hagen - möge Innos dich schützen.
	};

};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	4;
	condition	 = 	DIA_Pyrokar_TEACH_Condition;
	information	 = 	DIA_Pyrokar_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Lehre mich den letzten Kreis der Magie.";
};
func int DIA_Pyrokar_TEACH_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5) 
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Lehre mich den letzten Kreis der Magie.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Viel Zeit ist vergangen, seit du den Bund mit dem Feuer eingegangen bist. Viel ist geschehen und wir finden keine Ruhe.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Du bist der Erwählte Innos'. Und als solcher wirst du alle Kraft brauchen, um deine Kämpfe zu bestehen.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Ich weihe dich nun, Erwählter. Du trittst in den sechsten Kreis - mögest du das Licht bringen und die Dunkelheit vertreiben.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Die Zauberformeln des letzten Kreises kannst du nun von mir lernen, wenn du es wünscht.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Ach - eine Sache noch. Es hat einige Zeit gedauert, bis ich dich wiedererkannt habe.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Du hast von mir den Brief bekommen, als sie dich damals in die Barriere geworfen haben.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Ja, damit hast du mir das Gefasel des Richters erspart.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //Und du bist der Erwählte Innos'.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //Empfange nun meinen Segen, Erwählter!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innos, das Licht der Sonne und das Feuer der Welt, segne diesen Mann, deinen erwählten Diener.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Schenke ihm Mut, Kraft und Weisheit, dem Weg zu folgen, den du ihm bestimmt hast.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Noch ist es nicht an der Zeit dafür. Wenn du ein Stück weiter auf dem Weg gegangen bist, den Innos dir zeigt, dann werde ich dich unterweisen.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SPELLS_Condition;
	information	 = 	DIA_Pyrokar_SPELLS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Unterweise mich (Runen erschaffen)";
};
func int DIA_Pyrokar_SPELLS_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SPELLS_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Unterweise mich.
	
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
	Info_AddChoice		(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //Es gibt nichts mehr, das ich dir beibringen könnte.
	};
};
FUNC VOID DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
};
FUNC VOID DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};
///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_Parlan_Condition;
	information	 = 	DIA_Pyrokar_Parlan_Info;
	permanent	 = 	FALSE;
	description	 = 	"Parlan schickt mich...";
};
func int DIA_Pyrokar_Parlan_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Parlan_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Parlan schickt mich. Ich will meine magische Kraft steigern.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Nun, du hast viel gelernt und deine Kraft ist gewachsen. Von nun an sollst du von mir lernen.
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_TEACH_MANA_Condition;
	information	 = 	DIA_Pyrokar_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will meine magische Kraft steigern.";
};
func int DIA_Pyrokar_TEACH_MANA_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo (hero,DIA_Pyrokar_Parlan)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Ich will meine magische Kraft steigern.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Ich spüre, dass die magische Kraft dich ganz und gar durchströmt. Selbst ich kann dir nicht zeigen, wie du sie noch steigern kannst.
	};
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	900;
	condition	 = 	DIA_Pyrokar_PERM_Condition;
	information	 = 	DIA_Pyrokar_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"(Segen)";
};
func int DIA_Pyrokar_PERM_Condition ()
{	
	if (Kapitel >= 2)	
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Segne mich, Meister.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //Wie wär's mit 'n bisschen Segen. Ich könnt's gebrauchen.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Möge dein letzter Kampf gegen unseren Erzfeind von Erfolg gekrönt sein. Innos sei mit dir.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Möge Innos sein zwischen dir und dem Leid auf allen gottlosen Pfaden, die du beschreiten wirst.
			};
};

//##############################################################
//##
//##
//##							KAPITEL 3
//##
//##
//##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP3_EXIT_Condition;
	information	= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BACKFROMOW_Condition;
	information	 = 	DIA_Pyrokar_BACKFROMOW_Info;

	description	 = 	"Ich komme aus dem alten Minental.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //Ich komme aus dem alten Minental.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //Was hast du zu berichten?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //Der Feind hat sich dort formiert und wartet mit einer Armee von Orks und Drachen auf.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //Das ist uns schon von Milten mitgeteilt worden, aber wie steht es um die Erzlieferung des Königs?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //Die Mine, die Garond im Tal ausheben lässt, wird den Bedarf des Königs nicht decken.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Die Tage werden grauer und das Licht der Sonne immer schwächer.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //Ich bin von Männern in schwarzen Roben angegriffen worden.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Ich weiß. Das sind die Suchenden. Schergen der Unterwelt Beliars. Nimm dich vor ihnen in Acht. Sie werden versuchen, von dir Besitz zu ergreifen.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Bist du erst einmal besessen, bist du nicht mehr du selbst. Dann kann dir nur noch hier im Kloster geholfen werden. Also sei vorsichtig.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar erzählte mir von den Suchenden. Männer in schwarzen Roben. Die Schergen Beliars. Er warnte mich vor ihrer Fähigkeit, mich besessen zu machen. Ich soll sofort ins Kloster zurückkehren, sollte mir das einmal passieren."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Ich habe Karras darauf angesetzt, sich mit der Materie zu befassen. In Kürze wird er sicherlich mehr Erkenntnisse gewonnen haben, die uns weiter bringen.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar hat Karras damit beauftragt, sich mit der Bedrohung durch die Suchenden zu beschäftigen."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Hier - diese Rune wird dich direkt zum Kloster zurückbringen, wenn du unserer Hilfe bedarfst.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Denk daran, wir müssen Widerstand leisten, sonst sind wir alle dem Untergang geweiht.

};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	31;
	condition	 = 	DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_GIVEINNOSEYE_Info;

	description	 = 	"Ich bin gekommen, das Auge Innos' an mich zu nehmen.";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //Ich bin gekommen, das Auge Innos' an mich zu nehmen.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Ich sehe, du hast eine Ermächtigung von Lord Hagen persönlich erhalten, das Auge Innos' zu tragen.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Ich fürchte, ich muss dich enttäuschen. Wir sind einer heimtückischen List des Feindes zum Opfer gefallen.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //Das Auge Innos' ist aus diesen heiligen Mauern gewaltsam entwendet worden.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Wer konnte so vermessen sein, Meister?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Wer hat das getan?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //Wer konnte so vermessen sein, Meister?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //Wer hat das getan?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Das Böse ist gerissen und wirkt meist im Verborgenen. Nur selten sieht man es ans Tageslicht kommen, um seine bösen Machenschaften zu verrichten.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Doch in diesen Tagen ist das anders. Der Feind zeigt sich offen auf der Straße, in jedem Heim und auf jedem öffentlichen Platz.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //Das kann nur bedeuten, dass er keinen Gegner mehr fürchtet und vor nichts mehr zurückschrecken wird.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Einer unserer treuesten Anhänger und Anwärter auf die hohe Robe der Feuermagier ist unerwartet und auf erschreckend bösartige Weise übergelaufen. Pedro.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //Der Feind hat sich seiner bemächtigt und uns damit eine verheerende Niederlage zugefügt.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro hat sich gewaltsam Zugang zu unseren allerheiligsten Hallen verschafft und hat das Auge gestohlen.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Ich fürchte, er war einfach zu lange alleine draußen vor den Toren und somit außerhalb der schützenden Klostermauern allen lauernden Gefahren ausgeliefert.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschuß freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist für den SC nun als Traitor bekannt. Muß hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "Klasse. Hätte ich mir ja denken können. Ich bin zu spät gekommen, die Hohlköpfe im Kloster haben sich das Auge von einem Novizen klauen lassen und ich kann dem Verräter Pedro jetzt hinterher rennen und hoffen, dass er es noch nicht an irgendwen verkauft hat.");
 	B_LogEntry (TOPIC_TraitorPedro, "Pedro, der Verräter, hat das Auge Innos aus dem Kloster gestohlen. Ich schätze, dass die Feuermagier ihn nur all zu gerne in die Finger kriegen wollen.");
};



///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	34;
	
	condition	 = 	DIA_Pyrokar_NOVIZENCHASE_Condition;
	information	 = 	DIA_Pyrokar_NOVIZENCHASE_Info;

	description	 = 	"Wohin ist der Dieb geflohen?";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition ()
{
	if (Kapitel == 3)
	   && (Pedro_Traitor == TRUE)	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //Wohin ist der Dieb geflohen?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro schlug einige der anderen Novizen nieder, die versuchten, ihn aufzuhalten, und verschwand im Morgennebel.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //Viele Novizen sind ihm gefolgt, um das Auge unbeschadet wieder an seinen Platz zu bringen.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Wenn du sie noch einholen willst, dann musst du dich beeilen, bevor Pedro für dich unerreichbar wird.

	MIS_NovizenChase = LOG_RUNNING;	
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	35;
	condition	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Info;

	description	 = 	"Ich habe das Auge Innos' gefunden.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition ()
{
	if (Kapitel == 3)
		&& 	(MIS_NovizenChase == LOG_RUNNING)
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //Ich habe das Auge Innos' gefunden. Es ist zerbrochen.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Aber ... das kann nicht sein. Was ist passiert?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Es war bei einigen echt miesen Kerlen. Jedoch kam ich zu spät.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Sie hielten dort oben in den Wäldern eine seltsame Beschwörung auf einem sichelförmigen Ritualplatz ab.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Innos steh uns bei. Sie haben unseren Sonnenkreis entweiht.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Selbst in meinen schlimmsten Träumen hätte ich nicht damit gerechnet, dass sie solch eine Macht besitzen.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Was können wir tun?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Was können wir tun?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //Der Feind ist sehr stark geworden. Jedoch hat er in diesem alten Artefakt eine mächtige Bedrohung gesehen.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Wir müssen das Auge heilen und ihm seine alte Kraft zurück geben. Doch die Zeit ist gegen uns.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Ich vermag mir nicht auszumalen, was nun mit uns allen geschehen wird. Ohne den Schutz des Auges sind wir dem Feind hilflos ausgeliefert.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Gehe zu Vatras, dem Wassermagier in der Stadt. Nur er weiß in unserer misslichen Lage, was zu tun ist. Bringe das Auge zu ihm, beeile dich.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Warum gerade Vatras?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Was ist der Sonnenkreis?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar will, dass ich den Wassermagier Vatras in der Satdt um Rat frage, was mit dem zerstörten Auge nun zu tun ist.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Warum gerade Vatras?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Das Privileg der Robe ermächtigt dich nicht, meine Anweisungen in Frage zu stellen, Bruder.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras ist ein Diener Adanos'. Allein das Wissen der Wassermagier wird uns in dieser dunklen Stunde Klarheit verschaffen.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //Das ist alles, was du wissen musst.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Was ist der Sonnenkreis?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Zu jenem Ort reisen alle Magier und Novizen des Klosters jedes Jahr zur Sonnenwende, um den Beginn eines neuen Zyklus einzuläuten.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //Der Ort ist erfüllt von der unermesslichen Kraft der Sonne.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //Niemals hätte ich auch nur im entferntesten geahnt, dass seine Macht hätte umgekehrt werden können. Und doch ist es geschehen.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter ()
{
		Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
};


///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information	 = 	DIA_Pyrokar_SPOKETOVATRAS_Info;

	description	 = 	"Ich habe mit Vatras gesprochen.";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //Ich habe mit Vatras gesprochen.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Ah, gut. Wo ist er?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Er bereitet ein Ritual am Sonnenkreis vor, um das Auge Innos' zu heilen.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Wenn das wahr ist, dann gibt es vielleicht doch noch Hoffnung.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras möchte, dass Xardas und du ihm dabei helfen.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //WAS? Xardas wird auch da sein? Das ist doch nicht dein Ernst.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Hey. Das war nicht meine Entscheidung. Vatras besteht darauf.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Immer wieder dieser Xardas. Ich kann es nicht mehr hören. Es kann ja fast gar nicht mehr schlimmer werden.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Wer sagt mir denn, dass Xardas nicht mit dem Feind unter einer Decke steckt?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Ich kann Xardas nicht vertrauen, ganz egal, wie sehr wir ihn auch brauchen.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Es tut mir Leid, aber unter diesen Umständen kann ich Vatras nicht helfen.
	B_GivePlayerXP (XP_Ambient);


};


///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Info;

	description	 = 	"Ohne dich geht es nicht.";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Ohne dich geht es nicht. Vatras kann das Ritual sonst nicht durchführen.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Du wirst Xardas vertrauen müssen.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Ich muss gar nichts, hörst du? Ich habe nicht den geringsten Beweis dafür, dass Xardas nicht gegen uns arbeitet. Ich kann das nicht tun.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //Was wäre, wenn ich dir diesen Beweis liefern könnte?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Ich fürchte, das ist unmöglich. Es müsste mich schon sehr beeindrucken.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //Was Xardas angeht, habe ich meine Zweifel, ob es ihm überhaupt noch gelingen wird, mich zu beeindrucken.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar bekommt bei dem Gedanken an Xardas kalte Füsse. Ich werde mit Xardas darüber reden müssen, wie ich ihn zum Ritual am Sonnenkreis bewegen kann.");
	
	Pyrokar_DeniesInnosEyeRitual = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BUCHZURUECK_Condition;
	information	 = 	DIA_Pyrokar_BUCHZURUECK_Info;

	description	 = 	"Ich habe von Xardas dieses Buch mitgebracht.";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition ()
{
	if (Npc_HasItems (other,ItWr_XardasBookForPyrokar_Mis))
		 && (Kapitel == 3)
		 {
				return TRUE;
		 };
};

func void DIA_Pyrokar_BUCHZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //Ich habe von Xardas dieses Buch mitgebracht.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //Es ist ein Zeichen seines Vertrauens.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Zeig her.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(erstaunt) Das ist ja unglaublich. Hast du auch nur im geringsten eine Ahnung, was du mir da gerade gegeben hast?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Äh. Nein.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(verärgert) Das ist ein uraltes verschollenes Werk aus längst vergangenen Tagen.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Wir haben es alle für verloren gehalten und nun erfahre ich, dass Xardas immer gewusst hat, wo es war.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Wirst du nun zum Ritual erscheinen?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Ja, ich werde zum Sonnenkreis aufbrechen, aber sicher nicht, weil ich von Xardas' guten Absichten überzeugt bin.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //Vielmehr werde ich diesen Hund zur Rede stellen, wo er das Buch all die Jahre versteckt gehalten hat. Es hat eindeutig den Bogen überspannt.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Wir sehen uns am Sonnenkreis.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Endlich hat Pyrokar eingewilligt zum Sonnenkreis zu gehen.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_PRERITUAL_Condition;
	information	 = 	DIA_Pyrokar_PRERITUAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Glaubst du, ihr werdet das Auge wieder hinkriegen?";
};

func int DIA_Pyrokar_PRERITUAL_Condition ()
{
		if (Pyrokar_GoesToRitualInnosEye == TRUE)
			&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
			&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_PRERITUAL_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //Glaubst du, ihr werdet das Auge wieder hinkriegen?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //Schwer zu sagen. Warten wir es ab.
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_AUGEGEHEILT_Condition;
	information	 = 	DIA_Pyrokar_AUGEGEHEILT_Info;

	description	 = 	"Ihr habt es geschafft. Das Auge Innos' ist geheilt.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Pyrokar_AUGEGEHEILT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Ihr habt es geschafft. Das Auge Innos' ist geheilt.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Ich hätte es fast nicht für möglich gehalten.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Ja, Meister.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Du hast mehrfach bewiesen, dass du bereit für den hohen Orden der Feuermagier bist.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //Mit dem heutigen Tage bist du ein Mitglied des Rates und wirst unseren Orden in der Welt vertreten. Du bist nun hoher Feuermagier.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Trage die hohe Robe mit Würde und bringe dem Orden Ehre und Wohlstand, mein Bruder.
		
			CreateInvItem	(hero, ITAR_KDF_H);
			AI_EquipArmor	(hero, ITAR_KDF_H);	
			
			heroGIL_KDF2 = TRUE;
		};	
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_KAP3_READY_Condition;
	information	 = 	DIA_Pyrokar_KAP3_READY_Info;

	description	 = 	"Was bleibt mir hier noch zu tun?";
};

func int DIA_Pyrokar_KAP3_READY_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_KAP3_READY_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Was bleibt mir hier noch zu tun?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Halte dich nicht mit Nichtigkeiten auf. Geh und vernichte die Drachen. Hier hast du das Auge.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Bedenke, dass du erst mit einem Drachen gesprochen haben musst, bevor du ihn angreifst.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fügt ihnen auch unerträgliche Schmerzen zu, wenn du es bei dir trägst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Die Macht des Auges wird die Drachen dazu zwingen, mit dir zu reden, und dir die Wahrheit zu sagen.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Außerdem bietet es dir Schutz gegen ihre Angriffe, wenn du es trägst.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Jedoch ist seine Kraft nicht beständig. Du wirst es wieder mit magischer Energie füllen müssen.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Dazu brauchst du die Essenz eines Drachenherzens, das du an einem Alchemietisch mit dem Auge vereinst.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Erst dann kannst du es wagen, einem weiteren Drachen entgegen zu treten.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Danke. Ich werd's mir merken.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Du hast nun alles, was du brauchst. Geh nun. Du hast nicht mehr viel Zeit.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Ich bin nun bereit, den Drachen gegenüber zu treten. Das Auge Innos wird mir helfen sie zu bezwingen. Ich darf nur nicht vergessen, es zu tragen, wenn ich in den Kampf gegen die Biester ziehe. Erst muß ich mit den Drachen gesprochen haben, bevor ich auch nur den Hauch einer Chance gegen sie habe. Das Dumme ist nur, dass das Auge bei jedem Gespräch mit einem von ihnen seine Kraft verliert. Ich benötige das Herz eines Drachen und eine leere Laborflasche um das Extrakt des Drachenherzes mit dem geschwächten Stein des Amuletts an einem Alchemietisch zu vereinen, bevor ich mich dem nächsten Drachen stellen kann."); 

	MIS_ReadyforChapter4 = TRUE; //Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck (NEWWORLD_ZEN);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	39;
	condition	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Info;

	description	 = 	"Ich habe einen seltsamen Almanach gefunden.";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))		
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //Ich habe einen seltsamen Almanach gefunden.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //Tatsächlich? Was ist das für ein Almanach?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Ich bin mir nicht sicher. Ich dachte, du wüsstest, was damit zu tun ist.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //Fürwahr, das ist sehr beunruhigend. Gut, dass du es mir gebracht hast. Das war sehr klug.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Ich nehme an, dass es noch mehr davon gibt. Geh und finde noch weitere dieser Bücher der Verdammnis.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Ich vermute, es ist ein Machtinstrument der Suchenden.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Damit kontrollieren sie die verlorenen Seelen ihrer Opfer.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Die Namen derer, die sie zu übernehmen planen, schreiben sie offensichtlich in die Bücher hinein.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Pass auf. Ich gebe dir jetzt diesen magischen Brief. Er wird dir die Namen zeigen, die in den Büchern zu lesen sind.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Finde diese Opfer und bring mir ihre Bücher. Ich werde sie unschädlich machen.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Doch vorher solltest du wenigstens eins davon Karras zeigen. Vielleicht hilft ihm das bei seinen Studien.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //Begehe nicht den Fehler, sie selbst vernichten zu wollen. Du bist ihrer Macht noch nicht gewachsen.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar will die Almanachs der Besessenen unschädlich machen. Dazu gab er mir eine Liste derer, die die Suchenden zu übernehmen planen. Auf Pyrokars Liste sollen später vielleicht noch mehr Namen zu lesen sein."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Komm den Suchenden nicht zu nah, sonst werden sie von dir Besitz ergreifen.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Solltest du trotzdem ihrem Ruf nicht entgehen können, dann komm so schnell, wie du kannst, zu mir zurück.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //Nur hier im Kloster kann deiner Seele geholfen werden.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //Gibt es keinen Schutz gegen ihre mentalen Angriffe?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //Möglich. Karras könnte etwas darüber wissen.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"Karras soll mir helfen, einen Schutz gegen die mentalen Angriffe der Suchenden zu finden."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	70;
	condition	 = 	DIA_Pyrokar_SCOBSESSED_Condition;
	information	 = 	DIA_Pyrokar_SCOBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Besessenheit heilen)";
};

func int DIA_Pyrokar_SCOBSESSED_Condition ()
{
	if (SC_IsObsessed == TRUE)
		{
				return TRUE;
		};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info ()
{
	if ((Got_HealObsession_Day<=(Wld_GetDay()-2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems (other,ItPo_HealObsession_MIS) == FALSE)  
		{
			if (hero.guild == GIL_KDF)
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Heile mich, Meister, denn ich bin besessen.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //So sei es! Nimm diesen Trank. Er wird dich von deinen bösen Träumen befreien.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Möge die Gnade Innos' dich erlösen.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Handel in seinem Sinne und hüte dich vor dem bösen Blick des Feindes.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Aber sei gewarnt, wenn du dich noch öfter ihrer Macht aussetzt, wird es für dich irgendwann keinen Weg zurück mehr geben. Denke immer daran.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Ich glaube, ich bin besessen. Kannst du mich heilen?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //Nicht ohne ein Zeichen deiner Ehrerbietung diesem Kloster gegenüber, mein Sohn. 300 Goldmünzen.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Das ist mir zuviel.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Gut. Hier hast du das Geld.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Du hattest doch gerade erst noch deinen Genesungstrank. Komm erst zu mir zurück, wenn ich dir wieder helfen kann.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Gut. Hier hast du das Geld.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Hier, trink das. Möge die Gnade Innos' dich erlösen.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //Bring mir das Geld und dir soll geholfen werden.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //Das ist mir zu viel.
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Pyrokar_AlmanachBringen_Condition;
	information	 = 	DIA_Pyrokar_AlmanachBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ich kann noch mehr berichten über die Besessenen.";
};

func int DIA_Pyrokar_AlmanachBringen_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN))
		{
				return TRUE;
		};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Ich kann noch mehr berichten über die Besessenen.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Sprich, Bruder.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold für einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //Ich habe einen weiteren Almanach gefunden.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //Ich habe noch mehr Bücher der Suchenden für dich.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Das ist gut. Ich fürchte jedoch, dass es noch mehr davon zu finden gibt. Suche weiter.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Es sind schon viele gefunden worden. Aber ich denke, das waren noch nicht alle.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Du hast mir schon eine große Anzahl der Bücher des Feindes bringen können.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Würde mich wundern, wenn sie noch sehr viel mehr im Umlauf hätten. Ich bin stolz auf dich, mein Bruder.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Nimm dies. Mit dieser Aufwendung des Klosters wirst du dem Bösen besser begegnen können.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //Und denke daran, ab und zu in meinen magischen Brief zu sehen.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Es ist möglich, dass sie es auch noch bei anderen versuchen werden, die bisher noch nicht in den Almanachs zu lesen waren.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE; 
	};
	AlmanachGeld	= (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems (self, ItMi_Gold, AlmanachGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, AlmanachGeld);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP4_EXIT_Condition;
	information	= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP5_EXIT_Condition;
	information	= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DRACHENTOT_Condition;
	information	 = 	DIA_Pyrokar_DRACHENTOT_Info;

	description	 = 	"Alle Drachen sind tot.";
};

func int DIA_Pyrokar_DRACHENTOT_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //Alle Drachen sind tot.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //Das ist wahrlich eine gute Nachricht. Es ändert jedoch nichts an unserer scheinbar aussichtslosen Situation.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Die Suchenden sind immer noch nicht abgezogen. Ganz im Gegenteil. Mir kommen immer mehr Berichte zu Ohren, dass sich ihre Zahl in den letzten Tagen sogar noch vermehrt haben soll.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Die Drachen zu töten alleine hat dem Feind noch keinen ausreichenden Schlag versetzt. Wir müssen das Übel an der Wurzel packen.

};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DERMEISTER_Condition;
	information	 = 	DIA_Pyrokar_DERMEISTER_Info;

	description	 = 	"Ich habe mit den Drachen gesprochen.";
};

func int DIA_Pyrokar_DERMEISTER_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //Ich habe mit den Drachen gesprochen.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //Was haben sie gesagt?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //Sie sprachen unentwegt von der Macht ihres Meisters und dass dieser sich in den Hallen von Irdorath niedergelassen hat.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Innos stehe uns bei. Der schwarze Tempel hat seine Macht zurückerlangt und schickt nun seine Schergen über unsere Welt.

};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_WASISTIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_WASISTIRDORATH_Info;

	description	 = 	"Was sind diese Hallen von Irdorath?";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //Was sind diese Hallen von Irdorath?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //Der östliche Beschwörungstempel des Gottes Beliar. Es sind ihrer Zahl vier im Lande Myrtana. Doch dieser ist der wohl furchteinflössendste Tempel von ihnen.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Vor etwa 40 Jahren zerstörte man den nördlichen und westlichen Tempel dieser abscheulichen Gottheit.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Die tapferen Ritter dieser Zeit hatten alles eingesetzt, um diese mächtigen Bauwerke dem Erdboden gleich zu machen.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //Die schwarzen Horden des Feindes hatten damals der Überzahl und dem Heldenmut der Ritter und Paladine nichts entgegen zu setzen.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Es wäre ein Leichtes gewesen, die beiden anderen Tempel auch zu zerstören, um das Land endgültig von dem Übel zu befreien ...
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //... doch sie waren nach dem Fall des zweiten Tempel einfach verschwunden.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(spottet) Verschwunden. Ein ganzer Tempel. Ach, komm!
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Spotte nicht. Die Situation ist Ernst. Wenn die Hallen von Irdorath tatsächlich wieder an Macht gewonnen haben, wird es schwierig, den Feind zu besiegen.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Dazu müsstest du ihn erst einmal finden, und ich denke, das wird deine nächste und schwierigste Aufgabe sein.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Wir werden sehen.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Die Hallen von Irdorath seine laut Pyrokar ein verschollener Beschwörungstempel des Gottes Beliar. Ich muß diesen Tempel finden."); 

};


///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	54;
	condition	 = 	DIA_Pyrokar_BUCHIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_BUCHIRDORATH_Info;

	description	 = 	"Das verloren geglaubte Buch von Xardas, wo ist es?";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (ItWr_HallsofIrdorathIsOpen  == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //Das verloren geglaubte Buch von Xardas, wo ist es?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Ich hatte mir schon gedacht, dass du danach fragen würdest. Aber ich fürchte, damit wirst du nichts anfangen können.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Es ist magisch versiegelt worden. Ich habe es in unsere unteren Gewölbe gebracht und selbst wir haben bisher vergeblich versucht, es zu öffnen.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Dieser verdammte Xardas hat sich da einen derben Scherz erlaubt.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //Kann ich das Buch sehen?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Von mir aus. Ich kann mir nicht vorstellen, dass du da Erfolg hast, wo die größten Meister unseres Klosters gescheitert sind.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Aber versuch es ruhig, Talamon wird dich nicht aufhalten.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas Buch DIE HALLEN VON IRDORATH liegt in den unteren Gewölben des Klosters. Talamon bewacht es. Die Magier haben es nicht geschafft es zu öffnen. Es ist magisch veriegelt und Xardas sei dafür verantwortlich."); 
	
	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Info;

	description	 = 	"Ich habe das Buch von Xardas öffnen können.";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition ()
{
	if (ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //Ich habe das Buch von Xardas öffnen können.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Was? Wie hast du das geschafft? Ich bin daran schier verzweifelt.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas hat mir den Trick verraten.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Ich hatte Glück, schätze ich.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Ich hatte Glück, schätze ich.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Erzähl keinen Unsinn. Glück.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Wenn nicht mal ich es schaffe, das Buch zu öffnen und dann jemand wie du daher kommt ...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //... darüber werde ich eingehend nachdenken.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Trotz allem. Da du offensichtlich der einzige warst, der das Buch zu öffnen vermochte, dann sei dir gewährt, das Buch zu halten. Zumindest so lange, bis wir diese Krise überstanden haben.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas hat mir den Trick verraten.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Ach, so ist das. Interessant. Ich kann nur für dich hoffen, dass Xardas schlechter Einfluss dich nicht verdirbt.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Ich warne dich. Geh diesem alten Teufel nicht auf den Leim. Du könntest es bereuen.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;

	description	 = 	"In dem Buch ist von einer geheimen Bibliothek die Rede.";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition ()
{
	if 	(ItWr_SCReadsHallsofIrdorath == TRUE)
		&& (Kapitel == 5)	
		&& (MIS_SCKnowsWayToIrdorath == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
			{
					return TRUE;
			};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //In dem Buch ist von einer geheimen Bibliothek die Rede.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //Wovon redest du da?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //Von einer Bibliothek unterhalb dieser Mauern hier. Klingelt's?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //Nein. Wo soll diese Bibliothek sein, sagst du?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //So, so. Du hast also keine Ahnung. Mmh.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar hat von der geheimen Bibliothek keine Ahnung. Offensichtlich hatte nur Xardas jemals Zugang dazu."); 

};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;

	description	 = 	"Ich weiß, wo die Hallen von Irdorath zu finden sind.";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //Ich weiß, wo die Hallen von Irdorath zu finden sind.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Der Tempel befindet sich auf einer Insel. Ich habe eine Seekarte gefunden, die mir den Weg zeigt.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //Das ist großartig. Dann wirst du ein Schiff und eine Crew brauchen, um dem Feind die Stirn zu bieten.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Aber bedenke, dass du dafür gut gerüstet sein musst, wenn der Sieg über den Meister von Irdorath gelingen soll.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //Wo kann ich eine Crew finden?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Deine Mannschaft sollte aus Männern deines Vertrauens bestehen.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Rede mit deinen Freunden und beachte dabei, dass sie dir von Nutzen sind, wenn du auf der Insel bist.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Du wirst auch einen Magier brauchen. Nur leider kann ich hier im Kloster keinen Mann entbehren.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Du wirst einen Magier fragen müssen, der seinen Dienst nicht hier im Kloster verrichtet.

};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_SCWILLJORGEN_Condition;
	information	 = 	DIA_Pyrokar_SCWILLJORGEN_Info;

	description	 = 	"Jorgen ist ein erfahrener Seemann.";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&(Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen ist ein erfahrener Seemann. Er könnte mir helfen, zur Insel von Irdorath zu kommen.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //So einfach wird das nicht gehen, fürchte ich.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Er hat sich verpflichtet für die Bruderschaft zu arbeiten. Er hat weder den Tribut entrichtet, noch ein Schaf ins Kloster gebracht.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen muss erst seine Arbeiten verrichten, dann könntest du ihn mitnehmen.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Wie lange wird das dauern?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Er hat die Vorräte aufgebraucht, die einer der Novizen in drei ganzen Wochen verbraucht hätte, und das gleich am ersten Tag.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Also vor drei Monaten harter Arbeit in unseren Gärten werde ich ihn nicht entlassen.

};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_MACHDTFREI_Condition;
	information	 = 	DIA_Pyrokar_MACHDTFREI_Info;

	description	 = 	"Was kann ich tun, um Jorgen JETZT mitnehmen zu können?";
};

func int DIA_Pyrokar_MACHDTFREI_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_MACHDTFREI_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //Was kann ich tun, um Jorgen JETZT mitnehmen zu können?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Mmh. In der Tat gäbe es eine Sache, die du für mich erledigen könntest. Dein gutes Verhältnis zu Xardas könnte dir dabei helfen.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //Mir ist zu Ohren gekommen, dass in seinem Turm in den letzten Tagen recht seltsame Dinge vor sich gehen.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Viele Einwohner der Stadt hören des Nachts laute Schreie von dort und seltsame Lichter tanzen über seinem Turm.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Als ob wir nicht schon genug am Hals hätten. Sieh nach, was da vor sich geht, und sorge dafür, dass es aufhört.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Dann kannst du Jorgen haben.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"In Xardas Turm geschehen seltsame Dinge. Wenn ich mich darum kümmere, kann ich Jorgen mitnehmen.");
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_DTCLEARED_Condition;
	information	 = 	DIA_Pyrokar_DTCLEARED_Info;

	description	 = 	"Die Sache mit Xardas' Turm hat sich erledigt.";
};

func int DIA_Pyrokar_DTCLEARED_Condition ()
{
	if (Npc_IsDead(Xardas_DT_Demon1)) 
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_DTCLEARED_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //Die Sache mit Xardas' Turm hat sich erledigt.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Was war denn da los ... nein, warte, ich will es gar nicht wissen.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Wenn du Jorgen immer noch willst, dann nimm ihn mit auf deine Reise.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Möge Innos dich beschützen.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

//---------------------------------
var int Pyro_Gives_Aura;
//---------------------------------
instance DIA_Pyrokar_AmulettofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_AmulettofDeath_Condition;
	information	 = 	DIA_Pyrokar_AmulettofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Die Prophezeiung erwähnt die heilige Aura Innos'.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition ()
{
	if (PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //Die Prophezeiung erwähnt die heilige Aura Innos'.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //Die Aura Innos' ist ein Amulett, welches nur den größten Magiern eines Zeitalters vorbestimmt ist.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Kann ich es haben?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Was ist das für ein Amulett?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //Kann ich es haben?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //Was? Was willst du damit?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Gegen den Drachen antreten.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Ja, natürlich. Ich werde dir das Amulett geben, aber gehe sorgsam damit um.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Ja ja.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Ich möchte es nicht später bei einem Händler zurückkaufen müssen.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Nutze es gut, und möge Innos alle Zeit über dich wachen.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //Was ist das für ein Amulett?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //Man sagt, dass es von Innos selbst geschmiedet wurde und den Menschen als Geschenk gemacht wurde.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Es schützt den Träger vor jeglicher Art von Schaden.
};


///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_PotionofDeath_Condition;
	information	 = 	DIA_Pyrokar_PotionofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Was sind die Tränen Innos'?";
};

func int DIA_Pyrokar_PotionofDeath_Condition ()
{
	if (Npc_HasItems (other,ItPo_PotionOfDeath_01_MIS))
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info ()
{
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //Was sind die Tränen Innos'?
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Die Tränen Innos' sind eine alte Kindergeschichte. Sie handelt von der Urzeit, als der Kampf zwischen Innos und Beliar begann.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Aha.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Ich habe diesen Trank gefunden.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Aha.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //Ich weiß nicht, ob du dir unserer Situation voll bewusst bist, aber ich glaube kaum, dass der Feind aufgrund einer Kindergeschichte besiegt wird.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //Ich habe diesen Trank gefunden.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //Das kann nicht sein. Ich kann es nicht glauben.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //Was ist denn?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Wenn das wirklich die echten Tränen Innos' sind, dann ...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(unterbricht) Wohl kaum.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //Unterbrich mich nicht. Wenn das die echten Tränen Innos' sind, dann haben wir eine mächtige Waffe gegen den Feind.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Und was sind jetzt die Tränen Innos?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Was meinst du mit Waffe?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //Was sind jetzt die Tränen Innos'?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Als Innos erkannte, dass er Beliar, seinen eigenen Bruder, bekämpfen musste, um die Schöpfung zu erhalten, wurde er sehr traurig.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Er begann zu weinen und seine Tränen fielen herab auf die Welt. Es waren viele Tränen, denn sein Herz war so voll Trauer, dass er 13 Jahre weinte.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Komm zum Punkt.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Die Menschen, die seine Tränen fanden und von ihnen kosteten, wurden erfüllt von einer übernatürlichen Kraft und Klarheit. Sie erkannten die Weisheit von Innos' Schöpfung und begannen, ihm zu dienen.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Sie waren die ersten Mitglieder der Gemeinschaft des Feuers. Die Tränen gaben ihnen Kraft, Mut und Weisheit. Doch das ist alles sehr lange her und schon seit über 250 Jahren hat niemand mehr eine Träne Innos' zu Gesicht bekommen.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Was meinst du mit Waffe?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //Es ist überliefert, dass die Streiter Innos' unter dem Einfluss dieser Substanz zu fast übermenschlichen Leistungen im Stande wahren.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Sie waren immun gegen alle Arten der Erschöpfung und hatten die Kraft zweier Bären.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Die größten Heldentaten vergangener Tage waren nur durch die Tränen Innos' möglich.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Verstehe.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Doch die Tränen könne ebenso Leid und Tod bringen. Nur Angehörigen unseres Ordens ist es möglich, diesen Trank zu trinken.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Alle anderen, ja selbst den Paladinen unseres Herren, stünde ein grausamer Tod bevor.

	Npc_RemoveInvItems 	(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems 		(hero,ItPo_PotionOfDeath_02_Mis,1);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc		= KDF_500_Pyrokar;
	nr		= 999;
	condition	= DIA_Pyrokar_KAP6_EXIT_Condition;
	information	= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pyrokar_PICKPOCKET (C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 900;
	condition	= DIA_Pyrokar_PICKPOCKET_Condition;
	information	= DIA_Pyrokar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen (108, 550);
};
 
FUNC VOID DIA_Pyrokar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK 		,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
	
func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};















































































































































