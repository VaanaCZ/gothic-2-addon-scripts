// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Owen_EXIT(C_INFO)
{
	npc			= PIR_1367_Addon_Owen;
	nr			= 999;
	condition	= DIA_Addon_Owen_EXIT_Condition;
	information	= DIA_Addon_Owen_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Owen_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Owen_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Owen_PICKPOCKET (C_INFO)
{
	npc			= PIR_1367_Addon_Owen;
	nr			= 900;
	condition	= DIA_Addon_Owen_PICKPOCKET_Condition;
	information	= DIA_Addon_Owen_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Owen_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Addon_Owen_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Owen_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Owen_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Owen_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Owen_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Owen_PICKPOCKET_DoIt);
};

func void DIA_Addon_Owen_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Owen_PICKPOCKET);
};
	
func void DIA_Addon_Owen_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Owen_PICKPOCKET);
};
// ************************************************************
// 			  				 Hallo 
// ************************************************************
instance DIA_Addon_Owen_Hello		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 1;
	condition	= DIA_Addon_Owen_Hello_Condition;
	information	= DIA_Addon_Owen_Hello_Info;

	important 	= TRUE;
};
func int DIA_Addon_Owen_Hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_Hello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_00"); //Wszystko w porz�dku?
	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_01"); //Kim jeste�? Nale�ysz do bandyt�w?
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_02"); //A wygl�dam na takiego?

	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ItAr_Pir_M_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_L_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_H_Addon) == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_03"); //Nosisz nasze barwy, ale nie znam ci�.
	}
	else if ((Hlp_IsItem(itm, ItAr_BDT_M) == TRUE)
	|| (Hlp_IsItem(itm, ItAr_BDT_H) == TRUE))
	
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_04"); //Prawd� m�wi�c, to tak.
	}
	else
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_05"); //Nie. S�dz�c po wygl�dzie, jestem sk�onny uwierzy�, �e przybywasz z daleka.
	};
};

