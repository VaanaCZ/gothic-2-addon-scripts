///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_DI_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro_DI;
	nr          = 999;
	condition   = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verr�ter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU		(C_INFO)
{
	npc			 = 	NOV_600_Pedro_DI;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_DI_YOU_Condition;
	information	 = 	DIA_Pedro_DI_YOU_Info;
	
	description	 = 	"���������!";
	
};
func int DIA_Pedro_DI_YOU_Condition ()
{	
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //���������! �������-�� � ����� ����.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //�� ������ �� ���������, ��� � ������ ����, ������ ��� � �������.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //������ �� ���, ���������, ������� ���� ���� �������, � �������� � �������� ����, ����� ������ ��. �� ��� ����, ������ ������, � ������ ����������!
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //�� ���� ��������� ��������, ��� � �������� � ����� �����, �� ������. �� ����� ��� ������ ������.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //� ������ ����� ���� �� �����.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //�������. ������. �� ���� �������� ����������. � ������� �� �� ������ ��������� �� ����� ����.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //�� �� �������������, ����� ��� � ������ �� ��������� ��������� ����. ��� ��������� ���� ����� � ��� ������. � �� ���� ���������� �� ����.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //��������� ����� ���������� ���� ��������� ����. �� ��������� ��� ����. ������. � �� �������. �� ������ �������� ���.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "�����������, ��� �� ������.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "� ������� ������ �� ����. � ���� ����.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "������ ���� �� ���� �������, �� ������� � ������ �������� ����.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "��������� ��� ��� ������ ����� ����.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //������ ���� �� ���� �������, �� ������� � ������ �������� ����.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(��������) ������ ���� � �����. � ���� ���������� ���-���, ��� ������� ���� ��������� ������. �� ������ ��������� ����.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //� ������� ������ �� ����. � ���� ����.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //������ ����� ������...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //��������� ��� ��� ������ ����� ����. ��� ������ ��������. � � ������ ��, ��� ��� ���������.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(��������) ����������, ���. �� �� ������ ������� ���. � ���� ����� ����������� ����. �� ������� ���.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss hei�en; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //�����������, ��� �� ������.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(����������) ��, �������. � �������� ���� ���, ��� �� ������ �����. �� ��� ����� �������. �� ������ ������� ���� � ����� ���������� �������, �������?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "� ������� ������ �� ����. � ���� ����.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "������. ��� �� ����, � ������ ���� �� �������.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //������. ��� �� ����, � ������ ���� �� �������.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //�������. �� �� ��������� �� ����.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_RUNNING;

};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedAtShip
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_ArrivedAtShip		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	4;
	condition	 = 	DIA_Pedro_DI_ArrivedAtShip_Condition;
	information	 = 	DIA_Pedro_DI_ArrivedAtShip_Info;

	description	= "������!";	
};

func int DIA_Pedro_DI_ArrivedAtShip_Condition ()
{
	if (Npc_GetDistToWP(self,"SHIP")<6000) 
	&& (MIS_Pedro_DI_FollowShip == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //������!
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //����������� ������� � ����. �� ��������� �������.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //������ �������. �����������, ��� � ������ ������?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //��, �������. � ���� ��� ������?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "� ������� ����������.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "��� ��� ������� ������ ����� �������?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "� ����� ��� ������� �������� ���� ������?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "��� ��� ������ ����� ���������� �����?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //��� ��� ������ ����� ���������� �����?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //�� ����� � ���� ��������� ����� ������� �����-���� ������� ��� ������ �����.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //� ��� ���, ��� � ������ ����, �� ���������� ���� � �������������� ���������� ��������� �� ��������.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //�������, � �� ��� ���������� ��� �����. ������ ��� ����� �� ����, ���� ������? � ��������� ����.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "��������� ����� �����.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //� ����� ��� ������� �������� ���� ������?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //���� ����� ����� ������� �����-������, ������ � ������. ������ ��� ����� � ����� ����� ������� ����.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //��� ���� ����� ����� �� ���� ������, �� � �����, ��� ��������� �������� ������.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //��� ��� ������� ������ ����� �������?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //� ������� ���� ���������� ����� ���� ��������� ������.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //���� ������ ����� ���� ������ ���, ����� ������ ���������. � �����, ��� �� ��������.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //���� �� ������� �������� ��������, ����������� ������, ������� �� ������ ����� �����.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //�-�-�. ��� �������, �� ������� ����������� ����� �����, � ����� ������, �� � ����� �� �����.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //� ����� �������� ���������� ��������� ������, ������� ������� � ����.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //��� ��������� ���� ������, � �� ����.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //��������� ����� �����.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //�����? ����� ������. � ������� �� ������ ��� ������� ����.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //� ������� ����������. ���, ����� ���� ����� �� ���� �������. � ��� ��� ���-��� ����� �������.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //�� �������� � ����� ���� ������. � ���� �������� �� ����.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_PERM		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	5;
	condition	 = 	DIA_Pedro_DI_PERM_Condition;
	information	 = 	DIA_Pedro_DI_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"�����?";
};
var int PedroDI_TalkNomore;
func int DIA_Pedro_DI_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	&& (PedroDI_TalkNomore == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Pedro_DI_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //�����?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //������, � ������� ���� �������?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //������ ����, ����������. � ���� ������ ����� ����� ���� � �� ����� �� �����.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //�-�-�.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //� ��������� �������.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //����� �������. ����� �� ����� ������ � ����.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //�������. � ��� ���� �� �����. ��������� ����.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //��� � �������. �������.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //����������, �� ������ ����!
		AI_StopProcessInfos (self);
	};
};

