// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! Pán teď říkat paladinovi! Pán mít pravda. Pán mít vždycky pravda.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //My, vůdci skřetí armáda, přijít zabít velkého paladina.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Zneškodnit Hagen a jeho muži. Ty už jim nepomoct.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Pán říkat skřetím vůdcům, přinést hlava velkého paladina. Teď zemřít skřetí rukou. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //My, vůdci skřetí armády přijít zabít tebe, paladin.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! My tě zabít, paladin.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
