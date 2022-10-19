// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //¡KHROKGNAR! ¡Amo decir que tú ser paladín ahora! Amo tener razón. Amo siempre tener razón.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //Nosotros, jefes de orgulloso ejército orco, venir a matar gran paladín.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Hagen y sus hombres ir a ser aniquilados. Ni siquiera tú poder ayudarles.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Amo decir que jefes orcos llevar cabeza de gran paladín. Tú morir a mis manos. ¡KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //Nosotros, jefes orcos, venir a matarte, paladín.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //¡KHROKGNAR! Nosotros matarte, paladín.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
