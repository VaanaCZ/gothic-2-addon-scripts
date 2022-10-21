// ************************************************************
// 			Lares Patch 
// ************************************************************
instance DIA_Addon_Lares_Patch		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 99;
	condition	= DIA_Addon_Lares_Patch_Condition;
	information	= DIA_Addon_Lares_Patch_Info;
	description	= "(odzyskaj fragment ornamentu)";
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
	AI_Output	(self, other, "DIA_Addon_Lares_HaltsMaul_09_01"); //Do zobaczenia w porcie.
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
	AI_Output (self, other, "DIA_Lares_HALLO_09_00"); //Chyba oszala�em. Co ty tutaj robisz?
	
	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output (self, other, "DIA_Lares_HALLO_09_01"); //PRZYP�YN��E� tu?
		AI_Output (self, other, "DIA_Lares_HALLO_09_02"); //To niez�y spos�b na omini�cie stra�nik�w przy bramie.
		B_GivePlayerXP (500); //wer's schafft...	
	};
			
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Czy my si� znamy?",DIA_Lares_HALLO_NO);
	Info_AddChoice 		(DIA_Lares_HALLO,"Hej! Lares, ty stary draniu...",DIA_Lares_HALLO_YES);
};
FUNC VOID DIA_Lares_HALLO_NO()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NO_15_00"); //Czy my si� znamy?
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_01"); //Ch�opie, nie pami�tasz mnie? Trzyma�em si� w pobli�u Nowego Obozu.
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_02"); //Cz�owieku, ale by�o fajowo. Pami�tasz Lee?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Oczywi�cie, �e pami�tam Lee!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};
FUNC VOID DIA_Lares_HALLO_YES()
{
	AI_Output (other, self, "DIA_Lares_HALLO_YES_15_00"); //Hej! Lares, ty stary draniu, jak si� tu dosta�e�?
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_01"); //Uda�o mi si� w sam� por� uciec z doliny, razem z Lee i paroma innymi ch�opakami.
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_02"); //Pami�tasz Lee, prawda?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Oczywi�cie, �e pami�tam Lee!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};

// ------------------------------	
	func void B_Lares_AboutLee()
	{
		AI_Output (self, other, "B_Lares_AboutLee_09_00"); //Wi�c wydosta�em si� z nim z Kolonii zaraz po tym, jak Bariera zosta�a zniszczona.
		AI_Output (self, other, "B_Lares_AboutLee_09_01"); //Teraz on i jego ch�opcy s� w gospodarstwie Onara.
		AI_Output (self, other, "B_Lares_AboutLee_09_02"); //Zawar� uk�ad z w�a�cicielem. Lee i jego ch�opaki broni� gospodarstwa, a Onar ich karmi.
	};
// ------------------------------	

FUNC VOID DIA_Lares_HALLO_LEE()
{
	AI_Output (other, self, "DIA_Lares_HALLO_LEE_15_00"); //Oczywi�cie, �e pami�tam Lee!
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};
FUNC VOID DIA_Lares_HALLO_NOIDEA()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NOIDEA_15_00"); //Lee...?
	AI_Output (self, other, "DIA_Lares_HALLO_NOIDEA_09_01"); //Wiele przeszed�e�, co? Lee by� przyw�dc� najemnik�w w Nowym Obozie.
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

	description	= "Vatras mnie przysy�a.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_Vatras_15_00"); //Vatras mnie przysy�a - wspomina�, �e mo�esz mi pom�c.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_01"); //Pozna�e� ju� Vatrasa... Musia�e� zrobi� na nim niema�e wra�enie.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_02"); //Inaczej z pewno�ci� nie poda�by ci mojego imienia - zw�aszcza �e wci�� trzeba rozwi�za� spraw� zaginionych ludzi.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_03"); //Czego ci potrzeba?
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

	description	 = 	"Co ��czy ci� z Vatrasem?";
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
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_00"); //Co ��czy ci� z Vatrasem?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_01"); //Powiedzmy, �e mam pewn� umow� z Magami Wody. Jasne?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_02"); //Jakiego rodzaju umow�?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_03"); //My dla nich pracujemy, a oni dbaj�, aby�my nie mieli k�opot�w przez nasz� przesz�o��.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_04"); //M�wisz teraz o Wodnym Kr�gu, tak?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_05"); //H�? Wiesz o nim?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_06"); //Vatras mi powiedzia�.
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_07"); //Trzeba by�o tak od razu.

	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Lares nale�y do Wodnego Kr�gu." ); 
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

	description	= "Opowiedz mi wi�cej o Wodnym Kr�gu.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_00"); //Opowiedz mi wi�cej o Wodnym Kr�gu.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_01"); //Kr�g jest dla Mag�w Wody tym, czym paladyni s� dla Mag�w Ognia.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_02"); //W odr�nieniu od paladyn�w Kr�g woli jednak pozostawa� w cieniu.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_03"); //Kr�g jest pot�n� broni� w walce z niebezpiecze�stwami zagra�aj�cymi ludno�ci Khorinis.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_04"); //Aby by�o to mo�liwe, nikt z nich nie mo�e jednak wiedzie� o jego istnieniu.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_05"); //Wi�c nic na ten temat nie m�w!
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_06"); //Nie ma sprawy.
	B_LogEntry (TOPIC_Addon_RingOfWater,"Kr�g jest dla Mag�w Wody tym, czym paladyni s� dla Mag�w Ognia, poza tym, �e dzia�a on w tajemnicy. Niewtajemniczeni nie mog� wiedzie�, KTO do niego nale�y, aby nie mo�na by�o pozna� jego prawdziwej si�y." ); 
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

	description	= "Chcia�bym si� przy��czy� do Wodnego Kr�gu.";
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
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_15_00"); //Chcia�bym si� przy��czy� do Wodnego Kr�gu.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_09_01"); //Dobry pomys�, cho� decyzja nale�y do Mag�w Wody.
	
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 


	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Rozumiem.", DIA_Addon_Lares_WannaBeRanger_BACK );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Jak to jest nale�e� do Kr�gu?", DIA_Addon_Lares_WannaBeRanger_HowIsIt );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Jak ci si� uda�o zaimponowa� Magom Wody?", DIA_Addon_Lares_WannaBeRanger_AboutYou );
};
func void DIA_Addon_Lares_WannaBeRanger_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_BACK_15_00"); //Rozumiem.
	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
};
func void DIA_Addon_Lares_WannaBeRanger_AboutYou ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00"); //Jak ci si� uda�o zaimponowa� Magom Wody?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01"); //Chroni�em ich przez d�ugi czas, gdy jeszcze �yli otoczeni Barier�.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02"); //Naprawd� - powinni by� wdzi�czni...
};
func void DIA_Addon_Lares_WannaBeRanger_HowIsIt ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00"); //Jak to jest nale�e� do Kr�gu?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01"); //R�nimy si� od innych gildii z Khorinis.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02"); //Jako jeden z nas nigdy nie musisz robi� czego�, czego nie chcesz.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03"); //Wymagamy tylko jednego - sied� cicho.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04"); //Pracujemy w ukryciu. Obcy nie wiedz�, kto nale�y do Kr�gu.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05"); //Na razie ci� poobserwujemy i potem podejmiemy decyzj�.
};
// ------------------------------------------------------------
// Info RingBack (Bin jetzt dabei)
// ------------------------------------------------------------
func void B_Lares_Geheimtreffen()
{
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_07"); //Wkr�tce odb�dzie si� tajne spotkanie w gospodzie Orlana.
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_08"); //Przyb�d� tam jak najszybciej - tam otrzymasz sprz�t.
};
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_RingBack_Condition;
	information	 = 	DIA_Addon_Lares_RingBack_Info;

	description	 = 	"Jestem ju� cz�onkiem Wodnego Kr�gu.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_00"); //Jestem ju� cz�onkiem Wodnego Kr�gu.
	
	if (Lares_GotRingBack == FALSE) 
	&& (SC_GotLaresRing == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_01"); //Doskonale! Oddasz mi teraz m�j pier�cie� z akwamarynem?
		
		if (B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_02"); //Jasne.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_03"); //Mam nadziej�, �e si� przyda�. Ciesz� si�, �e jeste� ju� jednym z nas.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP (XP_Ambient);
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_04"); //Niestety, nie mam go przy sobie.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_05"); //Tylko go nie zgub! B�dzie mi jeszcze potrzebny.
		};
	};

	AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_06"); //Teraz by� pewnie chcia� nowy ekwipunek? S�uchaj mnie bardzo uwa�nie.
	B_Lares_Geheimtreffen();
	
	B_LogEntry (TOPIC_Addon_RingOfWater, "Lares zaprosi� mnie na sekretne spotkanie Kr�gu w gospodzie Orlana."); 
	
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

	description	= "Oto tw�j pier�cie�.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack2_15_00"); //Oto tw�j pier�cie�.
	B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1);
	AI_Output	(self, other, "DIA_Addon_Lares_RingBack2_09_01"); //Ach... Dobrze. Ju� s�dzi�em, �e go zgubi�e�.
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
	AI_Output	(self, other, "DIA_Addon_Lares_Geduld_09_01"); //Zaraz - czekamy jeszcze na kogo�.
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
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_00"); //M�j m�ody przyjacielu... Zebrali�my si� dzisiaj, aby uczci� twoje wst�pienie w szeregi Wodnego Kr�gu.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_01"); //Ci tutaj b�d� ci� teraz mieli na oku.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_02"); //Rzecz jasna to nie wszyscy cz�onkowie Wodnego Kr�gu, wi�c miej si� na baczno�ci.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_03"); //Bez wzgl�du na to, czy odniesiesz sukces, czy co� zawalisz, i tak si� o tym dowiemy.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_04"); //Niniejszym wr�czam ci pancerz gildii.
	CreateInvItem	(hero, ITAR_RANGER_Addon);
	AI_EquipArmor	(hero, ITAR_RANGER_Addon);	
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_05"); //No� go z dum�, ale nie daj si� przy�apa� w nim w mie�cie lub innych miejscach publicznych.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_06"); //Pami�taj, �e nie chcemy si� ujawnia�. Nikt niepowo�any nie mo�e si� dowiedzie�, kto nale�y do Wodnego Kr�gu.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_07"); //Nikt nie m�wi o Wodnym Kr�gu - to pierwsza i najwa�niejsza zasada. Nie �am jej.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_08"); //Jeszcze jakie� pytania?
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "Musz� si� zmywa�.", DIA_Addon_Lares_GetRangerArmor_end );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "Jak mo�esz mi pom�c?", DIA_Addon_Lares_GetRangerArmor_Learn );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "A co z broni�?", DIA_Addon_Lares_GetRangerArmor_weapons );

};
func void DIA_Addon_Lares_GetRangerArmor_weapons ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_weapons_15_00"); //A co z broni�?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_01"); //Broni� Kr�gu jest pika, ale ka�dy cz�onek mo�e u�ywa� tego, z czym jest najlepiej zaznajomiony.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_02"); //Oto jedna z naszych pik. Jako� nigdy nie potrafi�em si� do niej przyzwyczai� - mo�e tobie lepiej p�jdzie.
	CreateInvItems (self, ItMw_RangerStaff_Addon, 1);									
	B_GiveInvItems (self, other, ItMw_RangerStaff_Addon, 1);		
};
func void DIA_Addon_Lares_GetRangerArmor_end ()
{
	B_MakeRangerReadyToLeaveMeetingALL ();
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_end_15_00"); //Musz� si� zmywa�.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_01"); //Nie b�d� ci� zatrzymywa�.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_02"); //Udaj si� jak najszybciej do Vatrasa - on zleci ci pierwsze zadanie.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_03"); //Bracia Kr�gu - wracajmy do naszych zaj��.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_04"); //Ci�gle nie uda�o nam si� powstrzyma� bandyckich porwa� - trzeba rozwi�za� ten problem jak najszybciej.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_05"); //Adanosie, dbaj o r�wnowag� tego �wiata...
	Lares_TakeFirstMissionFromVatras = TRUE;

	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, DIALOG_ENDE, DIA_Addon_Lares_GetRangerArmor_weiter );
};
func void DIA_Addon_Lares_GetRangerArmor_weiter () 
{
	AI_StopProcessInfos (self);
	B_RangerMeetingParking ();
	B_LogEntry (TOPIC_Addon_RingOfWater,"Na tajnym spotkaniu w gospodzie Orlana otrzyma�em zbroj�. Teraz powinienem uda� si� do Vatrasa, by otrzyma� pierwszy rozkaz jako cz�onek Kr�gu." ); 
};

