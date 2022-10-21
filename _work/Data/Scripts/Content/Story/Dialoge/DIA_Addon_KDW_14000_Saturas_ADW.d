
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14000_Addon_Saturas_ADW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Adanos m�ge dich sch�tzen.
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Saturas_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14000_Addon_Saturas_ADW;
	nr			= 900;
	condition	= DIA_Addon_Saturas_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Saturas_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Saturas_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Saturas_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) 
	&& (other.attribute[ATR_DEXTERITY] >= (31 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Saturas_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Saturas_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Saturas_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 31)
	{
		
		B_GiveInvItems (self, other, ItSc_Water01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Saturas_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWStart
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADWStart		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Saturas_ADWStart_Condition;
	information	 = 	DIA_Addon_Saturas_ADWStart_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_ADWStart_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Saturas_ADWStart_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Adanos sei Dank. Da bist du ja endlich. Wir dachten schon, du tauchst gar nicht mehr auf.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(irritiert) Was? Wieso seid ihr schon HIER?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Du bist durch das Portal gegangen und wir folgten dir. Es dauerte nicht lang, da sind wir hier angekommen.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Doch du warst nicht da. Wir sind schon einige Tage hier.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(�berrascht) EINIGE TAGE? Wie kann das sein?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Nachdem wir dich hier nirgendwo finden konnten, hat Nefarius versucht zu ergr�nden, was schief gelaufen sein k�nnte. Er wirkte bisher ziemlich ratlos.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //Naja. Du bist ja jetzt hier und kannst mit deiner Arbeit beginnen.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Was ist in der Zwischenzeit passiert?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Was ist in der Zwischenzeit passiert?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Wir haben eine Menge neuer Erkenntnisse gesammelt.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Die Erdbeben scheinen hier tats�chlich ST�RKER zu werden. Wir sind nicht mehr weit von ihrem Zentrum entfernt.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Die Erbauer dieser alten Bauwerke hatten damals hier eine Stadt errichtet, so viel k�nnen wir schon mal sagen.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Doch aus irgendeinem Grund ist ihre Kultur untergegangen.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Bisher k�nnen wir allerdings nur Vermutungen anstellen, warum.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Habt ihr schon eine Spur der vermissten Leute ausgemacht?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Was ist mit Raven?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //Was ist mit Raven?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //In Ravens Brief war von einem Tempel die Rede, und dass er versucht, hineinzugelangen.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Wir sind einstimmig der Meinung, dass es sich dabei um einen Tempel Adanos' handelt, den Raven zu entweihen versucht.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Die Erdbeben sind offenkundig das Resultat von unheiligen Beschw�rungen, die st�ndig gegen einen m�chtigen Zauber prallen.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Die Tore des Tempels sind magisch verschlossen und genau dieser Zauber ist es, der die Steinw�chter auferstehen l�sst.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Der Tempel wehrt sich. Wir m�ssen Raven aufhalten, bevor er ins Allerheiligste eindringen kann.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Wie geht's jetzt weiter?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Raven ist nur ein ehemaliger Erzbaron, kein Magier.", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Was will Raven in dem Tempel?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Was will Raven im Tempel?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder M�chtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir k�nnen davon ausgehen, dass er nichts Gutes im Schilde f�hrt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Wir wissen nur, da� es sich um ein m�chtiges Artefakt handelt, da� irgendwie mit Adanos und Beliar in Verbindung steht.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(grimmig) Wir k�nnen wohl davon ausgehen, da� er damit nichts Gutes im Schilde f�hrt...
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Raven ist nur ein ehemaliger Erzbaron, kein Magier. Wie soll ER so eine Beschw�rung durchf�hren?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Vielleicht ist er es nicht selbst. Sondern ein abtr�nniger Magier, der in seinem Auftrag handelt.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //So oder so, wir M�SSEN das �bel abwenden.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Habt ihr schon eine Spur der vermissten Leute ausgemacht?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Erst gestern haben wir die Leiche eines Fischers gefunden. Sie liegt unten in einer der Ruinen im Osten.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Sieht ganz so aus, als ob es ein Fischer aus Khorinis gewesen ist. Das solltest du dir ansehen.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Wie geht's jetzt weiter?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //WIR werden hier bleiben und weiter die alte Kultur studieren.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Die alten Schriften der Erbauer bergen noch eine Menge Geheimnisse, die wir l�ften m�ssen - wenn wir verstehen wollen, was damals hier geschehen ist.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //DU musst in der Zwischenzeit einiges f�r uns erledigen ...
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Was soll ich tun?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //Was soll ich tun?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Du musst Raven finden und ihn daran hindern, den Tempel Adanos' zu entweihen.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Du meinst, ich soll ihn T�TEN.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Wenn das der einzige Weg ist, ihn aufzuhalten, in Adanos' Namen � JA!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Sammle auf deinem Weg auch alle alten Reliquien und Niederschriften der Erbauer, die du finden kannst und bringe sie zu uns.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Wir m�ssen noch mehr wissen �ber dieses Volk und seinen Untergang.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Nur wenn wir Ravens Pl�ne durchschauen, k�nnen wir sie auch durchkreuzen.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Desweiteren musst du einen Weg finden, die Sklaven zu befreien.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(zynisch) Ist das alles? Das mach' ich doch mit links.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(ver�rgert) Ich wei�, dass es viel verlangt ist. Sieh es als eine Chance, mein Vertrauen zur�ckzugewinnen.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven entweiht den heiligen Tempel Adanos'. Ich soll ihn aufhalten. Auch wenn es bedeutet, dass ich ihn t�ten muss."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas will, dass ich die Sklaven befreie."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas will, dass ich ihm alles bringe, dass Aufschluss �ber das alte Volk der Erbauer bringen kann."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Ich werd' mich dann mal auf den Weg machen.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //Ich werd' mich dann mal auf den Weg machen.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Eine Sache noch � Raven hat eine Menge Banditen um sich geschart.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //In deiner Abwesenheit haben wir ein anderes Mitglied vom 'Ring des Wassers' hierher geholt.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Wir haben ihn in den Sumpf geschickt. Er kam nicht zur�ck.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Wir vermuten, die Banditen greifen alles an, was nicht aussieht wie sie selbst.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Besorg dir also eine R�stung der Banditen.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //Nur so wirst du dich ihnen n�hern k�nnen, ohne dass sie dich gleich angreifen.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Die Banditen schie�en auf alles, was nicht wie sie selbst aussieht. Ich brauche eine Banditenr�stung, wenn ich mich den Banditen n�hern will."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info PoorRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PoorRanger		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_PoorRanger_Condition;
	information	 = 	DIA_Addon_Saturas_PoorRanger_Info;

	description	 = 	"Welches arme Schwein habt ihr in den Sumpf geschickt?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //Welches arme Schwein habt ihr in den Sumpf geschickt?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Sein Name war Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Ich f�rchte, er ist nicht sehr weit gekommen.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas schickte jemand namens Lance in den Sumpf der Banditen. Saturas f�rchtet, dass Lance nicht sehr weit gekommen ist."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Piraten
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Piraten		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Piraten_Condition;
	information	 = 	DIA_Addon_Saturas_Piraten_Info;

	description	 = 	"Wo werde ich eine Banditenr�stung finden, die mir passt?";
};

func int DIA_Addon_Saturas_Piraten_Condition ()
{
	if (AlligatorJack.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Greg.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Piraten_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //Wo werde ich eine Banditenr�stung finden, die mir passt?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Im Westen scheint es ein Lager der Piraten zu geben.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Soviel wir wissen, stehen sie in Kontakt mit den Banditen.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Ich denke nicht, dass sie dich angreifen werden, wenn du zu ihnen gehst.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Vielleicht kannst du bei ihnen Hilfe finden ...

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas meint, die Piraten k�nnten mir bei der Suche nach der R�stung helfen."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LanceLeiche
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceLeiche		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_LanceLeiche_Condition;
	information	 = 	DIA_Addon_Saturas_LanceLeiche_Info;

	description	 = 	"Ich habe Lances Leiche gefunden.";
};

func int DIA_Addon_Saturas_LanceLeiche_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_PoorRanger))
	&& (Npc_HasItems (NONE_Addon_114_Lance_ADW, ItRi_LanceRing) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceLeiche_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Ich habe Lances Leiche gefunden.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //M�ge seine Seele in Adanos' Reich eingehen.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Pass auf dich auf, mein Sohn. Noch so einen Verlust dieser Art will ich nicht beklagen m�ssen.
	
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP (XP_Addon_LanceLeiche);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceRing		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_LanceRing_Condition;
	information	 = 	DIA_Addon_Saturas_LanceRing_Info;

	description	 = 	"Ich habe hier Lances Aquamarinring.";
};

func int DIA_Addon_Saturas_LanceRing_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_LanceLeiche))
	&& (Npc_HasItems (other,ItRi_LanceRing))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Ich habe hier Lances Aquamarinring.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Am besten du gibst ihn mir, damit er nicht in falsche H�nde ger�t.
	B_GiveInvItems (other, self, ItRi_LanceRing, 1);		
	B_GivePlayerXP (XP_Addon_LanceRing);
};
///////////////////////////////////////////////////////////////////////
//	Info Tokens
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Tokens		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_Tokens_Condition;
	information	 = 	DIA_Addon_Saturas_Tokens_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wegen der Reliquien...";
};

