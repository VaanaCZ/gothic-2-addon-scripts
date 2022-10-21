// *****************************************************
// 							EXIT 
// *****************************************************
INSTANCE DIA_Brian_EXIT   (C_INFO)
{
	npc         = VLK_457_Brian;
	nr          = 999;
	condition   = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brian_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Brian_PICKPOCKET (C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 900;
	condition	= DIA_Brian_PICKPOCKET_Condition;
	information	= DIA_Brian_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Brian_PICKPOCKET_Condition()
{
	C_Beklauen (55, 100);
};
 
FUNC VOID DIA_Brian_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Brian_PICKPOCKET);
	Info_AddChoice		(DIA_Brian_PICKPOCKET, DIALOG_BACK 		,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Brian_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Brian_PICKPOCKET);
};
	
func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Brian_PICKPOCKET);
};
// *****************************************************
// 							Hallo 
// *****************************************************
instance DIA_Brian_HALLO		(C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_HALLO_Condition;
	information	= DIA_Brian_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Brian_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Brian_HALLO_04_00"); //Neu in der Stadt, was? Ich heiße Brian! Ich bin der Lehrling von Meister Harad.
};

// *****************************************************
// 					Wie ist Lehrling? 
// *****************************************************
instance DIA_Brian_AboutLehrling (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_AboutLehrling_Condition;
	information	= DIA_Brian_AboutLehrling_Info;
	permanent 	= FALSE;
	description = "Wie ist es, der Lehrling des Schmieds zu sein?";
};

func int DIA_Brian_AboutLehrling_Condition ()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};

func void DIA_Brian_AboutLehrling_Info ()
{
	AI_Output (other, self, "DIA_Brian_AboutLehrling_15_00"); //Wie ist es, der Lehrling des Schmieds zu sein?
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_01"); //Warum fragst du? Willst du mein Nachfolger werden?
	AI_Output (other, self, "DIA_Brian_AboutLehrling_15_02"); //Schon möglich.
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_03"); //Warum nicht ... Ich bin bald mit meiner Lehre fertig, dann werde ich mich aus der Stadt verkrümeln.
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_04"); //Aber es ist nicht wegen Harad. Er ist ein guter Meister - ich habe viel von ihm gelernt.
	
};

// *****************************************************
// 					Warum Stadt verlassen? 
// *****************************************************
instance DIA_Brian_WhyLeave (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_WhyLeave_Condition;
	information	= DIA_Brian_WhyLeave_Info;
	permanent 	= FALSE;
	description = "Warum willst du die Stadt verlassen?";
};

func int DIA_Brian_WhyLeave_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info ()
{
	AI_Output (other,self , "DIA_Brian_WhyLeave_15_00"); //Warum willst du die Stadt verlassen?
	AI_Output (self,other , "DIA_Brian_WhyLeave_04_00"); //Weil mir die Leute hier gehörig auf die Nerven gehen! Vor allem die anderen Meister.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_01"); //Ich weiß noch, was es für ein Theater war, bei Harad als Lehrling aufgenommen zu werden.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_02"); //Wirklich jeder von den Pennern hatte noch was dazu zu sagen.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_03"); //Ich will selber entscheiden können, wen ich als Lehrling aufnehme und wen nicht.
};

// *****************************************************
// 						Other Masters
// *****************************************************
instance DIA_Brian_OtherMasters (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_OtherMasters_Condition;
	information	= DIA_Brian_OtherMasters_Info;
	permanent 	= FALSE;
	description = "Wer sind die anderen Meister?";
};
func int DIA_Brian_OtherMasters_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_WhyLeave))
	&&  (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Brian_Add_15_00"); //Wer sind die anderen Meister?
	AI_Output (self ,other, "DIA_Brian_Add_04_01"); //Nun, da wären Thorben der Tischler, Bosper der Bogner, Constantino der Alchemist und Matteo.
	AI_Output (self ,other, "DIA_Brian_Add_04_02"); //Er stellt Rüstungen her, ber in erster Linie ist er Händler.
	AI_Output (self ,other, "DIA_Brian_Add_04_03"); //Alle Meister haben ihre Häuser hier an der Strasse.
	AI_Output (self ,other, "DIA_Brian_Add_04_04"); //Constantinos Laden liegt in der Unterführung zum Tempel.
};



// *****************************************************
// 					Über Meister Harad
// *****************************************************
instance DIA_Brian_AboutHarad (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 2;
	condition	= DIA_Brian_AboutHarad_Condition;
	information	= DIA_Brian_AboutHarad_Info;
	permanent 	= FALSE;
	description = "Erzähl mir mehr über Meister Harad.";
};

func int DIA_Brian_AboutHarad_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info ()
{
	AI_Output (other, self, "DIA_Brian_AboutHarad_15_00"); //Erzähl mir mehr über Meister Harad.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_01"); //Er ist zurzeit nicht besonders gut in Stimmung.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_02"); //Vor ein paar Tagen kamen Paladine und haben ihm befohlen, Schwerter für sie zu schmieden.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_03"); //Sie haben ihm sogar verboten, seine Schwerter an jemand anderen zu verkaufen.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_04"); //Jetzt schuftet er Tag und Nacht, um den Auftrag so schnell wie möglich zu beenden.
};

// *****************************************************
// 					Waffen kaufen?
// *****************************************************
instance DIA_Brian_NEEDWEAPONS		(C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 4;
	condition	= DIA_Brian_NEEDWEAPONS_Condition;
	information	= DIA_Brian_NEEDWEAPONS_Info;
	permanent 	= FALSE;
	description	= "Kann ich bei dir Waffen kaufen?";
};

