///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_EXIT   (C_INFO)
{
	npc         = KDW_1405_Addon_Merdarion_NW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1405_Addon_Merdarion_NW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre schwierig seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Hallo		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Hallo_Condition;
	information	 = 	DIA_Addon_Merdarion_Hallo_Info;

	description	 = 	"Bei der Arbeit?";
};

func int DIA_Addon_Merdarion_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Hallo_15_00"); //Bei der Arbeit?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //Diese Gewölbe sind mir ein einziges Rätsel. Unvorstellbar, dass sie bisher noch niemanden aufgefallen sind.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //Wir konnten den Eingang mühelos freilegen.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //Die Menschen sind so sehr mit ihrem täglichen Einerlei beschäftigt, dass sich niemand dieses Bauwerk näher angesehen hat.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //Ich habe keine andere Erklärung dafür.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Aufgabe		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Aufgabe_Condition;
	information	 = 	DIA_Addon_Merdarion_Aufgabe_Info;

	description	 = 	"Was ist deine Aufgabe hier?";
};

func int DIA_Addon_Merdarion_Aufgabe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Aufgabe_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Aufgabe_15_00"); //Was ist deine Aufgabe hier?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //Ich versuche herauszufinden, wohin uns dieses runde Portal führen wird.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //Außerdem helfe ich Nefarius bei der Suche nach dem fehlenden Ornament.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //Sicher ist, dass das Portal zu einem Teil der Insel führt, den wir noch nicht kennen.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //(nachdenklich) Ich kann mich auch nicht daran erinnern, jemals davon gehört oder gelesen zu haben ...
	
	Npc_ExchangeRoutine (self, "START");
	B_StartOtherRoutine (Cronos_NW, "START");
	
	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry (TOPIC_Addon_KDW,"Nefarius sucht nach einem fehlenden Ornament."); 
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info DaDurch
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_DaDurch		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_DaDurch_Condition;
	information	 = 	DIA_Addon_Merdarion_DaDurch_Info;

	description	 = 	"Ihr wollt tatsächlich durch das Portal gehen?";
};

func int DIA_Addon_Merdarion_DaDurch_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_DaDurch_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //Ihr wollt tatsächlich durch das Portal gehen?
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //Sicher. Vorausgesetzt, dass wir das fehlende Ornament finden, versteht sich.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //Ich gebe zu, es ist schon eine etwas riskante Angelegenheit.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //Aber wir müssen unbedingt herausfinden, was es mit diesen ständigen Erdbeben auf sich hat.
};
///////////////////////////////////////////////////////////////////////
//	Info Bedrohung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Bedrohung		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Bedrohung_Condition;
	information	 = 	DIA_Addon_Merdarion_Bedrohung_Info;

	description	 = 	"Was weißt du über die Erdbeben?";
};

func int DIA_Addon_Merdarion_Bedrohung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_DaDurch))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Bedrohung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //Was weißt du über die Erdbeben?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //Irgendetwas auf der anderen Seite löst sie aus.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //Vermutlich ist diese Quelle auch verantwortlich für das Erwachen der Steinwächter.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //Aber das ist nicht meine Aufgabe. Saturas und Cronos können dir sicher mehr darüber erzählen.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasdahinter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Wasdahinter2		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information	 = 	DIA_Addon_Merdarion_Wasdahinter2_Info;

	description	 = 	"Was glaubst du, werdet ihr drüben finden?";
};

func int DIA_Addon_Merdarion_Wasdahinter2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //Was glaubst du werdet ihr drüben finden?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //Ich bin mir da noch nicht sicher.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //Ich vermute, dass es auf der anderen Seite ein ähnliches Bauwerk wie dieses gibt. Und ein Gegenstück zu diesem Portal.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //Alles Weitere werden wir sehen, wenn wir da sind.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_PERM		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Merdarion_PERM_Condition;
	information	 = 	DIA_Addon_Merdarion_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kannst du mir etwas über die Magie beibringen?";
};

func int DIA_Addon_Merdarion_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //Kannst du mir etwas über die Magie beibringen?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //Wenn wir erst mal drüben sind, stehe ich dir zur Verfügung.
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Teleportstein		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Teleportstein_Condition;
	information	 = 	DIA_Addon_Merdarion_Teleportstein_Info;

	description	 = 	"Wie komme ich am schnellsten zurück in die Stadt?";
};

func int DIA_Addon_Merdarion_Teleportstein_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
	&& (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //Wie komme ich am schnellsten zurück in die Stadt?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //Du gehst am besten den gleichen Weg zurück, den du gekommen bist.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //(nachdenklich) Du könntest aber auch ... Nein. Das wäre zu gefährlich.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //Spuck's aus.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //Naja. Die Erbauer dieser Hallen hatten ihre eigene Art zu reisen.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //Soweit wir das beurteilen können, konnten sie sich teleportieren.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //Das ist doch nichts Besonderes.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //Die Teleportersteine, die wir hier in Khorinis gefunden haben, schon.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //Es scheint so, als würde der Teleporterstein hier in diesen Hallen zur Hafenstadt führen.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //Jedoch hat noch keiner von uns den Mut aufgebracht, ihn zu benutzen.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Was wäre, wenn ich es versuchen würde, ihn zu benutzen?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Wo ist dieser Teleportstein?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //Wo ist dieser Teleporterstein?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //Im Beckenraum gibt es eine Tür. Dahinter habe ich ihn eingeschlossen.
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Gib mir den Schlüssel. Ich will mir das Ding ansehen.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //Was wäre, wenn ich es versuchen würde, ihn zu benutzen?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //Keine Ahnung. Wir wissen darüber noch zu wenig. Es ist möglich, dass du es nicht überlebst.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //Gib mir den Schlüssel. Ich will mir das Ding mal ansehen.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //(unsicher) Wirklich? Aber ich übernehme dafür keinerlei Verantwortung.
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //Gib schon her.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //Wenn du meinst. Hier hast du ihn.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Merdarion gab mir den Schlüssel zur verschlossenen Tür in den Gewölben des Portals. Dahinter befinde sich ein Teleportstein, der mich zurück zur Hafenstadt bringen soll."); 

	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
};

///////////////////////////////////////////////////////////////////////
//	Info WHereOtherTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_WHereOtherTeleports		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Info;

	description	 = 	"Wo sind die anderen Teleportsteine?";
};

func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //Wo sind die anderen Teleportersteine?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //Wir haben bisher nur einen Weiteren etwa im Zentrum von Khorinis gefunden.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //In der Nähe der Taverne Zur Toten Harpie.
	B_LogEntry (TOPIC_Addon_TeleportsNW,"In der Nähe der Taverne 'Zur Toten Harpie' soll sich ein weiterer Teleportstein befinden."); 
};

///////////////////////////////////////////////////////////////////////
//	Info TeleportsteinSuccess
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_TeleportsteinSuccess		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Info;

	description	 = 	"Die Teleportsteine scheinen gut zu funktionieren.";
};

func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
	&& (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info ()
{
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //Die Teleportersteine scheinen gut zu funktionieren.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //Du hast es tatsächlich getan? Du bist wirklich hineingegangen?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //Ja. Sie funktionieren offensichtlich immer noch.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //(fasziniert) Unglaublich. Das muss ich mir nachher noch genauer ansehen.
};


