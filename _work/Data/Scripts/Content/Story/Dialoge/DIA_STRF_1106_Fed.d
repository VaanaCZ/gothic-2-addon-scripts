///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fed_EXIT   (C_INFO)
{
	npc         = STRF_1106_Fed;
	nr          = 999;
	condition   = DIA_Fed_EXIT_Condition;
	information = DIA_Fed_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_HALLO		(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  2;
	condition	 = 	DIA_Fed_HALLO_Condition;
	information	 = 	DIA_Fed_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};

func int DIA_Fed_HALLO_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Fed_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Fed_HALLO_08_00"); //Was willst du von mir? Ich werde nirgendwo hingehen!
	AI_Output (other, self, "DIA_Fed_HALLO_15_01"); //Bleib ganz ruhig - niemand will, dass du irgendwo hingehst.
	AI_Output (self, other, "DIA_Fed_HALLO_08_02"); //Innos sei Dank. Weißt du, in den letzten Tagen haben immer wieder Männer das Lager verlassen - von denen ist keiner wiedergekommen.
	AI_Output (self, other, "DIA_Fed_HALLO_08_03"); //Die wurden alle von den Snappern gefressen. Aber ich nicht. Ich werde hier einfach so lange hacken, bis alles vorbei ist.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Snapper	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  3;
	condition	 = 	DIA_Fed_Snapper_Condition;
	information	 = 	DIA_Fed_Snapper_Info;
	permanent	 =  FALSE;
	description	 = 	"Was weißt du über die Snapper?";
};
func int DIA_Fed_Snapper_Condition ()
{	
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fed_Snapper_Info ()
{
	AI_Output (other, self, "DIA_Fed_Snapper_15_00"); //Was weißt du über die Snapper?
	AI_Output (self, other, "DIA_Fed_Snapper_08_01"); //Bilgot hat sie nachts beobachtet. Ein paar von ihnen stehen unten an dem Tümpel, unten am Fuß des dunklen Turms.
	AI_Output (self, other, "DIA_Fed_Snapper_08_02"); //Andere sind genau über uns - auf der Felsklippe. Die warten so lange ab, bis wir völlig erschöpft sind.
	AI_Output (self, other, "DIA_Fed_Snapper_08_03"); //Wir haben uns hier selber in die Enge getrieben. Bald werden sie das Lager angreifen - und werden ihr blutiges Festmahl halten ...
	AI_Output (other, self, "DIA_Fed_Snapper_15_04"); //Verstehe.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Perm	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  5;
	condition	 = 	DIA_Fed_Perm_Condition;
	information	 = 	DIA_Fed_Perm_Info;
	permanent	 =  TRUE;
	description	 = 	"Geht's dir gut?";
};
func int DIA_Fed_Perm_Condition ()
{	
		return TRUE;
};
func void DIA_Fed_Perm_Info ()
{
	AI_Output (other, self, "DIA_Fed_Perm_15_00"); //Geht's dir gut?
	
	if (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_01"); //Die Snapper sind da draußen. Kannst du sie riechen ...? Ich rieche sie ...
	}
	else 
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_02"); //Die Snapper haben sich anscheinend zurückgezogen. Aber das heißt nichts. Die kommen wieder - oder es kommen Wölfe, oder Warane, oder die Orks.
		AI_Output (self, other, "DIA_Fed_Perm_08_03"); //Und über kurz oder lang werden sie uns erwischen und unsere toten Körper verspeisen ...
	};
	AI_StopProcessInfos(self);
	

};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fed_PICKPOCKET (C_INFO)
{
	npc			= STRF_1106_Fed;
	nr			= 900;
	condition	= DIA_Fed_PICKPOCKET_Condition;
	information	= DIA_Fed_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fed_PICKPOCKET_Condition()
{
	C_Beklauen (32, 8);
};
 
FUNC VOID DIA_Fed_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fed_PICKPOCKET);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_BACK 		,DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};
	
func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};




















