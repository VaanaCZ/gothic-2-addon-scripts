// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Alrik_EXIT(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 999;
	condition	= DIA_Alrik_EXIT_Condition;
	information	= DIA_Alrik_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Alrik_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Alrik_PICKPOCKET (C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 900;
	condition	= DIA_Alrik_PICKPOCKET_Condition;
	information	= DIA_Alrik_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Alrik_PICKPOCKET_Condition()
{
	C_Beklauen (55, 50);
};
 
FUNC VOID DIA_Alrik_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alrik_PICKPOCKET);
	Info_AddChoice		(DIA_Alrik_PICKPOCKET, DIALOG_BACK 		,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alrik_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alrik_PICKPOCKET);
};
	
func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alrik_PICKPOCKET);
};
// ************************************************************
// 			  				  Hallo
// ************************************************************

INSTANCE DIA_Alrik_Hallo(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Hallo_Condition;
	information	= DIA_Alrik_Hallo_Info;
	permanent	= FALSE;
	description = "��� �� ������� �����?";
};                       

FUNC INT DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Alrik_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_Hallo_15_00"); //��� �� ������� �����?
	
	if (Npc_GetDistToWP (self,"NW_CITY_PATH_HABOUR_16_01") <= 500) //In Ecke
	{
		AI_Output (self ,other,"DIA_Alrik_Hallo_09_01"); //(�������) ��� ��� ���!
	}
	else //In Kneipe oder auf dem Weg
	{
		if (Npc_GetDistToWP (self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
		{
			AI_Output (self ,other,"DIA_Alrik_Hallo_09_02"); //� ��� ��� ��� ������ �����? � ���.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_Hallo_09_03"); //� ��������� ������� �����������.
		};
	};
	AI_Output (self ,other,"DIA_Alrik_Hallo_09_04"); //�� ���� �� ������ � ����, ��� � ����� ���� - �� � ��������� ���.
};

// ************************************************************
// 			  				Du k�mpfst?
// ************************************************************

INSTANCE DIA_Alrik_YouFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_YouFight_Condition;
	information	= DIA_Alrik_YouFight_Info;
	permanent	= FALSE;
	description = "�� ����������� ���?";
};                       

FUNC INT DIA_Alrik_YouFight_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_Hallo))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_YouFight_Info()
{
	AI_Output (other,self ,"DIA_Alrik_YouFight_15_00"); //�� ����������� ���?
	AI_Output (self ,other,"DIA_Alrik_YouFight_09_01"); //������ ����, � ������� �� ������.
	if (Npc_GetDistToWP (self,"NW_CITY_PATH_HABOUR_16_01") <= 500) //In Ecke
	{
		AI_Output (self ,other,"DIA_Alrik_YouFight_09_02"); //� ����� �����!
	};
	AI_Output (self ,other,"DIA_Alrik_YouFight_09_03"); //�� ������� � �������� �������� - ����� ��� ���!
};


// ************************************************************
// 			  				Regeln
// ************************************************************

INSTANCE DIA_Alrik_Regeln(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Regeln_Condition;
	information	= DIA_Alrik_Regeln_Info;
	permanent	= FALSE;
	description = "������ ������� ����?";
};                       

FUNC INT DIA_Alrik_Regeln_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_Regeln_Info()
{
	AI_Output (other,self ,"DIA_Alrik_Regeln_15_00"); //������ ������� ����?
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_01"); //��� ������: ��������� ��� ������� ������. ������� �����, ��������� � ������� �����!
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_02"); //�� ���������, ���� ���� �� ��� �� ������. ��� ������ ���� �� ��� �������� ������������� �� �����, ��� �������, �������?
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_03"); //��� ������ - ��� ��������! �� ����, ���� �� ����� �� ���, �� � �������!
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_04"); //������ - 50 �������. ���� �� ��������, �� �������� 100 �����. ���� ��� - ��, ����� ���� ������ ��������� � ����. (����������)
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_05"); //�����?
	AI_Output (other,self ,"DIA_Alrik_Regeln_15_06"); //��!
};


// ************************************************************
// 		  			Important f�r NEUE 3 K�mpfe ab Kap 3
// ************************************************************

		func void B_Alrik_Again()
		{
			AI_Output (self, other, "DIA_Alrik_Add_09_03"); //��� ����? �� ������ ��������� �� ���� ��� ���? � �����, �� ��� ����� � ���� �����...
		};

