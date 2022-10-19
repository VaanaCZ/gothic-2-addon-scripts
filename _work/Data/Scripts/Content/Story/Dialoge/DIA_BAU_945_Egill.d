///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Egill_EXIT   (C_INFO)
{
	npc         = BAU_945_Egill;
	nr          = 999;
	condition   = DIA_Egill_EXIT_Condition;
	information = DIA_Egill_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Egill_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Egill_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_HALLO		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	3;
	condition	 = 	DIA_Egill_HALLO_Condition;
	information	 = 	DIA_Egill_HALLO_Info;

	description	 = 	"What's up?";
};

func int DIA_Egill_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Egill_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Egill_HALLO_15_00"); //What's up?
	AI_Output			(self, other, "DIA_Egill_HALLO_08_01"); //It's been a long time since we've seen a stranger on our land who didn't want to skin us.
	AI_Output			(self, other, "DIA_Egill_HALLO_08_02"); //I hope I'm not wrong about you.
	AI_Output			(self, other, "DIA_Egill_HALLO_08_03"); //I'm Egill.
	
	if (Hlp_IsValidNpc (Ehnim))
		&& (!C_NpcIsDown (Ehnim))
		{
			AI_Output			(self, other, "DIA_Egill_HALLO_08_04"); //And the strange bird over there is my brother Ehnim.
		};
};


///////////////////////////////////////////////////////////////////////
//	Info feldarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_FELDARBEIT		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	4;
	condition	 = 	DIA_Egill_FELDARBEIT_Condition;
	information	 = 	DIA_Egill_FELDARBEIT_Info;

	description	 = 	"How's the field work going?";
};

func int DIA_Egill_FELDARBEIT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Egill_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Egill_FELDARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Egill_FELDARBEIT_15_00"); //How's the field work going?
	AI_Output			(self, other, "DIA_Egill_FELDARBEIT_08_01"); //Great. If those miserable field raiders weren't constantly destroying our harvest ...

};


///////////////////////////////////////////////////////////////////////
//	Info Feldraeuber
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_FELDRAEUBER		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	5;
	condition	 = 	DIA_Egill_FELDRAEUBER_Condition;
	information	 = 	DIA_Egill_FELDRAEUBER_Info;

	description	 = 	"Why don't you do anything about the field raiders?";
};

func int DIA_Egill_FELDRAEUBER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Egill_FELDARBEIT))
		{
				return TRUE;
		};
};

func void DIA_Egill_FELDRAEUBER_Info ()
{
	AI_Output			(other, self, "DIA_Egill_FELDRAEUBER_15_00"); //Why don't you do anything about the field raiders?
	AI_Output			(self, other, "DIA_Egill_FELDRAEUBER_08_01"); //You're joking. Since I've been on this farm, I've killed so many of the beasts that I've lost count.
	AI_Output			(self, other, "DIA_Egill_FELDRAEUBER_08_02"); //But alas, new ones keep coming.
};


///////////////////////////////////////////////////////////////////////
//	Info Streit2
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_STREIT2		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	6;
	condition	 = 	DIA_Egill_STREIT2_Condition;
	information	 = 	DIA_Egill_STREIT2_Info;

	description	 = 	"Your brother tells a similar story.";
};

func int DIA_Egill_STREIT2_Condition ()
{
	if		(
			(Npc_KnowsInfo(other, DIA_Egill_FELDRAEUBER))
			&& (Npc_KnowsInfo(other, DIA_Ehnim_FELDRAEUBER))
			)
		&&
			(
			(Hlp_IsValidNpc (Ehnim))
			&& (!C_NpcIsDown (Ehnim))
			)
				{
						return TRUE;
				};
};

func void DIA_Egill_STREIT2_Info ()
{
	AI_Output			(other, self, "DIA_Egill_STREIT2_15_00"); //Your brother tells a similar story.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_01"); //(slyly) Aha. What exactly does he say?
	AI_Output			(other, self, "DIA_Egill_STREIT2_15_02"); //That he has also done away with plenty of field raiders.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_03"); //What? That loser can't even find his way home by himself.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_04"); //Tell him he shouldn't brag like that.

	AI_StopProcessInfos (self);
};



///////////////////////////////////////////////////////////////////////
//	Info Streit4
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_STREIT4		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	7;
	condition	 = 	DIA_Egill_STREIT4_Condition;
	information	 = 	DIA_Egill_STREIT4_Info;

	description	 = 	"Ehnim is a bit irritated about this thing.";
};

func int DIA_Egill_STREIT4_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Ehnim_STREIT3))
		&&
			(
			(Hlp_IsValidNpc (Ehnim))
			&& (!C_NpcIsDown (Ehnim))
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Egill_STREIT4_Info ()
{
	AI_Output			(other, self, "DIA_Egill_STREIT4_15_00"); //Ehnim is a bit irritated about this thing.
	AI_Output			(self, other, "DIA_Egill_STREIT4_08_01"); //He shouldn't puff himself up so much, else I'll tear his head off. Tell him that.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	condition	 = 	DIA_Egill_PERMKAP1_Condition;
	information	 = 	DIA_Egill_PERMKAP1_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Egill_PERMKAP1_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Npc_IsInState (self,ZS_Talk))
		)
			{
					return TRUE;
			};
};

func void DIA_Egill_PERMKAP1_Info ()
{
	AI_Output			(self, other, "DIA_Egill_PERMKAP1_08_00"); //Haven't you done enough damage? I think you should go now.

	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Egill_PICKPOCKET (C_INFO)
{
	npc			= BAU_945_Egill;
	nr			= 900;
	condition	= DIA_Egill_PICKPOCKET_Condition;
	information	= DIA_Egill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Egill_PICKPOCKET_Condition()
{
	C_Beklauen (45, 24);
};
 
FUNC VOID DIA_Egill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Egill_PICKPOCKET);
	Info_AddChoice		(DIA_Egill_PICKPOCKET, DIALOG_BACK 		,DIA_Egill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Egill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Egill_PICKPOCKET_DoIt);
};

func void DIA_Egill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Egill_PICKPOCKET);
};
	
func void DIA_Egill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Egill_PICKPOCKET);
};