func int DIA_Addon_Saturas_Tokens_Condition ()
{
	if (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};

var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //Wegen der Reliquien ...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Ich denke, ich habe hier etwas f�r dich.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Diese Art von Steintafeln kennen wir bereits. Die bringen uns jetzt nicht weiter.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Es muss noch mehr geben als das.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	
	
	var int BroughtToken;BroughtToken = 0;
	var int XP_BroughtTokens;XP_BroughtTokens = 0;
	
	if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
	{	
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //Was ist HIERMIT?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //Das sieht gut aus. Wo hast du das gefunden?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Saturas hat von mir folgende Reliquien erhalten:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Die Banditen benutzen diese Steintafeln als eine Art Zahlungsmittel.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Die Tafeln tragen das Zeichen Quahodrons, eines gro�en Kriegers.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Er ist der Feldherr, dessen Sohn Rhademes die ganze Stadt in den Untergang getrieben hat.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(ver�chtlich) Ts. Ich wette, die Banditen wissen nicht einmal, mit was sie da handeln.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Eine rote Steintafel, die die Banditen als Zahlungsmittel benutzen. Sie tr�gt das Zeichen des grossen Kriegers Quarhodron."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //Diese Tafel fand ich in einem Geb�ude im S�den.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Ah! Eine Tafel der Totenw�chter. Sie waren es, die die Geister ihrer Verstorbenen beschworen.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Die Verbindung zu ihren Ahnen war bei den Erbauern sehr stark.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Eine violette Steintafel aus dem Herrenhaus der Totenw�chter im S�den."); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Ich fand diese Tafel in einem Bauwerk im S�dwesten.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Der Tafel nach zu urteilen, handelt es sich dabei um die Behausung der Priester dieser Stadt.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Der Name des obersten Priesters war KHARDIMON. Wir wissen noch nicht viel �ber ihn.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Eine blaue Steintafel aus der Behausung der Priester im S�dwesten."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Dieses Ding hier lag in einem Geb�ude nahe des gro�en Sumpfes.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Das wird das Haus der Heiler gewesen sein.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Wir wissen sehr wenig �ber sie. Sie scheinen die ersten gewesen zu sein, die verschwanden.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Eine gr�ne Steintafel aus dem Haus der Heiler im s�dlichen Teil des Sumpfes."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Das Teil hier lag in einem gro�en Geb�ude in einer gro�en Schlucht.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //Das war die Bibliothek des alten Volkes.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Scheinbar eine Tafel der Gelehrten.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Viele der Schriften, die wir gefunden haben, stammen vom Anf�hrer der 'Kaste der Gelehrten'.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Merkw�rdigerweise hat er seinen eigenen Namen nirgendwo hinterlassen ...
				Log_AddEntry (TOPIC_Addon_Relicts,"- Eine gelbe Steintafel aus der Bibliothek der Gelehrten im Norden."); 
		};		 
			
			if (SC_Knows_WeaponInAdanosTempel == TRUE)
			{
			};
	
			XP_BroughtTokens = (XP_Addon_ForOneToken * BroughtToken);
	
			B_GivePlayerXP (XP_BroughtTokens);
			Saturas_BroughtTokenAmount = (Saturas_BroughtTokenAmount + BroughtToken);

		if (Saturas_BroughtTokenAmount < 5)
		{
			if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Sehr gut. Das Bild dieser Stadt wird schon klarer, aber wir wissen noch nicht genug.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //Es m�ssen insgesamt f�nf dieser Art Steintafeln hier in der Gegend versteckt sein.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Finde sie und bring sie zu mir.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //Hier hast du etwas Gold zu deiner Entlohnung.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Jetzt haben wir alle Reliquien zusammen, die wir brauchen.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Du hast uns einen sehr gro�en Dienst erwiesen. Ich danke dir.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //Das wird uns in unseren Studien einen entscheidenden Schritt nach vorn bringen.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Ich werde sehen, ob ich was finde.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Gut. Beeil dich aber damit. Die Zeit ist nicht unser Verb�ndeter.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlateHint
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_StonePlateHint		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_StonePlateHint_Condition;
	information	 = 	DIA_Addon_Saturas_StonePlateHint_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Saturas_StonePlateHint_Condition ()
{
	if ((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE))
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_StonePlateHint_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Gut, dass du kommst. Wir haben neue Erkenntnisse, die wir dir mitteilen m�ssen.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Dann lass mal h�ren.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //Die versunkene Stadt trug einst den Namen Jharkendar. Es gab 5 Herrscher in dieser Stadt, die sich die Macht �ber ihr Volk teilten.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Jeder dieser Herrscher hatte ein Herrenhaus, in dem er lebte und wo er seine Habe aufbewahrte.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Auf deiner Suche nach den Reliquien der alten Kultur scheint es daher unerl�sslich, dass du diese Herrenh�user durchsuchst.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Was ist, wenn es diese Herrenh�user gar nicht mehr gibt?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Wo soll ich nach diesen Herrenh�usern suchen?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Wo soll ich nach diesen Herrenh�usern suchen?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Riordian hat sich mit der Struktur der Geb�ude von Jharkendar besch�ftigt.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Er wird dir sagen, wo du nach den Herrenh�usern suchen sollst.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas will, dass ich die Herrenh�user der Erbauer nach etwas brauchbaren durchsuche. Riordian soll mir sagen, wo ich diese H�user finden kann."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //Was ist, wenn es diese Herrenh�user gar nicht mehr gibt?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Wenn du die H�user nicht finden kannst, dann sind sie vermutlich mit der Stadt untergegagen.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Doch sollte es sie noch geben, w�re das von unsch�tzbarem Wert f�r unsere Studien.
};

///////////////////////////////////////////////////////////////////////
//	Info SCBroughtAllToken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_SCBroughtAllToken		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Info;

	description	 = 	"Wof�r braucht ihr diese f�nf Steintafeln?";
};

func int DIA_Addon_Saturas_SCBroughtAllToken_Condition ()
{
	if (ScBroughtToken == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Wof�r braucht ihr diese f�nf Steintafeln?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Die Aufzeichnungen, die wir hier in dieser Ruine finden k�nnen, sind unvollst�ndig.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Aber die Niederschriften der Erbauer sprechen von f�nf Herrschern, die diese Stadt regierten.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Jeder dieser Herrscher hatte eine dieser Tafeln als ein Symbol seiner Herrschaft.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Ich denke, diese Tafeln sind der Schl�ssel zu unseren Fragen.
};

///////////////////////////////////////////////////////////////////////
//	Info Flut
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Flut		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Flut_Condition;
	information	 = 	DIA_Addon_Saturas_Flut_Info;

	description	 = 	"Nefarius erz�hlte mir von einer Flut...";
};

func int DIA_Addon_Saturas_Flut_Condition ()
{
	if (NefariusADW_Talk2Saturas == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Flut_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius erz�hlte mir von einer Flut ...
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Es steht geschrieben, dass Adanos selbst vom Himmel herabstieg, um die Ungl�ubigen zu strafen und sie ins Reich der Toten zu verbannen.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //Entfacht von seinem heiligen Zorn lie� er das Meer auf die Erbauer dieser Stadt herabfallen und fegte sie hinfort.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //Der Sumpf im Osten ist noch ein Zeuge dieser Ereignisse der Vergangenheit.

	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AdanosZorn
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_AdanosZorn		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_AdanosZorn_Condition;
	information	 = 	DIA_Addon_Saturas_AdanosZorn_Info;

	description	 = 	"Was kann Adanos so zornig gemacht haben?";
};
func int DIA_Addon_Saturas_AdanosZorn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Flut))
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_AdanosZorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Was kann Adanos so zornig gemacht haben?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Der Tempel dieser Stadt war einst ein gro�es strahlendes Bauwerk.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Alle verehrten ihn und beteten zu unserem Gott Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Rhademes, der Sohn des Feldherren Quahodron, entweihte den Tempel.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Einer nach dem anderen verfiel daraufhin dem B�sen.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Ich vermute, das konnte Adanos ihnen nicht verzeihen und seine Rache kam �ber das Land.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Um so wichtiger ist es, dass wir Raven aufhalten. Er ist im Begriff, genau das Gleiche zu tun ...
};

