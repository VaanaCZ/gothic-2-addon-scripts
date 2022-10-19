// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Francis_EXIT(C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 999;
	condition	= DIA_Addon_Francis_EXIT_Condition;
	information	= DIA_Addon_Francis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Francis_EXIT_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Francis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			In Gregs H�tte rein 
// ************************************************************
// ------------------------------------------------------------
// 			  		Spieler kennt H�tte nicht
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_First (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 1;
	condition	= DIA_Addon_Francis_First_Condition;
	information	= DIA_Addon_Francis_First_Info;
	permanent	= FALSE;
	description = "��� ���� ������?";
};                       
FUNC INT DIA_Addon_Francis_First_Condition()
{
	if (Knows_GregsHut == FALSE)
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_First_Info()
{	
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //��� ���� ������?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //���, ��� ����������� �����.
	Knows_GregsHut = TRUE;
};
// ------------------------------------------------------------
// 			  			Ich mu� da rein!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_LetMeIn (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 2;
	condition	= DIA_Addon_Francis_LetMeIn_Condition;
	information	= DIA_Addon_Francis_LetMeIn_Info;
	permanent	= FALSE;
	description = "� ������ ������� � ������ �����.";
};                       
FUNC INT DIA_Addon_Francis_LetMeIn_Condition()
{
	if ( (Npc_KnowsInfo (other, DIA_Addon_Francis_First)) || (Knows_GregsHut == TRUE) )
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_LetMeIn_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //� ������ ������� � ������ �����.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //� ������ ������!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //����� ������ ���. � � ����� �����, ����� ��� �� �������� ���������. 
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //��� ��� ����� �� ����, � �� ���������!
};
// ------------------------------------------------------------
// 			  			Hab Greg getroffen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AboutGreg (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 3;
	condition	= DIA_Addon_Francis_AboutGreg_Condition;
	information	= DIA_Addon_Francis_AboutGreg_Info;
	permanent	= FALSE;
	description = "���� - ��� ��������?";
};                       
FUNC INT DIA_Addon_Francis_AboutGreg_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Francis_ausgeschissen == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AboutGreg_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //���� ���� ���������?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //������ �� ������� ��� �������, ��� �� ��� ������!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //����� �����... �� ��� ���, ���� ��������� ���������� ����� ����� �������� �������� �����!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //(�����������) � �� ������� �� �������� ����!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //� ������ ���������� ���� ������� ��������� ��� �������!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //��������� ������, ��� ������, ���� �������� ���, ��� ����� ������ ���, ��� �� �����������������.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //��� ����� ��������, ����� ���� ��������. 
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //� ��� ��� �������� � ���, ��� ����� �����������, �������?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //� ����� �������� ��� � ���, ��� ������� ���������� � ��� ������.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //������� ����������, ��� � ���� ����� ������� ������������.
};
// ------------------------------------------------------------
// 		  			Gib mir Schl�ssel + Bestechung!
// ------------------------------------------------------------
var int Francis_bezahlt;

INSTANCE DIA_Addon_Francis_Key (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 4;
	condition	= DIA_Addon_Francis_Key_Condition;
	information	= DIA_Addon_Francis_Key_Info;
	permanent	= TRUE;
	description = "����� ��� ���� �� ������ �����!";
};                       
FUNC INT DIA_Addon_Francis_Key_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Key_Info()
{	
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //����� ��� ���� �� ������ �����!
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //������ ����, �� ������!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "� ������� ������ �����...", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "� ��� ���� 2000 �������!", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "� ��� ���� 1000 �������!", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //� ��� ���� 1000 �������!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //�����, ��� ��� ������������� �������� ����� ������������.
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //����� �� �������, ��� � ���� ����� ������������!
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //� ��� ���� 2000 �������!
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //������, �� ������� ���� �������� ���� �� �������.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //(������ ����) ����, � ������ �������...
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //�� �����, ����� ������. � ����� ������, �� ������ �� ������.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //��� ����!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //�������, ���� ���� �� ��������. � �� ���� ������ ������������ �� ����, �����?!
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //(�������) ��! ����� ���������, � ���� ������� ���!
	};
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
// ------------------------------------------------------------
// 			  				Aufs Maul!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AufsMaul (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_AufsMaul_Condition;
	information	= DIA_Addon_Francis_AufsMaul_Info;
	permanent	= TRUE;
	description = "��... ����� ���������, ��� �� ������.";
};                       
FUNC INT DIA_Addon_Francis_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //��� �, ����� ���������, ��� �� ����������� ���� ����������.
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //(������������) ���? ����� � �������! 
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //�� ��, ����� ����������, � ����� ���� ��������� ��������!
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
// ------------------------------------------------------------
// 			  		Ich habe dein Versteck gefunden...
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_Buch (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_Buch_Condition;
	information	= DIA_Addon_Francis_Buch_Info;
	permanent	= TRUE;
	description = "� ����� ���� �������...";
};                       
FUNC INT DIA_Addon_Francis_Buch_Condition()
{
	if (Npc_HasItems (other, ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Buch_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //� ����� ���� �������. ���� ������ � ������������� �����. ��� �� ���� �����, �� ��� ��?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //���... ������� ������ �� ����� ���� �����.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //�... ���... ���� ���� �� ��� ���� ��� �����...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //�� �� �� �������, ��� ����� ������� ����, �� ��� ��?
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //�� ������� �� � ����� �������� ������.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //���... ������� �������...
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //(�����������) ���� �� ����� ��� ���� �� ������ �����, �� ��� ��?
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //� ��� ���� ���� ����!
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //��� ������ ����� �������...
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //(������) �� �� ������ ������ ��� ����� � ������� ���� ��� �� �����, ����?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //�� ����� ���������!
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //��� ���� 2000 �������.
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //� �� ���� � ������� ��� 500 �������.
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //���, ����� 500 �������!
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //(���������) � ������ ����� ��� ���� ��� �����...
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	};
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 			  				PICK POCKET
// ------------------------------------------------------------
instance DIA_Francis_PICKPOCKET (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_PICKPOCKET_Condition;
	information	= DIA_Francis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(������� ���� ���� ����� �����)";
};                       
func INT DIA_Francis_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Francis_PICKPOCKET);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_BACK 		,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Francis_PICKPOCKET_DoIt);
};
func void DIA_Francis_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ITKE_Greg_ADDON_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft f�hrt zu NEWS!
	};
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};
func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};


// ************************************************************
// 			  		Wenn von Greg weggeschickt 
// ************************************************************
instance DIA_Francis_Ausgeschissen (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_Ausgeschissen_Condition;
	information	= DIA_Francis_Ausgeschissen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
func INT DIA_Francis_Ausgeschissen_Condition()
{
	if (Francis_ausgeschissen == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_Ausgeschissen_Info()
{	
	if (!Npc_IsDead(Greg))
	{
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //(������) ��������� ���� ���� �������� ���� ������ ����� �� ��� ���, ���� �� ������� �� ��������� �� ������ ������.
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //������ ���� � �����!
	AI_StopProcessInfos (self);
};


