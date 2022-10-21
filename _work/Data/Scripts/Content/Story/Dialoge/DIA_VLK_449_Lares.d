// ************************************************************
// 			Lares Patch 
// ************************************************************
instance DIA_Addon_Lares_Patch		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 99;
	condition	= DIA_Addon_Lares_Patch_Condition;
	information	= DIA_Addon_Lares_Patch_Info;
	description	= "(Ornament - ��dat navr�cen� ��sti)";
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
	AI_Output	(self, other, "DIA_Addon_Lares_HaltsMaul_09_01"); //Tak se m�j, uvid�me se v p��stavu.
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
	AI_Output (self, other, "DIA_Lares_HALLO_09_00"); //J� jsem se musel zbl�znit. Co tady d�l�?
	
	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output (self, other, "DIA_Lares_HALLO_09_01"); //Ty jsi sem P�IPLAVAL?
		AI_Output (self, other, "DIA_Lares_HALLO_09_02"); //(sm�ch) Je to jedin� cesta, jak obej�t str�e u br�ny.
		B_GivePlayerXP (500); //wer's schafft...	
	};
			
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Nevid�li jsme se u�?",DIA_Lares_HALLO_NO);
	Info_AddChoice 		(DIA_Lares_HALLO,"Hej, Laresi, ty starej pard�le!",DIA_Lares_HALLO_YES);
};
FUNC VOID DIA_Lares_HALLO_NO()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NO_15_00"); //Nevid�li jsme se u�?
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_01"); //Chlape, to si m� v�n� nepamatuje�? Poflakoval jsem se kolem Nov�ho t�bora.
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_02"); //Seznam pro doly... Chlape, u�ili jsme si spolu spoustu srandy. Pamatuje� si Leeho?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Samoz�ejm� �e si pamatuju na Leeho!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};
FUNC VOID DIA_Lares_HALLO_YES()
{
	AI_Output (other, self, "DIA_Lares_HALLO_YES_15_00"); //Hej, Laresi, ty starej mizero, jak ses sem dostal?
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_01"); //Poda�ilo se mi ut�ct z Hornick�ho �dol� pr�v� v�as. Spolu s Leem a je�t� n�kolika dal��ma chlapama.
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_02"); //Pamatuje� si p�ece Leeho, ne?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Samoz�ejm� �e si pamatuju na Leeho!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};

// ------------------------------	
	func void B_Lares_AboutLee()
	{
		AI_Output (self, other, "B_Lares_AboutLee_09_00"); //Tak s n�m jsem se dostal z kolonie. Hned po zni�en� bari�ry.
		AI_Output (self, other, "B_Lares_AboutLee_09_01"); //Je se svejma klukama na Onarov� farm�.
		AI_Output (self, other, "B_Lares_AboutLee_09_02"); //M� s t�m farm��em dohodu. On se sv�mi chlapci br�n� farmu a Onar je na opl�tku �iv�.
	};
// ------------------------------	

FUNC VOID DIA_Lares_HALLO_LEE()
{
	AI_Output (other, self, "DIA_Lares_HALLO_LEE_15_00"); //Samoz�ejm� �e si pamatuju na Leeho!
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};
FUNC VOID DIA_Lares_HALLO_NOIDEA()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NOIDEA_15_00"); //Lee...?
	AI_Output (self, other, "DIA_Lares_HALLO_NOIDEA_09_01"); //Tys asi dostal velkou r�nu do hlavy, co? Lee byl velitelem �old�k� v Nov�m t�bo�e.
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

	description	= "Pos�l� m� Vatras.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_Vatras_15_00"); //Pos�l� m� Vatras. M�m za tebou zaj�t, jestli nepot�ebuje� pomoc.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_01"); //(udiven�) Tak ty u� jsi byl za Vatrasem? To jsi na n�j musel ud�lat po��dn� dojem.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_02"); //Jinak by ti ur�it� jen tak neprozradil moje jm�no. Zvl᚝ kdy� tu te� m�me tu nevy�e�enou z�le�itost s poh�e�ovan�mi lidmi.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_03"); //Co pot�ebuje�?
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

	description	 = 	"Tak co m� do �in�n� s Vatrasem?";
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
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_00"); //A co m� co d�lat s Vatrasem?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_01"); //Jak vid�, uzav�el jsem s vodn�mi m�gy takov� ujedn�n�.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_02"); //Jak� ujedn�n�?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_03"); //Pracujeme pro n� a oni na opl�tku dohl�dnou, aby n�m na�e trestaneck� minulost nebyla na p��t�.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_04"); //Mluv� o kruhu vody?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_05"); //U� jsi o n�m sly�el?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_06"); //Vatras se o n�m zm�nil.
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_07"); //Tak to jsi m�l ��ct hned.

	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Lares pat�� do 'kruhu vody'." ); 
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

	description	= "Prozra� mi o tom 'kruhu vody' n�co v�c.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_00"); //Pov�z mi o tom kruhu vody n�co v�c.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_01"); //Kruh je pro vodn� m�gy tot�, co paladinov� pro m�gy ohn�.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_02"); //Ale my na rozd�l od paladin� operujeme ve skrytu.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_03"); //Kruh' je mocnou zbran� proti nebezpe��m, je� ohro�uj� obyvatelstvo Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_04"); //Jen�e to bude fungovat, jenom kdy� toto�nost �len� kruhu vody udr��me v tajnosti.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_05"); //Tak�e si to nechej pro sebe.
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_06"); //Jasn�.
	B_LogEntry (TOPIC_Addon_RingOfWater,"'Kruh' je pro m�gy vody tot� co paladinov� pro m�gy ohn�. 'Kruh' v�ak d�v� p�ednost nen�padn�mu jedn�n�. Nikdo nesm� v�d�t, KDO v�echno k n�mu pat��, nebo� jeho s�la spo��v� pr�v� v utajen�." ); 
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

	description	= "Chci se p�idat ke 'kruhu vody'.";
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
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_15_00"); //Chci se p�idat ke kruhu vody.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_09_01"); //Pro m� za m�. Ale jestli t� p�ijmou, nebo ne, to musej� rozhodnout samotn� vodn� m�gov�.
	
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 


	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Aha.", DIA_Addon_Lares_WannaBeRanger_BACK );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Jak� to je pat�it ke 'kruhu'?", DIA_Addon_Lares_WannaBeRanger_HowIsIt );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "��m jsi na vodn� m�gy zap�sobil?", DIA_Addon_Lares_WannaBeRanger_AboutYou );
};
func void DIA_Addon_Lares_WannaBeRanger_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_BACK_15_00"); //Ch�pu.
	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
};
func void DIA_Addon_Lares_WannaBeRanger_AboutYou ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00"); //Jak jsi na vodn� m�gy zap�sobil?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01"); //Kdysi d�vno jsem je ochr�nil, je�t� kdy� jsme �ili za bari�rou.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02"); //(usm�v� se) A maj� spoustu d�vod�, pro� mi b�t vd��n�.
};
func void DIA_Addon_Lares_WannaBeRanger_HowIsIt ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00"); //Jak� to je pat�it ke kruhu?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01"); //Hodn� se li��me od jin�ch komunit, ke kter�m se tady v Khorinidu m��e� p�ipojit.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02"); //Kdy� se stane� jedn�m z n�s, nebudeme po tob� cht�t nic, co bys nedok�zal.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03"); //Jedin�, co opravdu vy�adujeme, je ml�enlivost.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04"); //Pracujeme ve skrytu a nestoj�me o to, aby cizinci v�d�li, kdo v�echno k n�m pat��.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05"); //Budeme t� sledovat. V�echno ostatn� je v ruk�ch osudu.
};
// ------------------------------------------------------------
// Info RingBack (Bin jetzt dabei)
// ------------------------------------------------------------
func void B_Lares_Geheimtreffen()
{
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_07"); //Brzo budeme m�t tajn� setk�n� v Orlanov� hospod�.
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_08"); //Co nejrychleji tam za n�mi zajdi. Dostane� tam i dal�� v�bavu.
};
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_RingBack_Condition;
	information	 = 	DIA_Addon_Lares_RingBack_Info;

	description	 = 	"Nyn� pat��m ke 'kruhu vody'.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_00"); //Nyn� pat��m ke kruhu vody.
	
	if (Lares_GotRingBack == FALSE) 
	&& (SC_GotLaresRing == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_01"); //V�born�. M��e� mi tedy vr�tit m�j akvamar�nov� prsten?
		
		if (B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_02"); //Jasn�, tady je.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_03"); //Douf�m, �e se ti hodil. Jsem r�d, �e u� jsi jedn�m z n�s.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP (XP_Ambient);
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_04"); //Hmm, zrovna jej u sebe nem�m.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_05"); //Jen ��dn� skopi�iny! J� ho pot�ebuju!
		};
	};

	AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_06"); //Te� asi bude� cht�t sv� vybaven�, tak d�vej pozor.
	B_Lares_Geheimtreffen();
	
	B_LogEntry (TOPIC_Addon_RingOfWater, "Lares m� pozval na tajn� setk�n� kruhu, kter� prob�hne v Orlanov� hospod�."); 
	
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

	description	= "Tady m� ten akvamar�nov� prsten.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack2_15_00"); //Tady m� akvamar�nov� prsten.
	B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1);
	AI_Output	(self, other, "DIA_Addon_Lares_RingBack2_09_01"); //To m� kliku. U� jsem myslel, �es ho ztratil.
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
	AI_Output	(self, other, "DIA_Addon_Lares_Geduld_09_01"); //Bude� muset chvilku po�kat, je�t� tu nejsou v�ichni.
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
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_00"); //Tak�e, m�j mlad� p��teli. V�ichni jsme se tu dnes se�li, abychom oslavili tv� p�ijet� do kruhu vody.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_01"); //V�ichni chlapi, kte�� tu jsou, na tebe budou od nyn�j�ka d�vat dobr� pozor.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_02"); //Samoz�ejm� �e kruh vody m� i dal�� �leny, tak�e bu� opatrn�.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_03"); //Kdy� pro n�s vykon� n�jak� �kol nebo naopak vyvede� n�jakou pitomost, dozv� se to.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_04"); //Tady si vezmi zbroj na�eho spole�enstv�.
	CreateInvItem	(hero, ITAR_RANGER_Addon);
	AI_EquipArmor	(hero, ITAR_RANGER_Addon);	
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_05"); //Nos ji s hrdost�, ale nikdy ne ve m�st� ani v jin�ch obydlen�ch oblastech.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_06"); //Nezapome�, �e mus�me z�stat v utajen�. Nikdo nesm� v�d�t, kdo ke kruhu vody pat��.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_07"); //O kruhu vody se nemluv�. To je na�e z�kladn� pravidlo, tak si to zapi� za u�i.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_08"); //Je�t� n�jak� ot�zky?
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "U� mus�m j�t.", DIA_Addon_Lares_GetRangerArmor_end );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "V �em mi m��e� pomoci?", DIA_Addon_Lares_GetRangerArmor_Learn );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "A co takhle zbran�?", DIA_Addon_Lares_GetRangerArmor_weapons );

};
func void DIA_Addon_Lares_GetRangerArmor_weapons ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_weapons_15_00"); //A co takhle n�jak� zbran�?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_01"); //Zbran� kruhu vody je �tvrte�n� h�l, ale ka�d� z n�s rad�i bojuje s t�m, na� je zvykl�.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_02"); //Tady je jedna z na�ich hol�. J� se ji nikdy nenau�il pou��vat, ale tob� mo�n� posta��.
	CreateInvItems (self, ItMw_RangerStaff_Addon, 1);									
	B_GiveInvItems (self, other, ItMw_RangerStaff_Addon, 1);		
};
func void DIA_Addon_Lares_GetRangerArmor_end ()
{
	B_MakeRangerReadyToLeaveMeetingALL ();
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_end_15_00"); //U� mus�m j�t.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_01"); //Tak to t� nebudeme zdr�ovat.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_02"); //Te� b� p��mo za Vatrasem, a� ti zad� prvn� �kol.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_03"); //Brat�i z kruhu, nyn� se vra�me ke sv�m povinnostem.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_04"); //�toky bandit� st�le pokra�uj�. Mus�me se s nimi co nejl�pe vypo��dat.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_05"); //Adane, zachovej v tomto sv�t� rovnov�hu.
	Lares_TakeFirstMissionFromVatras = TRUE;

	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, DIALOG_ENDE, DIA_Addon_Lares_GetRangerArmor_weiter );
};
func void DIA_Addon_Lares_GetRangerArmor_weiter () 
{
	AI_StopProcessInfos (self);
	B_RangerMeetingParking ();
	B_LogEntry (TOPIC_Addon_RingOfWater,"Na tajn�m setk�n� kruhu, kter� prob�hlo v Orlanov� hospod�, jsem dostal novou zbroj. Nyn� m�m zaj�t za Vatrasem, kter� mi zad� prvn� �kol v �ad�ch tohoto spole�enstv�." ); 
};