INSTANCE DIA_Alrik_NewFights3(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_NewFights3_Condition;
	information	= DIA_Alrik_NewFights3_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Alrik_NewFights3_Condition()
{
	if (Kapitel >= 3)
	&& (Kapitel <= 4)
	&& (Alrik_ArenaKampfVerloren <= 6)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill (self, NPC_TALENT_1H, 20);
	B_SetAttributesToChapter (self, 4);
	B_Alrik_Again();
};

// ************************************************************
// 		  			Important f�r NEUE 3 K�mpfe ab Kap 5
// ************************************************************

INSTANCE DIA_Alrik_NewFights5(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_NewFights5_Condition;
	information	= DIA_Alrik_NewFights5_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Alrik_NewFights5_Condition()
{
	if (Kapitel >= 5)
	&& (Alrik_ArenaKampfVerloren <= 9)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill (self, NPC_TALENT_1H, 20);
	B_SetAttributesToChapter (self, 6);
	B_Alrik_Again();
};

// ************************************************************
// 			  			WannaFight
// ************************************************************
		
		func void B_Alrik_Enough()
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_05"); //��� �������, �� ���������� ������� �����.
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_06"); //�� ����� ���� �������, �� ��� ����� ��� ��� ����� ����� �������� ����...
		};
		
		func void B_Alrik_ComeBackLater()
		{
			AI_Output (self, other, "DIA_Alrik_Add_09_02"); //������ �����. � ���� � ������������...
		};
		

INSTANCE DIA_Alrik_WannaFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_WannaFight_Condition;
	information	= DIA_Alrik_WannaFight_Info;
	permanent	= TRUE;
	description = "� ���� ��������� � �����!";
};                       

FUNC INT DIA_Alrik_WannaFight_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_Regeln))
	&& (self.aivar[AIV_ArenaFight] == AF_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Alrik_WannaFight_Info()
{
	AI_Output (other,self ,"DIA_Alrik_WannaFight_15_00"); //� ���� ��������� � �����!
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
	
	// ------ EXIT: Wenn Alrik schonmal verloren, n�chster Kampf erst, wenn Alrik das bessere Schwert hat ------
	if ( (Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems (self, ItMW_AlriksSword_Mis) == 0) )
	|| (Npc_HasEquippedMeleeWeapon (self) == FALSE)
	{
		if (MIS_Alrik_Sword == LOG_SUCCESS) //Wenn nach Schwert-Mission niedergeschlagen und Schwert weggenommen
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_01"); //������� ����� ��� ��� ���. � ��� ���������...
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_02"); //���, ���. ������ ��� ����� ������ ���� ��� ���, ��� ��������� ����� ������ �������!
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_03"); //��� ��������� ���� ����� �������� ������� ���� ���.
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_04"); //� ��� � ���������! ���� �� ������� ��� ���, � ����� ����� ��������� � �����!
			
			Alrik_VomSchwertErzaehlt = TRUE;
			
			Log_CreateTopic (TOPIC_AlrikSchwert,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_AlrikSchwert,LOG_RUNNING);
			B_LogEntry (TOPIC_AlrikSchwert,"������ ������ ���� ��� �������� �����. �� ����� ��������� �� ����, ������ ���� � ����� ��� ��� ���.");
		};
	}
	
	// ----- EXIT: �BER DREI MAL Alrik_ArenaKampfVerloren ------
	else if (Kapitel <= 2)
	&& (Alrik_ArenaKampfVerloren > 3)
	{
		AI_Output (self, other, "DIA_Alrik_Add_09_00"); //� �����, ���� ������...
		AI_Output (self, other, "DIA_Alrik_Add_09_01"); //��� ��� ������� �����������.
		B_Alrik_ComeBackLater();
	}
	
	else if (Kapitel >= 3)
	&& (Kapitel <= 4)
	&& (Alrik_ArenaKampfVerloren > 6)
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	
	else if (Kapitel >= 5)
	&& (Alrik_ArenaKampfVerloren > 9)
	{
		B_Alrik_Enough();
		AI_Output (self, other, "DIA_Alrik_Add_09_04"); //����� ����, � ������� ��������� ��� ���������� �����.
		AI_Output (self, other, "DIA_Alrik_Add_09_05"); //� ���� ������. � ��������� ��������� ���� ������ �������� � ������...
		AI_Output (self, other, "DIA_Alrik_Add_09_06"); //��� �����, �����, � ������ ��������� �����...
	}
	
	// ------ normaler KAMPF ------
	else if (Wld_IsTime(11,00,19,00))
	{
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_07"); //� ���� ���� 50 �������?
		Info_ClearChoices 	(DIA_Alrik_WannaFight);
		Info_AddChoice 		(DIA_Alrik_WannaFight, "���...",	DIA_Alrik_WannaFight_NoGold);
		if (Npc_HasItems (other, itmi_gold) >= 50)
		{
			Info_AddChoice 		(DIA_Alrik_WannaFight, "���, �����...",	DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_08"); //� �������� ������ � ������� �� ������.
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_09"); //��� ����� �����, ������ ���� ���� ���������� ��������, �������� ������!
		if (Wld_IsTime(19,00,03,30))
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_10"); //������ ������� ������. ������� ������ � �������!
		}
		else // 03,30 - 11,00 
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_11"); //��� ��� ������� ����, ������ �����!
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_Gold_15_00"); //���, �����...
	B_GiveInvItems (other, self, itmi_gold, 50);
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_01"); //(������) � ��� ����� ����!
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_02"); //������ �������...
	
	Npc_RemoveInvItems (self, itmi_gold, Npc_HasItems(self, itmi_gold) );
	CreateInvItems (self, itmi_gold, 100); //50 vom Spieler und 50 Einsatz von Alrik...
	
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_03"); //�� �����?
	
	//--------------------------------------
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe 		= Alrik_Kaempfe + 1;
	//--------------------------------------
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
	Info_AddChoice 		(DIA_Alrik_WannaFight, "������� ����������...",	DIA_Alrik_WannaFight_Moment);
	Info_AddChoice 		(DIA_Alrik_WannaFight, "��� ����!",	DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_NoGold_15_00"); //���...
	AI_Output (self, other,"DIA_Alrik_WannaFight_NoGold_09_01"); //����� ����� ��! ��� ������ ��� �� �����!
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_NOW_15_00"); //��� ����!
	AI_Output (self, other,"DIA_Alrik_WannaFight_NOW_09_01"); //���������, �� ��� �� ��������!
	
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems (self, ItPo_Health_03, 1); 
		B_UseItem (self, ItPo_Health_03);
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self,other, AR_NONE, 1);
};	

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_Moment_15_00"); //������� ����������...
	AI_Output (self, other,"DIA_Alrik_WannaFight_Moment_09_01"); //��� ������... � � ������� ������!
	
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems (self, ItPo_Health_03, 1); 
		B_UseItem (self, ItPo_Health_03);
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self,other, AR_NONE, 1);
};	