///////////////////////////////////////////////////////////////////////
//	Info RavenInfos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavenInfos		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	9;
	condition	 = 	DIA_Addon_Saturas_RavenInfos_Condition;
	information	 = 	DIA_Addon_Saturas_RavenInfos_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wegen Raven...";
};
var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;

var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_RUNNING)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavenInfos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //Wegen Raven ...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Ich war im Banditenlager im Osten. Raven ist ihr Anf�hrer.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Aber um an Raven heranzukommen, muss ich erst noch einige der Banditen aus dem Weg r�umen.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Gut. Dann viel Gl�ck. Aber vergiss nicht, dass es schnell gehen muss.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Raven darf sein Ziel unter gar keinen Umst�nden erreichen.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Er hat eine Goldmine und l�sst die Gefangenen darin nach Gold sch�rfen.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //Das sieht ihm �hnlich. Du musst die Gefangenen da raus holen.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(seufzt) Ja doch. Ich arbeite dran.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Da gibt es so einen Kerl bei den Banditen, der behauptet, dass er Ravens Pl�ne kennt.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Sein Name ist Fortuno. Er meint, Raven will in den Tempel, um sich dort ein m�chtiges Artefakt zu holen.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //Und? Wu�te er mehr �ber dieses Artefakt?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Er konnte mir nur erz�hlen, dass Raven dazu das Grab eines Adanos Priesters ausheben lie�.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Dieses Grab enth�lt vielleicht den Schl�ssel zum Tempel. Du solltest dich dort vielleicht einmal umsehen.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Raven hat die Gefangenen dazu gezwungen, das Grab dieses Priesters auszuheben.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //Das ist nicht gut. Du musst dich beeilen und Raven unsch�dlich machen.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //Ich bin bis zu Ravens Gem�chern vorgedrungen.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //Und? Was ist mit Raven?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Ich kam zu sp�t. Er ist vor meinen Augen im Adanostempel verschwunden.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(aufgeregt) Was?! Das ist eine KATASTROPHE! Warum bist du ihm nicht gefolgt?!

		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (RavenNeuigkeit != 0)
	{
		var int XP_RavenNeuigkeit;
		XP_RavenNeuigkeit = (RavenNeuigkeit * XP_Ambient);
		B_GivePlayerXP (XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Hast du etwas Neues zu berichten?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Bisher noch nicht.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Ich rate dir nur, diesen Raven nicht zu untersch�tzen, h�rst du?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TuerZu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TuerZu		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TuerZu_Condition;
	information	 = 	DIA_Addon_Saturas_TuerZu_Info;

	description	 = 	"Ich konnte Raven nicht folgen!";
};

func int DIA_Addon_Saturas_TuerZu_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TuerZu_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Ich konnte Raven nicht folgen. Er hat das Eingangstor von innen versperrt.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //(gehetzt) Ich muss nachdenken ...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //Die Frage ist, wie ist Raven in den Tempel gelangt ...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Was hat er getan, bevor er das Portal durchschritten hat?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Er hat eine Beschw�rung auf das Tor ausgesprochen.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //Und davor?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Er hat eine Grabkammer ge�ffnet.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //Ich hatte dir schon davon erz�hlt ...
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Richtig!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //Ich wei� nur, dass er dort eine Art Ritual abgehalten haben muss ...
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //(nachdenklich) Ein Ritual ...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //(erkennt) Ja! Das ist es!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Ich bef�rchte, Raven hat sich die Macht der Totenw�chter zueigen gemacht.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //Er hat seine Kenntnis �ber den Tempel von einem Geist erlangt!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Du musst zu Myxir gehen, und ihm davon berichten!
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Raven hat sich die Macht der Totenw�chter zu eigen gemacht. Er hat seine Kenntnis �ber den Tempel Adanos' von einem Geist erlangt. Ich soll zu Myxir gehen und ihm davon berichten.");  
	
	Saturas_RiesenPlan = TRUE;	
};

