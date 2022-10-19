// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Dexter_EXIT   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 999;
	condition   = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_Dexter_Hallo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 1;
	condition   = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Dexter_Hallo_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Hallo_Info()
{
	AI_Output (self, other, "DIA_Dexter_Hallo_09_00");//Sieh an, wer da ist. Der gro�e Befreier. Na du Held - was suchst du hier?
	AI_Output (other, self, "DIA_Dexter_Hallo_15_01");//Ich suche ein paar Antworten.
	
	if (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		//ADDON>
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_00");//Ich hatte nicht damit gerechnet, dass du freiwillig hierher kommst.
		AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_01");//Was soll das hei�en?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_02");//Das soll hei�en, dass ich dich hab suchen lassen. Noch keinen von meinen Steckbriefen gesehen?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_03");//DEINE Visage ist da drauf. Ja ... du bist ein begehrter Mann. Hast du das nicht gewusst?
		//ADDON<
	}
	else // (Bdt13_Dexter_verraten == TRUE) //Gothic2
	{
		AI_Output (other, self, "DIA_Dexter_Hallo_15_02");//Irgendjemand verteilt Zettel mit meinem Gesicht drauf. Irgendjemand meint, dass du das w�rst.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_03");//Irgendjemand redet zuviel.
		
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_04");//Aber du hast Recht. Ich habe die Steckbriefe verteilt. Und siehe da, du bist hier.
		
		/*//ADDON>
		AI_Output (self, other, "DIA_Dexter_Hallo_09_04");//Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_05");//Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_06");//Ich dachte schon, das w�re mein Ende, aber dann tauchte pl�tzlich aus der Dunkelheit diese ... Gestalt auf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_07");//Er trug eine schwarze Robe mit Kapuze und eine Maske �berm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_08");//Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldst�cke f�r deinen Kopf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_09");//Hey, was sollte ich machen? Wenn ich abgelehnt h�tte, dann h�tte er mich get�tet!
		*///ADDON<
		//ADDON B_LogEntry (Topic_Bandits,"Dexter hat die Steckbriefe verteilt. Typen mit schwarzen Kapuzen haben ihn damit beauftragt.");
		
		
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
	};
	AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_05");//Was willst du denn von mir?
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_06");//Ich? Gar nichts. Aber mein Boss, der ist ganz hei� drauf, dich zu t�ten.
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_07");//Deswegen soll ich dich finden und deinen Kopf zu ihm bringen.
};

// ************************************************************
// 			Glaube 
// ************************************************************
INSTANCE DIA_Dexter_Glaube   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent   = FALSE;
	description = "Ich glaube dir kein Wort.";
};
FUNC INT DIA_Dexter_Glaube_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Glaube_Info()
{
	AI_Output (other, self, "DIA_Dexter_Glaube_15_00");//Ich glaube dir kein Wort.
	AI_Output (self, other, "DIA_Dexter_Glaube_09_01");//Hey, es ist wahr. Ich schw�re beim Grab meiner Mutter!
};

///////////////////////////////////////////////////////////////////////
//	Info Patrick
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Patrick		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_Patrick_Condition;
	information	 = 	DIA_Addon_Dexter_Patrick_Info;

	description	 = 	"Ein S�ldner namens Patrick soll hier gewesen sein.";
};

func int DIA_Addon_Dexter_Patrick_Condition ()
{
	if (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Patrick_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Patrick_15_00"); //Ein S�ldner namens Patrick soll hier gewesen sein.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_01"); //Patrick, he? Keine Ahnung, was du meinst.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_02"); //Ich kann mich an ein Gro�maul von S�ldner erinnern, der gelegentlich bei den Jungs drau�en 'rumhing.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_03"); //(l�gt auff�llig) Den hab ich aber schon lange nicht mehr gesehen.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_04"); //(scheinheilig) Vielleicht haben die Jungs ihn am Ende noch aufgekn�pft. Ich habe keine Ahnung.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Dexter behauptet den S�ldner Patrick nicht zu kennen."); 

	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP (XP_Addon_Dexter_KnowsPatrick);
};
///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Greg		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Dexter_Greg_Condition;
	information	 = 	DIA_Addon_Dexter_Greg_Info;

	description	 = 	"Da ist so'n Kerl mit Augenklappe. Der sucht DICH!";
};