// ************************************************************
// 			  			NACH Kampf
// ************************************************************

INSTANCE DIA_Alrik_AfterFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_AfterFight_Condition;
	information	= DIA_Alrik_AfterFight_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_Alrik_AfterFight_Condition()
{
	if (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		if (self.aivar[AIV_ArenaFight] != AF_NONE)
		{	
			return TRUE;	//direkt ansprechen
		}
		else if (Npc_IsInState (self, ZS_Talk))
		{
			return TRUE; 	//wenn kein Kampf war, nur reagieren, wenn SC ihn angesprochen hat
		};
	};
};
 
FUNC VOID DIA_Alrik_AfterFight_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	&& (self.aivar[AIV_ArenaFight] != AF_NONE)
	&& (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_00"); //��, ������! �� � ����� � ����.
			
			if (Npc_HasItems (self, itmi_gold) >= 100)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_01"); //��� ���� 100 �������! �� ��������� ��!
				B_GiveInvItems (self, other, itmi_gold, 100);
			}
			else if (Npc_HasItems (self, itmi_gold) == 0)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_02"); //� ����, �� ��� ������ ���� ������.
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_03"); //�� ��� �� ���������, ���� � ��� �� ����� ��� ���� - � ����� ���� �����!
			}
			else //zwischen 1 und 99 Gold...
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_04"); //�� ������� � ���� ��������, ���� � ��� ��� ��������!
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_05"); //��� ������ ���! �� �����, ��� ������ ��� ����� ���� ������! ��� ���������.
				B_GiveInvItems (self, other, itmi_gold, Npc_HasItems(self, itmi_gold) );
			};
			
			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_06"); //�� ������ ������. �� ���� ������ ������� - �� ������������� ��������, ��� ������ �� ������ ����! (����������)
		}
		else //FIGHT_CANCEL
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_07"); //��, � �� ������������, ���, ��� ������ �� ���� �����������! ���� ������ ����������� ��� ���, � � ����� �������!
		};
		
		// ------ nur einmal ------
		if (Alrik_Kaempfe == 1)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_08"); //� ��� ����: ����� �� ������� � ���, ��� ���������� �� �������.
			
			if (other.guild != GIL_MIL)
			&& (other.guild != GIL_PAL)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_09"); //��������� ������ �� �������� ����������� �������� ���� �� �������. � ��� ����� �� ����� ����� �������� ������ �� ���.
			};
		};
				
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else //anderer Kampfgrund gegen den Spieler ODER kein sauberer Kampf
	{
		if (self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE) // NACH Kampf und VOR Bewertung nochmal angegriffen.
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_10"); //��� ��� �������, ��, ������!
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_11"); //� �� �����, ����� ���-������ �� ����������� ���� ��������.
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_12"); //�������� ������!
		}
		else //einfach so angegriffen (unvorbereitet)
		{
			if (Alrik_Kaempfe == 0)
			{	
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_13"); //���� �� ����� ��������� �� ����, ���� ����� ���� ������� ����.
			}
			else // > 0
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_14"); //���� �� ����� ��������� ��� ���, ���� ����� ���� ������� ����!
			};
			
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_15"); //� �� ���� ����� ���� � ����� �������, ��� ��! ����������!
		};
		
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		AI_StopProcessInfos(self);
	};
};
	