func void DIA_Addon_Lares_GetRangerArmor_Learn ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_Learn_15_00"); //Jak mo�esz mi pom�c?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_01"); //Poprzez wspomo�enie pracy nad twoj� zr�czno�ci�.

	if ((Npc_IsDead(SLD_805_Cord))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_02"); //Je�li chcesz lepiej walczy� broni� bia��, pom�w z Cordem - to mistrz w pos�ugiwaniu si� r�nego rodzaju ostrzami.
	};
	if ((Npc_IsDead(BAU_961_Gaan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_03"); //Gann z kolei ch�tnie nauczy ci� paru rzeczy o wyprawianiu sk�r zwierz�t.
	};	
	if ((Npc_IsDead(Mil_350_Addon_Martin))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_04"); //Od Martina mo�esz nauczy� si� wiele o paladynach.
	};	
	if ((Npc_IsDead(Bau_4300_Addon_Cavalorn))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_05"); //Cavalorn z kolei umie si� podkrada�, mo�e ci� r�wnie� nauczy� walki broni� jednor�czn� oraz pos�ugiwania si� �ukiem.
	};
	if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_06"); //Zwr�� si� do Orlana, je�li potrzebujesz noclegu.
	};
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_07"); //Wszystkie twoje potrzeby magiczne powinien zaspokoi� Vatras.
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

	description	 = 	"Korzysta�e� kiedy� z kamienia teleportacyjnego?";
};
func int DIA_Addon_Lares_Teleportstation_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)//SC war schon bei den Wassermagiern
	&& (SCUsed_TELEPORTER == TRUE)			//SC hat schon mal einen Teleporter benutzt
	&& (MIS_Lares_BringRangerToMe != 0) 				//hat Aquamarinring von Lares bekommen. -> f�r Orlan
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Teleportstation_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_00"); //Korzysta�e� kiedy� z kamienia teleportacyjnego?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_01"); //Nie, ale s�ysza�em o nich. Magowie Wody nie maj� jeszcze pewno�ci, co z nimi robi�.
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_02"); //Ja ju� jeden wypr�bowa�em...
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_03"); //Powinienem si� by� domy�li�. Istnieje cokolwiek, na co by� si� nie powa�y�?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_04"); //Je�li nabierzesz ochoty na zabaw� w teleportacj�, to pom�w z karczmarzem, Orlanem. Mo�e wpu�ci ci� do swej zamkni�tej jaskini...
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_05"); //Chyba trzyma kamie� teleportacyjny w pobli�u swej gospody - na potrzeby Mag�w Wody.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_06"); //Wyjd� z miasta przez wschodni� bram� i id� wzd�u� �cie�ki. Na pewno trafisz.
	
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Lares powiedzia� mi, �e w pobli�u gospody Orlana znajduje si� ukryty kamie� teleportacyjny."); 
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

	description	= "Vatras wr�czy� mi ten ornament, abym ci go przekaza�.";
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
	AI_Output (other, self, "DIA_Addon_Lares_Ornament_15_00"); //Vatras wr�czy� mi ten ornament, abym ci go przekaza� i poleci� zwr�ci�.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_01"); //Ech... A to ci 'niespodzianka'. Znowu wszystko na mojej g�owie... Powinienem by� si� domy�li�.
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_02"); //Teraz musz� przeby� ca�� wysp� i odda� to co� Magom Wody.
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

	description = "Zrobi� to za ciebie!";
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
	AI_Output	(other, self, "DIA_Addon_Lares_OrnamentBringJob_15_00"); //Zrobi� to za ciebie!
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_01"); //Hmm... Nie, chyba lepiej b�dzie, je�li ja to zrobi�. Mo�esz mi jednak towarzyszy�, je�li chcesz.
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_02"); //Niestety, nie mog� teraz opu�ci� tego miejsca - musz� pilnowa� portu.
	
	B_LogEntry (TOPIC_Addon_KDW,"Przynios�em Laresowi ornament Vatrasa. Chce, �ebym dostarczy� go Magom Wody."); 
	
	MIS_Addon_Lares_Ornament2Saturas = LOG_RUNNING;
};
// ------------------------------------------------------------
// Hol Abl�sung
// ------------------------------------------------------------
instance DIA_Addon_Lares_YourMission		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_YourMission_Condition;
	information	= DIA_Addon_Lares_YourMission_Info;
	permanent 	= TRUE;
	description = "Czym konkretnie si� tu zajmujesz?";
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
	AI_Output (other, self, "DIA_Addon_Lares_YourMission_15_00"); //Czym konkretnie si� tu zajmujesz?
	
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_01"); //Nie mog� o tym m�wi�.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_02"); //Vatras urwa�by mi �eb...
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_03"); //Robi� to samo, co wszyscy pozostali - wykonuj� zadania zlecone przez Mag�w Wody.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_04"); //Cz�� zaginionych to rybacy - razem z nimi znikn�y r�wnie� ich �odzie.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_05"); //W�a�nie dlatego stoj� tu i obserwuj� port - mo�e uda mi si� co� odkry�.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_06"); //Ale mo�esz mi pom�c.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_07"); //Dam ci m�j pier�cie� z akwamarynem. To znak Wodnego Kr�gu.
		
		CreateInvItems (self, ItRi_Ranger_Lares_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Lares_Addon, 1);
		SC_GotLaresRing = TRUE;		
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_08"); //Za�� go - dzi�ki temu inni rozpoznaj�, �e pracujesz dla mnie.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_09"); //Znajd� mi zast�pc� tak, abym m�g� w spokoju odnie�� ornament.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_10"); //Kto� z nas z regu�y obserwuje targowisko, cho� nie mam poj�cia, kto zajmuje si� tym w tej chwili.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_11"); //Najlepiej porozmawiaj ze wszystkimi przebywaj�cymi tam lud�mi - w�a�ciwa osoba rozpozna ci� po pier�cieniu.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_12"); //Powiedz jej, aby znalaz�a zast�pstwo.

		B_LogEntry (TOPIC_Addon_RingOfWater,"Lares da� mi sw�j pier�cie� z akwamarynem - znak rozpoznawczy Kr�gu. Gdy za�o�� pier�cie�, zauwa�� go pozostali cz�onkowie tej organizacji."); 

		Log_CreateTopic (TOPIC_Addon_BringRangerToLares, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BringRangerToLares,"Lares nie mo�e opu�ci� portu. Powinienem przej�� si� po rynku, nosz�c jego pier�cie� z akwamarynem, aby znale�� kogo�, kto go zast�pi."); 

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

	description	 = 	"Rozmawia�em z Baltramem.";
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
	AI_Output (other, self, "DIA_Addon_Lares_BaltramAbloese_15_00"); //Rozmawia�em z Baltramem - zorganizuje ci zast�pc�.
	AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_01"); //Doskonale. Nareszcie b�dzie sobie mo�na st�d p�j��.
	if (SC_IsRanger == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_02"); //Mo�esz zatrzyma� na razie m�j pier�cie�.
		
		if (Npc_KnowsInfo (other, DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_03"); //Dop�ki nie otrzymasz w�asnego, mo�e ci si� przyda�.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_04"); //Mo�e kiedy� zdecydujesz si� do nas do��czy�...
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
	description	= "Co do zaginionych...";
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
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_15_00"); //Co do zaginionych...
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice (DIA_Addon_Lares_PeopleMissing, DIALOG_BACK, DIA_Addon_Lares_PeopleMissing_BACK);
	if (MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Uda�o mi si� ocali� cz�� z zaginionych.", DIA_Addon_Lares_PeopleMissing_SAVED );
	}
	else if (MIS_Lares_BringRangerToMe != 0)
	&& (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Wiem, gdzie przebywaj� zaginieni!", DIA_Addon_Lares_PeopleMissing_Success );
	}
	else
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Czy to nie jest raczej zadanie dla stra�y?", DIA_Addon_Lares_PeopleMissing_MIL );
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Powiedz, co wiesz o tej sprawie.", DIA_Addon_Lares_PeopleMissing_TellMe );
	};
};
func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_TellMe_15_00"); //Powiedz, co wiesz o tej sprawie.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_01"); //Pierwszy by� miejscowy rybak imieniem William. Pewnego dnia po prostu nie wr�ci� z morza.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_02"); //Pocz�tkowo s�dzili�my, �e jaki� potw�r morski zniszczy� mu ��d� podczas po�ow�w.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_03"); //Wkr�tce jednak zacz�li znika� inni; co gorsza, zupe�nie przypadkowi.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_04"); //Dlatego te� nie mamy poj�cia, jak si� zabra� do tej sprawy. Musimy chyba czeka� na jaki� �lad.

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
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_MIL_15_00"); //Czy to nie jest raczej zadanie dla stra�y?
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_01"); //Taa... Ju� widz�, jak cokolwiek robi� w tej sprawie.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_02"); //Nigdy nie znajd� przyczyny tych zdarze� - uznaj�, �e ludzie po prostu znikaj� bez wie�ci.
};
func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_00"); //Wiem, gdzie przebywaj� zaginieni!
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_01"); //Czy�by?
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_02"); //Dawny Magnat imieniem Kruk zleci� ich porwanie.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_03"); //Jeste� pewien? Hmm... Trzeba ich jako� oswobodzi�.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_04"); //Pracuj� nad tym.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_05"); //Dobra. Je�li b�dzie ci potrzebna moja pomoc...
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_06"); //...to wiem, gdzie ci� znale��. Jasne.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_SAVED ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_SAVED_15_00"); //Uda�o mi si� ocali� cz�� z zaginionych.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_SAVED_09_01"); //Wiedzia�em, �e ci si� uda. Wreszcie mog� zaj�� si� swoimi sprawami...
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
	description	= "Potrzebuj� pomocy.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_RangerHelp_15_00"); //Potrzebuj� pomocy.
	AI_Output	(self, other, "DIA_Addon_Lares_RangerHelp_09_01"); //Jak mog� ci� wesprze�?
	
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice (DIA_Addon_Lares_RangerHelp, DIALOG_BACK, DIA_Addon_Lares_RangerHelp_nix );
	
	if (Npc_IsInState (Moe, ZS_Attack))
	{
		Info_AddChoice (DIA_Addon_Lares_RangerHelp, "Denerwuje mnie taki jeden...", DIA_Addon_Lares_RangerHelp_Moe);
	};
		
	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Potrzeba mi lepszej broni.", DIA_Addon_Lares_RangerHelp_waffe );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Mo�e jakim� lepszym pancerzem?", DIA_Addon_Lares_RangerHelp_ruestung );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Potrzeba mi pieni�dzy.", DIA_Addon_Lares_RangerHelp_geld );
	};
};
func void DIA_Addon_Lares_RangerHelp_ruestung ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_00"); //Mo�e jakim� lepszym pancerzem?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_01"); //W tej sprawie lepiej udaj si� do Mattea - on handluje dobrymi zbrojami. Niestety, nie s� tanie.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_02"); //Pewnie da si� to za�atwi� bez znacz�cego wydatku - o ile nie masz nic przeciwko odrobinie k�opot�w ze stra��...
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_03"); //A konkretnie? O co chodzi?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_04"); //Przy domu Mattea znajduje si� magazynek, ale z�o�one w nim towary zosta�y skonfiskowane przez stra�.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_05"); //Udaj si� do Zurisa na targowisko i wydosta� od niego zakl�cie usypiaj�ce, za pomoc� kt�rego wyeliminujesz stra�nik�w.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_06"); //Tam musi by� co� niez�ego.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_waffe_15_00"); //Potrzeba mi lepszej broni.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_waffe_09_01"); //Przykro mi, z tym ci nie pomog�. Zak�adam, �e odwiedzi�e� ju� targowisko?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_geld ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_geld_15_00"); //Potrzeba mi pieni�dzy.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_01"); //A kto ich nie potrzebuje? Nie mam nic na zbyciu. Chocia�... Lichwiarz Lehmar ma u mnie d�ug wdzi�czno�ci.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_02"); //Id� do niego i wyp�a� tyle, ile ci potrzeba - ja zajm� si� reszt�. Znajdziesz go w porcie, w pobli�u przej�cia do dolnej cz�ci miasta.
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
	AI_Output (other, self, "DIA_Addon_Lares_Moe_15_00"); //Denerwuje mnie taki jeden...
	AI_Output (self, other, "DIA_Addon_Lares_Moe_09_01"); //Chwila...
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
	description	 = 	"Za wszelk� cen� musz� si� skontaktowa� z paladynami!";
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
	AI_Output (other, self, "DIA_Lares_Paladine_15_00"); //Musz� koniecznie porozmawia� z paladynami!
	AI_Output (self, other, "DIA_Lares_Paladine_09_01"); //A czego od NICH chcesz?
	AI_Output (other, self, "DIA_Lares_Paladine_15_02"); //Posiadaj� pot�ny amulet zwany Okiem Innosa. Musz� go mie�.
	AI_Output (self, other, "DIA_Lares_Paladine_09_03"); //I my�lisz, �e po prostu ci go oddadz�? Nigdy nie dostaniesz si� do g�rnego miasta.
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		AI_Output (other, self, "DIA_Lares_Paladine_15_04"); //Znajd� jaki� spos�b.
		AI_Output (self, other, "DIA_Lares_Paladine_09_05"); //Jasne, je�li chcesz si� przymila� mieszka�com, albo zostaniesz ch�opcem na posy�ki w stra�y.
	};
	
	//AI_Output (other, self, "DIA_Lares_Alternative_15_00"); //Hab' ich eine Alternative?
	//AI_Output (self, other, "DIA_Lares_Alternative_09_01"); //Wenn ich du w�re, w�rde ich zu Onars Hof gehen und mit Lee reden.
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
	description	 = 	"Czy wiesz, dlaczego s� tu paladyni?";
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
	AI_Output (other, self, "DIA_Lares_WhyPalHere_15_00"); //Czy wiesz, dlaczego tu s� paladyni?
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_01"); //Nikt nie wie na pewno... Wi�kszo�� ludzi uwa�a, �e to z powodu ork�w, ale ja mam inne zdanie na ten temat.
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_02"); //To ma pewnie co� wsp�lnego ze star� koloni� karn�.
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
	description	 = 	"Vatras wspomnia�, �e mo�esz mi pom�c do��czy� do jednej z gildii.";
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
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_15_00"); //Vatras wspomnia�, �e mo�esz mi pom�c do��czy� do jednej z gildii.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_01"); //Nie lubisz si� przepracowywa�, co?
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_02"); //Rozumiem.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_03"); //Je�li chcesz si� przy��czy� do Lee, to mog� pogada� z najemnikami.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_04"); //Z pewno�ci� �atwiej by�oby ci si� wkr�ci� do klasztoru...
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_05"); //A zdecydowanie najprostsze by�oby do��czenie do stra�y.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_06"); //Kt�r� gildi� wybierasz?
		
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Musz� to jeszcze przemy�le�...", DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Mag�w Ognia.", DIA_Addon_Lares_Gilde_KDF );
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Najemnik�w.", DIA_Addon_Lares_Gilde_SLD );	
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Stra�.", DIA_Addon_Lares_Gilde_MIL );
};
func void DIA_Addon_Lares_Gilde_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_BACK_15_00"); //Musz� to jeszcze przemy�le�...
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_SLD ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_SLD_15_00"); //Najemnik�w.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_01"); //Lee z pewno�ci� ci� przyjmie.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_01"); //Najpierw musisz jednak przej�� pewn� pr�b�...
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_02"); //Pom�w lepiej z Cordem na farmie Onara.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_02"); //On pomo�e ci w tej sprawie.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_03"); //Powiedz mu, �e jeste� moim protegowanym. Zrozumie, o co chodzi.
	RangerHelp_gildeSLD = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpSLD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Lares s�dzi, �e Cord, kt�ry jest na farmie bogatego ziemianina, mo�e mi pom�c dosta� si� do najemnik�w."); 
	
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_MIL_15_00"); //Stra�.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_01"); //Taaak. Wiem chyba, co ci� u nich tak poci�ga - wygl�dasz mi na kogo�, kto uwielbia dawa� innym wyk�ady o obowi�zuj�cym prawie, kradn�c jednocze�nie na pot�g�.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_02"); //W porcie znajduje si� magazyn paladyn�w. Kwatermistrzem jest tam m�j dobry znajomy.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_03"); //Nazywa si� Martin - mo�e on zdo�a ci pom�c.

	Log_CreateTopic (TOPIC_Addon_RangerHelpMIL, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Lares twierdzi, �e kwatermistrz Martin pomo�e mi szybciej dosta� si� w szeregi stra�y. Zwykle przebywa w porcie, gdzie paladyni maj� sw�j magazyn."); 
	
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_KDF ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_KDF_15_00"); //Mag�w Ognia.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_01"); //Vatras pewnie si� tego nie spodziewa�... Inaczej by ci� do mnie nie przys�a�.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_02"); //Je�li chcesz si� dosta� do klasztoru, to b�dzie ci� to kosztowa�.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_03"); //Nie pozwol� ci wej�� do �rodka, je�li nie op�acisz daniny.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_04"); //Tylko Vatras mo�e co� z tym zrobi� - musisz z nim pom�wi� w tej sprawie.

	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Lares twierdzi, �e Vatras zna dobry spos�b na wst�pienie do klasztoru."); 

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
	description	 = 	"Powiedz mi co� o Lee i jego najemnikach.";
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
	AI_Output (other,self,  "DIA_ADDON_Lares_AboutSld_15_00"); //Powiedz mi co� o Lee i jego najemnikach.
	AI_Output (self, other, "DIA_ADDON_Lares_AboutSld_09_01"); //Co konkretnie chcesz wiedzie�?
	
	Info_ClearChoices (DIA_Lares_AboutSld);
	Info_AddChoice (DIA_Lares_AboutSld, DIALOG_BACK, DIA_Lares_AboutSld_BACK);
	Info_AddChoice (DIA_Lares_AboutSld, "A dlaczego TY nie jeste� razem z Lee i jego najemnikami?", DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice (DIA_Lares_AboutSld, "Powiedz mi co� wi�cej o najemnikach.", DIA_Lares_AboutSld_Sld);
	Info_AddChoice (DIA_Lares_AboutSld, "Jak dostan� si� do gospodarstwa tego w�a�ciciela ziemskiego?", DIA_Lares_AboutSld_WayToOnar); 
};
func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices (DIA_Lares_AboutSld);
};
func void DIA_Lares_AboutSld_Sld()
{	
	AI_Output (other,self,  "DIA_Lares_AboutSld_15_00"); //Powiedz mi co� wi�cej o najemnikach.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_01"); //C�, je�li jeste� takim twardzielem jak kiedy�, nie powinni sprawi� ci k�opotu.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_02"); //Wi�kszo�� z nich to bandyci, a je�li sobie z nimi nie poradzisz, to daleko nie zajdziesz.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_03"); //Je�li jeste� delikatny, to na pewno z nimi nie wygrasz....
};	
func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output (other, self, "DIA_Lares_WhyInCity_15_00"); //A dlaczego TY nie jeste� razem z Lee i jego najemnikami?
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_01"); //Ale� jestem! Tylko �e nie na farmie.
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_02"); //Mo�na powiedzie�, �e zosta�em tu wys�any na posterunek. Nie chcemy, aby statek odp�yn�� bez nas.
	//AI_Output (self, other, "DIA_Lares_WhyInCity_09_03"); //Warum bist DU in die Stadt gekommen?
	Lares_WorkForLee = TRUE;
	
	Info_AddChoice (DIA_Lares_AboutSld, "O jakim statku m�wi�e�?", DIA_Lares_AboutSld_Schiff);
};
func void DIA_Lares_AboutSld_Schiff()
{	
	AI_Output (other,self , "DIA_Lares_Schiff_15_00"); //O jakim statku m�wi�e�?
	AI_Output (self, other, "DIA_Lares_Schiff_09_01"); //Stoi w porcie, za klifami. Lee i paru jego ludzi bardzo chce si� st�d wydosta�.
	AI_Output (self, other, "DIA_Lares_Schiff_09_02"); //Ale to mo�e troch� potrwa�...
	AI_Output (other,self , "DIA_Lares_Schiff_15_03"); //Dlaczego?
	AI_Output (self, other, "DIA_Lares_Schiff_09_04"); //Lepiej zapytaj o to Lee, je�li go spotkasz... Ma jakie� plany.
};
func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output (other,self, "DIA_Lares_WegZumHof_15_00"); //Jak dostan� si� do gospodarstwa tego w�a�ciciela ziemskiego?
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_00"); //To do�� proste. Wyjd� z miasta wschodni� bram� i id� drog� na wsch�d.
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_01"); //Mog� wskaza� ci drog�, je�li chcesz.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_01"); //Ich kann dich hinbringen, wenn du willst. Hab sowieso schon zu lange hier rumgehangen.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_02"); //Hier im Hafen gibt es zwar f�r gew�hnlich keine Miliz, aber ich muss ja nicht riskieren, dass einer von ihnen Verdacht sch�pft ...
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
	description	 = 	"Wiesz co� o gildii z�odziei w mie�cie?";
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
	AI_Output (other, self, "DIA_Lares_GuildOfThieves_15_00"); //Wiesz co� o gildii z�odziei w mie�cie?
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_01"); //Te twoje pytania...
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_02"); //Oczywi�cie, �e jest tu taka gildia. Jak w ka�dym wi�kszym mie�cie.
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_03"); //Ka�dy paser czy kieszonkowiec ma z ni� pewnie jakie� powi�zania.
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
	description	 = 	"Wiesz, gdzie mog� znale�� gildi� z�odziei?";
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
	AI_Output (other, self, "DIA_Lares_WhereGuildOfThieves_15_00"); //Wiesz, gdzie mog� znale�� gildi� z�odziei?
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_01"); //Bez obrazy, ale nawet gdybym wiedzia�, to nie powiedzia�bym ci ani s�owa.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_02"); //Ci ludzie s� zwykle BARDZO dra�liwi, je�li chodzi o te sprawy.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_03"); //Powiniene� by� bardzo ostro�ny, je�li chcesz si� z nimi zadawa�.
};
// ------------------------------------------------------------
// Meersalz Schl�ssel
// ------------------------------------------------------------
instance DIA_Lares_GotKey (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	16;
	condition	 = 	DIA_Lares_GotKey_Condition;
	information	 = 	DIA_Lares_GotKey_Info;
	permanent    =  FALSE;
	description	 = 	"Mam tutaj klucz. Zardzewia� od morskiej wody...";
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
	AI_Output (other, self, "DIA_Lares_GotKey_15_00"); //Mam tutaj klucz. Zardzewia� od morskiej wody...
	AI_Output (self, other, "DIA_Lares_GotKey_09_01"); //No i?
	AI_Output (other,self, "DIA_Lares_GotKey_15_02"); //Wydaje mi si�, �e pozwoli mi dosta� si� do kryj�wki gildii z�odziei...
	AI_Output (self, other, "DIA_Lares_GotKey_09_03"); //C�, mo�liwe, �e to klucz do kana��w.
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
	description	 = 	"Gdzie znajd� kana�y?";
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
	AI_Output (other,self, "DIA_Lares_Kanalisation_15_00"); //Gdzie znajd� kana�y?
	AI_Output (self, other, "DIA_Lares_Kanalisation_09_01"); //A co ja mog� wiedzie�... Zwykle maj� uj�cie na brzegu morza.
};