func int DIA_Addon_Dexter_Greg_Condition ()
{
	if (SC_KnowsGregsSearchsDexter == TRUE)
	&& (Knows_Dexter == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Dexter_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Greg_15_00"); //Da gibt's so'n Kerl mit Augenklappe. Der sucht DICH!
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_01"); //Alle suchen mich. Das schert mich einen Dreck.
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_02"); //Wenn der Kerl was von mir will, soll er her kommen.
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info missingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_missingPeople		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_missingPeople_Condition;
	information	 = 	DIA_Addon_Dexter_missingPeople_Info;

	description	 = 	"Man erz�hlt sich, dass du Leute aus Khorinis verschleppst.";
};

func int DIA_Addon_Dexter_missingPeople_Condition ()
{
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Dexter_missingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_missingPeople_15_00"); //Man erz�hlt sich, dass du Leute aus Khorinis verschleppst.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_01"); //Dahinter bist du also auch schon gekommen. Saubere Arbeit kann ich da nur sagen.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_02"); //Ich dachte, ich h�tte meine Spuren besser verwischt.
	
	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Wer gab dir diesen Auftrag?", DIA_Addon_Dexter_missingPeople_wer );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Wo sind die Leute geblieben?", DIA_Addon_Dexter_missingPeople_Wo );
};
func void DIA_Addon_Dexter_missingPeople_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Wo_15_00"); //Wo sind die Leute geblieben? Hier irgendwo in den Minen?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_01"); //(lacht) Sie sind schon l�ngst �ber alle Berge im Nordosten und unerreichbar f�r dich.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_02"); //Ich k�nnte dir zeigen, wo genau, aber ich w�sste nicht, warum ich das tun sollte.
};
func void DIA_Addon_Dexter_missingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_wer_15_00"); //Wer gab dir diesen Auftrag?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_01"); //Mein Boss. Ein gef�hrlicher Mann. Du kennst ihn. Es ist Raven, einer der ehemaligen Erzbarone aus dem alten Lager im Minental.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_02"); //Er braucht die Leute f�r seine Pl�ne. Und das ist auch schon alles, was du wissen musst.

	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Raven gef�hrlich? Naja...", DIA_Addon_Dexter_missingPeople_Raven );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Ein Erzbaron hier in Khorinis?", DIA_Addon_Dexter_missingPeople_RavenTot );
		 
};
func void DIA_Addon_Dexter_missingPeople_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Raven_15_00"); //Raven gef�hrlich? Naja ...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_01"); //(ver�rgert) Was wei�t DU denn schon? Du kennst ihn nicht so, wie ich ihn kenne.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_02"); //(verunsichert) Er war damals schon ein mieses Schwein, aber heute ...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_03"); //Er hat sich ver�ndert, seit die Barriere gefallen ist. Ein schwarzer Schatten liegt auf seinem Gesicht.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_04"); //(eingesch�chtert) Sein scharfer Blick durchdringt dich wie die Krallen eines Greifvogels, wenn du ihm zu lange in die Augen schaust.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_05"); //Ich kann dir nur den einen Rat geben: Verlasse Khorinis, so schnell wie du nur kannst, bevor es zu sp�t ist.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_06"); //(finster) Hier gibt es nichts f�r dich. Nur den sicheren Tod.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Dexter hat einen Auftraggeber. Sein Name ist Raven. Raven ist ein ehemaliger Erzbaron. Letztendlich scheint dieser Raven hinter der ganzen Entf�hrungssache zu stecken. Ich brauche jetzt nur noch einen Beweis daf�r."); 

	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
};
func void DIA_Addon_Dexter_missingPeople_RavenTot ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_RavenTot_15_00"); //Ein Erzbaron hier in Khorinis?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_RavenTot_09_01"); //Er ist kein Erzbaron mehr. Er hat seine eigenen Pl�ne und das wird Khorinis auch schon bald zu sp�ren bekommen.
};

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Boss		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	3;
	condition	 = 	DIA_Addon_Dexter_Boss_Condition;
	information	 = 	DIA_Addon_Dexter_Boss_Info;

	description	 = 	"Dein Boss? Wer soll das sein?";
};

