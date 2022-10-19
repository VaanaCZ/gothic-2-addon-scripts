///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_EXIT   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 999;
	condition   = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ignaz_PICKPOCKET (C_INFO)
{
	npc			= VLK_498_Ignaz;
	nr			= 900;
	condition	= DIA_Ignaz_PICKPOCKET_Condition;
	information	= DIA_Ignaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ignaz_PICKPOCKET_Condition()
{
	C_Beklauen (38, 50);
};
 
FUNC VOID DIA_Ignaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_BACK 		,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
	
func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Hallo   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ignaz_Hallo_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Hallo_Info()
{
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_00");//Ah - du kommst mir gerade recht. Ich suche noch einen Assistenten für ein magisches Experiment.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_01");//Du willst doch bestimmt der Wissenschaft einen Dienst erweisen.
	AI_Output (other, self, "DIA_Ignaz_Hallo_15_02");//Immer langsam. Sag mir erst mal, worum es geht.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_03");//Ich habe einen neuen Zauber entwickelt. Einen Zauber des Vergessens.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_04");//Ich konnte bereits einige praktische Anwendungen durchführen, aber mir fehlt die Zeit für einen abschließenden Test.
};
///////////////////////////////////////////////////////////////////////
//	Info Lerninhalte Traenke
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Traenke   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 3;
	condition   = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent   = FALSE;
	description = "Was habe ich davon, wenn ich dir helfe?";
};

FUNC INT DIA_Ignaz_Traenke_Condition()
{	
	if (MIS_Ignaz_Charm != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Traenke_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Traenke_15_00");//Was habe ich davon, wenn ich dir helfe?
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_01");//Ich kann dir das Brauen von Tränken beibringen.
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_02");//Ich kenne die Rezepte von Heilungs- und Mana-Essenzen und Geschwindigkeitstränken.
	//AI_Output (self, other, "DIA_Ignaz_Traenke_14_03");//Außerdem kann ich dir beibringen, wie du ein Elixier der Geschicklichkeit herstellst.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Experiment
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Experiment   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 4;
	condition   = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent   = FALSE;
	description = "Erzähl mir mehr über das Experiment und den Zauber. ";
};

FUNC INT DIA_Ignaz_Experiment_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Ignaz_Experiment_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_00");//Erzähl mir mehr über das Experiment und den Zauber.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_01");//Der Zauber dient dazu, dass der Betroffene verschiedene Ereignisse wieder vergisst.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_02");//Bisher konnte ich nur feststellen, dass er funktioniert, wenn der Betroffene verärgert ist - also, wenn er gerade bestohlen oder niedergeschlagen wurde.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_03");//Auch wenn er eine solche Tat nur gesehen hat, wird er sie wieder vergessen.
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_04");//Heißt das, ich soll irgendjemanden niederschlagen und dann verzaubern?
	AI_Output (other, self, "DIA_Ignaz_Add_15_00"); //Das macht dann wohl nur Sinn, wenn derjenige nach der Schlägerei WIRKLICH verärgert ist.
	AI_Output (other, self, "DIA_Ignaz_Add_15_01"); //(zu sich) Hier im Hafenviertel sind Schlägereien nichts Ungewöhnliches. Also müßte ich mir schon woanders ein Opfer suchen...
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_05");//Ja, ich denke, du hast verstanden, worum es geht. Aber um jemanden zu verärgern, reicht es, wenn du ihn angreifst, du musst ihn nicht niederschlagen.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_06");//Bevorzugt dafür sind Leute, die alleine sind - wenn noch weitere Personen anwesend sind, kriegst du nur Probleme mit Lord Andre.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_07");//Und es macht wenig Sinn, den Zauber auf jemanden zu sprechen, der dich gerade angreift. Warte auf den richtigen Augenblick.
};	
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_teilnehmen   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 5;
	condition   = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent   = FALSE;
	description = "Okay, ich teste den Zauber.";
};