// ************************************************************
// 		  			Important f�r andere Gilden
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
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_00"); //Jeste� teraz w stra�y!
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_01"); //Normalnie umr� ze �miechu - by�y skazaniec w stra�y miejskiej...
		}
		else //GIL_PAL
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_02"); //Wi�c teraz jeste� jednym z paladyn�w Kr�la!
		};
	
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_03"); //Tylko ty mog�e� wyci�� taki numer...
	
		if (Lares_WorkForLee == TRUE)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_04"); //Nie b�dziesz robi� mi problem�w z powodu pracy u Lee, prawda?
			AI_Output (other,self , "DIA_Lares_OtherGuild_15_05"); //Ale znasz mnie...
		};
	};
	
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_06"); //Nie �api�. By�e� w klasztorze. Jak tam jest?
		AI_Output (other,self , "DIA_Lares_OtherGuild_15_07"); //Inaczej.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_08"); //Domy�lam si�.
	};
		
	if (other.guild == GIL_SLD) 
	|| (other.guild == GIL_DJG)
	{
		//AI_Output (self, other, "DIA_Lares_OtherGuild_09_09"); //Ich hab geh�rt, du bist aufgenommen worden.
		AI_Output (self, other, "DIA_Addon_Lares_OtherGuild_09_00"); //Podobno Lee przyj�� ci� do kompanii.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_10"); //Gratulacje.
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

	description	 = 	"Mo�esz mi towarzyszy� w drodze przez g�sty las na wschodzie?";
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
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_00"); //Mo�esz mi towarzyszy� w drodze przez g�sty las na wschodzie?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_01"); //Jasne, tylko po co si� tam zapuszczasz?
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_02"); //Nefarius prosi�, aby poszuka� dalszych ornament�w.
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_03"); //Jedno z miejsc, kt�re mam zbada�, znajduje si� w �rodku tego lasu.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_04"); //Rozumiem. Samemu to zbyt niebezpieczne?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_05"); //Nie ma sprawy. Daj zna�, jak b�dziesz chcia� rusza�.

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
	description	 = 	"Dobra, chod�my.";
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
 	AI_Output (self, other, "DIA_Lares_GoNow_09_01"); //A wi�c ruszajmy... Chod� za mn�.
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
	AI_Output (other, self, "DIA_Lares_GoNow_15_00"); //Dobra, chod�my.
	
	if (Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_03"); //Nie mog� si� st�d ruszy�, dop�ki kto� mnie nie zast�pi lub nie zostanie rozwi�zana sprawa gin�cych ludzi.
	}
	else if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING) //bleibt am Hafen w�hrend RangerMeeting
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
			AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_04"); //Gdzie teraz?
			
			
			Info_ClearChoices	(DIA_Lares_GoNow);
			Info_AddChoice	(DIA_Lares_GoNow, DIALOG_BACK, DIA_Lares_GoNow_warte );
		
			if (Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS)
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Na farm� Onara.", DIA_Lares_GoNow_Onar );
			};
		
			if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) && (Lares_Angekommen == FALSE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Odnie�my ornament Vatrasa.", DIA_Lares_GoNow_Maya );
			};
			
			if ((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Zapu��my si� w ten g�sty las na wschodzie.", DIA_Lares_GoNow_Forest );
			};
	};		
};