///////////////////////////////////////////////////////////////////////
//	Info GhostQuestions
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_GhostQuestions		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_GhostQuestions_Condition;
	information	 = 	DIA_Addon_Saturas_GhostQuestions_Info;

	description	 = 	"Ich habe mit Quarhodron gesprochen.";
};
func int DIA_Addon_Saturas_GhostQuestions_Condition ()
{
	if ((Npc_IsDead(Quarhodron)) == FALSE)
	&& (SC_TalkedToGhost == TRUE) 
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_GhostQuestions_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Ich habe mit Quarhodron gesprochen.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //Und? Was hat er gesagt?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //Er wird mir erst helfen, wenn ich ihm einige Fragen beantworte.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //Was ist das Problem?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Ich bin mir nicht sicher, was ich ihm antworten soll.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Mmh � Wir wissen, dass die Gelehrten dieser Stadt im Norden eine Bibliothek erbaut haben.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Sie waren sehr gr�ndlich bei ihren Bem�hungen, die Geschehnisse der Vergangenheit festzuhalten.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Vielleicht findest du dort die Antworten, die Quarhodron von dir verlangt.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas vermutet, dass ich die Antworten auf Quarhodrons Fragen in der Bibliothek der Gelehrten finde. Die Bibliothek liegt weit im Norden."); 

};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Saturas_TalkedToGhost_Info;

	description	 = 	"Das Problem mit dem Tor am Tempeleingang ist gel�st.";
};

