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
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_00"); //Jak to vypadá?
	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_01"); //Kdo seš? Ty patâíš k tęm banditům?
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_02"); //Copak tak vypadám?

	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ItAr_Pir_M_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_L_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_H_Addon) == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_03"); //Sice máš na sobę naše hadry, ale já tę neznám.
	}
	else if ((Hlp_IsItem(itm, ItAr_BDT_M) == TRUE)
	|| (Hlp_IsItem(itm, ItAr_BDT_H) == TRUE))
	
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_04"); //Popravdę âečeno ano.
	}
	else
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_05"); //Ne. Soudę podle oblečení jsi urazil hezkej kus cesty.
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

	description	= "Co tady dęláš?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_WasMachen_15_00"); //Co tu dęláš?
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_01"); //Sekám dâevo pro tábor.
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_02"); //Já tu otročím, můžu si strhat cemr a v táboâe si všichni válej šunky.
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
	description	= "A co dál?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_Perm_15_00"); //No a?
	AI_Output	(self, other, "DIA_Addon_Owen_Perm_13_01"); //Kdybych vędęl, že to vezme takovejhle obrat, tak jsem k pirátům nikdy nelez.
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
	description	= "Henry čeká na dâevo na stavbu palisády.";
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
	AI_Output	(other, self, "DIA_Addon_Owen_Henry_15_00"); //Henry čeká na dâevo, který potâebuje na palisádu.

	if (MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_01"); //Napâed chci zjistit, co se stalo s mým kámošem Malcolmem.
	
			
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_02"); //Hele, klídek. Dâív nebo pozdęjc mu to pitomý dâevo pâinesu.
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_03"); //Tak mu to bęž âíct sám.
		
		B_LogEntry (TOPIC_Addon_HolOwen,"Mám Henrymu vyâídit, že dâíví pâiveze Owen.");
		
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

	description	= "Jak to jde?";
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
	AI_Output (other, self, "DIA_Addon_Owen_MalcomStunt_15_00"); //Co je?
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_01"); //Můj kámoš Malcolm zmizel.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_02"); //Napad ho jeden z tęch hnusnejch číhavců.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_03"); //Tak jsme zdrhli do týhle jeskynę.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_04"); //Jenže ten číhavec šel po nás.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_05"); //Malcolm s ním bojoval a pak oba spadli tady do tý díry.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_06"); //Nejspíš je plná vody.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_07"); //Chvíli tam voba ještę bojovali a pak všecko ztichlo.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_08"); //Nemám zdání, jestli je naživu nebo ne.
	
	Log_CreateTopic (TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MalcomsStunt,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Owen chce vędęt, zda je jeho pâítel Malcom ještę naživu. Kousek od ohništę spadl do hluboké jámy spolu s číhavcem.");
	Log_AddEntry	(TOPIC_Addon_MalcomsStunt,"Owen prohlásil, že je tam dole voda a že Malcom byl zpočátku určitę naživu, ale pak už se odtamtud neozval ani hlásek.");
	
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

	description	= "A jak se do té díry dostanu?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_runter_15_00"); //Jak se do té pukliny dostanu?
	AI_Output	(self, other, "DIA_Addon_Owen_runter_13_01"); //Co já vím. Nejspíš tam budeš muset slézt nebo seskočit.
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

	description	= "Tvůj kamarád Malcom je mrtvý.";
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
	AI_Output	(other, self, "DIA_Addon_Owen_MalcomDead_15_00"); //Tvůj kamarád Malcolm je mrtvý.
	AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_01"); //Já si to myslel. Chudák malej. Asi jsem mu męl pomoct.
	if (SC_MadeStunt == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_02"); //Ty seš vážnę statečnej, víš to?
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_03"); //V tý škvíâe bych mu stejnę nepomoh.
	};
	
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Sdęlil jsem Owenovi, že jeho pâítel Malcom je mrtvý. Vzal to docela klidnę.");
	
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Owen_MalcomDead);
};
