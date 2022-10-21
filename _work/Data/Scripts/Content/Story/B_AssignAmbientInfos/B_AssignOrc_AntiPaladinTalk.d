// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! Meister sagen, du jetzt Paladin. Meister hatte Recht. Meister hatte immer Recht.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //Wir Anführer der stolzen Orkarmee nun selbst kommen, um großen Paladin zu töten.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Hagen werden untergehen mit seinen Mannen. Auch du nicht ihnen helfen können.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Meister sagen Orkanführer, bringen Kopf von großen Paladin. Du jetzt sterben durch meine Hand. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //Wir Ork-Anführer jetzt selbst gekommen, dich zu töten, Paladin.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! Wir dich töten, Paladin.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
