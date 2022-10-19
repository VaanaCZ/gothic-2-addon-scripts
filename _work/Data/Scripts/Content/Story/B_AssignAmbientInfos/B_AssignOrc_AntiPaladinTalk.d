// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR! P�n te� ��kat paladinovi! P�n m�t pravda. P�n m�t v�dycky pravda.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //My, v�dci sk�et� arm�da, p�ij�t zab�t velk�ho paladina.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //Zne�kodnit Hagen a jeho mu�i. Ty u� jim nepomoct.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //P�n ��kat sk�et�m v�dc�m, p�in�st hlava velk�ho paladina. Te� zem��t sk�et� rukou. KHROKGNAR!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //My, v�dci sk�et� arm�dy p�ij�t zab�t tebe, paladin.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR! My t� zab�t, paladin.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
