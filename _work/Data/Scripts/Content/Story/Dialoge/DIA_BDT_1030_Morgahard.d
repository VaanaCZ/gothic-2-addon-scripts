///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Morgahard_EXIT   (C_INFO)
{
	npc         = BDT_1030_Morgahard;
	nr          = 999;
	condition   = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_HALLO		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_HALLO_Condition;
	information	 = 	DIA_Morgahard_HALLO_Info;

	description	 = 	"You are Morgahard.";
};

func int DIA_Morgahard_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_00"); //You are Morgahard.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //How come you know my name?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //The judge is looking for you. You fled from his jail.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //What did you do, then? Steal his wallet?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //Not his. The governor's. And on his behalf, too.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //After we attacked the governor, he didn't want to share the booty with us and had us arrested.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //We didn't want to wind up on the gallows, so we fled.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //We thought they'd never catch us that way. That seems to have been a mistake.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "Stop whining and draw your weapon.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "What can we do against the judge?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "The judge ordered me to kill you.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"I've found Morgahard, the leader of the fugitives."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //The judge ordered me to kill you.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //Yeah, sure. That's why you're here, isn't it?

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //What can we do against the judge?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //Nothing at all. He sits up there in the upper end of town like a spider in its web, untouchable.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //I wouldn't say that. We'd only need some proof of his guilt in the matter concerning the governor.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //Proof, you say? I have that. But who would listen to a convicted criminal?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Give me your proof, and I'll see to it that no one will hunt you again.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //Are you sure? All right. Here, take this letter. It bears the judge's signature.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //Even if it doesn't change my guilt, it should be enough to confirm that he was an accomplice in the business.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard gave me the judge's assignment. This piece of paper definitely proves that the judge had Governor Larius robbed. I think this is just the kind of thing Lee wanted me to find."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //Stop whining and draw your weapon. We'll put an end to this now.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //Suits me fine. I've got nothing left to lose anyway.
	AI_StopProcessInfos (self);
	MorgahardSucked = TRUE;
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_Perm_Condition;
	information	 = 	DIA_Morgahard_Perm_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Morgahard_Perm_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Morgahard_HALLO))
	&& (MorgahardSucked == FALSE)

		{
			return TRUE;
		};	
};

func void DIA_Morgahard_Perm_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //That swine of a judge - I'll see him swing some day.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm2		(C_INFO)
{
	npc			 = 	BDT_1030_Morgahard;
	nr			 = 	3;
	condition	 = 	DIA_Morgahard_Perm2_Condition;
	information	 = 	DIA_Morgahard_Perm2_Info;
	important	 = 	TRUE;
	Permanent	 = 	TRUE;

};
func int DIA_Morgahard_Perm2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (MorgahardSucked == TRUE)
		{
			return TRUE;
		};	
};
func void DIA_Morgahard_Perm2_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //Why don't you just disappear?
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Morgahard_PICKPOCKET (C_INFO)
{
	npc			= BDT_1030_Morgahard;
	nr			= 900;
	condition	= DIA_Morgahard_PICKPOCKET_Condition;
	information	= DIA_Morgahard_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Morgahard_PICKPOCKET_Condition()
{
	C_Beklauen (73, 45);
};
 
FUNC VOID DIA_Morgahard_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_BACK 		,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};
	
func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};


