///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Garvell_EXIT   (C_INFO)
{
	npc         = VLK_441_Garvell;
	nr          = 999;
	condition   = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garvell_PICKPOCKET (C_INFO)
{
	npc			= VLK_441_Garvell;
	nr			= 900;
	condition	= DIA_Garvell_PICKPOCKET_Condition;
	information	= DIA_Garvell_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre ein Kinderspiel seinen Geldbeutel zu stehlen)";
};                       

FUNC INT DIA_Garvell_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket25) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garvell_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garvell_PICKPOCKET);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_BACK 		,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 10)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket25, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Garvell_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garvell_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_GREET		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_GREET_Condition;
	information	 = 	DIA_Garvell_GREET_Info;
	description	 = 	"Was machst du hier?";
};
func int DIA_Garvell_GREET_Condition ()
{	
	if (Wld_IsTime (05,00,19,00))
	{	
			return TRUE;
	};
};
func void DIA_Garvell_GREET_Info ()
{
	AI_Output (other, self, "DIA_Garvell_GREET_15_00"); //Was machst du hier?
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Ich baue hier ein Schiff, denn ich will hier weg. Und zwar so schnell, wie es nur geht.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Aber so, wie es momentan aussieht, wird das Schiff niemals fertig.
};
///////////////////////////////////////////////////////////////////////
//	Info eilig
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_eilig		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_eilig_Condition;
	information	 = 	DIA_Garvell_eilig_Info;
	description	 = 	"Warum hast du es so eilig?";
};
func int DIA_Garvell_eilig_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_eilig_Info ()
{
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //Warum hast du es so eilig?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Bald werden die Orks kommen und die Stadt niederbrennen.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //Wie kommst du darauf?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //Junge, hast du schon die Paladine bemerkt, die überall rumlaufen? Was glaubst du, warum die hier sind?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Ich sage dir, die sind hier, weil die Orks bald angreifen. Und das wird nicht schön.
};

///////////////////////////////////////////////////////////////////////
//	Info Schiff
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Schiff		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_Schiff_Condition;
	information	 = 	DIA_Garvell_Schiff_Info;
	description	 = 	"Warum wird dein Schiff nicht fertig?";
};
func int DIA_Garvell_Schiff_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_Schiff_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //Warum wird dein Schiff nicht fertig?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //(winkt ab) Ach, wir haben tausend Probleme. Der Rumpf ist noch nicht stabil und es fehlen noch viele Bretter.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Aber ich hab kaum noch Gold, um neues Material zu kaufen, und in der letzten Lieferung hatten sich Wanzen eingeschlichen.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //Meine Jungs arbeiten nicht produktiv. Der eine will vor allem ein schnelles Schiff, der andere macht sich Gedanken um eine Galionsfigur!
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //Als ob wir nichts Wichtigeres zu tun hätten!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //Desweiteren kommt einer meiner Leute einfach nicht mehr zur Arbeit. Ich kriege langsam Angst, dass der Bau sich deswegen noch weiter verzögert.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Garvell_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_441_Garvell;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Garvell_MissingPeople_Condition;
	information	 = 	DIA_Addon_Garvell_MissingPeople_Info;

	description	 = 	"Dir fehlt ein Arbeiter?";
};

