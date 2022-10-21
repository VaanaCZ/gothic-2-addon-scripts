// ************************************************************
// 			Lares Patch 
// ************************************************************
instance DIA_Addon_Lares_Patch		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 99;
	condition	= DIA_Addon_Lares_Patch_Condition;
	information	= DIA_Addon_Lares_Patch_Info;
	description	= "(Ornament - Stück zurückverlangen)";
};
func int DIA_Addon_Lares_Patch_Condition ()
{
	if (Npc_HasItems  (self,ItMi_Ornament_Addon_Vatras))
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Patch_Info ()
{
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras,1);
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap1_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap1_EXIT_Condition;
	information	= DIA_Lares_Kap1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HaltsMaul
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_HaltsMaul		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_HaltsMaul_Condition;
	information	 = 	DIA_Addon_Lares_HaltsMaul_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Lares_HaltsMaul_Condition ()
{
	if (Lares_HaltsMaul == TRUE)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Lares_HaltsMaul_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_HaltsMaul_09_01"); //Wir sehen uns später am Hafen.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lares_PICKPOCKET (C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 900;
	condition	= DIA_Lares_PICKPOCKET_Condition;
	information	= DIA_Lares_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Lares_PICKPOCKET_Condition()
{
	C_Beklauen (95, 350);
};
 
FUNC VOID DIA_Lares_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lares_PICKPOCKET);
	Info_AddChoice		(DIA_Lares_PICKPOCKET, DIALOG_BACK 			,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lares_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lares_PICKPOCKET);
};
	
func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lares_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Lares_HALLO		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Lares_HALLO_Condition;
	information	= DIA_Lares_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE; 
};
func int DIA_Lares_HALLO_Condition ()
{	
	if 	(RangerMeetingRunning == 0)//ADDON
		{
			return TRUE;
		};
};
func void DIA_Lares_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Lares_HALLO_09_00"); //Ich werd verrückt, was machst du denn hier?
	
	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output (self, other, "DIA_Lares_HALLO_09_01"); //Bist du bis hierher GESCHWOMMEN?
		AI_Output (self, other, "DIA_Lares_HALLO_09_02"); //(lacht) Das ist auch ein Weg, an den Stadttorwachen vorbeizukommen.
		B_GivePlayerXP (500); //wer's schafft...	
	};
			
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Sind wir uns schon mal begegnet?",DIA_Lares_HALLO_NO);
	Info_AddChoice 		(DIA_Lares_HALLO,"Hey, Lares alter Gauner...",DIA_Lares_HALLO_YES);
};
FUNC VOID DIA_Lares_HALLO_NO()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NO_15_00"); //Sind wir uns schon mal begegnet?
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_01"); //Mann, du kannst dich nicht mehr an mich erinnern?! Ich hab mich im Neuen Lager rumgetrieben.
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_02"); //Die Liste für die Mine ... Mann, wir hatten echt 'ne Menge Spaß. Erinnerst du dich denn noch an Lee?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Natürlich kenne ich Lee noch!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};
FUNC VOID DIA_Lares_HALLO_YES()
{
	AI_Output (other, self, "DIA_Lares_HALLO_YES_15_00"); //Hey, Lares, alter Gauner, wie bist du hier her gekommen?
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_01"); //Ich konnte gerade noch rechtzeitig aus dem Minental fliehen, zusammen mit Lee und ein paar anderen Jungs.
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_02"); //Du kannst dich doch noch an Lee erinnern, oder?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Natürlich kenne ich Lee noch!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};

// ------------------------------	
	func void B_Lares_AboutLee()
	{
		AI_Output (self, other, "B_Lares_AboutLee_09_00"); //Ich bin damals mit ihm aus der Kolonie abgehauen. Kurz nachdem die Barriere zerstört wurde.
		AI_Output (self, other, "B_Lares_AboutLee_09_01"); //Er ist jetzt mit seinen Jungs auf dem Hof von Onar, dem Großbauern.
		AI_Output (self, other, "B_Lares_AboutLee_09_02"); //Er hat einen Deal mit dem Bauern gemacht. Er und seine Jungs verteidigen den Hof und Onar füttert sie dafür durch.
	};
// ------------------------------	

FUNC VOID DIA_Lares_HALLO_LEE()
{
	AI_Output (other, self, "DIA_Lares_HALLO_LEE_15_00"); //Natürlich kenne ich Lee noch!
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};
FUNC VOID DIA_Lares_HALLO_NOIDEA()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NOIDEA_15_00"); //Lee ...?
	AI_Output (self, other, "DIA_Lares_HALLO_NOIDEA_09_01"); //Du hast wohl 'ne Menge mitgemacht, was? Lee war der Anführer der Söldner im Neuen Lager.
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};



// ************************************************************
// ***														***
// 								ADDON
// ***														***
// ************************************************************

// ------------------------------------------------------------
// Vatras schickt mich 
// ------------------------------------------------------------
instance DIA_Addon_Lares_Vatras		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 1;
	condition	= DIA_Addon_Lares_Vatras_Condition;
	information	= DIA_Addon_Lares_Vatras_Info;

	description	= "Vatras schickt mich.";
};
func int DIA_Addon_Lares_Vatras_Condition ()
{
	if (Vatras_GehZuLares == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Vatras_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Vatras_15_00"); //Vatras schickt mich. Er sagt, ich soll zu dir kommen, wenn ich Hilfe brauche.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_01"); //(verwundert) Ach, bei Vatras warst du also auch schon. Du musst ja einen bleibenden Eindruck bei ihm hinterlassen haben.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_02"); //Sonst hätte er sicherlich nicht so bereitwillig meinen Namen genannt. Vor allem nicht, weil die Sache mit den verschwundenen Leuten immer noch nicht geklärt ist.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_03"); //Sag mir, was du brauchst.
	Lares_RangerHelp = TRUE;

	if (GregLocation == Greg_Farm1)
	{
		B_StartOtherRoutine	(Bau_974_Bauer,"GregInTaverne");
		GregLocation = Greg_Taverne;
		B_StartOtherRoutine	(Greg_NW,"Taverne");
	};
};

