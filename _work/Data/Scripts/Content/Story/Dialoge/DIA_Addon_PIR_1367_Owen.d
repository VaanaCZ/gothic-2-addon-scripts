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
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_00"); //Alles klar?
	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_01"); //Wer bist DU denn? Bist du einer der Banditen?
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_02"); //Sehe ich etwa so aus?

	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ItAr_Pir_M_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_L_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_H_Addon) == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_03"); //Du tr‰gst zwar unsere Kleidung, aber ich kenne dich nicht.
	}
	else if ((Hlp_IsItem(itm, ItAr_BDT_M) == TRUE)
	|| (Hlp_IsItem(itm, ItAr_BDT_H) == TRUE))
	
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_04"); //Um ehrlich zu sein, irgendwie schon.
	}
	else
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_05"); //Nein. Nach deinen Klamotten zu urteilen, kommst du von weit her.
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

	description	= "Was machst du hier?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_WasMachen_15_00"); //Was machst du hier?
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_01"); //Ich bin Holzf‰ller und besorge Holz f¸r unser Lager.
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_02"); //Ich schuffte hier, brech' mir fast das Kreuz und die anderen im Lager liegen in der Sonne.
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
	description	= "Und sonst?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_Perm_15_00"); //Und sonst?
	AI_Output	(self, other, "DIA_Addon_Owen_Perm_13_01"); //Wenn ich das alles vorher gewusst h‰tte, w‰r' ich niemals Pirat geworden.
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
	description	= "Henry wartet auf die Holzlieferung f¸r die Palisade.";
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
	AI_Output	(other, self, "DIA_Addon_Owen_Henry_15_00"); //Henry wartet auf die Holzlieferung f¸r die Palisade.

	if (MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_01"); //Ich will erst mal wissen, was mit meinem Kumpel Malcom passiert ist.
	
			
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_02"); //Ja, ja. Ich werd' ihm das d‰mliche Holz schon noch bringen.
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_03"); //Geh hin und sag ihm das.
		
		B_LogEntry (TOPIC_Addon_HolOwen,"Ich soll Henry ausrichten, dass Owen das Holz liefern wird.");
		
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

	description	= "Was ist los?";
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
	AI_Output (other, self, "DIA_Addon_Owen_MalcomStunt_15_00"); //Was ist los?
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_01"); //Mein Kumpel Malcom ist weg.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_02"); //Uns hat so ein Mistvieh von einem Lurker angegriffen.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_03"); //Da sind wir in diese Hˆhle gefl¸chtet.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_04"); //Leider kam der Lurker uns nach.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_05"); //Malcom hat gegen ihn gek‰mpft und ist dann mit dem Biest zusammen in das Loch da hinten gefallen.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_06"); //Da unten scheint Wasser zu sein.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_07"); //Der Lurker und Malcom k‰mpften da unten noch eine Weile. Dann war es still.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_08"); //Ich weiﬂ nicht, ob er noch lebt oder schon tot ist.
	
	Log_CreateTopic (TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MalcomsStunt,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Owen will wissen, ob sein Freund Malcom noch lebt. Er ist zusammen mit einem Lurker in das Tiefe Loch nah an der Lagerstelle gefallen.");
	Log_AddEntry	(TOPIC_Addon_MalcomsStunt,"Owen hat gesagt, dass dort unten Wasser ist und Malcom zun‰chst noch gelebt hat. Aber nach einer Weile war alles still.");
	
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

	description	= "Wie kommt man denn die Felsspalte runter?";
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
	AI_Output	(other, self, "DIA_Addon_Owen_runter_15_00"); //Wie kommt man denn die Felsspalte runter?
	AI_Output	(self, other, "DIA_Addon_Owen_runter_13_01"); //Keine Ahnung. Entweder man klettert runter oder man springt.
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

	description	= "Dein Kumpel Malcom ist tot.";
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
	AI_Output	(other, self, "DIA_Addon_Owen_MalcomDead_15_00"); //Dein Kumpel Malcom ist tot.
	AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_01"); //Das hab ich mir schon gedacht. Armes Schwein. Ich h‰tte ihm doch helfen sollen.
	if (SC_MadeStunt == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_02"); //Du bist echt mutig, weiﬂt du das?
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_03"); //Ich h‰tte das mit dem Felsspalte nicht fertig gebracht.
	};
	
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"Ich habe Owen die Nachricht von dem Tod Malcoms gebracht. er nahm sie sehr gefasst auf.");
	
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Owen_MalcomDead);
};