func int DIA_Addon_Saturas_TalkedToGhost_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Das Problem mit dem Tor am Tempeleingang ist gel�st.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //Hat der Geist geredet?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Ja, das hat er.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Du wei�t also, wie du in den Tempel gelangst?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Richtig. Und er hat mir auch verraten, was sich im Tempel befindet.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Er sprach von einem m�chtigen Schwert und den Kammern Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(verzweifelt) Bei Adanos. Was sind wir doch f�r Narren. Wie konnten wir nur so arglos sein?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //(ersch�ttert) Die Hinweise in den Aufzeichnungen ...
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //(aufgeregt) Es kann sich bei diesem Schwert nur um 'Die Klaue Beliars' handeln.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Wir m�ssen so schnell wie m�glich die Kammern �berwinden und die Waffe in unseren Besitz bringen.
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Was ist 'Die Klaue Beliars'?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Was sind die Kammern Adanos?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Was ist 'Die Klaue Beliars'?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //Sie ist die Inkarnation des B�sen. Beliar SELBST hat sie erschaffen.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Jeder, der sie tr�gt, verf�gt �ber ein schreckliches Werkzeug der Zerst�rung.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Je m�chtiger sein Tr�ger ist, desto gewaltiger ist die Macht der 'Klaue'.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Nur jemand, der stark im Geiste und standhaft in seinem Glauben ist, kann ihrem Bann widerstehen.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //Jetzt ist mir klar, warum die Erbauer dieses Tal abgeriegelt haben.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Sie hatten diese Waffe des �bels in ihre Stadt gebracht und verfielen ihrem Bann.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Diese �berheblichen Trottel haben sich aus Habgier gegenseitig umgebracht.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Die Grausamkeiten kannten kein Ende, bis Adanos' Zorn �ber dieses Land fegte und alles im Meer versinken lie�.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //Wahrlich. Die Sch�pfer des Portals taten gut daran, diese Dinge vor dem Rest der Welt zu verbergen.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Welch ein tragisches Ende f�r so eine wunderbare Kultur.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //Erkennst du jetzt die Dringlichkeit unserer Mission?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Raven ist ein starker K�mpfer und verblendet von seiner Gier nach Macht.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //In seiner Hand wird die 'Klaue' zu einem Instrument der Vernichtung.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Er darf die Waffe nicht bekommen, sonst sind wir alle verloren.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Im Tempel Adanos befindet sich eine m�chtige Waffe. Sie wird 'Die Klaue Beliars' genannt. Raven darf diese Waffe nicht in die Finger bekommen."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //Was sind die Kammern Adanos'?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Wir wissen jetzt, dass das Eingangtor nicht die einzige H�rde ist, um ins Innere des Tempels zu gelangen.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //Im Tempel selbst gibt es drei Kammern, die alle Eindringlinge aufhalten sollen.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Die farbigen Reliquien der Erbauer sind der Schl�ssel dazu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Nur wenn wir alle Reliquien beisammen haben und die R�tsel auf ihnen l�sen, kommen wir ins Allerheiligste des Tempels.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Ich wei� nicht, ob Raven die R�tsel des Tempels entschl�sseln konnte, aber falls dies der Fall ist, haben wir ein gro�es Problem ...
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,LogText_Addon_Relicts); 
	
	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,LogText_Addon_Relicts); 

	Saturas_KnowsHow2GetInTempel = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RelictsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RelictsBack		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_RelictsBack_Condition;
	information	 = 	DIA_Addon_Saturas_RelictsBack_Info;

	description	 = 	"Was genau soll ich mit den Reliquien im Tempel machen?";
};