func void DIA_Addon_Lares_GetRangerArmor_Learn ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_Learn_15_00"); //V �em mi m��e� pomoci?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_01"); //M��u ti uk�zat, jak se st�t obratn�j��m.

	if ((Npc_IsDead(SLD_805_Cord))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_02"); //Pokud se pot�ebuje� zdokonalit ve zbran�ch nabl�zko, promluv si s Cordem. Je mistrem me�e.
	};
	if ((Npc_IsDead(BAU_961_Gaan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_03"); //Gaan ti zase r�d uk�e, jak vyvrhovat zv��ata.
	};	
	if ((Npc_IsDead(Mil_350_Addon_Martin))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_04"); //A Martin ti pov� spoustu v�c� o paladinech.
	};	
	if ((Npc_IsDead(Bau_4300_Addon_Cavalorn))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_05"); //Cavalorn ovl�d� pl�en�, jednoru�n� boj a st�elbu.
	};
	if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_06"); //Orlan tu pro tebe v�dycky bude m�t p�ipraven� vytopen� pokoj a �istou postel.
	};
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_07"); //A s ve�ker�mi magick�mi z�le�itostmi se obracej na Vatrase.
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

	description	 = 	"U� jsi n�kdy pou��val teleporta�n� k�men?";
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
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_00"); //U� jsi n�kdy pou��val teleporta�n� k�men?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_01"); //Ne, ale u� jsem o takov�ch v�cech sly�el. Jen�e ani vodn� m�gov� o nich zat�m moc nev�d�.
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_02"); //J� ho vyzkou�el.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_03"); //(sm�je se) Samoz�ejm�. Ty se neboj� ni�eho, co?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_04"); //No, jestli chce� pou��vat takov� v�ci, popros hospodsk�ho Orlana, aby t� pustil do t� sv� zabedn�n� jeskyn�.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_05"); //Mysl�m, �e n�kde u sv� hospody ukryl jeden z teleporta�n�ch kamen� vodn�ch m�g�.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_06"); //Vyjdi z m�sta v�chodn� branou a prost� se dr� na cest�. Nem��e� to minout.
	
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Lares mi prozradil, �e Orlan schoval u sv�ho hostince teleporta�n� k�men."); 
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

	description	= "Vatras ti pos�l� tenhle ornament.";
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
	AI_Output (other, self, "DIA_Addon_Lares_Ornament_15_00"); //Vatras mi nak�zal, abych ti zanesl tenhle ornament. Pr� ho m� n�komu vr�tit.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_01"); //(povzdech) Samoz�ejm�. Zase je to na mn�, jako v�dycky. To jsem si mohl myslet.
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_02"); //Budu muset proj�t p�es p�l ostrova a vr�tit jej vodn�m m�g�m.
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

	description = "M��u tam ten ornament zan�st za tebe!";
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
	AI_Output	(other, self, "DIA_Addon_Lares_OrnamentBringJob_15_00"); //J� bych to mohl za��dit m�sto tebe!
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_01"); //(zamy�len�) Hmm. Mysl�m, �e bych to m�l rad�i za��dit s�m, ale m��e� j�t se mnou.
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_02"); //Akor�t nem��u odej�t hned, mus�m dohl�et na p��stav.
	
	B_LogEntry (TOPIC_Addon_KDW,"Zanesl jsem Laresovi ornament od Vatrase. Chce je p�edat vodn�m m�g�m osobn� a j� ho m�m doprovodit."); 
	
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
	description = "Co p�esn� tady v p��stavu d�l�?";
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
	AI_Output (other, self, "DIA_Addon_Lares_YourMission_15_00"); //Co p�esn� tady v p��stavu d�l�?
	
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_01"); //O tom nem��u mluvit.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_02"); //Vatras by mi utrhnul hlavu.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_03"); //D�l�m to, co v�ichni. D�l�m, co mi nak�ou vodn� m�gov�.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_04"); //N�kte�� z t�ch zmizel�ch lid� byli ryb��i. A zmizeli i se sv�mi �luny.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_05"); //A proto tu stoj�m a hl�d�m cel� p��stav. Snad se tu je�t� n�co semele.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_06"); //Ale mohl bys mi pomoct.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_07"); //Posly�, p�j��m ti sv�j akvamar�novej prsten. Ten je pozn�vac�m znamen�m �len� kruhu vody.
		
		CreateInvItems (self, ItRi_Ranger_Lares_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Lares_Addon, 1);
		SC_GotLaresRing = TRUE;		
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_08"); //Kdy� ho bude� m�t na prst�, ostatn� budou v�d�t, �e jedn� m�m jm�nem.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_09"); //Se�e� n�koho, kdo to tu za m� vezme, a� m��u j�t vr�tit ten ornament.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_10"); //N�kdo z n�s ur�it� hl�d� na tr�i�ti, ale nev�m, na kom je zrovna �ada.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_11"); //Tak�e si rad�i promluv se v�ema, kte�� tam post�vaj. A� naraz� na toho prav�ho, v�imne si m�ho prstenu a d� ti v�d�t.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_12"); //Vy�i� mu, �e pot�ebuju, aby m� tady v p��stavu n�kdo vyst��dal.

		B_LogEntry (TOPIC_Addon_RingOfWater,"Lares mi p�edal sv�j akvamar�nov� prsten - tajn� znamen� na�eho kruhu. Kdy� jej budu nosit, ostatn� �lenov� poznaj�, �e k nim pat��m."); 

		Log_CreateTopic (TOPIC_Addon_BringRangerToLares, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BringRangerToLares,"Lares nem��e opustit p��stav. Proto m�m m�sto n�j zaj�t na tr�i�t�, prok�zat se jeho akvamar�nov�m prstenem a naj�t n�koho, kdo by ho vyst��dal."); 

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

	description	 = 	"Mluvil jsem s Baltramem.";
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
	AI_Output (other, self, "DIA_Addon_Lares_BaltramAbloese_15_00"); //Mluvil jsem s Baltramem. Pr� najde n�koho, kdo t� p�ijde nahradit.
	AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_01"); //�, tak to je fajn. Tak�e m��eme kone�n� vypadnout.
	if (SC_IsRanger == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_02"); //Ale ten m�j akvamar�novej prsten si rad�i je�t� nech.
		
		if (Npc_KnowsInfo (other, DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_03"); //(s �sm�vem) Mysl�m, �e se ti je�t� bude hodit.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_04"); //(s �sm�vem) Kdo v�, t�eba se k n�m bude� cht�t p�idat.
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
	description	= "Co se t��e t�ch poh�e�ovan�ch lid�...";
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
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_15_00"); //Co se t��e t�ch poh�e�ovan�ch lid�...
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice (DIA_Addon_Lares_PeopleMissing, DIALOG_BACK, DIA_Addon_Lares_PeopleMissing_BACK);
	if (MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "N�kolik z t�ch poh�e�ovan�ch lid� jsem zachr�nil.", DIA_Addon_Lares_PeopleMissing_SAVED );
	}
	else if (MIS_Lares_BringRangerToMe != 0)
	&& (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "U� v�m, co se s t�mi poh�e�ovan�mi lidmi stalo.", DIA_Addon_Lares_PeopleMissing_Success );
	}
	else
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Nen� to sp� z�le�itost pro domobranu?", DIA_Addon_Lares_PeopleMissing_MIL );
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Prozra� mi, co v�.", DIA_Addon_Lares_PeopleMissing_TellMe );
	};
};
func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_TellMe_15_00"); //Pov�z mi, co v�.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_01"); //Nap�ed to byl William, jeden ze zdej��ch ryb���. Jednoho dne se prost� nevr�til.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_02"); //Zpo��tku jsme si mysleli, �e ho prost� schlamstla jedna z t�ch mo�skejch p��er.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_03"); //Jen�e zanedlouho za�ali mizet i dal�� lidi z m�sta i okol�. To u� by byly p�kn� divn� n�hody.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_04"); //Nikdo z nich se zat�m nevr�til. Zat�m to vypad�, �e budeme muset po�kat, dokud nenaraz�me na n�jakou stopu.

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
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_MIL_15_00"); //Copak by se o tyhle v�ci nem�la starat domobrana?
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_01"); //Domobrana vyp�tr� houby s octem, abych tak �ekl.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_02"); //Tohle nikdy neobjasn�. TI lidi se prost� vypa�ili.
};
func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_00"); //V�m, co se stalo s t�mi poh�e�ovan�mi lidmi!
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_01"); //(p�ekvapen�) V�n�?
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_02"); //Unesl je b�val� rudobaron Havran.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_03"); //V� to jist�? Tak to je odtamtud mus�me dostat.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_04"); //Pracuju na tom.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_05"); //Fajn. A kdybys pot�eboval pomoc...
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_06"); //...v�m, kde t� hledat. Je mi to jasn�.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_SAVED ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_SAVED_15_00"); //N�kter� z t�ch zmizel�ch lid� u� jsem zachr�nil.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_SAVED_09_01"); //J� v�d�l, �e to dok�e�. Tak�e u� si m��u kone�n� j�t po sv�m.
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
	description	= "Pot�ebuji tvou pomoc.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_RangerHelp_15_00"); //Pot�ebuju tvou pomoc.
	AI_Output	(self, other, "DIA_Addon_Lares_RangerHelp_09_01"); //A co p�esn� m� na mysli?
	
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice (DIA_Addon_Lares_RangerHelp, DIALOG_BACK, DIA_Addon_Lares_RangerHelp_nix );
	
	if (Npc_IsInState (Moe, ZS_Attack))
	{
		Info_AddChoice (DIA_Addon_Lares_RangerHelp, "Ten chlap m� otravuje!", DIA_Addon_Lares_RangerHelp_Moe);
	};
		
	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Pot�ebuju lep�� zbra�.", DIA_Addon_Lares_RangerHelp_waffe );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Co takhle n�jak� lep�� brn�n�?", DIA_Addon_Lares_RangerHelp_ruestung );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Pot�ebuju pen�ze.", DIA_Addon_Lares_RangerHelp_geld );
	};
};
func void DIA_Addon_Lares_RangerHelp_ruestung ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_00"); //Co takhle n�jakou lep�� zbroj.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_01"); //Hmm. Zbroj prod�v� Matteo, ale ur�it� za ni bude cht�t majlant.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_02"); //Ale d� se z�skat i levn�jc, kdy� ti p�itom nebude vadit trochu nap�lit domobranu.
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_03"); //Co t�m mysl�?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_04"); //Matteo m� vedle sv�ho domu skladi�t�, ale v�echno zbo�� zabavila domobrana.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_05"); //Zajdi na tr�i�t� za Zurisem, kup si u n�j usp�vac� kouzlo a t�m pak po�li v�echny str�ce do ��e sn�.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_06"); //Pak si mezi Matteov�m zbo��m ur�it� vybere� n�co �ikovn�ho.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_waffe_15_00"); //Pot�ebuju lep�� zbra�.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_waffe_09_01"); //Tak v tom ti, ob�v�m se, nepom��u. Zkusils to na tr�i�ti?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_geld ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_geld_15_00"); //Pot�ebuju prachy.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_01"); //Tak to pot�ebujeme v�ichni. Je mi l�to, nem�m, co bych ti dal. Ale lichv�� Lehmar mi je�t� dlu�� laskavost.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_02"); //Zajdi za n�m a p�j� si, kolik pot�ebuje�. O zbytek se postar�m. Najde� ho v p��stavn� �tvrti, tam, kde u� skoro za��n� doln� ��st m�sta.
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
	AI_Output (other, self, "DIA_Addon_Lares_Moe_15_00"); //Ten chlap m� otravuje.
	AI_Output (self, other, "DIA_Addon_Lares_Moe_09_01"); //Dlouho u� to nepotrv�.
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
	description	 = 	"Mus�m mluvit s paladiny, a� to stoj�, co to stoj�!";
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
	AI_Output (other, self, "DIA_Lares_Paladine_15_00"); //Mus�m za ka�dou cenu mluvit s paladiny!
	AI_Output (self, other, "DIA_Lares_Paladine_09_01"); //Co od NICH chce�?
	AI_Output (other, self, "DIA_Lares_Paladine_15_02"); //Maj� mocn� amulet, Innosovo oko. Mus�m ho m�t.
	AI_Output (self, other, "DIA_Lares_Paladine_09_03"); //A to si mysl�, �e ti ho daj�? Nikdy se nedostane� ani do horn� ��sti m�sta.
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		AI_Output (other, self, "DIA_Lares_Paladine_15_04"); //N�jak� zp�sob se najde.
		AI_Output (self, other, "DIA_Lares_Paladine_09_05"); //Jasn�, jestli chce� podlejzat m욝an�m nebo d�lat poskoka domobran�...
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
	description	 = 	"V�, pro� jsou tu jsou paladinov�?";
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
	AI_Output (other, self, "DIA_Lares_WhyPalHere_15_00"); //V�, pro� tu jsou paladinov�?
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_01"); //Nikdo to nev� jist�. Hodn� lid� si mysl�, �e to je kv�li sk�et�m, ale j� si mysl�m, �e tu je jinej d�vod.
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_02"); //Nejsp� to m� co d�lat se starou trestaneckou koloni�.
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
	description	 = 	"Vatras tvrdil, �e mi pom��e� p�idat se k n�kter� z m�stn�ch komunit.";
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
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_15_00"); //Podle Vatrase mi pr� m��e� pomoct p�idat se k n�kter� z m�stn�ch komunit.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_01"); //(sm�je se) U� t� unavuje bejt n�mandem, co?
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_02"); //No dob�e, ch�pu t�.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_03"); //Jestli se chce� p�idat k Leemu, m��u na �old�ky trochu zap�sobit.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_04"); //A ur�it� najdeme zp�sob, jak se brzo dostat do kl�tera.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_05"); //Ale nejjednodu��� by stejn� bylo p�idat se k domobran�.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_06"); //Komu d�v� p�ednost ty?
		
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Pop�em��l�m o tom.", DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Ohniv� m�gov�.", DIA_Addon_Lares_Gilde_KDF );
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "�oldn��i.", DIA_Addon_Lares_Gilde_SLD );	
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Domobrana.", DIA_Addon_Lares_Gilde_MIL );
};
func void DIA_Addon_Lares_Gilde_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_BACK_15_00"); //Tak to si mus�m rozmyslet...
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_SLD ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_SLD_15_00"); //�old�k�m.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_01"); //Jsem si jist, �e t� Lee p�ijme.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_01"); //Ale nap�ed bude� muset proj�t zkou�kou.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_02"); //B� na Onar�v statek a promluv si tam s Cordem. 
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_02"); //Pom��e ti tu zkou�ku splnit.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_03"); //Pov�z mu, �e nad tebou dr��m ochrannou ruku. Pochop� to.
	RangerHelp_gildeSLD = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpSLD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Podle Larese mi m��e �ivot na statk��ov� farm� uleh�it �old�k Cord."); 
	
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_MIL_15_00"); //Domobran�.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_01"); //(pobaven�) Je mi jasn�, �e by se ti to l�bilo! Diktovat ostatn�m z�kony a p�itom jim vyb�rat kapsy.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_02"); //Paladinov� skladuj� sv� z�soby v p��stavu a jejich skladn�k je m�j dobr� p��tel.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_03"); //Mo�n� by ti mohl n�jak pomoct. Jmenuje se Martin.

	Log_CreateTopic (TOPIC_Addon_RangerHelpMIL, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Lares mi poradil, �e jestli se chci co nejd��ve st�t �lenem domobrany, m�l bych zaj�t za skladn�kem Martinem. Obvykle post�v� v p��stavu, kde paladinov� uchov�vaj� sv� z�soby."); 
	
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_KDF ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_KDF_15_00"); //Ohniv�m m�g�m.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_01"); //(sm�je se) Vsad�m se, �e tohle Vatras nep�edv�dal, jinak by m� za tebou neposlal.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_02"); //Vstup do kl�tera je drah�.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_03"); //Ti ho�i t� nepust� d�l, dokud jim nev�nuje� p�kn� tu�n� milodar.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_04"); //A jedin�, kdo v t�hle v�ci m��e n�co ud�lat, je s�m Vatras. Zkus si s n�m o tom promluvit.

	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Lares tvrdil, �e Vatras zn� snadn� zp�sob, jak se dostat do kl�tera."); 

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
	description	 = 	"Pov�z mi o Leem a t�ch jeho �old�c�ch n�co bli���ho.";
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
	AI_Output (other,self,  "DIA_ADDON_Lares_AboutSld_15_00"); //Pov�z mi n�co v�c o Leeovi a jeho �old�c�ch.
	AI_Output (self, other, "DIA_ADDON_Lares_AboutSld_09_01"); //Ale co bys cht�l v�d�t?
	
	Info_ClearChoices (DIA_Lares_AboutSld);
	Info_AddChoice (DIA_Lares_AboutSld, DIALOG_BACK, DIA_Lares_AboutSld_BACK);
	Info_AddChoice (DIA_Lares_AboutSld, "A pro� teda nejsi s Leem a jeho �old�kama?", DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice (DIA_Lares_AboutSld, "Cht�l bych v�d�t v�c o t�ch �old�c�ch.", DIA_Lares_AboutSld_Sld);
	Info_AddChoice (DIA_Lares_AboutSld, "Jak najdu farmu velkostatk��e?", DIA_Lares_AboutSld_WayToOnar); 
};
func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices (DIA_Lares_AboutSld);
};
func void DIA_Lares_AboutSld_Sld()
{	
	AI_Output (other,self,  "DIA_Lares_AboutSld_15_00"); //�ekni mi o �oldn���ch v�c.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_01"); //Fajn, jestli se� po��d tak tvrdej, jako jsi bejval, nem�l bys s nima m�t ��dnej probl�m.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_02"); //V�t�ina z nich jsou rv��i, a jestli se jim nebude� um�t postavit, daleko se nedostane�.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_03"); //(sm�ch) Jestli se� krapet p�ecitliv�lej, tak nem� �anci s nima vydr�et.
};	
func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output (other, self, "DIA_Lares_WhyInCity_15_00"); //A pro� teda nejsi s Leem a jeho �old�kama?
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_01"); //Ale v�dy� jsem! Jenom ne na farm�.
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_02"); //D� se ��ct, �e ho tady ve m�st� zastupuju. Nechceme, aby ta lo� odplula bez n�s.
	//AI_Output (self, other, "DIA_Lares_WhyInCity_09_03"); //Warum bist DU in die Stadt gekommen?
	Lares_WorkForLee = TRUE;
	
	Info_AddChoice (DIA_Lares_AboutSld, "O jak� lodi jsi to mluvil?", DIA_Lares_AboutSld_Schiff);
};
func void DIA_Lares_AboutSld_Schiff()
{	
	AI_Output (other,self , "DIA_Lares_Schiff_15_00"); //O jak� lodi jsi to mluvil?
	AI_Output (self, other, "DIA_Lares_Schiff_09_01"); //Je na otev�en� ��sti p��stavu za �tesem. Lee se chce se svejma p�r lidma odsud v�n� dostat.
	AI_Output (self, other, "DIA_Lares_Schiff_09_02"); //Ale bude to chv�li trvat.
	AI_Output (other,self , "DIA_Lares_Schiff_15_03"); //Pro�?
	AI_Output (self, other, "DIA_Lares_Schiff_09_04"); //M�l by ses na to rad�j zeptat Leeho, kdy� ho potk�... M� dobrej pl�n.
};
func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output (other,self, "DIA_Lares_WegZumHof_15_00"); //Jak najdu farmu velkostatk��e?
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_00"); //Je to jednoduch�. Vyjde� v�chodn� br�nou z p��stavu a pak p�jde� po cest� k v�chodu.
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_01"); //Jestli chce�, m��u t� tam zav�st.
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
	description	 = 	"V� n�co o zlod�jsk�m cechu ve m�st�?";
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
	AI_Output (other, self, "DIA_Lares_GuildOfThieves_15_00"); //V� n�co o zlod�jsk�m cechu ve m�st�?
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_01"); //Ty tvoje ot�zky...
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_02"); //Samoz�ejm�, m�me tady zlod�jskej cech. Jako v ka�d�m v�t��m m�st�.
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_03"); //A ka�dej malej zlod�j��ek nebo �melin�� je s n� n�jak propojenej.
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
	description	 = 	"V�, kde bych ten cech na�el?";
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
	AI_Output (other, self, "DIA_Lares_WhereGuildOfThieves_15_00"); //V�, kde bych ten cech na�el?
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_01"); //(sm�ch) Bez ur�ky, ale v�m jen to, �e ti nesm�m nic ��ct.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_02"); //Tihle lid� na takov� v�ci v�t�inou reaguj� VELMI citliv�.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_03"); //Jestli se s nima chce� zapl�st, m�l bys b�t hodn� opatrn�.
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
	description	 = 	"M�m tady tenhle kl��. Je celej zrezlej od mo�sk� vody...";
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
	AI_Output (other, self, "DIA_Lares_GotKey_15_00"); //M�m tady tenhle kl��. Je celej zrezlej od mo�sk� vody.
	AI_Output (self, other, "DIA_Lares_GotKey_09_01"); //Tak�e?
	AI_Output (other,self, "DIA_Lares_GotKey_15_02"); //M�m dojem, �e by m� mohl dov�st k �krytu zlod�jsk�ho cechu.
	AI_Output (self, other, "DIA_Lares_GotKey_09_03"); //Fajn, to by moh bejt kl�� od stok.
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
	description	 = 	"Kde najdu ty stoky?";
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
	AI_Output (other,self, "DIA_Lares_Kanalisation_15_00"); //Kde najdu ty stoky?
	AI_Output (self, other, "DIA_Lares_Kanalisation_09_01"); //Co j� v�m... v�t�inou �st� do mo�e.
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
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_00"); //Ty jsi te� v domobran�!
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_01"); //(sm�ch) To m� podr� - bejvalej trestanec v domobran�...
		}
		else //GIL_PAL
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_02"); //Tak ty se� te� jedn�m z kr�lovsk�ch paladin�!
		};
	
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_03"); //(uli�nicky) N�co takov�ho m��e� prov�st jenom ty.
	
		if (Lares_WorkForLee == TRUE)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_04"); //(starostliv�) Nepr�skne� m� kv�li moj� spolupr�ci s Leem?
			AI_Output (other,self , "DIA_Lares_OtherGuild_15_05"); //V�ak m� zn�...
		};
	};
	
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_06"); //Nerozum�m tomu. Vstoupil jsi do kl�tera. Jak� to tam je?
		AI_Output (other,self , "DIA_Lares_OtherGuild_15_07"); //Jin�.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_08"); //Nedovedu si to p�edstavit.
	};
		
	if (other.guild == GIL_SLD) 
	|| (other.guild == GIL_DJG)
	{
		//AI_Output (self, other, "DIA_Lares_OtherGuild_09_09"); //Ich hab geh�rt, du bist aufgenommen worden.
		AI_Output (self, other, "DIA_Addon_Lares_OtherGuild_09_00"); //Pr� t� p�ijali k Leemu.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_10"); //Gratuluju.
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

	description	 = 	"Pomohl bys mi proj�t t�mi hou�tinami na v�chod�?";
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
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_00"); //Nepomohl bys mi proj�t p�es ty hust� lesy na v�chod�.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_01"); //Klidn�, ale pro� tam chce� j�t?
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_02"); //Nefarius mi nak�zal naj�t dal�� ornamenty.
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_03"); //A jedno z m�st, kde m�m hledat, by m�lo b�t pr�v� uprost�ed t�ch hvozd�.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_04"); //Ch�pu. A pro jednoho je takov� cesta moc nebezpe�n�, co?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_05"); //Tak fajn, jen mi dej v�d�t, a� bude� cht�t vyrazit.

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
	description	 = 	"OK, jdeme.";
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
 	AI_Output (self, other, "DIA_Lares_GoNow_09_01"); //Tak jdeme... Poj� za mnou.
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
	AI_Output (other, self, "DIA_Lares_GoNow_15_00"); //Fajn, jdeme.
	
	if (Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_03"); //Nem��u odsud odej�t, dokud nezjist�me v�c o t�ch zmizel�ch lidech, nebo pokud m� tu n�kdo nevyst��d�.
	}
	else if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING) //bleibt am Hafen w�hrend RangerMeeting
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
			AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_04"); //Tak kam?
			
			
			Info_ClearChoices	(DIA_Lares_GoNow);
			Info_AddChoice	(DIA_Lares_GoNow, DIALOG_BACK, DIA_Lares_GoNow_warte );
		
			if (Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS)
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Na Onar�v statek.", DIA_Lares_GoNow_Onar );
			};
		
			if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) && (Lares_Angekommen == FALSE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Poj�me odevzdat ten Vatras�v ornament.", DIA_Lares_GoNow_Maya );
			};
			
			if ((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Do hust�ho lesa na v�chod�.", DIA_Lares_GoNow_Forest );
			};
	};		
};

