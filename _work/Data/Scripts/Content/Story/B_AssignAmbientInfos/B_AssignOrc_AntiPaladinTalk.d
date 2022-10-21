// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR ! Maître dire vous paladin maintenant ! Maître raison. Maître toujours raison.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //Nous chefs de fière armée orque venir tuer grand paladin.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Hagen et hommes à lui être balayés. Même vous pas pouvoir aider eux.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //Maître dire chefs orques apporter tête de grand paladin. Vous maintenant mourir par main à moi. KHROKGNAR !
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //Nous chefs orques venir maintenant tuer vous, paladin.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR ! Nous tuer vous, paladin.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