FUNC INT DIA_Ignaz_teilnehmen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Ignaz_Experiment)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_teilnehmen_Info()
{
	AI_Output (other, self, "DIA_Ignaz_teilnehmen_15_00");//Okay, ich teste den Zauber.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_01");//Dann nimm diese Spruchrolle und such dir ein geeignetes Versuchsobjekt.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_02");//Wenn du die Sache erledigt hast, komm zurück und erzähle mir, wie es gelaufen ist.
	
	B_GiveInvItems (self, other, ITSC_Charm,1);
	MIS_Ignaz_Charm = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ignaz,LOG_RUNNING);
	B_LogEntry (TOPIC_Ignaz,"Ich soll für Ignaz einen neuen Zauber testen. Einen Zauber des Vergessens. Sobald jemand aufgrund eines Diebstahls oder einer Schlägerei oder aus einem anderen Grund verärgert ist, wird er nicht mehr mit mir sprechen wollen. ");
	B_LogEntry (TOPIC_Ignaz,"Das ist der richtige Moment, um den Zauber einzusetzen. Dann wird er auch vergessen das er die Tat gemeldet hat. Aber im Hafenviertel wird wohl kaum jemand verärgert sein, wenn ich ihn niederschlage... ");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Running   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent   = FALSE;
	description = "Wegen des Experiments ...";
};

FUNC INT DIA_Ignaz_Running_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_RUNNING)
	&& (Charm_Test == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Running_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Running_15_00");//Wegen des Experiments ...
	AI_Output (self, other, "DIA_Ignaz_Running_14_01");//Hast du schon einen Erfolg erzielen können? Oder hast du die Spruchrolle verschwendet? Hm?
	AI_Output (self, other, "DIA_Ignaz_Running_14_02");//Wenn du weitere Spruchrollen brauchst, dann kannst du sie von mir kaufen.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Danach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent   = FALSE;
	description = "Ich habe die Spruchrolle angewendet";
};
FUNC INT DIA_Ignaz_Danach_Condition()
{	
	if (Charm_Test == TRUE)
	&& (MIS_Ignaz_Charm == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Danach_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Danach_15_00");//Ich habe die Spruchrolle angewendet.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_01");//Gut gut. Und hattest du Erfolg?
	AI_Output (other, self, "DIA_Ignaz_Danach_15_02");//Ja, es hat funktioniert.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_03");//Ausgezeichnet. Ein kleiner Fortschritt für die Wissenschaft, aber ein großer für mich!
	AI_Output (self, other, "DIA_Ignaz_Danach_14_04");//Jetzt kann ich mich meine Zeit nutzen, um dich in den Künsten der Alchemie zu unterweisen.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_05");//Und, wenn du willst, kannst du auch einige nützliche Dinge von mir haben.
	
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Ignaz kann mir einige Rezepte zur Herstellung von Tränken zeigen. Er wohnt im Hafenviertel.");
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP (XP_MIS_Ignaz_Charm);
	
	//PATCH fallls alle Scrolls aufgekauft oder geplündert wurden
	CreateInvItems (self,ITSC_Charm		, 3);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Trade   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent   = TRUE;
	trade 		= TRUE;
	description = "Zeig mir deine Ware.";
};
FUNC INT DIA_Ignaz_Trade_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_SUCCESS)
	|| (Npc_KnowsInfo (other,DIA_Ignaz_Running))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Ignaz_Trade_15_00");//Zeig mir deine Ware.
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Teach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent   = TRUE;
	description = "Lehre mich die Kunst der Alchemie.";
};
//----------------------------------------
var int DIA_Ignaz_Teach_permanent;
//----------------------------------------

FUNC INT DIA_Ignaz_Teach_Condition()
{	
	if (DIA_Ignaz_Teach_permanent == FALSE)
	&& (Ignaz_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Ignaz_Teach_15_00");//Lehre mich die Kunst der Alchemie.
	
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_ClearChoices (DIA_Ignaz_Teach);
		Info_AddChoice (DIA_Ignaz_Teach,DIALOG_BACK,DIA_Ignaz_Teach_BACK);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Trank der Geschwindigkeit", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)) ,DIA_Ignaz_Teach_Health);
		talente = (talente + 1);
	};
	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_01"); //Zur Herstellung eines Tranks am Alchimietisch brauchst du eine Laborflasche.
			AI_Output (self, other,"DIA_Ignaz_Teach_14_02"); //Und du benötigst unterschiedliche Pflanzen oder andere Ingredienzen für jeden Trank.
			//AI_Output (self, other,"DIA_Ignaz_Teach_14_03"); //Eins noch. Falls du vorhast, das Wissen um Elixiere der Geschicklichkeit zu lernen, solltest du wissen, dass die benötigten Pflanzen dafür sehr selten sind.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_04"); //Was willst du wissen?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Ignaz_Teach_14_05"); //Du hast alles gelernt, was ich dir beibringen kann.
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};
	
FUNC VOID DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Speed);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices (DIA_Ignaz_Teach);
};