// ************************************************************
// 						Ring des Wassers
// ************************************************************
// ------------------------------------------------------------
// WhatAreYouGuys
// ------------------------------------------------------------
instance DIA_Addon_Lares_WhatAreYouGuys		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 6;
	condition	= DIA_Addon_Lares_WhatAreYouGuys_Condition;
	information	= DIA_Addon_Lares_WhatAreYouGuys_Info;

	description	 = 	"Was hast du eigentlich mit Vatras zu schaffen?";
};
func int DIA_Addon_Lares_WhatAreYouGuys_Condition ()
{
	if (Lares_RangerHelp == TRUE)
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_WhatAreYouGuys_Info ()
{	
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_00"); //Was hast du eigentlich mit Vatras zu schaffen?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_01"); //Ich hab da so ein kleines Abkommen mit den Wassermagiern, verstehst du?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_02"); //Was für ein Abkommen?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_03"); //Wir arbeiten für sie und sie sorgen dafür, dass wir keine Probleme aufgrund unserer Vergangenheit in der Sträflingskolonie haben.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_04"); //Du redest vom 'Ring des Wassers'?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_05"); //Du hast schon davon gehört?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_06"); //Vatras hat mir davon erzählt.
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_07"); //Sag das doch gleich.

	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Lares gehört zum 'Ring des Wassers'." ); 
};
// ------------------------------------------------------------
// Ranger
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ranger		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_Ranger_Condition;
	information	= DIA_Addon_Lares_Ranger_Info;

	description	= "Erzähl mir mehr über den 'Ring des Wassers'.";
};
func int DIA_Addon_Lares_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_00"); //Erzähl mir mehr über den 'Ring des Wassers'.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_01"); //Der 'Ring' ist für die Wassermagier das, was die Paladine für die Feuermagier sind.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_02"); //Aber im Gegensatz zu den Paladinen arbeiten wir im Hintergrund.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_03"); //Der 'Ring' ist eine mächtige Waffe im Kampf gegen die Gefahren, die den Menschen von Khorinis drohen.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_04"); //Aber das kann nur funktionieren, wenn wir geheim halten, wer alles zum 'Ring des Wassers' gehört.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_05"); //Deshalb behalt die Sache für dich!
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_06"); //Klar.
	B_LogEntry (TOPIC_Addon_RingOfWater,"Der 'Ring' ist für die Wassermagier das, was die Paladine für die Feuermagier sind. Nur arbeitet der 'Ring' im Hintergrund. Niemand soll wissen, WER dazu gehört, damit ihre Anzahl und Stärke verborgen bleibt." ); 
};
// ------------------------------------------------------------
// Info WannaBeRanger
// ------------------------------------------------------------
instance DIA_Addon_Lares_WannaBeRanger		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_WannaBeRanger_Condition;
	information	= DIA_Addon_Lares_WannaBeRanger_Info;

	description	= "Ich will mich dem Ring des Wassers anschließen...";
};
func int DIA_Addon_Lares_WannaBeRanger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ranger))
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_WannaBeRanger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_15_00"); //Ich will mich dem Ring des Wassers anschließen...
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_09_01"); //Das ist gut. Aber die Entscheidung darüber, ob du aufgenommen wirst, liegt einzig und allein bei den Wassermagiern.
	
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 


	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Verstehe.", DIA_Addon_Lares_WannaBeRanger_BACK );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Wie ist das so, zum 'Ring' zu gehören?", DIA_Addon_Lares_WannaBeRanger_HowIsIt );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Was hast du gemacht um die Wassermagier zu beeindrucken?", DIA_Addon_Lares_WannaBeRanger_AboutYou );
};
func void DIA_Addon_Lares_WannaBeRanger_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_BACK_15_00"); //Verstehe.
	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
};
func void DIA_Addon_Lares_WannaBeRanger_AboutYou ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00"); //Was hast du gemacht, um die Wassermagier zu beeindrucken?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01"); //Ich habe sie eine lange Zeit über beschützt, als wir noch unter der Barriere gelebt haben.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02"); //(schmunzelt) Und sie hatten allen Grund, mir dafür dankbar zu sein.
};
func void DIA_Addon_Lares_WannaBeRanger_HowIsIt ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00"); //Wie ist das so, zum 'Ring' zu gehören?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01"); //Wir unterscheiden uns wesentlich von den üblichen Gemeinschaften, denen du hier in Khorinis beitreten kannst.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02"); //Wenn du erst mal zu uns gehörst, werden wir nichts von dir verlangen, was du nicht selbst bereit bist zu tun.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03"); //Das einzige, was von dir verlangt wird, ist, dicht zu halten.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04"); //Wir wirken im Verborgenen und wollen nicht, dass Außenstehende wissen, wer zu uns gehört.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05"); //Wir werden dich im Auge behalten. Alles weitere wird sich zeigen.
};
// ------------------------------------------------------------
// Info RingBack (Bin jetzt dabei)
// ------------------------------------------------------------
func void B_Lares_Geheimtreffen()
{
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_07"); //Wir haben bald ein geheimes Treffen in Orlans Taverne.
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_08"); //Komm sobald du kannst dorthin. Wir werden dir deine Ausrüstung dort aushändigen.
};
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_RingBack_Condition;
	information	 = 	DIA_Addon_Lares_RingBack_Info;

	description	 = 	"Ich gehöre jetzt zum 'Ring des Wassers'.";
};
func int DIA_Addon_Lares_RingBack_Condition ()
{
	if (SC_IsRanger == TRUE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	&& (((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B")<1000) )||((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08")<1000)))
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_RingBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_00"); //Ich gehöre jetzt zum 'Ring des Wassers'.
	
	if (Lares_GotRingBack == FALSE) 
	&& (SC_GotLaresRing == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_01"); //Klasse. Kann ich meinen Aquamarinring jetzt wieder haben?
		
		if (B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_02"); //Klar. Hier hast du ihn.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_03"); //Ich hoffe, er hat dir geholfen. Freut mich, dich in unseren Reihen zu wissen.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP (XP_Ambient);
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_04"); //Tja. Ich habe ihn gerade nicht bei mir.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_05"); //Mach keinen Mist damit, hörst du? Ich brauche ihn noch.
		};
	};

	AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_06"); //Jetzt willst du sicher deine Ausrüstung haben. Gut, pass auf.
	B_Lares_Geheimtreffen();
	
	B_LogEntry (TOPIC_Addon_RingOfWater, "Lares lud mich ein, zum geheimen Treffen des 'Rings' in Orlans Taverne zu kommen."); 
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
};
// ------------------------------------------------------------
// Info RingBack2
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack2		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_RingBack2_Condition;
	information	= DIA_Addon_Lares_RingBack2_Info;

	description	= "Hier ist dein Aquamarinring.";
};
func int DIA_Addon_Lares_RingBack2_Condition ()
{
	if (Npc_HasItems (other,ItRi_Ranger_Lares_Addon))
	&& (Lares_GotRingBack == FALSE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_RingBack2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack2_15_00"); //Hier ist dein Aquamarinring.
	B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1);
	AI_Output	(self, other, "DIA_Addon_Lares_RingBack2_09_01"); //Da hast du ja noch mal Glück gehabt. Ich dachte schon, du hättest ihn verloren.
	B_GivePlayerXP (XP_Ambient);
	Lares_GotRingBack = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Geduld
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Geduld		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 =  2;
	condition	 = 	DIA_Addon_Lares_Geduld_Condition;
	information	 = 	DIA_Addon_Lares_Geduld_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Lares_Geduld_Condition ()
{
	if (RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES")>200)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_Geduld_Info ()
{ 
	AI_Output	(self, other, "DIA_Addon_Lares_Geduld_09_01"); //Noch einen Moment Geduld. Warte, bis alle da sind.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 						RANGER MEETING
// ************************************************************
instance DIA_Addon_Lares_GetRangerArmor		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_GetRangerArmor_Condition;
	information	= DIA_Addon_Lares_GetRangerArmor_Info;
	important	= TRUE;
};
func int DIA_Addon_Lares_GetRangerArmor_Condition ()
{
	if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
	&& ((Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES")<200))
	&& (RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_GetRangerArmor_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_00"); //So, mein junger Freund. Wir sind hier zusammen gekommen, um deine Aufnahme in den 'Ring des Wassers' zu feiern.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_01"); //Die Jungs, die du hier sehen kannst, werden ab heute ein Auge auf dich haben.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_02"); //Es sind natürlich nicht alle, die dem 'Ring des Wassers' angehören, also sei vorsichtig.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_03"); //Ob du Mist baust oder ob du unserer Gemeinschaft einen Dienst erweist, wir werden es wissen.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_04"); //Ich überreiche dir nun die Rüstung unserer Gemeinschaft.
	CreateInvItem	(hero, ITAR_RANGER_Addon);
	AI_EquipArmor	(hero, ITAR_RANGER_Addon);	
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_05"); //Trage sie mit Stolz, aber lass dich nicht dabei erwischen, dass du sie in der Stadt oder in anderen bewohnten Gebieten trägst.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_06"); //Bedenke, dass wir nicht entlarvt werden wollen. Darum darf niemand erfahren, wer zum 'Ring des Wassers' gehört.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_07"); //Niemand spricht über den 'Ring des Wassers'. Das ist unsere oberste Regel. Also halte dich daran.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_08"); //Noch Fragen?
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "Ich muss weiter.", DIA_Addon_Lares_GetRangerArmor_end );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "Mit welcher Hilfe kann bei euch rechnen?", DIA_Addon_Lares_GetRangerArmor_Learn );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "Wie sieht's mit Waffen aus?", DIA_Addon_Lares_GetRangerArmor_weapons );

};
func void DIA_Addon_Lares_GetRangerArmor_weapons ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_weapons_15_00"); //Wie sieht's mit Waffen aus?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_01"); //Die Waffe des 'Rings' ist der Kampfstab, aber jeder kämpft mit der Waffe, die ihm am besten liegt.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_02"); //Hier hast du einen von unseren Stäben. Ich konnte nie viel damit anfangen, aber vielleicht kannst du damit umgehen.
	CreateInvItems (self, ItMw_RangerStaff_Addon, 1);									
	B_GiveInvItems (self, other, ItMw_RangerStaff_Addon, 1);		
};
func void DIA_Addon_Lares_GetRangerArmor_end ()
{
	B_MakeRangerReadyToLeaveMeetingALL ();
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_end_15_00"); //Ich muss weiter.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_01"); //In Ordnung, dann wollen wir dich nicht länger aufhalten.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_02"); //Geh nun umgehend zu Vatras und lass dir deinen ersten Auftrag geben.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_03"); //Brüder des 'Rings'. Lasst uns nun zurückkehren zu unseren Pflichten.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_04"); //Die Überfälle der Banditen haben immer noch nicht aufgehört. Wir müssen dafür sorgen, dass diese Bedrohnung eingedämmt wird.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_05"); //Adanos, erhalte das Gleichgewicht dieser Welt.
	Lares_TakeFirstMissionFromVatras = TRUE;

	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, DIALOG_ENDE, DIA_Addon_Lares_GetRangerArmor_weiter );
};
func void DIA_Addon_Lares_GetRangerArmor_weiter () 
{
	AI_StopProcessInfos (self);
	B_RangerMeetingParking ();
	B_LogEntry (TOPIC_Addon_RingOfWater,"Bei dem geheimen Treffen in Orlans Taverne wurde mir meine Rüstung verliehen. Ich soll nun zu Vatras gehen und mir meinen ersten Auftrag als Mitglied des 'Rings' geben lassen." ); 
};

func void DIA_Addon_Lares_GetRangerArmor_Learn ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_Learn_15_00"); //Mit welcher Hilfe kann bei euch rechnen?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_01"); //Ich kann dir zeigen, wie man geschickter wird.

	if ((Npc_IsDead(SLD_805_Cord))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_02"); //Wenn du Hilfe im Umgang mit Nahkampfwaffen benötigst, wende dich an Cord. Er ist ein Meister der Klinge.
	};
	if ((Npc_IsDead(BAU_961_Gaan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_03"); //Gaan zeigt dir sicher gerne, wie man Tiere richtig ausnimmt.
	};	
	if ((Npc_IsDead(Mil_350_Addon_Martin))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_04"); //Von Martin kannst du viel über die Paladine erfahren.
	};	
	if ((Npc_IsDead(Bau_4300_Addon_Cavalorn))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_05"); //Cavalorn lehrt dich das Schleichen, Einhandkampf und das Schießen mit dem Bogen.
	};
	if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_06"); //Bei Orlan wirst du immer ein warmes Zimmer und ein Bett finden.
	};
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_07"); //Und was mit Magie zu tun hat, wirst du sicher bei Vatras erfahren können.
};