func int DIA_Addon_Garvell_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Garvell_Schiff)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{	
			return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //Dir fehlt ein Arbeiter?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Ja. Sein Name ist Monty. Der Kerl hat sich einfach in Luft aufgelöst.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Das faule Schwein macht sich scheinbar irgendwo bei den Bauern ein schönes Leben. Ich hätte ihn eben nicht im Voraus bezahlen sollen.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell beschwert sich über seinen Arbeiter Monty. Monty ist eines Tages nicht mehr zur Arbeit erschienen und macht sich seitdem angeblich ein schönes Leben bei den Bauern."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Es sind noch mehr Leute verschwunden, hab ich mir sagen lassen.", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Wann hast du Monty das letzte Mal gesehen?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //Es sind noch mehr Leute verschwunden, hab ich mir sagen lassen.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //Na, das sag ich doch. Da geht´s schon los mit dem Übel.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Der Fischer Farim hat mir auch schon sowas erzählt. Sein Kumpel William ist nicht mehr da.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Da stecken doch bestimmt die Orks dahinter.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Der Fischer Farim scheint etwas über den Verbleib seines Freundes William zu wissen."); 
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK );

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Wo finde ich diesen Farim?", DIA_Addon_Garvell_MissingPeople_Farim );
	};
};
func void DIA_Addon_Garvell_MissingPeople_BACK ()
{
	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
};
func void DIA_Addon_Garvell_MissingPeople_Farim ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //Wo finde ich diesen Farim?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //Er ist Fischer. Ich glaube, er hat seine Hütte in der Nähe des Proviantlagers der Paladine. Aber genau weiß ich das nicht.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Farim hat seine Hütte in der Nähe des Proviantlagers der Paladine."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //Wann hast du Monty das letzte Mal gesehen?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //(sauer) Er ist schon mindestens zwei Tage nicht mehr zur Arbeit erschienen.
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnMonty
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_ReturnMonty		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_ReturnMonty_Condition;
	information	 = 	DIA_Garvell_ReturnMonty_Info;
	description	 = 	"Und, wie läuft's JETZT?";
};
func int DIA_Garvell_ReturnMonty_Condition ()
{	
	if (Npc_GetDistToWP (Monty_NW, "NW_CITY_HABOUR_WERFT_IN_01") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_ReturnMonty_Info ()
{
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //Und, wie läuft's JETZT?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //Monty ist wieder da! Er studiert gerade die Pläne.
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Vielleicht wird's ja jetzt was mit dem Schiff ...
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_MISSION		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_MISSION_Condition;
	information	 = 	DIA_Garvell_MISSION_Info;
	permanent    =  FALSE;
	description	 = 	"Kann ich dir irgendwie helfen?";
};

func int DIA_Garvell_MISSION_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_eilig)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Garvell_MISSION_Info ()
{
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //Kann ich dir irgendwie helfen?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //Ja, das kannst du. Finde heraus, was die Paladine vorhaben. Ich will wissen, warum sie hier sind.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //Und ich muss wissen, ob die Orks bald angreifen werden - und wie weit sie von der Stadt entfernt sind.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Es wurde nämlich schon einer von den Bastarden vor der Stadt gesehen.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Bringe mir einfach alle Informationen, die du kriegen kannst.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Ich muss wissen, wieviel Zeit mir noch bleibt, um das Boot fertig zu kriegen.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell will Informationen über die Orks und er will wissen, warum die Paladine in der Stadt sind.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Gut. Wenn du noch mehr herausfindest, lass es mich wissen.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Danke für die Informationen. So wie es aussieht, haben wir alle Zeit der Welt, um unser Schiff zu bauen.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Orks		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	3;
	condition	 = 	DIA_Garvell_Orks_Condition;
	information	 = 	DIA_Garvell_Orks_Info;
	permanent    =  FALSE;
	description	 = 	"Ich habe Informationen über die Orks.";
};
func int DIA_Garvell_Orks_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Orks_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //Ich habe Informationen über die Orks.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //Lass hören.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Sie sitzen im Minental fest und dort werden sie wohl auch bleiben.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Zur Sicherheit lassen die Paladine den Pass bewachen.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Paladine		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_Paladine_Condition;
	information	 = 	DIA_Garvell_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"Ich weiß, warum die Paladine hier sind. ";
};
func int DIA_Garvell_Paladine_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (KnowsPaladins_Ore == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //Ich weiß, warum die Paladine hier sind.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //Wirklich? Erzähl!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Die Paladine sind hier, um das magische Erz aus dem Minental zu holen, nicht, weil die Orks die Stadt angreifen wollen.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //Sobald sie das Erz haben, werden sie wieder zum Festland zurückkehren.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Ork vor der Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_City		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	4;
	condition	 = 	DIA_Garvell_City_Condition;
	information	 = 	DIA_Garvell_City_Info;
	permanent    =  FALSE;
	description	 = 	"Was den Ork vor der Stadt angeht ...";
};
func int DIA_Garvell_City_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 2)
	{
		return TRUE;
	};
};
func void DIA_Garvell_City_Info ()
{
	AI_Output (other, self, "DIA_Garvell_City_15_00"); //Was den Ork vor der Stadt angeht ...
	AI_Output (self, other, "DIA_Garvell_City_04_01"); //Jaaa ... ?
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //Mach dir über ihn keine Gedanken. Die Stadtwache wird sich um ihn kümmern.
	

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Perm		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	13;
	condition	 = 	DIA_Garvell_Perm_Condition;
	information	 = 	DIA_Garvell_Perm_Info;
	permanent    =  TRUE;
	description	 = 	"Was ist denn so im Hafen los?";
};
func int DIA_Garvell_Perm_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_MISSION)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Perm_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //Was ist denn so im Hafen los?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Die Orks rücken uns auf den Pelz und du fragst nach dem Hafen?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Ich wollte ja nur ...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //Das größte Problem, das wir haben, ist, dass im Hafen nicht genug Schiffe liegen, um uns von hier zu verdrücken.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //Um ehrlich zu sein, liegt hier nur ein Schiff, und das gehört den Paladinen. Die lassen uns bestimmt nicht damit abhauen.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Schau dich doch selbst um, hier ist tote Hose.
	};
};























