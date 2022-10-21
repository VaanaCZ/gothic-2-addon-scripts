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
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_00"); //Come va?
	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_01"); //Chi sei TU? Sei uno dei briganti?
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_02"); //Tu che dici?

	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ItAr_Pir_M_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_L_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_H_Addon) == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_03"); //Indossi i nostri abiti, ma io non ti conosco.
	}
	else if ((Hlp_IsItem(itm, ItAr_BDT_M) == TRUE)
	|| (Hlp_IsItem(itm, ItAr_BDT_H) == TRUE))
	
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_04"); //Ad essere sinceri, sì.
	}
	else
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_05"); //No. A giudicare dai tuoi abiti hai fatto parecchia strada.
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

	description	= "Cosa stai facendo, qui?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_WasMachen_15_00"); //Cosa stai facendo qui?
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_01"); //Taglio legna per l'accampamento.
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_02"); //Io sto qui a spaccarmi alla schiena, mentre quelli si crogiolano al sole all'accampamento.
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
	description	= "E a parte questo?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_Perm_15_00"); //E...?
	AI_Output	(self, other, "DIA_Addon_Owen_Perm_13_01"); //Se l'avessi saputo prima non sarei mai diventato un pirata.
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
	description	= "Henry sta aspettando la legna per la palizzata.";
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
	AI_Output	(other, self, "DIA_Addon_Owen_Henry_15_00"); //Henry sta aspettando la legna per la palizzata.

	if (MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_01"); //Prima voglio scoprire cos'è successo al mio amico Malcolm.
	
			
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_02"); //Rilassati. Prima o poi glielo porto, quel suo stupido legno.
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_03"); //Riferiscigli questo.
		
		B_LogEntry (TOPIC_Addon_HolOwen,"Dovrei dire a Henry che Owen consegnerà la legna.");
		
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

	description	= "Qual è il problema???";
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
	AI_Output (other, self, "DIA_Addon_Owen_MalcomStunt_15_00"); //Che c'è?
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_01"); //Il mio amico Malcolm è scomparso.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_02"); //Uno di quei predatori ci ha attaccati.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_03"); //Ci siamo rifugiati qui.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_04"); //Ma il predatore ci ha seguiti.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_05"); //Malcolm e la bestia hanno lottato, poi sono caduti in quel buco laggiù.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_06"); //Sembra pieno d'acqua.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_07"); //Il predatore e Malcolm hanno combattuto per un po', poi non si è sentito più niente.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_08"); //Non so neppure se sia ancora vivo.
	
	Log_CreateTopic (TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MalcomsStunt,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Owen vuole sapere se il suo amico Malcom è ancora vivo. È caduto insieme a un predatore in un buco profondo vicino al fuoco.");
	Log_AddEntry	(TOPIC_Addon_MalcomsStunt,"Owen ha detto che laggiù c'è dell'acqua e che Malcom era ancora vivo. Ma dopo un po' non si è sentito più niente.");
	
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

	description	= "Come posso scendere in quel crepaccio?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_runter_15_00"); //Come posso scendere in quel crepaccio?
	AI_Output	(self, other, "DIA_Addon_Owen_runter_13_01"); //Non ne ho idea. Forse devi calarti o saltarci dentro.
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

	description	= "Il tuo amico Malcolm è morto.";
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
	AI_Output	(other, self, "DIA_Addon_Owen_MalcomDead_15_00"); //Il tuo amico Malcolm è morto.
	AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_01"); //Lo sospettavo. Poveraccio. Avrei dovuto aiutarlo, dopo tutto.
	if (SC_MadeStunt == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_02"); //Sei proprio coraggioso, lo sai?
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_03"); //Io non ce l'avrei fatta in quel crepaccio.
	};
	
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Ho dato a Owen la notizia della morte di Malcom. Ha reagito compostamente.");
	
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Owen_MalcomDead);
};