// ************************************************************
// 							Teleporter
// ************************************************************
instance DIA_Addon_Lares_Teleportstation		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_Teleportstation_Condition;
	information	 = 	DIA_Addon_Lares_Teleportstation_Info;

	description	 = 	"Hast du schon mal einen Teleportstein benutzt?";
};
func int DIA_Addon_Lares_Teleportstation_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)//SC war schon bei den Wassermagiern
	&& (SCUsed_TELEPORTER == TRUE)			//SC hat schon mal einen Teleporter benutzt
	&& (MIS_Lares_BringRangerToMe != 0) 				//hat Aquamarinring von Lares bekommen. -> für Orlan
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Teleportstation_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_00"); //Hast du schon mal einen Teleporterstein benutzt?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_01"); //Nein, aber ich hörte davon. Die Wassermagier sind sich bei den Dingern noch nicht sicher.
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_02"); //Ich hab's schon ausprobiert.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_03"); //(lacht) War ja klar. Du hast vor gar nichts Angst, was?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_04"); //Nun. Wenn du die Dinger benutzen willst, dann frag mal Orlan, den Wirt, ob er dich in seine vernagelte Höhle lässt.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_05"); //So viel ich weiß, hat er einen dieser Teleportersteine für die Wassermagier in der Nähe seiner Taverne versteckt.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_06"); //Du gehst aus dem Osttor der Stadt und folgst einfach dem Weg. Dann kannst du sie gar nicht verfehlen.
	
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Lares sagte mir, dass Orlan in der Nähe seiner Taverne einen Teleportstein versteckt hält."); 
	Orlan_Hint_Lares = TRUE;
};



// ************************************************************
// 							Ornament
// ************************************************************
// ------------------------------------------------------------
// Ornament von Vatras
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ornament		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_Ornament_Condition;
	information	= DIA_Addon_Lares_Ornament_Info;

	description	= "Vatras gab mir dieses Ornament für dich mit.";
};
func int DIA_Addon_Lares_Ornament_Condition ()
{
	if (Npc_HasItems (other,ItMi_Ornament_Addon_Vatras))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Ornament_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Ornament_15_00"); //Vatras gab mir dieses Ornament für dich mit. Er sagte, es soll zurückgebracht werden.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_01"); //(seufzt) Natürlich. Es bleibt mal wieder an mir hängen. Hätte ich mir ja denken können.
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_02"); //Ich muss damit über die halbe Insel rennen, um es den Wassermagiern zu bringen.
};
// ------------------------------------------------------------
// Ornament BringJob
// ------------------------------------------------------------
instance DIA_Addon_Lares_OrnamentBringJob		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_OrnamentBringJob_Condition;
	information	= DIA_Addon_Lares_OrnamentBringJob_Info;

	description = "Ich werde das Ornament für dich hinbringen!";
};
func int DIA_Addon_Lares_OrnamentBringJob_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ornament))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_OrnamentBringJob_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_OrnamentBringJob_15_00"); //Ich werde das Ornament für dich hinbringen!
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_01"); //(nachdenklich) Mmh. Ich glaube, es ist besser, wenn ich es selbst überbringe. Aber du könntest mich begleiten.
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_02"); //Doch ich komme hier im Moment nicht weg. Ich muss den Hafen im Auge behalten.
	
	B_LogEntry (TOPIC_Addon_KDW,"Ich habe Lares das Ornament von Vatras überbracht. Er will es selbst den Wassermagiern überbringen. Ich sollte ihn dabei begleiten."); 
	
	MIS_Addon_Lares_Ornament2Saturas = LOG_RUNNING;
};
// ------------------------------------------------------------
// Hol Ablösung
// ------------------------------------------------------------
instance DIA_Addon_Lares_YourMission		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_YourMission_Condition;
	information	= DIA_Addon_Lares_YourMission_Info;
	permanent 	= TRUE;
	description = "Was genau machst du hier am Hafen?";
};
func int DIA_Addon_Lares_YourMission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ornament))
	&& (MIS_Lares_BringRangerToMe == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_YourMission_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_YourMission_15_00"); //Was genau machst du hier am Hafen?
	
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_01"); //Darüber kann ich nicht reden.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_02"); //Vatras würde mir den Kopf abreißen ...
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_03"); //Ich mache das, was alle von uns tun. Ich erledige die Aufgaben, die mir die Wassermagier auftragen.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_04"); //Einige der vermissten Leute sind Fischer. Sie sind mitsamt ihren Booten verschwunden.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_05"); //Deswegen stehe ich hier und beobachte den Hafen. Vielleicht tut sich da noch was.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_06"); //Aber du kannst mir helfen.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_07"); //Pass auf. Ich gebe dir meinen Aquamarinring. Er ist das Erkennungszeichen des 'Rings des Wassers'.
		
		CreateInvItems (self, ItRi_Ranger_Lares_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Lares_Addon, 1);
		SC_GotLaresRing = TRUE;		
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_08"); //Wenn du meinen Ring trägst, werden die anderen von uns erkennen, dass du für mich unterwegs bist.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_09"); //Besorg' mir eine Ablösung, damit ich das Ornament zurück bringen kann.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_10"); //Einer von uns hält immer den Marktplatz im Auge. Ich weiß aber nicht, wer das im Moment macht.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_11"); //Sprich am Besten mit allen, die dort rumstehen. Wenn der richtige Mann meinen Aquamarinring an deinem Finger sieht, wird er sich dir zu erkennen geben.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_12"); //Sag ihm, dass er für einen Ersatz hier am Hafen sorgen soll.

		B_LogEntry (TOPIC_Addon_RingOfWater,"Lares gab mir seinen Aquamarinring. Das Erkennungszeichen des 'Rings'. Wenn ich den Aquamarinring trage, werden mich die anderen Mitglieder des 'Rings' sich mir zu erkennen geben."); 

		Log_CreateTopic (TOPIC_Addon_BringRangerToLares, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BringRangerToLares,"Lares kann den Hafen nicht verlassen. Ich soll mich mit seinem Aquamarinring am Finger auf dem Marktplatz zeigen und jemanden ausfindig machen, der Lares ablösen kann."); 

		MIS_Lares_BringRangerToMe = LOG_RUNNING;
	};
};
// ------------------------------------------------------------
// Baltram Abloese
// ------------------------------------------------------------
instance DIA_Addon_Lares_BaltramAbloese		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_BaltramAbloese_Condition;
	information	 = 	DIA_Addon_Lares_BaltramAbloese_Info;

	description	 = 	"Ich habe mit Baltram gesprochen.";
};
func int DIA_Addon_Lares_BaltramAbloese_Condition ()
{
	if (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	&& (Baltram_Exchange4Lares == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_BaltramAbloese_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_BaltramAbloese_15_00"); //Ich habe mit Baltram gesprochen. Er wird sich um eine Ablösung für dich kümmern.
	AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_01"); //Ah. Sehr gut. Dann können wir endlich hier weg.
	if (SC_IsRanger == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_02"); //Meinen Aquamarinring behältst du am Besten erst mal.
		
		if (Npc_KnowsInfo (other, DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_03"); //(schmunzelt) Ich vermute, du kannst ihn gut brauchen, bis du deinen eigenen bekommst.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_04"); //(schmunzelt) Vielleicht kommst du ja auf die Idee, dich uns anzuschließen ...
		};
	};
	MIS_Lares_BringRangerToMe = LOG_SUCCESS;
	Lares_CanBringScToPlaces = TRUE;
};



// ************************************************************
// 						Missing People
// ************************************************************
// ------------------------------------------------------------
// About Missing People
// ------------------------------------------------------------
var int Lares_PeopleMissing_PERM;
// ------------------------------------------------------------
instance DIA_Addon_Lares_PeopleMissing		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 3;
	condition	= DIA_Addon_Lares_PeopleMissing_Condition;
	information	= DIA_Addon_Lares_PeopleMissing_Info;
	permanent 	= TRUE;
	description	= "Wegen der verschwundenen Leute...";
};
func int DIA_Addon_Lares_PeopleMissing_Condition ()
{
	if (Lares_RangerHelp == TRUE)
	&& (Lares_PeopleMissing_PERM == FALSE)
	&& ((SC_IsRanger == FALSE)||(MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_PeopleMissing_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_15_00"); //Wegen der verschwundenen Leute ...
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice (DIA_Addon_Lares_PeopleMissing, DIALOG_BACK, DIA_Addon_Lares_PeopleMissing_BACK);
	if (MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Ich habe einige der vermissten Leute retten können.", DIA_Addon_Lares_PeopleMissing_SAVED );
	}
	else if (MIS_Lares_BringRangerToMe != 0)
	&& (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Ich weiß wo die vermissten Leute geblieben sind.", DIA_Addon_Lares_PeopleMissing_Success );
	}
	else
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Ist die Sache nicht Angelegenheit der Miliz?", DIA_Addon_Lares_PeopleMissing_MIL );
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Erzähl mir, was du weißt.", DIA_Addon_Lares_PeopleMissing_TellMe );
	};
};
func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_TellMe_15_00"); //Erzähl mir, was du weißt.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_01"); //William, einer der Fischer hier in Khorinis, war der Erste. Eines Tages kam er einfach nicht mehr nach Hause.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_02"); //Erst hatten wir vermutet, dass er mit seinem Boot draußen auf dem Meer einem dieser Seeungeheuer zum Opfer gefallen ist.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_03"); //Aber kurze Zeit später verschwanden noch mehr Bewohner der Stadt und Umgebung. Es scheint jedoch keine Methode dahinter zu stecken.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_04"); //Bisher sind alle völlig ratlos. So wie es aussieht, müssen wir abwarten, bis wir über einen Hinweis stolpern.

		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	SC_HearedAboutMissingPeople = TRUE;
};
func void DIA_Addon_Lares_PeopleMissing_MIL()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_MIL_15_00"); //Ist die Sache nicht eine Angelegenheit der Miliz?
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_01"); //Die Miliz hat doch nichts drauf, wenn du mich fragst.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_02"); //Die kommen nie dahinter. Die verschwundenen Leute sind wie vom Erdboden verschluckt.
};
func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_00"); //Ich weiß, wo die vermissten Leute geblieben sind!
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_01"); //(verwundert) Ach.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_02"); //Der ehemalige Erzbaron Raven hat sie verschleppen lassen.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_03"); //Bist du sicher? Dann müssen wir sie da raus holen.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_04"); //Ich arbeite dran.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_05"); //Na gut. Aber du weißt ja, wenn du meine Hilfe gebrauchen kannst ...
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_06"); //... dann weiß ich, wo ich dich finde. Schon klar.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_SAVED ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_SAVED_15_00"); //Ich habe einige vermisste Leute retten können.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_SAVED_09_01"); //Ich hab gewusst, dass du es schaffen würdest. Dann kann ich mich jetzt ja endlich um meinen eigenen Kram kümmern.
	B_GivePlayerXP (XP_Ambient);
	Lares_PeopleMissing_PERM = TRUE;
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};