func int DIA_Addon_Saturas_RelictsBack_Condition ()
{
	if (Saturas_SCBroughtAllToken == TRUE)
	&& (Saturas_KnowsHow2GetInTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_RelictsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Was genau soll ich mit den Reliquien im Tempel machen?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Wir wissen zu wenig. Doch du wirst ihre Bedeutung hoffentlich erkennen, sobald du im Tempel bist.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Tut mir Leid, dass ich dir nicht mehr dazu sagen kann. Jetzt liegt alles bei dir.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Nimm die Reliquien an dich und begib dich umgehend in den Tempel.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas schickt mich mit den f�nf Reliqien der Erbauer in den Tempel Adanos' um die Kammern zu �berwinden und Raven aufzuhalten."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Adanos m�ge dir gn�dig sein und uns alle besch�tzen.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Vielleicht ist es ja noch nicht zu sp�t.
};

///////////////////////////////////////////////////////////////////////
//	Info RavensDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavensDead		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_RavensDead_Condition;
	information	 = 	DIA_Addon_Saturas_RavensDead_Info;

	important	 = 	TRUE;
};
func int DIA_Addon_Saturas_RavensDead_Condition ()
{
	if (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavensDead_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Die Erdbeben haben aufgeh�rt und wie ich sehe, weilst du immer noch unter den Lebenden.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Hei�t das, dass deine Mission erfolgreich war?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Ja. Raven ist tot.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //Dann ist es also vorbei. Adanos sei Dank.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Das hast du gut gemacht, mein Sohn. Wir stehen tief in deiner Schuld.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Du hast dem B�sen eine m�chtige Waffe entrissen und das Gleichgewicht in diesem Teil der Welt wieder hergestellt.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Als die Erdbeben verstummten, haben wir beraten, was nun geschehen soll und wir sind zu einem Ergebnis gekommen.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Geh hin und nimm die 'Klaue Beliars'. Sie soll nun dir bestimmt sein.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //In deiner Hand kann sie ein m�chtiger Verb�ndeter f�r uns sein.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //Nutze sie weise, mein Sohn. Adanos m�ge dir dabei helfen.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //Wir werden hierbleiben und daf�r sorgen, dass der Tempel wieder zu altem Glanz erbl�ht.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Nur Myxir ist schon nach Khorinis aufgebrochen, um Vatras zu unterst�tzen.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras ist schon zu lange alleine in der Stadt gewesen.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir wurde los geschickt um Vatras in der Hafenstadt zu unterst�tzen."); 

	B_GivePlayerXP (XP_Addon_Saturas_RavensDead);
};

///////////////////////////////////////////////////////////////////////
//	Info FreedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_FreedMissingPeople		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information	 = 	DIA_Addon_Saturas_FreedMissingPeople_Info;

	description	 = 	"Ich habe die Gefangenen befreit.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Ich habe die Gefangenen befreit.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Sehr gut. M�gen sie wohlbehalten in ihrer Heimat ankommen.
	B_GivePlayerXP (XP_Addon_Saturas_FreedMissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarsWeapon
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarsWeapon		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarsWeapon_Info;

	description	 = 	"Ich habe die 'Klaue Beliars' an mich genommen.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info ()
{
	AI_UnequipWeapons (hero);
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //Ich habe die 'Klaue Beliars' an mich genommen.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Doch ich kann sie nicht anlegen.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //Die Klaue Beliars ist eine ganz BESONDERE Waffe.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Sie hat einen eigenen Willen und Bewusstsein.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //Du, der nun diese m�chtige Waffe besitzt, bist ihr Herr und Meister.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Sie ist ein Teil von dir und wird sich deinen F�higkeiten anpassen.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Doch tut sie das nicht aus freien St�cken.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //Nur Beliar SELBST kann sie dazu zwingen, dir zu gehorchen.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Und warum sollte Beliar mir helfen?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Was kann ich mit der Waffe tun?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //Was kann ich mit der Waffe tun?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //Das liegt in deiner Hand. Du hast die Waffe erobert und bist nun ihr Herr.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Ich kann dir nur empfehlen, was du damit machen kannst.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Entweder du �bergibst sie MIR, und ich werde daf�r sorgen, dass sie keinen Schaden mehr anrichtet ...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //� oder du machst dir ihre Macht zu Nutzen und verwendest sie im Kampf.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "K�nntest du die Waffe nicht verwahren?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //K�nntest du die Waffe nicht verwahren?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des B�sen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschlie�t, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Wenn du sie mir gibst, dann werde ich sie unsch�dlich machen, damit niemand mehr sie missbrauchen kann.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //�berleg dir also gut, was du tun wirst.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Ich kann die Klaue Beliars bei Saturas abgeben oder sie f�r mich behalten."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //Und warum sollte Beliar mir helfen?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Nur ein Gebet zu ihm kann das bewirken.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Aber sei vorsichtig. Beliar ist niedertr�chtig.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Wenn du seinen Zorn erregst, dann wird er dich das sp�ren lassen.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Um die Klaue meinem Willen zu unterwerfen muss ich zu Beliar beten.");

	B_Say 	  	(other,self,"$VERSTEHE");
};

///////////////////////////////////////////////////////////////////////
//	Info PermENDE_ADDON
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PermENDE_ADDON		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Was werdet ihr nun tun?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_RavensDead))
		{
			return TRUE;
		};
};
var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;
func void DIA_Addon_Saturas_PermENDE_ADDON_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //Was werdet ihr nun tun?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Wir bleiben hier und verhelfen dem Tempel wieder zu Glanz und Gr��e.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //All zu lange schon verweilen seine Mauern in diesem beklagenswerten Zustand.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //Was dich angeht, mein Sohn ...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Es freut mich zu sehen, dass ich mich in dir get�uscht habe. Du bist der Bewahrer des Gleichgewichts. Daran gibt es keinen Zweifel mehr.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Ohne deinen Mut und deine Kraft w�re die Insel von Khorinis untergegangen. Wir danken dir und werden deiner in Ehren gedenken.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Widme dich jetzt wieder den anderen Aufgaben, die noch vor dir liegen, und gib dieser Welt wieder Gleichgewicht und Frieden.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Geh nun und erf�lle dein Schicksal, Bewahrer. Unsere Gebete begleiten dich.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarWeapGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarWeapGeben		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Info;

	description	 = 	"Nimm die 'Klaue Beliars' und vernichte sie.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_BeliarsWeapon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //Nimm die Klaue Beliars und vernichte sie.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Wie du willst, mein Sohn. Gib sie mir.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Auf dass sie nun keinen Schaden mehr anrichte werde ich sie in den Tiefen des Meeres versenken.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //Adanos' Weisheit wird �ber sie wachen.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP (XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachCircle
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_PreTeachCircle		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Info;

	description	 = 	"Kannst du mir die Kreise der Magie beibringen?";
};

