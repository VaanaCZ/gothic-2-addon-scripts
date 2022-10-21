///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NAME_BANDIT_EXIT   (C_INFO)
{
	npc         = BDT_1025_Bandit_H;
	nr          = 999;
	condition   = DIA_NAME_BANDIT_EXIT_Condition;
	information = DIA_NAME_BANDIT_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NAME_BANDIT_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NAME_BANDIT_EXIT_Info()
{
	hero.aivar[AIV_LastDistToWP] 	= Npc_GetDistToWP (hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchafBleibthier
///////////////////////////////////////////////////////////////////////
instance DIA_NAME_BANDIT_SCHAFBLEIBTHIER		(C_INFO)
{
	npc		 = 	BDT_1025_Bandit_H;
	nr		 = 	30;
	condition	 = 	DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Condition;
	information	 = 	DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Info;
	important	 = 	TRUE;
};

func int DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Condition ()
{
		return TRUE;
};

func void DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Info ()
{
	AI_Output			(self, other, "DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_00"); //Hey, you bum. You haven't come about that sheep, have you?

	if (MIS_Akil_SchafDiebe == 0)
	{
		AI_Output			(other, self, "DIA_NAME_BANDIT_SCHAFBLEIBTHIER_15_01"); //Sheep? What sheep?
		AI_Output			(self, other, "DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_02"); //There's a good lad. And now beat it. There's nothing here for you.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SchafKlau
///////////////////////////////////////////////////////////////////////
instance DIA_NAME_BANDIT_SchafKlau		(C_INFO)
{
	npc		 = 	BDT_1025_Bandit_H;
	nr		 = 	30;
	condition	 = 	DIA_NAME_BANDIT_SchafKlau_Condition;
	information	 = 	DIA_NAME_BANDIT_SchafKlau_Info;
	important	 = 	TRUE;
};

func int DIA_NAME_BANDIT_SchafKlau_Condition ()
{
	if  (Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01")	<  (hero.aivar[AIV_LastDistToWP]-50)	) 
		{
				return TRUE;
		};
};

func void DIA_NAME_BANDIT_SchafKlau_Info ()
{
	AI_Output			(self, other, "DIA_NAME_BANDIT_SchafKlau_09_00"); //Hey! I'm talking to you.
	
	Info_AddChoice	(DIA_NAME_BANDIT_SchafKlau, DIALOG_ENDE, DIA_NAME_BANDIT_SchafKlau_weiter );

};
func void DIA_NAME_BANDIT_SchafKlau_weiter ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;  
	BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;  
};

///////////////////////////////////////////////////////////////////////
//	Info RueckDasSchafraus
///////////////////////////////////////////////////////////////////////
instance DIA_NAME_BANDIT_RUECKDASSCHAFRAUS		(C_INFO)
{
	npc		 = 	BDT_1025_Bandit_H;
	nr		 = 	30;
	condition	 = 	DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Condition;
	information	 = 	DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Info;
	permanent	 = 	TRUE;

	description	 = 	"You stole the sheep from Akil the farmer.";
};

func int DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Condition ()
{
	if (MIS_Akil_SchafDiebe == LOG_RUNNING)
	&& (DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm == FALSE)
		{
				return TRUE;
		};
};
var int DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm;
func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Info ()
{
	AI_Output			(other, self, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_15_00"); //You stole the sheep from Akil the farmer.
	AI_Output			(self, other, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_09_01"); //So what? What are you gonna do about it?
	
	Info_ClearChoices	(DIA_NAME_BANDIT_RUECKDASSCHAFRAUS);
	Info_AddChoice	(DIA_NAME_BANDIT_RUECKDASSCHAFRAUS, "Nothing. What's that stupid sheep to me?", DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts );
	Info_AddChoice	(DIA_NAME_BANDIT_RUECKDASSCHAFRAUS, "Give me that sheep, or I'll punch you in the eye.", DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf );

};
func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf ()
{
	AI_Output			(other, self, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_15_00"); //Give me that sheep, or I'll punch you in the eye.
	AI_Output			(self, other, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_09_01"); //Then look out, boyo. All hell's about to break loose.

	AI_StopProcessInfos (self);
	DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm = TRUE;
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;  
	BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;  

};

func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts ()
{
	AI_Output			(other, self, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_15_00"); //Nothing. What's that stupid sheep to me?
	AI_Output			(self, other, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_09_01"); //Then don't get on my nerves. Beat it!
	hero.aivar[AIV_LastDistToWP] 	= Npc_GetDistToWP (hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos (self);
};