// ************************************************************
// 								Hilfe
// ************************************************************
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung;
// ------------------------------------------------------------
instance DIA_Addon_Lares_RangerHelp		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_RangerHelp_Condition;
	information	= DIA_Addon_Lares_RangerHelp_Info;
	permanent	= TRUE;
	description	= "Ich brauche deine Hilfe.";
};
func int DIA_Addon_Lares_RangerHelp_Condition ()
{
	if 
	(
		   (Lares_RangerHelp == TRUE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	)
	|| (Npc_IsInState (Moe, ZS_Attack))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_RangerHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RangerHelp_15_00"); //Ich brauche deine Hilfe.
	AI_Output	(self, other, "DIA_Addon_Lares_RangerHelp_09_01"); //Und was genau schwebt dir da vor?
	
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice (DIA_Addon_Lares_RangerHelp, DIALOG_BACK, DIA_Addon_Lares_RangerHelp_nix );
	
	if (Npc_IsInState (Moe, ZS_Attack))
	{
		Info_AddChoice (DIA_Addon_Lares_RangerHelp, "Dieser Typ da belästigt mich!", DIA_Addon_Lares_RangerHelp_Moe);
	};
		
	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Ich brauche eine bessere Waffe.", DIA_Addon_Lares_RangerHelp_waffe );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Wie wär's mit 'ner besseren Rüstung?", DIA_Addon_Lares_RangerHelp_ruestung );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Ich brauche Geld.", DIA_Addon_Lares_RangerHelp_geld );
	};
};
func void DIA_Addon_Lares_RangerHelp_ruestung ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_00"); //Wie wär's mit 'ner besseren Rüstung?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_01"); //Mmh. Ich glaube, Matteo verkauft Rüstungen. Aber er will sicher 'ne Menge Geld dafür sehen.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_02"); //Allerdings könntest du billiger rankommen, wenn du kein Problem damit hast, dich ein bisschen mit der Miliz anzulegen ...
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_03"); //Wie meinst du das?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_04"); //Neben Matteos Haus ist ein Lagerplatz. Aber die Waren wurden alle von der Miliz beschlagnahmt.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_05"); //Geh zu Zuris am Marktplatz und besorg dir einen Schlafzauber. Damit legst du die Wache schlafen.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_06"); //Ich bin mir sicher, dass du in Matteos Lager eine brauchbare Rüstung finden wirst ...
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_waffe_15_00"); //Ich brauche eine bessere Waffe.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_waffe_09_01"); //Damit kann ich dir leider nicht dienen. Hast du es schon mal am Marktplatz versucht?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_geld ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_geld_15_00"); //Ich brauche Geld.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_01"); //Das brauchen wir alle. Soll heißen, ich kann dir nichts geben. Aber Lehmar, der Geldverleiher, schuldet mir noch einen Gefallen.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_02"); //Geh zu ihm und leih dir das Geld, das du brauchst. Den Rest regle ich dann schon. Du findest Lehmar im Hafenviertel an der Grenze zur Unterstadt.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld = TRUE;
	RangerHelp_LehmarKohle = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
};
func void DIA_Addon_Lares_RangerHelp_nix ()
{
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
};
// ------------------------------------------------------------
// Moe
// ------------------------------------------------------------
func void DIA_Addon_Lares_RangerHelp_Moe()
{
	AI_Output (other, self, "DIA_Addon_Lares_Moe_15_00"); //Dieser Typ da belästigt mich ...
	AI_Output (self, other, "DIA_Addon_Lares_Moe_09_01"); //Das haben wir gleich ...
	Info_ClearChoices (DIA_Addon_Lares_RangerHelp);
	AI_StopProcessInfos (self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Moe, AR_GuardStopsFight, 0);
};



// ************************************************************
// ***														***
// 							Gothic II
// ***														***
// ************************************************************



// ************************************************************
// 			  			Paladine und GILDE
// ************************************************************
// ------------------------------------------------------------
// Paladine
// ------------------------------------------------------------
instance DIA_Lares_Paladine	(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	4;
	condition	 = 	DIA_Lares_Paladine_Condition;
	information	 = 	DIA_Lares_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"Ich muss unbedingt mit den Paladinen reden!";
};
func int DIA_Lares_Paladine_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Lares_Paladine_15_00"); //Ich muss unbedingt mit den Paladinen reden!
	AI_Output (self, other, "DIA_Lares_Paladine_09_01"); //Was willst du denn von DENEN?
	AI_Output (other, self, "DIA_Lares_Paladine_15_02"); //Sie haben ein mächtiges Amulett, das Auge Innos'. Ich muss es haben.
	AI_Output (self, other, "DIA_Lares_Paladine_09_03"); //Und du denkst, sie werden es dir geben? Du kommst ja nicht mal ins obere Viertel.
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		AI_Output (other, self, "DIA_Lares_Paladine_15_04"); //Ich werde schon einen Weg finden.
		AI_Output (self, other, "DIA_Lares_Paladine_09_05"); //Klar, wenn du dich bei den Bürgern einschmeicheln oder Laufbursche für die Miliz spielen willst ...
	};
	
	//AI_Output (other, self, "DIA_Lares_Alternative_15_00"); //Hab' ich eine Alternative?
	//AI_Output (self, other, "DIA_Lares_Alternative_09_01"); //Wenn ich du wäre, würde ich zu Onars Hof gehen und mit Lee reden.
	//AI_Output (self, other, "DIA_Lares_Alternative_09_02"); //Ich bin mir sicher, wir finden einem Weg, dich ins obere Viertel zu bringen.
};	

