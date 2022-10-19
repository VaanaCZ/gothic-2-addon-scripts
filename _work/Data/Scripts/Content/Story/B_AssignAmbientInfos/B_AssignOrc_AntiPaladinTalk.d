// ***************************************************
//  	B_AssignORC_AntiPaladinTalk	
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk (var C_NPC Antipaladin)
{	
	 	if (AntiPaladinTalkcount == 0)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_01"); //���������! ������ �������� �� ������� ������! ������ ����. ������ ������ ����.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_02"); //��, ������������ ������ ����� �����, ������ ���� ������ ����� ������� �������.
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_03"); //����� � ��� ���� ����� ����������. ���� �� �� ����� ������ ��.
			B_GivePlayerXP (XP_Ambient);
		}
		else if (AntiPaladinTalkcount == 1)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_04"); //������ �������� ������������� �����, ��������� ������ �������� ��������. �� ������� �� ���� ����. ���������!
		}
		else if (AntiPaladinTalkcount == 2)
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_05"); //��, ������������ �����, ������ ���� ���� ������� ����, �������.
		}
		else 
		{
			AI_Output			(self ,other, "DIA_ORC_AntiPaladin_18_06"); //���������! �� ������� ����, �������.
		};
		AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
		TalkedTo_AntiPaladin = TRUE;
		
		AI_StopProcessInfos (Antipaladin);
		Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetRefuseTalk (Antipaladin,20);
};
