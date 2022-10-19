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
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_00"); //Wszystko w porz¹dku?
	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_01"); //Kim jesteœ? Nale¿ysz do bandytów?
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_02"); //A wygl¹dam na takiego?

	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ItAr_Pir_M_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_L_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_H_Addon) == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_03"); //Nosisz nasze barwy, ale nie znam ciê.
	}
	else if ((Hlp_IsItem(itm, ItAr_BDT_M) == TRUE)
	|| (Hlp_IsItem(itm, ItAr_BDT_H) == TRUE))
	
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_04"); //Prawdê mówi¹c, to tak.
	}
	else
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_05"); //Nie. S¹dz¹c po wygl¹dzie, jestem sk³onny uwierzyæ, ¿e przybywasz z daleka.
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
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_01"); //Jestem drwalem. R¹biê drzewa, które inni zaci¹gaj¹ do obozu.
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_02"); //A tak naprawdê zaharowujê siê tu na œmieræ, podczas gdy pozostali bycz¹ siê na s³oñcu.
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
	description	= "Coœ jeszcze?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_Perm_15_00"); //Coœ jeszcze?
	AI_Output	(self, other, "DIA_Addon_Owen_Perm_13_01"); //Gdybym wiedzia³, ¿e tak to bêdzie wygl¹daæ, nigdy nie zosta³bym piratem.
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
	description	= "Henry czeka na dostawê drewna do budowy palisady.";
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
	AI_Output	(other, self, "DIA_Addon_Owen_Henry_15_00"); //Henry czeka na dostawê drewna do budowy palisady.

	if (MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_01"); //Najpierw muszê siê dowiedzieæ, co siê sta³o z moim kumplem Malcolmem.
	
			
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_02"); //Dobrze, dobrze, zadbam o to jego drewno.
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_03"); //IdŸ i powiedz mu to.
		
		B_LogEntry (TOPIC_Addon_HolOwen,"Mam powiedzieæ Henry'emu, ¿e Owen dostarczy drewno.");
		
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

	description	= "Co siê dzieje?";
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
	AI_Output (other, self, "DIA_Addon_Owen_MalcomStunt_15_00"); //Co siê dzieje?
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_01"); //Mój kompan, Malcolm, gdzieœ znikn¹³.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_02"); //Zostaliœmy zaatakowani przez topielce.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_03"); //Trochê ich by³o, wiêc zwialiœmy do jaskini.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_04"); //Niestety, jedna z tych bestii przylaz³a za nami.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_05"); //Malcolm rzuci³ siê, ¿eby j¹ odpêdziæ. I wpad³ razem z ni¹ do jakiejœ jamy.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_06"); //Wyl¹dowali w wodzie, bo s³ysza³em chlupniêcie.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_07"); //Przez chwilê s³ysza³em odg³osy walki, a potem zapad³a cisza.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_08"); //Nie wiem nawet, czy Malcolm ¿yje.
	
	Log_CreateTopic (TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MalcomsStunt,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Owen chce wiedzieæ, czy jego przyjaciel Malcom ¿yje. Spad³ z urwiska obok obozu razem z topielcem.");
	Log_AddEntry	(TOPIC_Addon_MalcomsStunt,"Owen powiedzia³, ¿e na dole jest woda i przez jakiœ czas Malcom ¿y³. Ale wkrótce przesta³ dawaæ znaki ¿ycia.");
	
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

	description	= "Jak mogê zejœæ do tej rozpadliny?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_runter_15_00"); //Jak mogê zejœæ do tej rozpadliny?
	AI_Output	(self, other, "DIA_Addon_Owen_runter_13_01"); //Trzeba albo zejœæ po œcianie, albo zeskoczyæ.
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

	description	= "Niestety, Malcolm nie ¿yje.";
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
	AI_Output	(other, self, "DIA_Addon_Owen_MalcomDead_15_00"); //Niestety, Malcolm nie ¿yje.
	AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_01"); //No tego siê obawia³em. A teraz bêdê sobie wyrzuca³, ¿e mu nie pomog³em.
	if (SC_MadeStunt == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_02"); //Jesteœ naprawdê odwa¿ny, wiesz?
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_03"); //Ja nigdy bym siê na to nie zdoby³.
	};
	
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Powiedzia³em Owenowi, ¿e Malcolm nie ¿yje. Nie przej¹³ siê tym za bardzo.");
	
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Owen_MalcomDead);
};