// ------------------------------------------------------------
// 			  			Warum Paladine hier?
// ------------------------------------------------------------
instance DIA_Lares_WhyPalHere		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	4;
	condition	 = 	DIA_Lares_WhyPalHere_Condition;
	information	 = 	DIA_Lares_WhyPalHere_Info;
	permanent    =  FALSE;
	description	 = 	"Weißt du, warum die Paladine hier sind?";
};
func int DIA_Lares_WhyPalHere_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		if (Npc_KnowsInfo (other, DIA_Lares_Paladine))
		|| (RangerHelp_gildeMIL == TRUE)
		|| (RangerHelp_gildeSLD == TRUE)
		|| (RangerHelp_gildeKDF == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Lares_WhyPalHere_Info ()
{
	AI_Output (other, self, "DIA_Lares_WhyPalHere_15_00"); //Weißt du, warum die Paladine hier sind?
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_01"); //Das weiß keiner so genau ... Viele denken, es wäre wegen der Orks, aber ich denke, es gibt einen anderen Grund.
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_02"); //Hat wahrscheinlich was mit der alten Strafkolonie zu tun.
};	

// ------------------------------------------------------------
// 			  			Guild Bypass
// ------------------------------------------------------------
instance DIA_Addon_Lares_Gilde (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Lares_Gilde_Condition;
	information	 = 	DIA_Addon_Lares_Gilde_Info;
	permanent    =  TRUE;
	description	 = 	"Vatras sagte, du könntest mir helfen, mich einer Gemeinschaft anzuschließen.";
};
func int DIA_Addon_Lares_Gilde_Condition ()
{	
	if (Lares_RangerHelp == TRUE)
	&& (other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Gilde_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_15_00"); //Vatras sagte, du könntest mir helfen, mich einer Gemeinschaft anzuschließen.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_01"); //(lacht) Keine Lust, den Leuten ihren Arsch hinterher zu tragen, was?
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_02"); //Alles klar. Ich verstehe, was du meinst.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_03"); //Ich kann meinen Einfluss bei den Söldnern geltend machen, wenn du dich Lee anschließen willst.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_04"); //Sicher werden wir auch einen Weg finden, dich schnell im Kloster unterzubringen.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_05"); //Aber das Einfachste ist es sicherlich, wenn du dich der Miliz anschließt.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_06"); //Welche Gemeinschaft ist dir lieber?
		
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Ich denk' nochmal drüber nach...", DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Die Feuermagier.", DIA_Addon_Lares_Gilde_KDF );
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Die Söldner.", DIA_Addon_Lares_Gilde_SLD );	
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Die Miliz.", DIA_Addon_Lares_Gilde_MIL );
};
func void DIA_Addon_Lares_Gilde_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_BACK_15_00"); //Ich denk' nochmal drüber nach ...
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_SLD ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_SLD_15_00"); //Die Söldner.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_01"); //Ich bin mir sicher, dass Lee dich aufnehmen wird.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_01"); //Aber du mußt zuerst eine Probe bestehen.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_02"); //Rede am besten mal mit Cord auf Onars Hof.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_02"); //Er kann dir bei deiner Prüfung helfen.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_03"); //Sag ihm, dass du 'unter meinem Flügel wohnst'. Er wird dann schon verstehen.
	RangerHelp_gildeSLD = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpSLD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Lares meinte, dass mir der Söldner Cord das Leben auf dem Hof des Grossbauern erleichtern kann."); 
	
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_MIL_15_00"); //Die Miliz.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_01"); //(amüsiert) Ja. Das kann ich mir vorstellen, dass dir das Gefallen würde, was? Anderen Leuten die Gesetze vorlesen, während du dir ihre Börse einsackst.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_02"); //Die Paladine haben am Hafen ihr Proviantlager aufgeschlagen. Der Proviantmeister dort ist ein guter Freund von mir.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_03"); //Vielleicht kann er ja etwas für dich tun. Sein Name ist Martin.

	Log_CreateTopic (TOPIC_Addon_RangerHelpMIL, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Lares meinte, dass mir der Proviantmeister Martin helfen wird, schneller bei der Miliz aufgenommen zu werden. Er ist meistens am Hafen, dort wo die Paladine ihr Proviantlager haben."); 
	
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_KDF ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_KDF_15_00"); //Die Feuermagier.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_01"); //(lacht) Ich schätze, damit hatte Vatras nicht gerechnet. Sonst hätte er dich gar nicht erst zu mir geschickt.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_02"); //Wenn du ins Kloster willst, dann wird das teuer.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_03"); //Die Jungs lassen dich gar nicht erst rein, wenn du ihnen nicht einen Tribut zahlst.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_04"); //Und der Einzige, der daran was ändern könnte, ist Vatras selbst. Sprich am Besten noch mal mit ihm darüber.

	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Lares meinte, dass Vatras einen günstigen Weg kennt, ins Kloster zu kommen."); 

	RangerHelp_gildeKDF = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};


// ------------------------------------------------------------
// 			  					About Sld
// ------------------------------------------------------------
var int Lares_WorkForLee;
var int Lares_WayToOnar;
// ------------------------------------------------------------
instance DIA_Lares_AboutSld (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	10;
	condition	 = 	DIA_Lares_AboutSld_Condition;
	information	 = 	DIA_Lares_AboutSld_Info;
	permanent    =  TRUE;
	description	 = 	"Erzähl mir mehr über Lee und seine Söldner...";
};
func int DIA_Lares_AboutSld_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Lares_WayToOnar == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_AboutSld_Info ()
{
	AI_Output (other,self,  "DIA_ADDON_Lares_AboutSld_15_00"); //Erzähl mir mehr über Lee und seine Söldner ...
	AI_Output (self, other, "DIA_ADDON_Lares_AboutSld_09_01"); //Was willst du wissen?
	
	Info_ClearChoices (DIA_Lares_AboutSld);
	Info_AddChoice (DIA_Lares_AboutSld, DIALOG_BACK, DIA_Lares_AboutSld_BACK);
	Info_AddChoice (DIA_Lares_AboutSld, "Warum bist DU nicht bei Lee und seinen Söldnern?", DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice (DIA_Lares_AboutSld, "Erzähl mir mehr über die Söldner...", DIA_Lares_AboutSld_Sld);
	Info_AddChoice (DIA_Lares_AboutSld, "Wie komme ich zum Hof des Großbauern?", DIA_Lares_AboutSld_WayToOnar); 
};
func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices (DIA_Lares_AboutSld);
};
func void DIA_Lares_AboutSld_Sld()
{	
	AI_Output (other,self,  "DIA_Lares_AboutSld_15_00"); //Erzähl mir mehr über die Söldner.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_01"); //Also wenn du noch so 'n harter Junge bist wie damals, solltest du mit ihnen keine Probleme haben.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_02"); //Die meisten von ihnen sind Raufbolde und wer sich nicht durchsetzen kann, kommt auch nicht weit.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_03"); //(lacht) Wenn du zart besaitet bist, hast du keine Chance, bei ihnen zu landen ...
};	
func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output (other, self, "DIA_Lares_WhyInCity_15_00"); //Warum bist DU nicht bei Lee und seinen Söldnern?
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_01"); //Bin ich doch! Nur eben nicht auf dem Hof.
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_02"); //Ich bin sozusagen unser Vorposten in der Stadt. Wir wollen ja schließlich nicht, dass das Schiff ohne uns abfährt.
	//AI_Output (self, other, "DIA_Lares_WhyInCity_09_03"); //Warum bist DU in die Stadt gekommen?
	Lares_WorkForLee = TRUE;
	
	Info_AddChoice (DIA_Lares_AboutSld, "Von welchem Schiff hast du geredet?", DIA_Lares_AboutSld_Schiff);
};
func void DIA_Lares_AboutSld_Schiff()
{	
	AI_Output (other,self , "DIA_Lares_Schiff_15_00"); //Von welchem Schiff hast du geredet?
	AI_Output (self, other, "DIA_Lares_Schiff_09_01"); //Es liegt am Hochseehafen, hinter den Felsen. Lee und ein paar von seinen Leuten wollen unbedingt hier weg.
	AI_Output (self, other, "DIA_Lares_Schiff_09_02"); //Aber das kann noch dauern ...
	AI_Output (other,self , "DIA_Lares_Schiff_15_03"); //Warum?
	AI_Output (self, other, "DIA_Lares_Schiff_09_04"); //Das fragst du am besten Lee, wenn du ihn triffst ... Er hat Pläne...
};
func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output (other,self, "DIA_Lares_WegZumHof_15_00"); //Wie komme ich zum Hof des Großbauern?
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_00"); //Es ist ganz einfach. Du gehst aus dem Osttor der Hafenstadt und dann immer auf dem Weg in Richtung Osten.
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_01"); //Ich kann dich hinbringen, wenn du willst.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_01"); //Ich kann dich hinbringen, wenn du willst. Hab sowieso schon zu lange hier rumgehangen.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_02"); //Hier im Hafen gibt es zwar für gewöhnlich keine Miliz, aber ich muss ja nicht riskieren, dass einer von ihnen Verdacht schöpft ...
	Lares_WayToOnar = TRUE;
};	