func void DIA_Lares_GoNow_Maya ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Maya_15_00"); //Odnie�my ornament Vatrasa.
	LaresGuide_ZumPortal = 1;
	Npc_ExchangeRoutine (self, "GUIDEPORTALTEMPEL1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Onar ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Onar_15_00"); //Na farm� Onara.
	LaresGuide_ZuOnar = TRUE;
	Npc_ExchangeRoutine (self, "GUIDE");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Forest ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Forest_15_00"); //Zapu��my si� w ten g�sty las na wschodzie.
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
		AI_Output (self, other, "DIA_Lares_GUIDE_09_00"); //A wi�c jeste�my.
	}
	else
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_01"); //A wi�c tutaj jeste�. Ju� zaczyna�em my�le�, �e ze�ar�y ci� wilki.
	};
	AI_Output (self, other, "DIA_Lares_GUIDE_09_02"); //C�, przez reszt� drogi poradzisz sobie sam. Musz� wraca� do miasta. Mam tam kilka spraw do za�atwienia.
	AI_Output (self, other, "DIA_Lares_GUIDE_09_03"); //Id� po prostu t� drog� i pami�taj - b�d� twardy i nie daj sobie wcisn�� kitu, a wszystko p�jdzie jak po ma�le.
	
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
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_00"); //Jeste�my ju� za miastem, tutaj nikt nas nie pods�ucha... Mam ci co� do powiedzenia.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_01"); //Ten ornament nale�y zanie�� Saturasowi. Pami�tasz go, prawda?
	
	
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Jasne.", DIA_Addon_Lares_ArrivedPortalInter1_ja );
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Saturas? Kto to taki?", DIA_Addon_Lares_ArrivedPortalInter1_wer );

	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2 ()
{
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00"); //Jako dawni mieszka�cy Nowego Obozu mamy dobre stosunki z Magami Wody.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01"); //Nawet Lee b�dzie ich chroni� w razie potrzeby.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02"); //Wi�kszo�� mych wysi�k�w w mie�cie koncentrowa�a si� na utrzymywaniu wraz z Vatrasem kontaktu z Magami Wody.
	B_MakeRangerReadyForMeeting (self);
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03"); //A to jest pancerz, kt�ry ka�dy z nas od nich otrzyma�. Cz�onkowie Wodnego Kr�gu nosili takie zbroje, jeszcze przed wojnami z orkami.
	
	if (Cavalorn_RangerHint == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04"); //A sk�d si� w tym wszystkim wzi�� Cavalorn? Nie pami�tam go z Nowego Obozu.
		AI_Output (self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05"); //Masz racj�, nasza spo�eczno�� si� rozros�a. Nawet ja nie wiem, ilu nas dok�adnie jest.
	};

	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06"); //Ale chod�my ju�. Chc� si� bardziej oddali� od miasta - p�niej pogadamy.
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00"); //Saturas? Kto to taki?
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01"); //G��wny Mag Wody z Nowego Obozu. Jeszcze z czas�w, gdy G�rnicz� Dolin� otacza�a Bariera.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02"); //Wraz z Lee zawarli�my umow� z Magami Wody i po��czyli�my si�y przeciwko Staremu Obozowi.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00"); //Jasne. By� g��wnym Magiem Wody z Nowego Obozu.
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
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00"); //Jak leci? Wszystko w porz�dku?
	
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
	&& ((Npc_GetDistToWP(Erol,"NW_TAVERN_TO_FOREST_03")<1000))
	&& ((Npc_IsDead(Erol))==FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01"); //Ten go�� ma problemy z bandytami.
		AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02"); //Dobrze wiedzie�, ale czasu to my mamy raczej ma�o.
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
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00"); //Nie wkurzaj mnie...
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
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_00"); //Magowie Wody s� strasznie podekscytowani - od kilku tygodni trwaj� wykopaliska na p�nocnym wschodzie. Nie wiem, co chc� tam znale��.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_01"); //Zacz�o si� od tego, �e ziemia zatrz�s�a si� jak w okresie, kiedy istnia�a jeszcze Bariera.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_02"); //Obudzi�y si� kamienne maszkary, kt�re zacz�y niszczy� wszystko, co odwa�y�o si� podej�� do nich bli�ej ni� na 100 krok�w.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_03"); //Magowie Wody zniszczyli te istoty i przekopuj� tamt� okolic�, �eby dowiedzie� si� czego� wi�cej.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_04"); //Ale wkr�tce zobaczysz to na w�asne oczy.

	LaresGuide_ZumPortal = 5;
	B_LogEntry (TOPIC_Addon_KDW,"Lares powiedzia� mi o wykopaliskach Mag�w Wody. Badaj� oni dziwne wydarzenia, jakie mia�y miejsce w tamtej okolicy, i s� prawdopodobnie odpowiedzialne za tajemnicze trz�sienia ziemi oraz pojawienie si� kamiennych istot."); 
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
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00"); //Wszystko w porz�dku?
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
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00"); //Uwa�aj - tutaj mo�e by� niebezpiecznie.
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
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_00"); //Jeste�my na miejscu.
 	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_01"); //We� ten ornament. Gdzie� w tej okolicy powinni przebywa� Magowie Wody - zanie� im go.
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);					
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_02"); //Je�li napotkasz tu jakie� stwory, kt�re b�d� dla ciebie zbyt silne, to po prostu uciekaj jak najszybciej do Saturasa.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_03"); //On ju� sobie z nimi jako� poradzi. Ja musz� teraz wraca�.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_04"); //I jeszcze jedno - nawet nie my�l o badaniu okolicy z ornamentem. Id� prosto do Saturasa.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_05"); //Do zobaczenia.
	
	B_LogEntry (TOPIC_Addon_KDW,"Lares przekaza� mi ornament. Mam go zanie�� do Saturasa, Maga Wody."); 
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
	AI_Output (self, other, "DIA_Addon_Lares_Albern_09_00"); //Nie �artuj sobie! Dostarcz ten ornament!
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
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_ja_15_00"); //Tak.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_ja_09_01"); //Dobrze. Chod� za mn�. To nie b�dzie przyjemne...
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2; 
};
func void DIA_Addon_Lares_GOFORESTPRE_nein ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_nein_15_00"); //Nie. Mo�esz ju� sobie i��.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_nein_09_01"); //To chyba ju� koniec? Do zobaczenia p�niej.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"Start");
	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit Guide
};

