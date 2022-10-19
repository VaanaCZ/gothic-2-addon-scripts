// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! Padrone detto che tu ora paladino! Padrone avere ragione, come sempre.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //Noi capi del fiero esercito degli orchi siamo qui per uccidere il grande paladino.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Hagen e i suoi uomini verranno spazzati via. Nemmeno tu puoi aiutarli.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Padrone detto a capi di orchi di portare testa di grande paladino. Io ora uccidere te. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //Noi capi del fiero esercito degli orchi siamo qui per uccidere te, paladino.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! Noi uccidere te, paladino.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