// ************************************************************
// 			  			GuildOfThieves
// ************************************************************
// ------------------------------------------------------------
// About Thieves
// ------------------------------------------------------------
instance DIA_Lares_GuildOfThieves (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	14;
	condition	 = 	DIA_Lares_GuildOfThieves_Condition;
	information	 = 	DIA_Lares_GuildOfThieves_Info;
	permanent    =  FALSE;
	description	 = 	"Weißt du etwas über eine Diebesgilde in der Stadt?";
};
func int DIA_Lares_GuildOfThieves_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Lares_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Lares_GuildOfThieves_15_00"); //Weißt du etwas über eine Diebesgilde in der Stadt?
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_01"); //Du kannst Fragen stellen ...
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_02"); //Natürlich gibt es eine Diebesgilde hier. Wie in jeder größeren Stadt.
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_03"); //Und jeder kleine Taschendieb oder Hehler hängt wahrscheinlich irgendwie mit drin.
};	
// ------------------------------------------------------------
// Wo finden?
// ------------------------------------------------------------
instance DIA_Lares_WhereGuildOfThieves (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	15;
	condition	 = 	DIA_Lares_WhereGuildOfThieves_Condition;
	information	 = 	DIA_Lares_WhereGuildOfThieves_Info;
	permanent    =  FALSE;
	description	 = 	"Weißt du, wo ich die Diebesgilde finden kann? ";
};
func int DIA_Lares_WhereGuildOfThieves_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_GuildOfThieves))
	&& (DG_gefunden == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_WhereGuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Lares_WhereGuildOfThieves_15_00"); //Weißt du, wo ich die Diebesgilde finden kann?
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_01"); //(lacht) Nichts gegen dich, aber wenn ich es wüsste, würde ich es dir nicht sagen.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_02"); //Diese Leute reagieren für gewöhnlich SEHR empfindlich auf so was.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_03"); //Wenn du dich mit ihnen einlassen willst, wäre ich sehr vorsichtig.
};
// ------------------------------------------------------------
// Meersalz Schlüssel
// ------------------------------------------------------------
instance DIA_Lares_GotKey (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	16;
	condition	 = 	DIA_Lares_GotKey_Condition;
	information	 = 	DIA_Lares_GotKey_Info;
	permanent    =  FALSE;
	description	 = 	"Ich habe hier diesen vom Meersalz zerfressenen Schlüssel ...";
};
func int DIA_Lares_GotKey_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_WhereGuildOfThieves))
	&& (Npc_HasItems (other, ItKe_ThiefGuildKey_MIS))
	&& (DG_gefunden == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_GotKey_Info ()
{
	AI_Output (other, self, "DIA_Lares_GotKey_15_00"); //Ich habe hier diesen vom Meersalz zerfressenen Schlüssel ...
	AI_Output (self, other, "DIA_Lares_GotKey_09_01"); //Und?
	AI_Output (other,self, "DIA_Lares_GotKey_15_02"); //Ich denke, er wird mich zum Versteck der Diebesgilde führen ...
	AI_Output (self, other, "DIA_Lares_GotKey_09_03"); //Tja, es könnte der Schlüssel zur Kanalisation sein.
};
// ------------------------------------------------------------
// Kanalisation
// ------------------------------------------------------------
instance DIA_Lares_Kanalisation (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	17;
	condition	 = 	DIA_Lares_Kanalisation_Condition;
	information	 = 	DIA_Lares_Kanalisation_Info;
	permanent    =  FALSE;
	description	 = 	"Wo finde ich die Kanalisation?";
};
func int DIA_Lares_Kanalisation_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_GotKey))
	&& (DG_gefunden == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_Kanalisation_Info ()
{
	AI_Output (other,self, "DIA_Lares_Kanalisation_15_00"); //Wo finde ich die Kanalisation?
	AI_Output (self, other, "DIA_Lares_Kanalisation_09_01"); //Was weiß ich ... sie endet für gewöhnlich im Meer.
};

// ************************************************************
// 		  			Important für andere Gilden
// ************************************************************
instance DIA_Lares_OtherGuild (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	1;
	condition	 = 	DIA_Lares_OtherGuild_Condition;
	information	 = 	DIA_Lares_OtherGuild_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lares_OtherGuild_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (other.guild != GIL_NONE)
	&& (SC_IsRanger == FALSE)//ADDON
	{
		return TRUE;
	};
};
func void DIA_Lares_OtherGuild_Info ()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_00"); //Du bist jetzt bei der Miliz!
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_01"); //(lacht) Ich lach' mich tot - ein ehemaliger Sträfling bei der Miliz ...
		}
		else //GIL_PAL
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_02"); //Du bist jetzt also ein Paladin des Königs!
		};
	
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_03"); //(verschmitzt) So was kannst auch nur du bringen ...
	
		if (Lares_WorkForLee == TRUE)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_04"); //(besorgt) Du wirst doch nicht verpfeifen, dass ich für Lee arbeite, oder?
			AI_Output (other,self , "DIA_Lares_OtherGuild_15_05"); //Du kennst mich doch ...
		};
	};
	
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_06"); //Ich fasse es nicht. Du bist ins Kloster gegangen. Wie ist es da?
		AI_Output (other,self , "DIA_Lares_OtherGuild_15_07"); //Anders.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_08"); //Kann ich mir denken.
	};
		
	if (other.guild == GIL_SLD) 
	|| (other.guild == GIL_DJG)
	{
		//AI_Output (self, other, "DIA_Lares_OtherGuild_09_09"); //Ich hab gehört, du bist aufgenommen worden.
		AI_Output (self, other, "DIA_Addon_Lares_OtherGuild_09_00"); //Ich hab gehört, du bist bei Lee aufgenommen worden.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_10"); //Gratuliere.
	};
};



// ************************************************************
// ***														***
// 							Die Latscherei
// ***														***
// ************************************************************
instance DIA_Addon_Lares_Forest (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	9;
	condition	 = 	DIA_Addon_Lares_Forest_Condition;
	information	 = 	DIA_Addon_Lares_Forest_Info;

	description	 = 	"Kannst du mir helfen durch den dichten Wald im Osten zu kommen?";
};
func int DIA_Addon_Lares_Forest_Condition ()
{	
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Forest_info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_00"); //Kannst du mir helfen, durch den dichten Wald im Osten zu kommen?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_01"); //Ok? Aber, was willst du da?
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_02"); //Ich bekam von Nefarius den Auftrag, nach weiteren Ornamenten zu suchen.
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_03"); //Eine Stelle, an der ich suchen soll, ist mitten in dem Wald.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_04"); //Ich verstehe schon. Der ist dir alleine noch zu gefährlich, was?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_05"); //Kein Problem. Sag mir, wann du los willst.

	RangerHelp_OrnamentForest = TRUE;
};


// ------------------------------------------------------------
// Lass uns gehen...
// ------------------------------------------------------------
instance DIA_Lares_GoNow (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	10;
	condition	 = 	DIA_Lares_GoNow_Condition;
	information	 = 	DIA_Lares_GoNow_Info;
	permanent    =  TRUE;
	description	 = 	"Okay, lass uns gehen.";
};
func int DIA_Lares_GoNow_Condition ()
{	
	if (
		(Lares_WayToOnar == TRUE)
	 	|| (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	 	|| (RangerHelp_OrnamentForest == TRUE)
	 	)
	 	&& ((LaresGuide_ZumPortal == 0)||(LaresGuide_ZumPortal == 8))
	 	&& ((LaresGuide_ZuOnar == FALSE) || (LaresGuide_ZuOnar == LOG_SUCCESS))
	 	&& ((LaresGuide_OrnamentForest == 0)||(LaresGuide_OrnamentForest == 3))
		&& (Kapitel < 3)
			{
				return TRUE;
			};
};

func void DIA_Lares_GoNow_GoingConditions ()
{	
 	AI_Output (self, other, "DIA_Lares_GoNow_09_01"); //Dann wollen wir mal ... Folge mir.
	AI_StopProcessInfos (self);
	
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	if (Npc_KnowsInfo (other, DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk (Moe,30);
	};
};

func void DIA_Lares_GoNow_Info ()
{
	AI_Output (other, self, "DIA_Lares_GoNow_15_00"); //Okay, lass uns gehen.
	
	if (Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_03"); //So lange mich hier keiner ablöst oder wir mehr über die Vermissten wissen, kann ich hier nicht weg.
	}
	else if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING) //bleibt am Hafen während RangerMeeting
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
			AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_04"); //Wohin?
			
			
			Info_ClearChoices	(DIA_Lares_GoNow);
			Info_AddChoice	(DIA_Lares_GoNow, DIALOG_BACK, DIA_Lares_GoNow_warte );
		
			if (Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS)
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Zu Onars Hof.", DIA_Lares_GoNow_Onar );
			};
		
			if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) && (Lares_Angekommen == FALSE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Lass uns Vatras' Ornament zurück bringen.", DIA_Lares_GoNow_Maya );
			};
			
			if ((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "In den dichten Wald im Osten.", DIA_Lares_GoNow_Forest );
			};
	};		
};

