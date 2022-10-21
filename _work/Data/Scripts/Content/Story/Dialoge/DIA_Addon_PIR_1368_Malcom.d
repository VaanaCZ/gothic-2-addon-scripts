// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Malcom_EXIT(C_INFO)
{
	npc			= PIR_1368_Addon_Malcom;
	nr			= 999;
	condition	= DIA_Addon_Malcom_EXIT_Condition;
	information	= DIA_Addon_Malcom_EXIT_Info;
	permanent	= TRUE;
	description = "Ich muss weiter.";
};                       
FUNC INT DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Malcom_EXIT_Info()
{	
	AI_Output (other, self, "DIA_Addon_Malcom_perm_15_00"); //Ich muss weiter.
	
	if (MalcomBotschaft == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_perm_04_01"); //Lass dich nicht von den Biestern fressen. Die Gegend hier ist sehr gefährlich.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_03"); //Hey! Wenn du zu unserem Lager gehst kannst du Henry von mir was ausrichten.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_04"); //Die Bäume hier sind verdammt hartnäckig.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_05"); //Er wird noch eine Weile auf sein Holz warten müssen. Sag ihm das.
		MalcomBotschaft = TRUE;
	};
	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Malcom_PICKPOCKET (C_INFO)
{
	npc			= PIR_1368_Addon_Malcom;
	nr			= 900;
	condition	= DIA_Addon_Malcom_PICKPOCKET_Condition;
	information	= DIA_Addon_Malcom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Malcom_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Addon_Malcom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Malcom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Malcom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Malcom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Malcom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Malcom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Malcom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Malcom_PICKPOCKET);
};
	
func void DIA_Addon_Malcom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Malcom_PICKPOCKET);
};
// ************************************************************
//								Hello
// ************************************************************
instance DIA_Addon_Malcom_Hello		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 1;
	condition	= DIA_Addon_Malcom_Hello_Condition;
	information	= DIA_Addon_Malcom_Hello_Info;

	important 	= TRUE;
};

func int DIA_Addon_Malcom_Hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_01"); //Du kommst nicht von hier, oder?
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_02"); //Scheinst 'ne weite Reise hinter dir zu haben.
};

// ************************************************************
//					Hallo 2 	(Was machst du?)
// ************************************************************
instance DIA_Addon_Malcom_WasMachen		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 2;
	condition	= DIA_Addon_Malcom_WasMachen_Condition;
	information	= DIA_Addon_Malcom_WasMachen_Info;

	description	= "Beschäftigt?";
};
func int DIA_Addon_Malcom_WasMachen_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Malcom_WasMachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_00"); //Beschäftigt?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_01"); //Hör bloß auf. Henry will, dass ich hier die ganzen Bäume abholze.
	if (Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_02"); //Henry?
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_00"); //Er führt unseren Trupp an.
	};
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_04"); //Er steht die ganze Zeit vor unserm Lager und hält große Reden.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_05"); //Mehr Einsatz für die Gemeinschaft und so'n Dreck.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_06"); //Dabei macht er selber keinen Finger krumm.
};

// ************************************************************
// 					Holz - Nachricht für Henry
// ************************************************************
instance DIA_Addon_Malcom_Entertrupp		(C_INFO)
{
	npc		 = 	PIR_1368_Addon_Malcom;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Malcom_Entertrupp_Condition;
	information	 = 	DIA_Addon_Malcom_Entertrupp_Info;

	description	 = 	"Henry ist euer Anführer?";
};
func int DIA_Addon_Malcom_Entertrupp_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};
func void DIA_Addon_Malcom_Entertrupp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_Entertrupp_15_00"); //Henry ist euer Anführer?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_03"); //Ja, der Anführer von unserem Entertrupp.
	AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_01"); //Unser KÄPT'N ist Greg.
	if (GregIsBack == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_Add_04_02"); //Aber der ist zur Zeit nicht da.
	};
};

// ************************************************************
// 						Wo ist Lager
// ************************************************************
instance DIA_Addon_Malcom_Lager		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 3;
	condition	= DIA_Addon_Malcom_Lager_Condition;
	information	= DIA_Addon_Malcom_Lager_Info;

	description	= "Wo ist euer Lager?";
};
func int DIA_Addon_Malcom_Lager_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};
func void DIA_Addon_Malcom_Lager_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_Lager_15_00"); //Wo ist euer Lager?
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_01"); //Du gehst einfach den Weg hier weiter Richtung Westen.
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_02"); //Dann kannst du Henry schon herum stehen sehen.
};