func int DIA_Brian_NEEDWEAPONS_Condition ()
{
	return TRUE;
};

func void DIA_Brian_NEEDWEAPONS_Info ()
{
	AI_Output (other, self, "DIA_Brian_NEEDWEAPONS_15_00"); //Kann ich bei dir Waffen kaufen?
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_01"); //Das nicht gerade. Ich bin nur Gehilfe.
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_02"); //Die Waffen, die in dieser Schmiede hergestellt werden, werden von der Miliz abgeholt und in die Türme gebracht. Dort werden sie gelagert.
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_03"); //Aber wenn es mit dem Schmieden selbst zu tun hat, kann ich dir vielleicht weiter helfen.
};


// *****************************************************
// 					Schmiede-Stuff kaufen
// *****************************************************

//------------------------------------------------------
var int Brian_Trade_einmal;

instance DIA_Brian_WASKAUFEN		(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 4;
	condition	= DIA_Brian_WASKAUFEN_Condition;
	information	= DIA_Brian_WASKAUFEN_Info;
	permanent	= TRUE;
	description	= "Was kann ich bei dir bekommen?";
	trade		= TRUE;
};

func int DIA_Brian_WASKAUFEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info ()
{
	AI_Output			(other, self, "DIA_Brian_WASKAUFEN_15_00"); //Was kann ich bei dir bekommen?
	B_GiveTradeInv (self);

	if (Npc_IsDead(Harad))
	{
		AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_01"); //Wenn ich noch ein paar Schmiederohlinge habe, kannst du sie gerne haben. Mehr leider nicht.
		
		if (MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_02"); //Seit Harad nicht mehr da ist, hält die Miliz mich genau im Auge.
			AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_03"); //Ich darf die Schmiede nicht weiter führen. Sie haben Angst, dass ich die ganze Schmiede verkaufe und mich dann einfach aus dem Staub mache.
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_05"); //Ich könnte dir Schmiederohlinge verkaufen.
	};
	
	if (Brian_Trade_Einmal == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Brian, der Gehilfe von Harad, verkauft Schmiederohlinge"); 
		Brian_Trade_Einmal = TRUE;
	};
	Npc_RemoveInvItems (self,ItMiSwordblade,Npc_HasItems (self,ItMiSwordblade));
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

INSTANCE DIA_Brian_KAP3_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP3_EXIT_Condition;
	information	= DIA_Brian_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Brian_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_457_Brian;
	nr           = 	8;
	condition	 = 	DIA_Brian_RepairNecklace_Condition;
	information	 = 	DIA_Brian_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kannst du Schmuckstücke reparieren?";
};

func int DIA_Brian_RepairNecklace_Condition ()
{
	if 	(
		(MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
		&&	 	(
				(Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
				|| 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE)
				)
		) 
		{
			return TRUE;
		};
};

func void DIA_Brian_RepairNecklace_Info ()
{
	AI_Output (other,self ,"DIA_Brian_RepairNecklace_15_00"); //Kannst du Schmuckstücke reparieren?
	AI_Output (self	,other,"DIA_Brian_RepairNecklace_04_01"); //Ich bin nur Gehilfe, ich bin schon froh, wenn mich mal einen Dolch schmieden darf.
	
	if ((Npc_IsDead (Harad))== FALSE)
	{
		AI_Output (self ,other,"DIA_Brian_RepairNecklace_04_02"); //Schmuck? Da musst du schon den Meister fragen.
	};
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
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

INSTANCE DIA_Brian_KAP4_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP4_EXIT_Condition;
	information	= DIA_Brian_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP4_EXIT_Info()
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

INSTANCE DIA_Brian_KAP5_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP5_EXIT_Condition;
	information	= DIA_Brian_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NewLighthouseOfficer
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_NEWLIGHTHOUSEOFFICER		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	51;
	condition	 = 	DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information	 = 	DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;

	description	 = 	"Ich hörte, du hättest Interesse an Jacks altem Leuchtturm.";
};

func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition ()
{
	if (Kapitel == 5)	
	&& (MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	
	&& (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS))
		{
			return TRUE;
		};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info ()
{
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00"); //Ich hörte, du hättest Interesse an Jacks altem Leuchtturm.
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01"); //Jack möchte vielleicht wieder zu See fahren. Aber sein Leuchtturm wäre in der Zeit unbeaufsichtigt.
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02"); //Jack sollte aber klar sein, dass ich aus seinem Leuchtturm eine Schmiede machen werde, wenn er nicht da ist.
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03"); //Ist das ein Problem?
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04"); //(lacht) Nicht für mich. Harads Schmiede kriege ich sowieso nicht. Das hab ich mir schon aus dem Kopf geschlagen.
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05"); //Abgemacht. Wir sehen uns bei Jack.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
};


///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	8;
	condition	 = 	DIA_Brian_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"Und, was sagst du?";
};

func int DIA_Brian_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01")<1000)
		&& (Kapitel == 5) 
		{
				return TRUE;
		};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Brian_LIGHTHOUSEFREE_15_00"); //Und, was sagst du?
	AI_Output			(self, other, "DIA_Brian_LIGHTHOUSEFREE_04_01"); //Mein lieber Mann, eine ganz schöne Rumpelkammer. Jack wird die Bude nicht wieder erkennen, wenn ich mit ihr fertig bin.
};






























