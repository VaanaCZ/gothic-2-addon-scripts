// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! Pán teï øíkat paladinovi! Pán mít pravda. Pán mít vždycky pravda.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //My, vùdci skøetí armáda, pøijít zabít velkého paladina.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Zneškodnit Hagen a jeho muži. Ty už jim nepomoct.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Pán øíkat skøetím vùdcùm, pøinést hlava velkého paladina. Teï zemøít skøetí rukou. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //My, vùdci skøetí armády pøijít zabít tebe, paladin.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! My tì zabít, paladin.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