// ************************************************************
// 			  			Du wohnst hier?
// ************************************************************

INSTANCE DIA_Alrik_DuWohnst(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_DuWohnst_Condition;
	information	= DIA_Alrik_DuWohnst_Info;
	permanent	= FALSE;
	description = "�� '������' �� ���� �������?";
};                       

FUNC INT DIA_Alrik_DuWohnst_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_DuWohnst_Info()
{
	AI_Output (other,self ,"DIA_Alrik_DuWohnst_15_00"); //(���������) �� '������' �� ���� �������?
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_01"); //������ ��������. (����������) ����� ������ ������� �����, ��� � ����, ����� ��������� ���� ������� �������!
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_02"); //� ��� ������������ � �����, �� � ������ ��� ������� � ������ ������ �������� �����������.
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_03"); //� ��� � ������� � ���� ����. ��� ��������� 100 ������� ���� � ������ ���������� � ��������� �����.
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_04"); //� ��� � ������� ����� �����������. ��� ���� �������� ������� ��� ���.
	
	Alrik_VomSchwertErzaehlt = TRUE;
};


// ************************************************************
// 			  		Wer hat dein Schwert?
// ************************************************************

INSTANCE DIA_Alrik_WerSchwert(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_WerSchwert_Condition;
	information	= DIA_Alrik_WerSchwert_Info;
	permanent	= FALSE;
	description = "���� �� ������ ���� ���?";
};                       

