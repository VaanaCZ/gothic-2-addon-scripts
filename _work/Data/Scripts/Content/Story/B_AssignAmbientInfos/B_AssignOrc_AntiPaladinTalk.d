// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! Pán teë âíkat paladinovi! Pán mít pravda. Pán mít vždycky pravda.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //My, vùdci skâetí armáda, pâijít zabít velkého paladina.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Zneškodnit Hagen a jeho muži. Ty už jim nepomoct.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Pán âíkat skâetím vùdcùm, pâinést hlava velkého paladina. Teë zemâít skâetí rukou. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //My, vùdci skâetí armády pâijít zabít tebe, paladin.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! My tê zabít, paladin.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