func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Kannst du mir die Kreise der Magie beibringen?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Du bist ein Magier des Feuers. Was wird denn wohl Pyrokar dazu sagen?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //Das muss ja niemand wissen.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(seufzt) Ich sehe, dass es dir Ernst damit ist, also werde ich deiner Bitte entsprechen.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Sollte ich jedoch den Eindruck bekommen, dass ich unser Wissen in die falschen H�nde lege, wirst du nicht mehr mit meiner Hilfe rechnen k�nnen.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //Du entt�uschst mich also besser nicht.
	};
	Saturas_Addon_TeachCircle = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_SaturasTeach); 
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCIRCLE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_CIRCLE		(C_INFO)
{
	npc			 = 	KDW_14000_Addon_Saturas_ADW;
	nr			 = 	99;
	condition	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will einen h�heren Kreis der Magie lernen.";
};
var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;
func int DIA_Addon_Saturas_ADW_CIRCLE_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) < 6)
	&& (Saturas_Addon_TeachCircle == TRUE)
	&& (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_ADW_CIRCLE_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Ich will einen h�heren Kreis der Magie lernen.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Ja, du bist bereit, dein Wissen zu mehren.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Tritt nun in den zweiten Kreis der Magie. Adanos gebe dir die Kraft, deine hiermit verliehene Macht weise einzusetzen.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Ja, die Zeit ist reif. Tritt nun in den dritten Kreis der Magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Dein Wissen wird dir erlauben, neue m�chtige Zauber zu wirken. Setze sie mit Bedacht ein.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //Es ist soweit. Du bist bereit, in den vierten Kreis der Magie zu treten.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //M�chtig ist nun dein Wort und deine Tat. W�hle deine neuen Zauber immer mit Sorgfalt und Vernunft.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Dir soll nun das Privileg zuteil werden, in den f�nften Kreis der Magie zu treten.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Die Zauber, die du nun erlernen wirst, k�nnen wahrlich vernichtend sein.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //Sei dir also deiner Macht bewusst und erliege nicht dem Gr��enwahn.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //Das ist nun nicht mehr meine Aufgabe.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //Um den sechsten und letzten Kreis der Magie zu lernen, solltest du doch besser ins Kloster gehen, Magier des Feuers.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Es ist noch zu fr�h f�r dich. Komm sp�ter wieder.
	};
};

