FUNC INT DIA_Alrik_WerSchwert_Condition()
{
	if (Alrik_VomSchwertErzaehlt == TRUE)
	&& (MIS_Alrik_Sword != LOG_SUCCESS)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_WerSchwert_Info()
{
	AI_Output (other,self ,"DIA_Alrik_WerSchwert_15_00"); //���� �� ������ ���� ���?
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_01"); //� ������� ��� � �������� � �������� ������� �� ���-����� ����.
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_02"); //��� ����� �����. ������ � ����, ��� �� ��� ���, ����� �����������.
	AI_Output (other,self ,"DIA_Alrik_WerSchwert_15_03"); //�� ���� �� ������ ��� ���� ��� ������ ���...
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_04"); //��� ������ ���. �� ���� �� ����� �� ���� ��������. ������ ����� �� ���� �������, ��� � �������������� ������. (����������)
		
	MIS_Alrik_Sword = LOG_RUNNING;
};

// **************************************
//			Ich hab dein Schwert
// **************************************
var int Alrik_EinmalSchwertBonus;

INSTANCE DIA_Alrik_HaveSword(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_HaveSword_Condition;
	information	= DIA_Alrik_HaveSword_Info;
	permanent	= TRUE;
	description = "� ������ ���� ���!";
};                       

FUNC INT DIA_Alrik_HaveSword_Condition()
{
	IF (Npc_HasItems (other,ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Alrik_HaveSword_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_HaveSword_15_00"); //� ������ ���� ���!
	B_GiveInvItems (other,self,ItMW_AlriksSword_Mis,1);
	
	if (MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Alrik_HaveSword_09_01"); //��! �� ����������� ������� ���������, ��� ������!
		
		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP (XP_AlriksSword);
	}
	else
	{	
		AI_Output (self ,other,"DIA_Alrik_HaveSword_09_02"); //�������! ���������, ���������� �� �� ������� ���� ������!
	};
		
	if (Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill (self, NPC_TALENT_1H, 20);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	AI_EquipBestMeleeWeapon (self);
};

// ************************************************************
// 			  			Krieg mit Orks
// ************************************************************

INSTANCE DIA_Alrik_Krieg(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Krieg_Condition;
	information	= DIA_Alrik_Krieg_Info;
	permanent	= FALSE;
	description = "��� �� ������ � ����� � ������?";
};                       

FUNC INT DIA_Alrik_Krieg_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_DuWohnst))
	|| (hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_Krieg_Info()
{
	AI_Output (other,self ,"DIA_Alrik_Krieg_15_00"); //��� �� ������ � ����� � ������?
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_01"); //��� ����� ������ �������. ��� ����� ���� ��� ����� �����.
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_02"); //����� ��������. ������� ����������� ������������ ���������, ������� ����������� ����������� �������.
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_03"); //�� �� ������� �����. ���� ����� ������ �� ����������, ����������� ����������.
};

// ************************************************************
// 			  			Mich ausbilden?
// ************************************************************

// -------------------------------
	var int Alrik_VorausErzaehlt;
// -------------------------------


instance DIA_Alrik_Ausbilden(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Ausbilden_Condition;
	information	= DIA_Alrik_Ausbilden_Info;
	permanent	= TRUE;
	description = "�� ������ ������� ����?";
};                       

FUNC INT DIA_Alrik_Ausbilden_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Alrik_DuWohnst))
	|| (hero.guild != GIL_NONE))
	&& (Alrik_Teach1H == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_Ausbilden_Info()
{
	AI_Output (other,self ,"DIA_Alrik_Ausbilden_15_00"); //�� ������ ������� ����?
	
	if (Alrik_Kaempfe == 0)
	&& (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_01"); //���� �� ������������� ������ ��������� ���������, �� ������ ������ ����. (����������) �� ���� ���� � �� ������ �������������� �����.
		Alrik_VorausErzaehlt = TRUE; 
	}
	else //>0
	{
		if (Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_02"); //� ����� ���� �����. � ����� ���� �����, ��� � ���� - ���� � ���� ���������� �����.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_03"); //��� ������ � ���� ����� ����������� ���� - ����������.
		};
		
		
		Alrik_Teach1H = TRUE;
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		B_LogEntry (Topic_CityTeacher,"������ ����� ������� ���� ��������� �������� ���������� �������. �� ��������� �� ������� � �������� ��������.");
	};
};

//**************************************
//			Ich will trainieren
//**************************************

// -------------------------------------
	var int Alrik_Merke_1h;
// -------------------------------------

instance DIA_Alrik_Teach(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Teach_Condition;
	information	= DIA_Alrik_Teach_Info;
	permanent	= TRUE;
	description = "����� ���� ���������� � �����!";
};                       

FUNC INT DIA_Alrik_Teach_Condition()
{
	if (Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Alrik_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_Teach_15_00"); //����� ���� ���������� � �����!
	
	Alrik_Merke_1h =  other.HitChance[NPC_TALENT_1H];
	
	Info_ClearChoices 	(DIA_Alrik_Teach);
	Info_AddChoice 		(DIA_Alrik_Teach, DIALOG_BACK,	DIA_Alrik_Teach_Back);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Alrik_Teach_1H_1);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Alrik_Teach_1H_5);
};

FUNC VOID DIA_Alrik_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_1H] >= (60-30))
	{
		AI_Output (self ,other,"DIA_Alrik_Teach_Back_09_00"); //�� ������ �� �������!
	}
	else if (other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h)
	{
		AI_Output (self ,other,"DIA_Alrik_Teach_Back_09_01"); //� ���� ��� ����� ����������. ����� �� ������� ��������� ������!
	};
	
	Info_ClearChoices (DIA_Alrik_Teach);
};

FUNC VOID DIA_Alrik_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	Info_ClearChoices 	(DIA_Alrik_Teach);
	Info_AddChoice 		(DIA_Alrik_Teach, DIALOG_BACK,	DIA_Alrik_Teach_Back);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Alrik_Teach_1H_1);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Alrik_Teach_1H_5);
};

FUNC VOID DIA_Alrik_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_Alrik_Teach);
	Info_AddChoice 		(DIA_Alrik_Teach, DIALOG_BACK,	DIA_Alrik_Teach_Back);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Alrik_Teach_1H_1);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Alrik_Teach_1H_5);
};



		






		