func int DIA_Addon_Dexter_Boss_Condition ()
{
	if (Knows_Dexter == TRUE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Boss_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Boss_15_00"); //Dein Boss? Wer soll das sein?
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_01"); //(lacht) Das m�chtest du gerne wissen, was? Ja, das kann ich mir vorstellen.
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_02"); //(ernst) Ich w�sste keinen Grund, warum ich dir das sagen sollte.
};

// ************************************************************
// 			Vor 
// ************************************************************
INSTANCE DIA_Dexter_Vor   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent   = FALSE;
	description = "Und was hast du jetzt vor?";
};
FUNC INT DIA_Dexter_Vor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Dexter_missingPeople))
		{
			return TRUE;
		};
};
FUNC VOID DIA_Dexter_Vor_Info()
{
	AI_Output (other, self, "DIA_Dexter_Vor_15_00");//Und was hast du jetzt vor? Willst du mich t�ten?
	AI_Output (self, other, "DIA_Dexter_Vor_09_01");//Ja. Aber du hast uns alle befreit. Deshalb gebe ich dir noch eine Chance. Hau ab - verschwinde, mach dich unsichtbar. Geh und lauf mir nie wieder �bern Weg.
	AI_Output (other, self, "DIA_Addon_Dexter_Vor_15_00");//Ich muss wissen, wohin du die Leute verschleppt hast.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_01");//(lacht) Tja. Kannst ja versuchen, es aus mir raus zu pr�geln.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_02");//(droht) Es ist besser f�r dich, wenn du jetzt gehst.
	AI_Output (self, other, "DIA_Dexter_Vor_09_02");//L�sst du dich hier noch mal blicken, werde nicht z�gern, dich zu t�ten.
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Kill
// ************************************************************
INSTANCE DIA_Dexter_Kill   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 2;
	condition   = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dexter_Kill_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Dexter_NoMoreSmallTalk == TRUE)
	|| (Knows_Dexter == FALSE)) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kill_Info()
{
	if (Knows_Dexter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Dexter_Add_09_02"); //(greift an) Du hast es nicht anders gewollt...
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Kill_09_01");//Oh Mann, du w�rst hier besser nicht aufgetaucht. Du bist der falsche Mann am falschen Ort.
	};
	
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter ();
	Info_ClearChoices	(DIA_Dexter_Kill);
	Info_AddChoice	(DIA_Dexter_Kill, DIALOG_ENDE, DIA_Dexter_Kill_ENDE );
};
func void DIA_Dexter_Kill_ENDE ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(Greg_NW);

	if (Hlp_IsItem(itm, ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor	(Greg_NW, ITAR_PIR_H_Addon);	
	};
};


// ************************************************************
// 			Mein Kopf? 
// ************************************************************
INSTANCE DIA_Dexter_Kopf (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent   = FALSE;
	description = "Du willst meinen Kopf? Komm und hol ihn dir!";
};
FUNC INT DIA_Dexter_Kopf_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kopf_Info()
{
	AI_Output (other, self, "DIA_Addon_Dexter_Add_15_00"); //Du willst meinen Kopf? Komm und hol ihn dir!
	AI_Output (self, other, "DIA_Addon_Dexter_Add_09_01"); //(greift an) Ganz wie du willst...

	DIA_Dexter_Kill_ENDE();
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dexter_PICKPOCKET (C_INFO)
{
	npc			= BDT_1060_Dexter;
	nr			= 900;
	condition	= DIA_Dexter_PICKPOCKET_Condition;
	information	= DIA_Dexter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Dexter_PICKPOCKET_Condition()
{
	C_Beklauen (96, 370);
};
 
FUNC VOID DIA_Dexter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dexter_PICKPOCKET);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_BACK 		,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};
	
func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};





/*
// ************************************************************
// 			Wo
// ************************************************************
INSTANCE DIA_Dexter_Wo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 3;
	condition   = DIA_Dexter_Wo_Condition;
	information = DIA_Dexter_Wo_Info;
	permanent   = FALSE;
	description = "Wo finde ich diesen Mann?";
};
FUNC INT DIA_Dexter_Wo_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Dexter_Glaube) == FALSE)
	&& (Knows_Dexter == TRUE)
	&& (Bdt13_Dexter_verraten == TRUE) 
	&& (Ranger_SCKnowsDexter == FALSE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Wo_Info()
{
	AI_Output (other, self, "DIA_Dexter_Wo_15_00");//Wo finde ich diesen Mann?
	
	if (Kapitel < 3)
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_01");//Ich glaube, der sitzt irgendwo im Minental.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_02");//Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle �berall unterwegs! Und die suchen dich.
	};
};
*/
