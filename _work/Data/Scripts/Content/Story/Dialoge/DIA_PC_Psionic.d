// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_EXIT_Condition;
	information	= DIA_Lester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_Hello (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Hello_Condition;
	information	= DIA_Lester_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       
FUNC INT DIA_Lester_Hello_Condition()
{	
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Hello_Info()
{	
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//Bist DU es? - Tats�chlich! Mann, bin ich froh, dich zu sehen!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "Kennen wir uns?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lester! Wie kommst du hierher?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lester! Wie kommst du hierher?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//Das war eine irre Flucht. Nachdem die Barriere explodierte, bin ich zun�chst orientierungslos durch die Gegend gestreift.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Dann habe ich mich tagelang durch die W�lder geschlagen und schlie�lich dieses Tal hier gefunden.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten und Gorn sind noch im Minental. Zumindest denke ich das.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//Kennen wir uns?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Hallo? Jemand zuhause? Ich hab meinen Hals riskiert, damit du diesen komischen Stein bekommen konntest.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Du schuldest mir was ... DAS solltest du dir aber diesmal merken!
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//Du erinnerst dich doch noch an Diego, Milten und Gorn?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten und WER?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Klar. Was ist mit ihnen?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Klar. Was ist mit ihnen?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Soweit ich wei�, m�ssten sie die Zerst�rung der Barriere �berlebt haben.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Hab keine Ahnung, wo sie jetzt sind - vermutlich h�ngen die drei noch im Minental rum.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Wenn du sie triffst, sag mir Bescheid.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten und WER?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Sag blo�, du wei�t nichts mehr davon. Die Fokussteine - der Troll - der riesige Erzhaufen der Wassermagier?
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Ich bin mir nicht sicher ...
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Das kommt schon wieder. Ich hab auch 'ne Zeit lang gebraucht, um wieder klar zu kommen.
};
// ************************************************************
// 		  				  Was ist passiert?		//E1
// ************************************************************
INSTANCE DIA_Lester_WhatHappened (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_WhatHappened_Condition;
	information	= DIA_Lester_WhatHappened_Info;
	permanent	= FALSE;
	description = "Was ist passiert?";
};                       
FUNC INT DIA_Lester_WhatHappened_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_WhatHappened_Info()
{	
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//Was ist passiert?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//Nachdem der Schl�fer besiegt wurde, hat die gesamte Bruderschaft den Verstand verloren.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Ohne ihren Meister waren sie alle nur noch leere H�llen.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//Und du? Was ist mit dir?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//Mir ging es genau so. Ich hatte Alptr�ume und sogar Halluzinationen. Aber ich bin geflohen, als ich wieder einen einigerma�en klaren Kopf hatte.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//Einmal glaubte ich, einen gro�en schwarzen Schatten zu sehen, der sich auf eine Gruppe Fl�chtender st�rzte und alles in einer riesigen Feuerwolke verbrannte.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//In dem Moment dachte ich wirklich, ein Drache w�re gekommen, um mich zu t�ten.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Hast du noch mehr gesehen?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//Nein - ich hab die Beine in die Hand genommen und bin gerannt!
};
// ************************************************************
// 		  				   Minental		 		//E1 
// ************************************************************
INSTANCE DIA_Lester_MineColony (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_MineColony_Condition;
	information	= DIA_Lester_MineColony_Info;
	permanent	= FALSE;
	description = "Wie lange versteckst du dich schon hier im Tal?";
};                       
FUNC INT DIA_Lester_MineColony_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_MineColony_Info()
{	
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//Wie lange versteckst du dich schon hier im Tal?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//So genau wei� ich das nicht. Aber ich sch�tze mal, eine Woche vielleicht. Aber da ist noch eine Sache:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Als ich hier abends ankam, habe ich mich oben auf dem Berg umgesehen - da standen nur ein paar B�ume.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//Und als ich am n�chsten Tag gucke, steht auf einmal dieser Turm da. Ich schw�re dir, der war vorher noch nicht da. Seitdem habe ich das Tal nicht mehr verlassen.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//Du meinst Xardas' Turm? Ich wusste ja, dass er m�chtig ist, aber dass er sogar einen Turm erschaffen kann ...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Xardas der D�monenbeschw�rer? Er lebt in diesem Turm? Ich wei� nicht, ob mich das beruhigt ...
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Keine Sorge, er war es, der mich aus dem Schl�fer-Tempel befreit hat. Er ist auf unserer Seite.
};
///////////////////////////////////////////////////////////////////////
//	Info SEND_XARDAS
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_SEND_XARDAS		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_SEND_XARDAS_Condition;
	information	 = 	DIA_Lester_SEND_XARDAS_Info;
	permanent	 = 	FALSE;
	description	 = 	"Du mu�t Xardas von dem Schatten berichten...";
};
func int DIA_Lester_SEND_XARDAS_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Lester_WhatHappened)
	&& Npc_KnowsInfo (other,DIA_Lester_MineColony)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_SEND_XARDAS_Info ()
{
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Du mu�t Xardas von dem Schatten berichten, es k�nnte wichtig sein.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //Du glaubst, es war keine Einbildung? Du meinst, da war wirklich ein ...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //... Drache. Ja.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Du steckst doch schon wieder mitten drin, hab ich Recht?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Mitten drin w�rde ich nicht sagen ... noch nicht.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //(seufzt) Na sch�n, wenn es so wichtig ist, dann werde ich ihn aufsuchen - aber nicht jetzt.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //F�r den Augenblick werde ich mich ausruhen. Ich bin immer noch ersch�pft von der Flucht aus der Strafkolonie.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //Ich denke, du hast noch viel vor. Wir sehen uns dann sp�ter bei Xardas.
	
	AI_StopProcessInfos (self);
	
	//wird bei LOLO zu Xardas gebeamt
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_STADT		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_STADT_Condition;
	information	 = 	DIA_Addon_Lester_STADT_Info;

	description	 = 	"Ich bin auf dem Weg nach KHORINIS! Was wei�t du �ber die Stadt?";
};