// ************************************************************
// 			  		 Hallo 2 	(Was machst du?)
// ************************************************************
instance DIA_Addon_Owen_WasMachen		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 2;
	condition	= DIA_Addon_Owen_WasMachen_Condition;
	information	= DIA_Addon_Owen_WasMachen_Info;

	description	= "Co tu robisz?";
};
func int DIA_Addon_Owen_WasMachen_Condition ()
{
	if (Malcom_Accident == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_WasMachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_WasMachen_15_00"); //Co tu robisz?
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_01"); //Jestem drwalem. R�bi� drzewa, kt�re inni zaci�gaj� do obozu.
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_02"); //A tak naprawd� zaharowuj� si� tu na �mier�, podczas gdy pozostali bycz� si� na s�o�cu.
};

// ************************************************************
//								PERM
// ************************************************************
instance DIA_Addon_Owen_Perm		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 99;
	condition	= DIA_Addon_Owen_Perm_Condition;
	information	= DIA_Addon_Owen_Perm_Info;
	permanent	= TRUE;
	description	= "Co� jeszcze?";
};
func int DIA_Addon_Owen_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Owen_WasMachen))
	|| (Npc_KnowsInfo (other, DIA_Addon_Owen_MalcomStunt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_Perm_15_00"); //Co� jeszcze?
	AI_Output	(self, other, "DIA_Addon_Owen_Perm_13_01"); //Gdybym wiedzia�, �e tak to b�dzie wygl�da�, nigdy nie zosta�bym piratem.
};

// ************************************************************
// 						Henrys Holzlieferung
// ************************************************************
instance DIA_Addon_Owen_Henry		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 3;
	condition	= DIA_Addon_Owen_Henry_Condition;
	information	= DIA_Addon_Owen_Henry_Info;
	permanent	= TRUE;
	description	= "Henry czeka na dostaw� drewna do budowy palisady.";
};
func int DIA_Addon_Owen_Henry_Condition ()
{
	if (MIS_Henry_HolOwen == LOG_RUNNING)
	&& (Owen_ComesToHenry == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_Henry_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_Henry_15_00"); //Henry czeka na dostaw� drewna do budowy palisady.

	if (MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_01"); //Najpierw musz� si� dowiedzie�, co si� sta�o z moim kumplem Malcolmem.
	
			
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_02"); //Dobrze, dobrze, zadbam o to jego drewno.
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_03"); //Id� i powiedz mu to.
		
		B_LogEntry (TOPIC_Addon_HolOwen,"Mam powiedzie� Henry'emu, �e Owen dostarczy drewno.");
		
		AI_StopProcessInfos (self);
		Owen_ComesToHenry = TRUE;
	};
};



// ************************************************************
// ***														***
// 							Malcom Accident
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 						Malcom im Loch
// ------------------------------------------------------------
instance DIA_Addon_Owen_MalcomStunt		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 1;
	condition	= DIA_Addon_Owen_MalcomStunt_Condition;
	information	= DIA_Addon_Owen_MalcomStunt_Info;

	description	= "Co si� dzieje?";
};
func int DIA_Addon_Owen_MalcomStunt_Condition ()
{
	if (Malcom_Accident == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_MalcomStunt_Info ()
{
	AI_Output (other, self, "DIA_Addon_Owen_MalcomStunt_15_00"); //Co si� dzieje?
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_01"); //M�j kompan, Malcolm, gdzie� znikn��.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_02"); //Zostali�my zaatakowani przez topielce.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_03"); //Troch� ich by�o, wi�c zwiali�my do jaskini.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_04"); //Niestety, jedna z tych bestii przylaz�a za nami.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_05"); //Malcolm rzuci� si�, �eby j� odp�dzi�. I wpad� razem z ni� do jakiej� jamy.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_06"); //Wyl�dowali w wodzie, bo s�ysza�em chlupni�cie.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_07"); //Przez chwil� s�ysza�em odg�osy walki, a potem zapad�a cisza.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_08"); //Nie wiem nawet, czy Malcolm �yje.
	
	Log_CreateTopic (TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MalcomsStunt,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Owen chce wiedzie�, czy jego przyjaciel Malcom �yje. Spad� z urwiska obok obozu razem z topielcem.");
	Log_AddEntry	(TOPIC_Addon_MalcomsStunt,"Owen powiedzia�, �e na dole jest woda i przez jaki� czas Malcom �y�. Ale wkr�tce przesta� dawa� znaki �ycia.");
	
	MIS_Owen_FindMalcom = LOG_RUNNING;
};

// ------------------------------------------------------------
// 					Wie komme ich da runter?
// ------------------------------------------------------------
instance DIA_Addon_Owen_runter		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 2;
	condition	= DIA_Addon_Owen_runter_Condition;
	information	= DIA_Addon_Owen_runter_Info;

	description	= "Jak mog� zej�� do tej rozpadliny?";
};
func int DIA_Addon_Owen_runter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Owen_MalcomStunt))
	&& (MIS_Owen_FindMalcom == LOG_RUNNING)
	&& (Npc_HasItems (Malcom, ItWr_TwoHStonePlate3_Addon) > 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_runter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_runter_15_00"); //Jak mog� zej�� do tej rozpadliny?
	AI_Output	(self, other, "DIA_Addon_Owen_runter_13_01"); //Trzeba albo zej�� po �cianie, albo zeskoczy�.
};

// ------------------------------------------------------------
// 						Malcom gefunden
// ------------------------------------------------------------
instance DIA_Addon_Owen_MalcomDead		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 3;
	condition	= DIA_Addon_Owen_MalcomDead_Condition;
	information	= DIA_Addon_Owen_MalcomDead_Info;

	description	= "Niestety, Malcolm nie �yje.";
};
func int DIA_Addon_Owen_MalcomDead_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Owen_MalcomStunt))
	&& (MIS_Owen_FindMalcom == LOG_RUNNING)
	&& (Npc_HasItems (Malcom, ItWr_TwoHStonePlate3_Addon) == 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_MalcomDead_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_MalcomDead_15_00"); //Niestety, Malcolm nie �yje.
	AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_01"); //No tego si� obawia�em. A teraz b�d� sobie wyrzuca�, �e mu nie pomog�em.
	if (SC_MadeStunt == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_02"); //Jeste� naprawd� odwa�ny, wiesz?
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_03"); //Ja nigdy bym si� na to nie zdoby�.
	};
	
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Powiedzia�em Owenowi, �e Malcolm nie �yje. Nie przej�� si� tym za bardzo.");
	
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Owen_MalcomDead);
};
