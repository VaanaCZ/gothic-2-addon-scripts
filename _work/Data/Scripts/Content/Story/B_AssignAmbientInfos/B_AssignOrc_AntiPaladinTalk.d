// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! Pan mówiæ, ¿e ty tera paladyn! Pan mieæ racjê. Pan mieæ zawsze racjê.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //My orki dowódce teraz same zabiæ wielki paladyn.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //My zgnieœæ Hagen i jego ludzie. Nawet ty nic nie pomóc.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Pan powiedzieæ orki dowódce, ¿eby przynieœæ wielka g³owa paladyna. Ty po¿egnaæ siê z ¿yciem. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //My, orki dowódce przyjœæ ciê zabiæ, paladyn.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! My ciê zabiæ, paladynie.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
