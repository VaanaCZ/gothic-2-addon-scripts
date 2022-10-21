// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //�KHROKGNAR! �Amo decir que t� ser palad�n ahora! Amo tener raz�n. Amo siempre tener raz�n.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //Nosotros, jefes de orgulloso ej�rcito orco, venir a matar gran palad�n.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Hagen y sus hombres ir a ser aniquilados. Ni siquiera t� poder ayudarles.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Amo decir que jefes orcos llevar cabeza de gran palad�n. T� morir a mis manos. �KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //Nosotros, jefes orcos, venir a matarte, palad�n.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //�KHROKGNAR! Nosotros matarte, palad�n.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