func int DIA_Addon_Lester_STADT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_STADT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //Ich bin auf dem Weg nach Khorinis! Was wei�t du �ber die Stadt?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Khorinis? Nun, es ist eine Hafenstadt, nichts Besonderes.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Warum fragst du?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Ich muss zu den Paladinen, die sich in der Stadt befinden sollen.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //(lacht) So? Tats�chlich. Hah. Du kommst doch noch nicht mal in die Stadt hinein, geschweige denn, zu den Paladinen.
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_Vorschlag		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_Vorschlag_Condition;
	information	 = 	DIA_Addon_Lester_Vorschlag_Info;

	description	 = 	"Hast du einen Vorschlag, wie ich in die Stadt komme?";
};

func int DIA_Addon_Lester_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lester_STADT))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //Hast du einen Vorschlag, wie ich in die Stadt komme?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Allerdings. Ich habe vor einiger Zeit f�r einen alten Alchemisten namens Constantino gearbeitet.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //Er ist sehr einflussreich in der Stadt und hat die Torwachen angewiesen, jeden zu ihm zu lassen, der ihm seltene Kr�uter verkaufen kann.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //Im Grunde ist es ganz einfach. Du sammelst ein gro�es B�schel Pflanzen, die hier �berall wachsen, und gibst vor, f�r Constantino zu arbeiten, dann werden sie dich passieren lassen.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Sammel aber nicht alles durcheinander. Die Stadtwachen sind ein bisschen d�mlich und haben keine Ahnung von Alchemie.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //Das B�schel muss schon f�r sie nach etwas aussehen, wenn du damit durchkommen willst.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //Ich denke, 10 Exemplare ein und derselben Pflanzenart sollten reichen.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Danke f�r den Tipp.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester sagt, dass ich mit 10 Planzen der gleichen Art an den Stadtwachen vorbei komme, wenn ich sage, dass sie f�r den alten Alchemisten namens Constantino sind."); 
	
	MIS_Addon_Lester_PickForConstantino = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info PASSAGEPLANTSSUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;

	description	 = 	"Die Sache mit den Planzen f�r Constantino hat geklappt.";
};