func void DIA_Addon_Lares_GOFORESTPRE_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_00"); //Nadal chcesz, abym towarzyszy� ci w drodze przez las?
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_01"); //Przemy�la�e� to sobie? Naprawd� chcesz i�� do tego miejsca?
 	};
	Info_ClearChoices	(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "Nie. Mo�esz ju� sobie i��.", DIA_Addon_Lares_GOFORESTPRE_nein );
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "Tak.", DIA_Addon_Lares_GOFORESTPRE_ja );
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
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_00"); //Moje zadanie ju� sko�czone, poradzisz sobie beze mnie. Czas si� zmywa�.
	 	AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine (self,"START");
	 	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit guide Forest!
 	}
 	else
 	{
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_01"); //Pospiesz si� - wola�bym nie zostawa� tu zbyt d�ugo.
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

	description	 = 	"Chod�my.";
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
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_00"); //Przesta� si� maza�.
	}
	else if (LaresGuide_ZumPortal == 6)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_01"); //Tak, tak.
	};

	AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_02"); //Chod�my.
	
	if (LaresGuide_ZumPortal == 7)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_03"); //Zwolnij troch�.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_04"); //Pod��aj za mn�.
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
	description	 = 	"Mo�esz mnie czego� nauczy�?";
};
func int DIA_Lares_DEX_Condition ()
{	
	return TRUE;
};
func void DIA_Lares_DEX_Info ()
{
	AI_Output (other, self, "DIA_Lares_DEX_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Addon_Lares_DEX_Add_09_01"); //Jasne - lepsza si�a i zr�czno�� na pewno ci nie zaszkodz�.

	Lares_TeachDEX = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Lares mo�e pom�c mi zwi�kszy� si�� i zr�czno��.");
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
	description	 = 	"Ucz mnie.";
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
	AI_Output (other,self ,"DIA_Addon_Lares_Teach_15_00"); //Ucz mnie.
	
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
		AI_Output (self, other, "DIA_Lares_TEACH_BACK_09_00"); //Ju� sta�e� si� bardziej zr�czny.
	};
	if (other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_Lares_TEACH_BACK_Add_09_00"); //Dobrze - twoja si�a wzrasta.
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
	description = "Jakie� wie�ci?";
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
	AI_Output (other,self ,"DIA_Lares_AnyNews_15_00"); //Jakie� wie�ci?
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_01"); //Dzi�ki tobie wie�ci s� naprawd� wspania�e. Wypu�cili Benneta. Wr�ci� ju� na farm�.
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_02"); //Id� do niego. My�l�, �e chcia�by ci sam podzi�kowa�.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_03"); //Mo�na tak powiedzie�. Paladyni aresztowali Benneta, naszego kowala.
		
		if (MIS_RescueBennet == LOG_RUNNING)
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_04"); //S�ysza�em. To z�a wiadomo��.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_05"); //Taa, to za ma�o powiedziane.
		}
		else
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_06"); //Jak to si� sta�o?
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_07"); //Bennet poszed� do miasta po zapasy. No i ju� nie wr�ci�.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_08"); //Je�li chcesz wiedzie� wi�cej, pogadaj z Hodgesem. By� w mie�cie razem z Bennetem.
			
			MIS_RescueBennet = LOG_RUNNING;
		};
	};
};