func void DIA_Lares_GoNow_Maya ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Maya_15_00"); //Tak poj�me Vatrasovi vr�tit ten ornament.
	LaresGuide_ZumPortal = 1;
	Npc_ExchangeRoutine (self, "GUIDEPORTALTEMPEL1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Onar ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Onar_15_00"); //Na Onar�v statek.
	LaresGuide_ZuOnar = TRUE;
	Npc_ExchangeRoutine (self, "GUIDE");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Forest ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Forest_15_00"); //Do hust�ho lesa na v�chod�.
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
		AI_Output (self, other, "DIA_Lares_GUIDE_09_00"); //Tak jsme tady.
	}
	else
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_01"); //Tak tady jsi. U� jsem si za��nal myslet, �e t� se�rali vlci.
	};
	AI_Output (self, other, "DIA_Lares_GUIDE_09_02"); //Tak�e d�l u� tref� s�m. Mus�m se vr�tit do m�sta, m�m tam je�t� n�jak� vy�izov�n�.
	AI_Output (self, other, "DIA_Lares_GUIDE_09_03"); //Prost� pokra�uj po t�hle cest� d�l a pamatuj - va� si s�m sebe a nepod�lej se z ka�d� blbosti, pak to pro tebe bude hra�ka.
	
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
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_00"); //Te�, kdy� jsme venku z m�sta a nikdo n�s nem��e sly�et, vysv�tl�m ti to trochu bl�.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_01"); //Ten ornament, kter� jsi mi dal, te� odneseme Saturasovi. Pamatuje� se na Saturase, ne?
	
	
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Jasn�.", DIA_Addon_Lares_ArrivedPortalInter1_ja );
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Saturas? Kdo je to?", DIA_Addon_Lares_ArrivedPortalInter1_wer );

	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2 ()
{
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00"); //My chlapi z Nov�ho t�bora m�me po��d dobr� vztahy s vodn�mi m�gy.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01"); //Dokonce i Lee se je dote�ka sna�� chr�nit, jak m��e, aby je nepotkalo nic zl�ho.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02"); //J� mus�m b�t s vodn�mi m�gy po��d v kontaktu, proto jsem taky v�t�inou ve m�st� a spolupracuju s Vatrasem.
	B_MakeRangerReadyForMeeting (self);
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03"); //A tohle je zbroj, kterou n�m v�em dali vodn� m�gov�. Pr� takov� brn�n� nosili �lenov� kruhu vody je�t� p�ed v�lkama se sk�ety.
	
	if (Cavalorn_RangerHint == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04"); //Jak je do toho v�eho zapleten� Cavalorn? Pokud v�m, tak ten do Nov�ho t�bora nepat�il.
		AI_Output (self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05"); //M� pravdu, na�e komunita se rozrostla. Dokonce ani j� u� nev�m, kolik n�s vlastn� je.
	};

	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06"); //Ale te� se pohn�me. Chci se dostat d�l od m�sta a pak si m��eme ��ct v�c.
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00"); //Saturasovi? Kdo je to?
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01"); //V Nov�m t�bo�e b�val hlavn�m m�gem vody, je�t� kdy� Hornick� �dol� obklopovala bari�ra.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02"); //Tenkr�t jsme se s Leem sp��hli s vodn�mi m�gy. Pak jsme byli dost siln�, abysme se ubr�nili Star�mu t�boru.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00"); //Samoz�ejm�, b�val hlavn�m vodn�m m�gem v Nov�m t�bo�e.
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
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00"); //Co se d�je? Pro� po��d v�h�?
	
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
	&& ((Npc_GetDistToWP(Erol,"NW_TAVERN_TO_FOREST_03")<1000))
	&& ((Npc_IsDead(Erol))==FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01"); //Tamhle ten chlap m� probl�my s bandity.
		AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02"); //(j�zliv�) Tak to m� sm�lu, ale my na to te� nem�me �as.
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
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00"); //Jen se tu nesesypej.
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
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_00"); //M�gov� vody jsou cel� bez sebe. U� p�r t�dn� makaj na vykop�vk�ch na severov�chod�, ale nikdo netu��, co se tam vlastn� sna�� naj�t.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_01"); //V�echno to za�alo, kdy� se zem� za�ala t��st, jako to b�valo v nejhor��ch dob�ch bari�ry.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_02"); //Ze zem� vyl�zaj d�sn� kamenn� potvory a zabijou ka�d�ho, kdo se nachom�tne na 100 stop od nich.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_03"); //Vodn� m�gov� se toho chopili a v�ecky ty nep��telsk� �to�n�ky zni�ili. A te� tam kopou a hledaj� pro v�echny ty podivnosti n�jak� vysv�tlen�.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_04"); //Ale to brzo uvid� s�m.

	LaresGuide_ZumPortal = 5;
	B_LogEntry (TOPIC_Addon_KDW,"Lares mi vypr�v�l o vykop�vk�ch, kter� maj� na sv�dom� vodn� m�gov�. Sna�� se objasnit n�jak� podivn� ud�losti - tajemn� zem�t�esen� a z�hadn� kamenn� obludy, kter� povst�vaj� p��mo ze zem�."); 
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
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00"); //M��e� je�t� pokra�ovat.
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
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00"); //Jo, tady u� to m��e bejt nebezpe�n�.
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
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_00"); //Tak jsme tu.
 	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_01"); //Tum�, vezmi si ten ornament. Vodn� m�gov� mus� b�t n�kde tady. Tak jim ho dej.
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);					
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_02"); //Kdybys v t� d��e narazil na n�jak� potvory, na kter� bys nesta�il, ut�kej sm�rem k Saturasovi.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_03"); //On je za tebe vy��d�. J� u� se mus�m vr�tit.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_04"); //Jo, je�t� n�co: a� t� ani nenapadne, �e by ses tu del�� dobu promen�doval s t�m ornamentem. B� P��MO za Saturasem.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_05"); //M�j se.
	
	B_LogEntry (TOPIC_Addon_KDW,"Lares mi p�edal tento ornament. M�m jej don�st vodn�mu m�govi Saturasovi."); 
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
	AI_Output (self, other, "DIA_Addon_Lares_Albern_09_00"); //(ost�e) P�esta� se tu poflakovat a koukej Saturasovi don�st ten ornament!
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
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_ja_15_00"); //Ano.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_ja_09_01"); //Tak fajn, kamar�de. Poj� za mnou, p�jde do tuh�ho.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2; 
};
func void DIA_Addon_Lares_GOFORESTPRE_nein ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_nein_15_00"); //Ne. M��e� j�t.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_nein_09_01"); //Mysl�, �e se to v�ecko vy�e�� samo? No tak dobr�, m�j se!
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"Start");
	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit Guide
};