func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition ()
{
	if (MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //Die Sache mit den Planzen f�r Constantino hat geklappt. Ich bin damit an der Stadtwache vorbei gekommen.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //Na, sag' ich doch. Du solltest eben ab und zu mal auf mich h�ren, mein Freund.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 		  		Perm	
// ************************************************************
INSTANCE DIA_Lester_Perm (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Perm_Condition;
	information	= DIA_Lester_Perm_Info;
	permanent	= TRUE;
	description = "Was wei�t du �ber die Gegend?";
};                       
FUNC INT DIA_Lester_Perm_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_LESTER") <= 2000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Perm_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//Was wei�t du �ber die Gegend?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Wenn du den Weg weiter runtergehst, kommst du zu einem Bauernhof. Ein kurzes St�ck dahinter f�ngt auch schon die Stadt an.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Sei aber vorsichtig, hier treiben sich nicht nur W�lfe und Ratten rum, sondern auch Goblins und Banditen!
};
// ************************************************************
// 		  		Sleep
// ************************************************************
INSTANCE DIA_Lester_Sleep (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Sleep_Condition;
	information	= DIA_Lester_Sleep_Info;
	permanent	= TRUE;
	description = "Bist du immer noch ersch�pft?";
};                       
FUNC INT DIA_Lester_Sleep_Condition()
{
	if  (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_IN1_31") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Sleep_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Bist du immer noch ersch�pft?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//Und wie. (g�hnt) Ich habe Xardas alles erz�hlt. Jetzt werde ich noch ein bisschen pennen. So ein bis zwei ...
	AI_Output	(self, other,"DIA_Lester_Sleep_13_02");	//... Tage ... oder l�nger.
	
	AI_StopProcessInfos (self);
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Lester_KAP3_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP3_EXIT_Condition;
	information	= DIA_Lester_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BACKINTOWN
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_BACKINTOWN		(C_INFO) 
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_BACKINTOWN_Condition;
	information	 = 	DIA_Lester_BACKINTOWN_Info;
	important	 = 	TRUE;
};
func int DIA_Lester_BACKINTOWN_Condition ()
{	
	if (Npc_GetDistToWP (self, "LEVELCHANGE") <= 500) 
		&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_BACKINTOWN_Info ()
{
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //Hey, endlich bist du wieder da! Du musst sofort zu Xardas kommen, es gibt Probleme.
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //Das glaube ich allerdings auch.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //Hier ist die H�lle ausgebrochen, seit du weg warst.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Sprich mit Xardas, er wartet bereits auf dich!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Er gab mir diese Rune f�r dich mit. Damit kommst du schneller zu ihm. Wir sehen uns dann bei Xardas.
	
	CreateInvItems 		(self,ItRu_TeleportXardas,1);
	B_GiveInvItems 		(self,other,ItRu_TeleportXardas,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");	//Joly: Lester geht wieder zur�ck in sein Tal!
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_PERM3		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	900;
	condition	 = 	DIA_Lester_PERM3_Condition;
	information	 = 	DIA_Lester_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Du siehst nicht gerade fit aus.";
};

func int DIA_Lester_PERM3_Condition ()
{
	if (Kapitel >= 3)
	&& (Lester_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

var int DIA_Lester_PERM3_OneTime;
func void DIA_Lester_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //Du siehst nicht gerade fit aus.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //Ich f�hle mich auch nicht besonders, Mann. Ich bin irgendwie v�llig im Eimer und habe st�ndig Kopfschmerzen.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Jedes Mal, wenn einer dieser schwarzen Kapuzenm�nner irgendwo auftaucht, wird es schlimmer.
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //Ich kann dir auch genau sagen, warum.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Ja? Ich glaube, ich will's gar nicht wissen.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Diese schwarzen Kapuzenm�nner oder die Suchenden, wie wir Magier sie nennen, waren fr�her einmal Anh�nger eines m�chtigen Erzd�monen. Klingelt's?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Mmh. Nein. Es sei denn, du willst mir damit erz�hlen, dass ...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //Ja genau. Die Suchenden sind ehemalige Anh�nger des Schl�fers. Die abtr�nnigen Sektenspinner aus dem Sumpflager.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //Es sind deine Leute, Lester. Die ehemalige Bruderschaft des Schl�fers. Sie sind jetzt nur noch seelenlose Diener des B�sen.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Ich habe es geahnt, aber ich wollte es nicht wahr haben. Meinst du, er ist zur�ckgekehrt? Ist der Schl�fer wieder da?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Gute Frage. Sicher ist nur, dass ich die Suchenden aufhalten muss, bevor sie zu m�chtig werden.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //Es gef�llt mir nicht, aber ich vermute, du hast Recht. Tut mir Leid, aber dieser ganze Mist steigt mir zu Kopf.
					B_LogEntry (TOPIC_DEMENTOREN,"Mein Verdacht hat sich best�tigt. Selbst Lester zweifelt nicht daran, dass es sich bei den Suchenden um die Anh�nger des Schl�fers aus dem ehemaligen Sumpflager handelt."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //Die Kopfschmerzen sind zwar noch da, aber das Problem wird sich hoffentlich bald erledigt haben.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //So oder so.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //Die Kopfschmerzen werden fast unertr�glich. Und jetzt greifen mich auch noch st�ndig diese Echsenmenschen an. Ich frag mich, wo die alle her kommen.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //Diese Kopfschmerzen wollen einfach nicht aufh�ren. Da braut sich was zusammen.
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //(seufz) Ich denke, ich werde mich jetzt erstmal ausruhen.
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

INSTANCE DIA_Lester_KAP4_EXIT(C_INFO)
{
	npc		= PC_Psionic;
	nr		= 999;
	condition	= DIA_Lester_KAP4_EXIT_Condition;
	information	= DIA_Lester_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP4_EXIT_Info()
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

INSTANCE DIA_Lester_KAP5_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP5_EXIT_Condition;
	information	= DIA_Lester_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info XardasWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_XARDASWEG		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_XARDASWEG_Condition;
	information	 = 	DIA_Lester_XARDASWEG_Info;

	description	 = 	"Wo ist Xardas?";
};

func int DIA_Lester_XARDASWEG_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_00"); //Wo ist Xardas?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Er ist fort und hat in seinem Turm diese D�monenwesen zur�ck gelassen.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Ich glaube, er will nicht, dass jemand w�hrend seiner Abwesenheit in seinem Turm herum schn�ffelt.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Wo ist er hin?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //Das hat er nicht gesagt. Er bat mich nur darum, dir diesen Brief von ihm zu geben.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //Ich habe ihn gelesen. Tut mir Leid. Ich war neugierig.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //Und?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //Keine Ahnung, ich habe kein Wort verstanden, Mann. Aber eines steht f�r mich fest: So bald werden wir ihn nicht wieder sehen.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //Ich glaube, es ist ihm hier einfach zu brenzlig geworden, und da hat er sich einfach aus dem Staub gemacht.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas ist verschwunden. Lester gab mir einen Brief den Xardas mir hinterlassen hat."); 
};


///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lester_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ich habe herausgefunden, wo sich der Fe�nd versteckt.";
};
func int DIA_Lester_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lester_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lester_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //Ich habe herausgefunden, wo sich der Feind versteckt.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Frag mich nicht, wieso, aber ich sp�re, dass ich dich begleiten sollte.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //Wie meinst du das?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //Ich kann es nicht erkl�ren, aber ich wei�, dass ich die Antworten nur erfahre, wenn ich dich begleite.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Das geht leider nicht, das Schiff ist bereits voll.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Vielleicht ist es so, vielleicht ist mein Schicksal unbedeutend verglichen mit den Ereignissen, die noch vor uns stehen.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //Du wei�t, was du zu tun hast. Stell dich dem B�sen entgegen, du brauchst auf mich keine R�cksicht nehmen.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //Ich bin nicht wichtig.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Ich kann dich nicht mitnehmen.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Dann komm mit und hole dir deine Antworten!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Dann komm mit und hole dir deine Antworten!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Wir treffen uns am Hafen. Wenn ich soweit bin, werde ich dorthin kommen.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Beeil dich, unsere Zeit ist knapp.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};

FUNC VOID DIA_Lester_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //Ich kann dich nicht mitnehmen.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Das kann ich verstehen. Ich bin dir wahrscheinlich keine gro�e Hilfe.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //Egal, wen du mitnimmst, sei dir sicher, dass du ihnen vertrauen kannst.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //Und pass auf dich auf.

	Lester_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_LeaveMyShip_Condition;
	information	 = 	DIA_Lester_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ich habe doch keinen Platz mehr f�r dich.";
};
func int DIA_Lester_LeaveMyShip_Condition ()
{	
	if (Lester_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lester_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Ich habe doch keinen Platz mehr f�r dich.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Ich kann dich verstehen, wahrscheinlich w�rde ich in deiner Situation �hnlich handeln.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Wenn du mich brauchst, werde ich dir helfen. Du wei�t ja, wo du mich findest.
	
	Lester_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_StillNeedYou_Condition;
	information	 = 	DIA_Lester_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ich brauche einen Freund, der mir hilft.";
};
func int DIA_Lester_StillNeedYou_Condition ()
{	
	if ((Lester_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man nat�rlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lester_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //Ich brauche einen Freund, der mir hilft.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //Ich wusste es, wir ziehen das Ding gemeinsam durch, wie fr�her.
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Das B�se sollte aufpassen. Denn wir werden ihm auf die Pelle r�cken.
		
		self.flags 		 = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Ich denke, es ist doch besser, wenn ich hier bleibe. Viel Gl�ck.
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6 //auf der Dracheninsel ->Neue Instanz!!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lester_KAP6_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP6_EXIT_Condition;
	information	= DIA_Lester_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_PC_Psionic_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 900;
	condition	= DIA_PC_Psionic_PICKPOCKET_Condition;
	information	= DIA_PC_Psionic_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_PC_Psionic_PICKPOCKET_Condition()
{
	C_Beklauen (76, 20);
};
 
FUNC VOID DIA_PC_Psionic_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_BACK 		,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};
	
func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};




