// ************************************************************
// 		Hast du was von Bennet geh�rt?			 
// ************************************************************
INSTANCE DIA_Lares_NewsAboutBennet(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 6;
	condition	= DIA_Lares_NewsAboutBennet_Condition;
	information	= DIA_Lares_NewsAboutBennet_Info;
	permanent	= FALSE;
	description = "Jakie� wie�ci o Bennecie?";
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
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_00"); //Jakie� wie�ci o Bennecie?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_01"); //Wygl�da na to, �e zabrali go do koszar i wrzucili do lochu.
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_02"); //Jak mo�emy go stamt�d wydosta�?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_03"); //Nie mam na razie �adnych pomys��w. Nie mog� dosta� si� do celi, �eby z nim porozmawia�.
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_04"); //Mog� tylko nadstawia� ucha, ale tutaj niewiele mo�na si� dowiedzie�.
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
	description = "Dlaczego nie polujesz na smoki?";
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
	AI_Output (other,self ,"DIA_Lares_Kap4_PERM_15_00"); //Dlaczego nie polujesz na smoki?
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_01"); //To nie moja dzia�ka. Takie rzeczy zostawiam innym.
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_02"); //Nie, nie. �wie�e morskie powietrze - tego mi teraz trzeba.
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
	description	 = 	"Masz mo�e ochot� na opuszczenie wyspy?";
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
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_00"); //Chcia�by� mo�e opu�ci� t� wysp�?
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_01"); //Najbardziej na �wiecie. A co chodzi ci po g�owie?
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_02"); //Dowiedzia�em si�, gdzie ukrywa si� przyw�dca smok�w. Jest na wyspie, niedaleko st�d.
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_03"); //Zamierzam si� go pozby� raz na zawsze.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_04"); //Brzmi �wietnie. Wchodz� w to, je�li mog� si� do czego� przyda�.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_05"); //Nie chcia�by� si� nauczy�, jak poprawi� swoj� zr�czno��, albo jak lepiej pos�ugiwa� si� broniami jednor�cznymi?
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lares_KnowWhereEnemy_15_06"); //Statek jest ju� pe�en, ale dam ci zna�, je�li co� si� zmieni.
	}
	else 
	{
		Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"Do niczego mi si� nie przydasz.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"Wiedzia�em, �e mog� na tobie polega�.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lares_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_00"); //Wiedzia�em, �e mog� na tobie polega�.
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_01"); //Wszyscy spotkamy si� na statku.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02"); //Cz�owiek czynu - to mi si� podoba. Do zobaczenia.
	
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
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_No_15_00"); //Doceniam twoj� propozycj�, ale do niczego mi si� nie przydasz.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_No_09_01"); //Musisz si� zdecydowa�. Wiesz, gdzie mnie szuka�, je�li zechcesz o tym pogada�.

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
	description	 = 	"Jednak wol�, �eby� zosta�.";
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
	AI_Output			(other, self, "DIA_Lares_LeaveMyShip_15_00"); //Jednak wol�, �eby� zosta�.
	AI_Output			(self, other, "DIA_Lares_LeaveMyShip_09_01"); //Jak sobie chcesz, ale nast�pnym razem zastan�w si�, co komu obiecujesz.
	
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
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_StillNeedYou_Condition;
	information	 = 	DIA_Lares_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Wci�� jeste� zainteresowany podr�?";
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
	AI_Output			(other, self, "DIA_Lares_StillNeedYou_15_00"); //Wci�� jeste� zainteresowany podr�?
	
	if (Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_01"); //Zwykle nie pozwalam si� tak traktowa�, ale poniewa� jeste� jednym z nas, to tym razem puszcz� ci to p�azem.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_02"); //Spotkamy si� na statku.
		
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
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_03"); //Nie bierz tego do siebie, ale wydaje mi si�, �e mia�e� racj�.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_04"); //Lepiej je�li zostan� tutaj.
		
		AI_StopProcessInfos (self);
	};	
};


























