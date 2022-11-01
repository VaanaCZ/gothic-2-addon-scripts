// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! Pan mówić, że ty tera paladyn! Pan mieć rację. Pan mieć zawsze rację.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //My orki dowódce teraz same zabić wielki paladyn.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //My zgnieść Hagen i jego ludzie. Nawet ty nic nie pomóc.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Pan powiedzieć orki dowódce, żeby przynieść wielka głowa paladyna. Ty pożegnać się z życiem. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //My, orki dowódce przyjść cię zabić, paladyn.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! My cię zabić, paladynie.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
