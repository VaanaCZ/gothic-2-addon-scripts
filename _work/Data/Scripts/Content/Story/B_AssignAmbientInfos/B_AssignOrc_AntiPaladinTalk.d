// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! Meister sagen, du jetzt Paladin. Meister hatte Recht. Meister hatte immer Recht.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //Wir Anf�hrer der stolzen Orkarmee nun selbst kommen, um gro�en Paladin zu t�ten.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Hagen werden untergehen mit seinen Mannen. Auch du nicht ihnen helfen k�nnen.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Meister sagen Orkanf�hrer, bringen Kopf von gro�en Paladin. Du jetzt sterben durch meine Hand. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //Wir Ork-Anf�hrer jetzt selbst gekommen, dich zu t�ten, Paladin.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! Wir dich t�ten, Paladin.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