func void DIA_Lares_GoNow_Maya ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Maya_15_00"); //Lass uns Vatras' Ornament zurück bringen.
	LaresGuide_ZumPortal = 1;
	Npc_ExchangeRoutine (self, "GUIDEPORTALTEMPEL1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Onar ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Onar_15_00"); //Zu Onars Hof.
	LaresGuide_ZuOnar = TRUE;
	Npc_ExchangeRoutine (self, "GUIDE");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Forest ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Forest_15_00"); //In den dichten Wald im Osten.
	LaresGuide_OrnamentForest = 1;
	Npc_ExchangeRoutine (self, "GUIDEMEDIUMWALD1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_warte ()
{
	Info_ClearChoices	(DIA_Lares_GoNow);
};

// ************************************************************
// 			  					Angekommen 
// ************************************************************
instance DIA_Lares_GUIDE		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	1;
	condition	 = 	DIA_Lares_GUIDE_Condition;
	information	 = 	DIA_Lares_GUIDE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lares_GUIDE_Condition ()
{	
	if (LaresGuide_ZuOnar == TRUE)
	&& Hlp_StrCmp 	 (Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05")
	{
		return TRUE;
	};
};
func void DIA_Lares_GUIDE_Info ()
{
	if Lares_Guide > (Wld_GetDay()-2)
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_00"); //So, wir sind da.
	}
	else
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_01"); //Kommst du auch noch? Ich dachte schon, du hättest dich von den Wölfen fressen lassen.
	};
	AI_Output (self, other, "DIA_Lares_GUIDE_09_02"); //So, den Rest des Weges wirst du alleine zurücklegen. Ich muss zurück in die Stadt, hab noch ein paar Sachen zu erledigen ...
	AI_Output (self, other, "DIA_Lares_GUIDE_09_03"); //Folge einfach dem Weg hier, und denk daran - setz dich durch und lass dir nichts gefallen, dann läuft schon alles glatt.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	Npc_ExchangeRoutine (self,"START");
	LaresGuide_ZuOnar = LOG_SUCCESS; //Joly: schluss mit Onar guide
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter1		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInter1_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInter1_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInter1_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11")
	&& (LaresGuide_ZumPortal == 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInter1_Info ()
{
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_00"); //Jetzt, wo wir außerhalb der Stadt sind und uns keiner zuhört, kann ich dir ja mal ein paar Takte erzählen.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_01"); //Dieses Ornament, das du mir gebracht hast, werden wir nun zurück zu Saturas bringen. Du kannst dich doch sicherlich an Saturas erinnern?
	
	
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Sicher.", DIA_Addon_Lares_ArrivedPortalInter1_ja );
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Saturas? Wer ist das?", DIA_Addon_Lares_ArrivedPortalInter1_wer );

	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2 ()
{
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00"); //Wir Jungs aus dem ehemaligen neuen Lager unterhalten mit den Wassermagiern immer noch gute Beziehungen.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01"); //Selbst Lee würde die Wassermagier auch heute gegen jegliche Gefahr schützen, wenn es in seiner Macht steht.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02"); //Damit wir immer Kontakt halten mit den Wassermagiern bin ich die meiste Zeit in der Stadt und arbeite mit Vatras zusammen.
	B_MakeRangerReadyForMeeting (self);
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03"); //Und das hier ist die Rüstung, die jeder von uns von den Wassermagiern bekommt. Der Ring des Wassers trägt solche Rüstungen schon seit der Zeit vor den Orkkriegen.
	
	if (Cavalorn_RangerHint == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04"); //Was hat Cavalorn damit zu tun? Soviel ich noch weiß, war er kein Anhänger des neuen Lagers.
		AI_Output (self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05"); //Du hast Recht, unsere Gemeinschaft ist gewachsen. Selbst ich weiß nicht, wie viele es mittlerweile sind.
	};

	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06"); //Aber lass uns jetzt weiter gehen. Ich will erst mal weiter von der Stadt weg. Wir können uns später noch darüber unterhalten.
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00"); //Saturas? Wer ist das?
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01"); //Na, der oberste Wassermagier im neuen Lager. Damals im Minental, als die Barriere uns noch alle eingeschlossen hatte.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02"); //Lee und ich hatten damals einen Pakt mit den Wassermagiern geschlossen und haben uns mit gemeinsamen Kräften gegen das alte Lager behaupten können.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00"); //Sicher. Er war der oberste Wassermagier im neuen Lager.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02")
	&& (LaresGuide_ZumPortal == 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00"); //Was ist los? Geht's noch?
	
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
	&& ((Npc_GetDistToWP(Erol,"NW_TAVERN_TO_FOREST_03")<1000))
	&& ((Npc_IsDead(Erol))==FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01"); //Der Kerl da drüben hat Probleme mit Banditen.
		AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02"); //(abfällig) Das ist ja toll, aber dafür haben wir jetzt keine Zeit.
	};
	
	LaresGuide_ZumPortal = 3;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter2		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14")
	&& (LaresGuide_ZumPortal == 3)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00"); //Mach mir jetzt nicht schlapp.
	LaresGuide_ZumPortal = 4;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter2		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInter2_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInter2_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58")
	&& (LaresGuide_ZumPortal == 4)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInter2_Info ()
{
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_00"); //Die Wassermagier sind völlig aus dem Häuschen. Seit Wochen schon buddeln sie an einer Ausgrabungsstelle im Nordosten. Weiß der Geier, was sie denken, dort zu finden.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_01"); //Alles fing damit an, dass die Erde bebte wie in den schlimmsten Zeiten der Barriere.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_02"); //Grauenhafte Steinwesen entstiegen der Erde und fegten alles aus dieser Welt, was sich näher als 100 Schritt an sie heran wagte.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_03"); //Die Wassermagier nahmen sich der Sache an und vernichteten die feindseligen Eindringlinge. Und nun buddeln sie da unten und suchen nach einer Erklärung für diese seltsamen Vorkommnisse.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_04"); //Aber das wirst du ja bald selbst sehen.

	LaresGuide_ZumPortal = 5;
	B_LogEntry (TOPIC_Addon_KDW,"Lares erzählte mir von der Ausgrabungsstelle der Wassermagier. Sie untersuchen dort seltsame Ereignisse. Es gibt dort rätselhafte Erdbeben und seltsame Steinwesen sollen der Erde entstiegen sein."); 
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter3
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter3		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) 	
	&& (LaresGuide_ZumPortal == 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00"); //Kannst du noch?
	LaresGuide_ZumPortal = 6;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter4
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter4		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02")
	&& (LaresGuide_ZumPortal == 6)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00"); //So. Hier kann's gefährlich werden.
	LaresGuide_ZumPortal = 7;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortal		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortal_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortal_Info;
	important	 = 	TRUE;

};
func int DIA_Addon_Lares_ArrivedPortal_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41")
	&& (LaresGuide_ZumPortal == 7)
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_ArrivedPortal_Info ()
{
	B_MakeRangerReadyToLeaveMeeting (self);
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_00"); //Wir sind da.
 	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_01"); //Hier, nimm das Ornament. Irgendwo da drin müssen die Wassermagier sein. Bring es zu ihnen.
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);					
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_02"); //Wenn du in dem Erdloch da unten auf irgendwelche Viecher triffst, von denen du glaubst, dass du ihnen nicht gewachsen bist, dann ergreif am Besten die Flucht nach vorn bis hin zu Saturas.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_03"); //Er wird sich schon um die Biester kümmern. Ich muss zurück.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_04"); //Und eins noch: Lass dir nicht einfallen, mit dem Ornament hier in der Gegend rumzuwandern. Geh DIREKT zu Saturas.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_05"); //Wir sehen uns.
	
	B_LogEntry (TOPIC_Addon_KDW,"Ich habe das Ornament von Lares in die Hand gedrückt bekommen. Ich soll es dem Wassermagier Saturas übergeben."); 
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"START");
	LaresGuide_ZumPortal = 8; //Joly: schluss mit guide Portal
	
	Lares_Angekommen = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	ALBERN
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Albern	(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 1;
	condition	= DIA_Addon_Lares_Albern_Condition;
	information	= DIA_Addon_Lares_Albern_Info;
	important	= TRUE;
};
func int DIA_Addon_Lares_Albern_Condition ()
{
	if (Lares_Angekommen == TRUE)
	&& (Npc_GetDistToWP (self, "NW_TROLLAREA_RUINS_41") > 1000)
	&& (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Albern_Info()
{
	AI_Output (self, other, "DIA_Addon_Lares_Albern_09_00"); //(streng) Hör auf, hier rumzualbern! Bring das Ornament zu Saturas!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GOFORESTPRE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFORESTPRE		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_GOFORESTPRE_Condition;
	information	 = 	DIA_Addon_Lares_GOFORESTPRE_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_GOFORESTPRE_Condition ()
{
	if Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") 
	&& (LaresGuide_OrnamentForest == 1)
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_GOFORESTPRE_ja ()
{
	B_MakeRangerReadyForMeeting (self);
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_ja_15_00"); //Ja.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_ja_09_01"); //Gut, mein Freund. Dann folge mir. Jetzt wird´s ekelig.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2; 
};
func void DIA_Addon_Lares_GOFORESTPRE_nein ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_nein_15_00"); //Nein. Du kannst wieder gehen.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_nein_09_01"); //Ich schätze, die Sache hat sich erledigt, was? Alles klar. Wir sehen uns.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"Start");
	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit Guide
};

func void DIA_Addon_Lares_GOFORESTPRE_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_00"); //Willst du immer noch mit mir in den Wald gehen?
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_01"); //Hast du dir das mit dem Wald auch gut überlegt? Willst du da wirklich rein?
 	};
	Info_ClearChoices	(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "Nein. Du kannst wieder gehen.", DIA_Addon_Lares_GOFORESTPRE_nein );
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "Ja.", DIA_Addon_Lares_GOFORESTPRE_ja );
};


///////////////////////////////////////////////////////////////////////
//	Info GOFOREST
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFOREST		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_GOFOREST_Condition;
	information	 = 	DIA_Addon_Lares_GOFOREST_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Lares_GOFOREST_Condition ()
{
	if Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_FOREST_PATH_62") 
	&& (LaresGuide_OrnamentForest == 2)
	&& (Npc_IsDead(Stoneguardian_Ornament))
	{
		if (ORNAMENT_SWITCHED_FOREST == FALSE)
		&& (Npc_IsInState (self,ZS_Talk))
			{
				return TRUE;
			};	
		if (ORNAMENT_SWITCHED_FOREST == TRUE)
			{
				return TRUE;
			};
	};
};

func void DIA_Addon_Lares_GOFOREST_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{	
		B_MakeRangerReadyToLeaveMeeting (self);
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_00"); //So. Den Rest wirst du hoffentlich alleine schaffen. Ich geh dann wieder.
	 	AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine (self,"START");
	 	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit guide Forest!
 	}
 	else
 	{
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_01"); //Mach schnell. Ich will hier so schnell wie möglich wieder weg.
	 	AI_StopProcessInfos (self);
 	};
};

///////////////////////////////////////////////////////////////////////
//	Info PortalInterWEITER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_PortalInterWEITER		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_PortalInterWEITER_Condition;
	information	 = 	DIA_Addon_Lares_PortalInterWEITER_Info;
	permanent	 = 	TRUE;

	description	 = 	"Lass uns weiter gehen.";
};

func int DIA_Addon_Lares_PortalInterWEITER_Condition ()
{
	if (LaresGuide_ZumPortal != 0)
	&& (LaresGuide_ZumPortal != 8)//Joly: schluss mit guide Portal
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_PortalInterWEITER_Info ()
{
	if (LaresGuide_ZumPortal == 4)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_00"); //Quatsch nicht so viel.
	}
	else if (LaresGuide_ZumPortal == 6)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_01"); //(genervt) Ja, ja.
	};

	AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_02"); //Lass uns weiter gehen.
	
	if (LaresGuide_ZumPortal == 7)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_03"); //Halt dich ein bisschen zurück.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_04"); //Bleib dicht hinter mir.
	};
		
	AI_StopProcessInfos (self);

	if (LaresGuide_ZumPortal == 2)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL2");
	}
	else if	(LaresGuide_ZumPortal == 3)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL3");
	}
	else if	(LaresGuide_ZumPortal == 4)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL4");
	}
	else if	(LaresGuide_ZumPortal == 5)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL5");
	}
	else if	(LaresGuide_ZumPortal == 6)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL6");
	}
	else if	(LaresGuide_ZumPortal == 7)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPELEND");
	};
};