func void DIA_Addon_Lares_GOFORESTPRE_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_00"); //Je�t� po��d bys cht�l se mnou vyrazit do toho lesa?
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_01"); //P�em��lel jsi o tom, �e vyraz�me do lesa? Opravdu to chce� ud�lat?
 	};
	Info_ClearChoices	(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "Ne. M��e� j�t.", DIA_Addon_Lares_GOFORESTPRE_nein );
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "Ano.", DIA_Addon_Lares_GOFORESTPRE_ja );
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
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_00"); //Tak, zbytek u� bys m�l zvl�dnout s�m. J� jdu zp�tky.
	 	AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine (self,"START");
	 	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit guide Forest!
 	}
 	else
 	{
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_01"); //Posp� si, nechci tu z�st�vat ani o chvilku d�l, ne� mus�m.
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

	description	 = 	"Tak jdeme.";
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
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_00"); //P�esta� pl�cat nesmysly.
	}
	else if (LaresGuide_ZumPortal == 6)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_01"); //(na�tvan�) Jo, jo.
	};

	AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_02"); //Tak jdeme.
	
	if (LaresGuide_ZumPortal == 7)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_03"); //Dr� se trochu d�l.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_04"); //Dr� se za mnou.
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
	description	 = 	"M��e� m� n��emu nau�it?";
};
func int DIA_Lares_DEX_Condition ()
{	
	return TRUE;
};
func void DIA_Lares_DEX_Info ()
{
	AI_Output (other, self, "DIA_Lares_DEX_15_00"); //M��e� m� n��emu nau�it?
	AI_Output (self, other, "DIA_Addon_Lares_DEX_Add_09_01"); //Jasn�. Kdy� bude� cht�t, m��u ti vysv�tlit, jak se st�t siln�j��m a obratn�j��m.

	Lares_TeachDEX = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Lares mi pom��e zlep�it s�lu a obratnost.");
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
	description	 = 	"M��e� m� n��emu nau�it?";
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
	AI_Output (other,self ,"DIA_Addon_Lares_Teach_15_00"); //Nau� m� n�co.
	
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
		AI_Output (self, other, "DIA_Lares_TEACH_BACK_09_00"); //Zase jsi o n�co obratn�j��.
	};
	if (other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_Lares_TEACH_BACK_Add_09_00"); //(odhaduje) Dob�e. Zes�lil jsi.
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
	description = "Co je nov�ho?";
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
	AI_Output (other,self ,"DIA_Lares_AnyNews_15_00"); //Co je nov�ho?
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_01"); //Za ty nejlep�� zpr�vy m��e� ty s�m. Nechali Benneta j�t, je zp�tky na farm�.
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_02"); //B� za n�m, m�m dojem, �e by ti cht�l pod�kovat osobn�.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_03"); //Dalo by se to tak ��ct. Paladinov� zab�sli Benneta, na�eho kov��e.
		
		if (MIS_RescueBennet == LOG_RUNNING)
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_04"); //Sly�el jsem. Tak to je zl�.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_05"); //To mi pov�dej.
		}
		else
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_06"); //Jak se to stalo?
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_07"); //Bennet odjel do m�sta pro z�soby. No a u� se nevr�til.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_08"); //Jestli se chce� dozv�d�t v�c, promluv si s Hodgesem, byl ve m�st� s Bennetem.
			
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
	description = "N�jak� zpr�vy o Bennetovi?";
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
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_00"); //N�jak� zpr�vy o Bennetovi?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_01"); //Vypad� to, �e ho vzali do kas�ren a str�ili do �al��e.
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_02"); //Jak ho odtamtud m��eme dostat?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_03"); //Tak to v�bec netu��m. Nem��u se dostat ani k n�mu do cely, abych si s n�m promluvil.
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_04"); //V�echno, co zm��u, je m�t o�i na stopk�ch. Ale asi toho stejn� moc nevykouk�m.
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
	description = "Pro� nejsi venku a nelov� draky?";
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
	AI_Output (other,self ,"DIA_Lares_Kap4_PERM_15_00"); //Pro� nejsi venku a nelov� draky?
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_01"); //O takov� v�ci se nestar�m, p�enech�v�m je ostatn�m.
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_02"); //Hmmm. �erstv� mo�sk� vzduch - to je p�esn� to, co jsem pot�eboval.
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
	description	 = 	"Necht�l bys opustit tenhle ostrov?";
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
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_00"); //Necht�l bys opustit tenhle ostrov?
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_01"); //V�c ne� cokoli jin�ho. Cos myslel?
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_02"); //Zjistil jsem, kde se ukr�v� v�dce drak�. Je na ostrov�, nedaleko odsud.
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_03"); //Chci se ho jednou prov�dy zbavit.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_04"); //Spr�vn� slova. Jestli m� bude� pot�ebovat, jdu do toho.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_05"); //M��e� na sv�ch cest�ch pot�ebovat n�koho, kde t� nau�� posilovat obratnost nebo boj jednoru�n�mi zbran�mi?
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lares_KnowWhereEnemy_15_06"); //Lo� u� je pln�, ale kdyby se n�co zm�nilo, d�m v�d�t.
	}
	else 
	{
		Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"K ni�emu bys mi nebyl.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"V�d�l jsem, �e se na tebe m��u spolehnout.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lares_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_00"); //V�d�l jsem, �e se na tebe m��u spolehnout.
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_01"); //V�ichni se sejdeme na lodi.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02"); //Mu� �inu, tak to m�m r�d. Je�t� se uvid�me.
	
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
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_No_15_00"); //Cen�m si tv� nab�dky, ale nem�m, jak bych t� vyu�il.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_No_09_01"); //S�m mus� v�d�t, co chce�. Pokud si o tom bude� cht�t promluvit pozd�ji, v�, kde m� najde�.

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
	description	 = 	"Bude lep��, kdy� z�stane� tady.";
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
	AI_Output			(other, self, "DIA_Lares_LeaveMyShip_15_00"); //Bude lep��, kdy� nepopluje�.
	AI_Output			(self, other, "DIA_Lares_LeaveMyShip_09_01"); //Jak chce�, ale pak si vzpome�, kdo komu co sliboval.
	
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
	description	 = 	"Je�t� po��d bys m�l z�jem o tu cestu?";
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
	AI_Output			(other, self, "DIA_Lares_StillNeedYou_15_00"); //Je�t� po��d bys m�l z�jem o tu cestu?
	
	if (Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_01"); //Norm�ln� nenech�v�m jen tak n�koho, aby se mnou takhle jednal, ale jeliko� jsi jedn�m z n�s, nech�m to protentokr�t b�t.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_02"); //Uvid�me se na lodi.
		
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
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_03"); //Neber si to n�jak osobn�, ale asi jsi m�l pravdu.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_04"); //Bude lep��, kdy� z�stanu tady.
		
		AI_StopProcessInfos (self);
	};	
};


























