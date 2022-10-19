// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! Pan m�wi�, �e ty tera paladyn! Pan mie� racj�. Pan mie� zawsze racj�.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //My orki dow�dce teraz same zabi� wielki paladyn.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //My zgnie�� Hagen i jego ludzie. Nawet ty nic nie pom�c.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Pan powiedzie� orki dow�dce, �eby przynie�� wielka g�owa paladyna. Ty po�egna� si� z �yciem. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //My, orki dow�dce przyj�� ci� zabi�, paladyn.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! My ci� zabi�, paladynie.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