// ************************************************************
// 			  				  LEHRER
// ************************************************************
// ------------------------------------------------------------
// Wanna Learn
// ------------------------------------------------------------
instance DIA_Lares_DEX		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	20;
	condition	 = 	DIA_Lares_DEX_Condition;
	information	 = 	DIA_Lares_DEX_Info;
	permanent 	 =  FALSE;
	description	 = 	"Kannst du mir was beibringen?";
};
func int DIA_Lares_DEX_Condition ()
{	
	return TRUE;
};
func void DIA_Lares_DEX_Info ()
{
	AI_Output (other, self, "DIA_Lares_DEX_15_00"); //Kannst du mir was beibringen?
	AI_Output (self, other, "DIA_Addon_Lares_DEX_Add_09_01"); //Klar. Wenn du willst, helfe ich dir, geschickter und stärker zu werden.

	Lares_TeachDEX = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Lares kann mir dabei helfen, geschickter und stärker zu werden.");
};
// ------------------------------------------------------------
// 			  				   TEACH 
// ------------------------------------------------------------
var int Lares_MerkeDEX;
var int Lares_MerkeSTR;
//-----------------------------------
instance DIA_Lares_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_449_Lares;
	nr			 = 	20;
	condition	 = 	DIA_Lares_TEACH_Condition;
	information	 = 	DIA_Lares_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Bring mir was bei.";
};
func int DIA_Lares_TEACH_Condition ()
{	
	if (Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lares_TEACH_Info ()
{
	//AI_Output (other, self, "DIA_Lares_TEACH_15_00"); //Ich will geschickter werden!
	AI_Output (other,self ,"DIA_Addon_Lares_Teach_15_00"); //Bring mir was bei.
	
	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Lares_MerkeSTR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACH_BACK()
{
	if (other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output (self, other, "DIA_Lares_TEACH_BACK_09_00"); //Du hast schon etwas an Geschicklichkeit gewonnen.
	};
	if (other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_Lares_TEACH_BACK_Add_09_00"); //(abschätzend) Gut. Deine Stärke hat zugenommen.
	};
	
	Info_ClearChoices (DIA_Lares_TEACH);
};
func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACHSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACHSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};


//#################################
//##
//##	Kapitel 2
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap2_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap2_EXIT_Condition;
	information	= DIA_Lares_Kap2_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#################################
//##
//##	Kapitel 3
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap3_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap3_EXIT_Condition;
	information	= DIA_Lares_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		Gibt's was Neues?			 
// ************************************************************
INSTANCE DIA_Lares_AnyNews(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 5;
	condition	= DIA_Lares_AnyNews_Condition;
	information	= DIA_Lares_AnyNews_Info;
	permanent	= TRUE;
	description = "Gibt's was Neues?";
};                       
FUNC INT DIA_Lares_AnyNews_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Lares_AnyNews_15_00"); //Gibt's was Neues?
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_01"); //Für die besten Nachrichten bist du ja selbst verantwortlich. Bennet haben sie wieder laufen lassen, er ist schon wieder auf dem Hof.
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_02"); //Geh mal hin, ich denke, er will sich auch noch selbst bei dir bedanken.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_03"); //Das kann mal wohl sagen. Die Paladine haben Bennet, unseren Schmied, verhaftet.
		
		if (MIS_RescueBennet == LOG_RUNNING)
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_04"); //Ich habe bereits davon gehört, schlimme Sache.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_05"); //Das kannst du wohl laut sagen.
		}
		else
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_06"); //Wie ist das passiert?
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_07"); //Bennet war in der Stadt, um Vorräte einzukaufen. Na ja, er ist nicht zurückgekommen.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_08"); //Wenn du Genaueres erfahren willst, frag am besten Hodges, er war mit Bennet in der Stadt.
			
			MIS_RescueBennet = LOG_RUNNING;
		};
	};
};

// ************************************************************
// 		Hast du was von Bennet gehört?			 
// ************************************************************
INSTANCE DIA_Lares_NewsAboutBennet(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 6;
	condition	= DIA_Lares_NewsAboutBennet_Condition;
	information	= DIA_Lares_NewsAboutBennet_Info;
	permanent	= FALSE;
	description = "Hast du was von Bennet gehört?";
};                       
FUNC INT DIA_Lares_NewsAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_NewsAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_00"); //Hast du was von Bennet gehört?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_01"); //Sie haben ihn anscheinend in die Kaserne gebracht und dort in den Kerker geschmissen.
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_02"); //Wie können wir ihn da rausholen?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_03"); //Ich habe noch keine Idee, ich komme nicht bis zu seiner Zelle, um mit ihm zu reden.
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_04"); //Ich kann eigentlich nur die Ohren offen halten, aber hier erfährt man nichts.
};

//#################################
//##
//##	Kapitel 4
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap4_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap4_EXIT_Condition;
	information	= DIA_Lares_Kap4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************
//	Wieso bist du nicht auf Drachenjagd?
//****************************************

INSTANCE DIA_Lares_Kap4_PERM(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 6;
	condition	= DIA_Lares_Kap4_PERM_Condition;
	information	= DIA_Lares_Kap4_PERM_Info;
	permanent	= TRUE;
	description = "Wieso bist du nicht auf der Drachenjagd? ";
};                       
FUNC INT DIA_Lares_Kap4_PERM_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lares_Kap4_PERM_15_00"); //Wieso bist du nicht auf der Drachenjagd?
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_01"); //Das ist nichts für mich, das überlasse ich lieber den anderen.
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_02"); //Nee, nee. Frische Seeluft - das ist es, was ich jetzt brauche.
};

//#################################
//##
//##	Kapitel 5
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap5_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap5_EXIT_Condition;
	information	= DIA_Lares_Kap5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************
//	Lares anheuern
//****************************************************************

///////////////////////////////////////////////////////////////////////
//	Hast du Lust diese Insel zu verlassen?
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lares_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Hast du Lust, diese Insel zu verlassen?";
};
func int DIA_Lares_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lares_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_00"); //Hast du Lust, diese Insel zu verlassen?
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_01"); //Nichts lieber als das, was hast du vor?
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_02"); //Ich habe herausgefunden, wo der Anführer der Drachen sich aufhält. Er ist auf einer Insel, nicht weit von hier.
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_03"); //Ich habe vor, ihm endgültig den Garaus zu machen.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_04"); //Klingt nach 'nem Heidenspaß, wenn du mich brauchen kannst, bin ich dabei.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_05"); //Brauchst du auf deiner Reise noch einen Lehrer für Geschicklichkeit oder Kampf mit der Einhandwaffe?
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lares_KnowWhereEnemy_15_06"); //Das Schiff ist zwar schon voll, aber wenn sich was ergibt, komme ich wieder.
	}
	else 
	{
		Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"Ich kann dich nicht gebrauchen.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"Ich wusste, dass ich mich auf dich verlassen kann.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lares_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_00"); //Ich wusste, dass ich mich auf dich verlassen kann.
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_01"); //Wir treffen uns alle am Schiff.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02"); //Ein Mann der Taten, so hab ich es gern. Wir sehen uns.
	
	Lares_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
};

FUNC VOID DIA_Lares_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_No_15_00"); //Ich weiß dein Angebot zu schätzen, aber ich kann dich nicht gebrauchen.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_No_09_01"); //Du musst wissen, was du willst. Wenn du noch mal darüber reden willst, du weißt ja, wo du mich finden kannst.

	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard	 = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard	 = LOG_FAILED;
	};	
	Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_LeaveMyShip		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_LeaveMyShip_Condition;
	information	 = 	DIA_Lares_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Es ist besser, wenn du nicht mitkommst.";
};
func int DIA_Lares_LeaveMyShip_Condition ()
{	
	if (Lares_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lares_LeaveMyShip_15_00"); //Es ist besser, wenn du nicht mitkommst.
	AI_Output			(self, other, "DIA_Lares_LeaveMyShip_09_01"); //Wie du meinst, aber denk in Zukunft besser vorher nach, wem du welche Zusagen gibst.
	
	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard	 = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard	 = LOG_FAILED;
	};				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_StillNeedYou_Condition;
	information	 = 	DIA_Lares_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Hast du noch Interesse an der Überfahrt?";
};
func int DIA_Lares_StillNeedYou_Condition ()
{	
	if ((Lares_IsOnBOard == LOG_OBSOLETE)		
	|| (Lares_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lares_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lares_StillNeedYou_15_00"); //Hast du noch Interesse an der Überfahrt?
	
	if (Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_01"); //Normalerweise lass ich mich ja nicht so behandeln, aber weil du zu uns gehörst, werde ich noch mal ein Auge zudrücken.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_02"); //Wir sehen uns am Schiff.
		
		Lares_IsOnBoard	 = LOG_SUCCESS;
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
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_03"); //Nimm's nicht persönlich, aber ich glaube, du hattest Recht.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_04"); //Es ist wohl besser, wenn ich hier bleibe.
		
		AI_StopProcessInfos (self);
	};	
};


























