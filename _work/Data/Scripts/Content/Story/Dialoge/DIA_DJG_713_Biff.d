func void B_KommMit ()
{
	AI_Output (other, self,"DIA_AkilsSchaf_KommMit_15_00");	//��� �� ����!
};
func void B_BIFF_VERARSCHEN ()
{
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_lebenlassen_07_01"); //� �� ����, ����� �� ����� �� ���� ������.
};

func void B_BiffsAnteil_Berechnung() //Joly: Wieviel Kohle mu� der SC Biff nun geben:
{	
	var int momentanKohle;
	var int UeberschussKohle;
	momentanKohle = Npc_HasItems(hero,ItMi_Gold);
	UeberschussKohle = (momentanKohle - DJG_Biff_SCGold);
	BiffsAnteil = ((UeberschussKohle)/2);
};

func void B_BiffsAnteil_PrintScreen ()
{
	var string BiffsAnteilText_Teil;
	var string BiffsAnteilText;
	var string Anteil;
	Anteil = IntToString (BiffsAnteil);
	BiffsAnteilText_Teil = ConcatStrings(PRINT_BiffsAnteil, Anteil);		
	BiffsAnteilText	= ConcatStrings(BiffsAnteilText_Teil, PRINT_BiffGold);	
	AI_PrintScreen	(BiffsAnteilText, -1, 45, FONT_ScreenSmall, 4);
};
func void B_Biff_SetRefuseTalk ()	//Joly: Biffs Geld eintreiberei kommt beim HalbeHalbe Deal nicht so h�ufig.
{
	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		Npc_SetRefuseTalk (Biff,1000);//Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	}
	else
	{
		Npc_SetRefuseTalk (Biff,600);//Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	};
};
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Biff_EXIT   (C_INFO)
{
	npc         = DJG_713_Biff;
	nr          = 999;
	condition   = DIA_Biff_EXIT_Condition;
	information = DIA_Biff_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Biff_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Biff_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HALLO		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	5;
	condition	 = 	DIA_Biff_HALLO_Condition;
	information	 = 	DIA_Biff_HALLO_Info;

	description	 = 	"��� �� ������� �����?";
};

func int DIA_Biff_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Biff_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_15_00"); //��� �� ������� �����?
	AI_Output			(self, other, "DIA_Biff_HALLO_07_01"); //����� ��� �� ������ ������ ������ �������. � ���, ��-������?

	Info_AddChoice	(DIA_Biff_HALLO, "� ������ �� ���� ������ ��-�� ������ ���������� ��������� ����.", DIA_Biff_HALLO_spott );
	Info_AddChoice	(DIA_Biff_HALLO, "���������� �� �����������.", DIA_Biff_HALLO_keineAhnung );
	Info_AddChoice	(DIA_Biff_HALLO, "�����, ������.", DIA_Biff_HALLO_doof );
};

func void DIA_Biff_HALLO_doof ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_doof_15_00"); //�����, ������.
	Info_ClearChoices	(DIA_Biff_HALLO);
};

func void DIA_Biff_HALLO_spott ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_spott_15_00"); //� ������ �� ���� ������ ��-�� ������ ���������� ��������� ����. ��� ������ � � �������.
	AI_Output			(self, other, "DIA_Biff_HALLO_spott_07_01"); //� ���� ������� ������� ����. � �����, ������ ����� ��������� ���.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};

func void DIA_Biff_HALLO_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_15_00"); //���������� �� �����������.
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_07_01"); //� ���, ����� ���-������, �������, ����������.

	Info_AddChoice	(DIA_Biff_HALLO, "� ��� ������ ���������?", DIA_Biff_HALLO_keineAhnung_was );
};
func void DIA_Biff_HALLO_keineAhnung_was ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_15_00"); //� ��� ������ ���������?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_07_01"); //��, �� �� ��� ����� �����, ��� � �����. ���� �� � ���� ���, � �� �� ����.

	Info_AddChoice	(DIA_Biff_HALLO, "� ��� ����� ���������?", DIA_Biff_HALLO_keineAhnung_was_was2 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_15_00"); //� ��� ����� ���������?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_07_01"); //�� ��������� ����������� ��� �� �����. ��������, ���� �� �������, ��� ����������. ��� �����, ����� ���-������ ���������.

	Info_AddChoice	(DIA_Biff_HALLO, "� ������ �� ����� ������ �� �������?", DIA_Biff_HALLO_keineAhnung_was_was2_was3 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00"); //� ������ �� ����� ������ �� �������?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01"); //���� �� �� ����������� �������� ��������� �������, � ������� ���� ������� ����.


	Info_AddChoice	(DIA_Biff_HALLO, "���� �� ������ ������ ����� �����, ������ � �� ����������!", DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00"); //���� �� ������ ������ ����� �����, ������ � �� ����������!
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01"); //�� ������ ����!

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};


///////////////////////////////////////////////////////////////////////
//	Info washierimTal
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_WASHIERIMTAL		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	7;
	condition	 = 	DIA_Biff_WASHIERIMTAL_Condition;
	information	 = 	DIA_Biff_WASHIERIMTAL_Info;

	description	 = 	"��� �� ��������� ����� �����, � ������ ��������?";
};

func int DIA_Biff_WASHIERIMTAL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Biff_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Biff_WASHIERIMTAL_Info ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_15_00"); //��� �� ��������� ����� �����, � ������ ��������?
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_01"); //������ � �����. ��� �� ���? ����� � ������� � ���������, � ���� �������� � ������.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_02"); //� ���� ����� ����������, ����� �������� ������� ����� �����, ������� �������� ��� ������� � ������� � ������.

	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "��� �, ����� � ����� ���� �����.", DIA_Biff_WASHIERIMTAL_vielglueck );
	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "�� ��,  ���� ���, ���� �� ������� ������!", DIA_Biff_WASHIERIMTAL_ihrtot );

};
func void DIA_Biff_WASHIERIMTAL_ihrtot ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_ihrtot_15_00"); //�� ��,  ���� ���, ���� �� ������� ������!
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_ihrtot_07_01"); //� ���? ��� ����� ����. ���� �� ������ ����� �������, �� ������ ���������.

	Info_ClearChoices	(DIA_Biff_WASHIERIMTAL);
};

func void DIA_Biff_WASHIERIMTAL_vielglueck ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_vielglueck_15_00"); //��� �, ����� � ����� ���� �����.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_vielglueck_07_01"); //��� �� ����� �����. ���������� ����� ������.

	Info_ClearChoices	(DIA_Biff_WASHIERIMTAL);
};

///////////////////////////////////////////////////////////////////////
//	Info arbeiten
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ARBEITEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	8;
	condition	 = 	DIA_Biff_ARBEITEN_Condition;
	information	 = 	DIA_Biff_ARBEITEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"�� �� �� ����� ���������� �� ����?";
};

func int DIA_Biff_ARBEITEN_Condition ()
{
	if 	(DJG_BiffParty == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Biff_HALLO))
		&& (DJG_Biff_Stay == FALSE)	
			{
					return TRUE;
			};
};
func void DIA_Biff_ARBEITEN_Info ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_15_00"); //�� �� �� ����� ���������� �� ����?
	
	B_LogEntry (TOPIC_Dragonhunter,"������� �� �������� ���� - �������� �������. ���� � ������� ���, �� ����� ��������� ������ �� ����."); 

	if (DJG_BiffParty_nomore >= 6) //Joly: Biff hat bei 3 die Schnauze voll vom SC
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_01"); //�� ��� ���-�� ��������. �� ����� �� ����� ������ ��������. ��� ��� �������, �� ����.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_02"); //���. ������ �� � ���? ��� ������ �������?
	};
	Info_ClearChoices	(DIA_Biff_ARBEITEN);
	
	Info_AddChoice	(DIA_Biff_ARBEITEN, "������, ��� ���� �������, ���� � ������� ���� � �����.", DIA_Biff_ARBEITEN_lebenlassen );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "�� �������� �������� ������.", DIA_Biff_ARBEITEN_HalbeHalbe );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "� ������� ���� 100 �������.", DIA_Biff_ARBEITEN_100 );
};

func void DIA_Biff_ARBEITEN_100 ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_100_15_00"); //� ������� ���� 100 �������.

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{	
			AI_Output			(self, other, "DIA_Biff_ARBEITEN_100_07_01"); //������. ���� ����������. ��� ������. � ����� �� �����.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"Follow");
			B_Biff_SetRefuseTalk ();
			self.aivar[AIV_PARTYMEMBER] = TRUE;
			DJG_BiffParty = TRUE;	
		}
		else
		{
			B_BIFF_VERARSCHEN ();
			AI_StopProcessInfos (self);
			DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
		};

};

func void DIA_Biff_ARBEITEN_HalbeHalbe ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_HalbeHalbe_15_00"); //�� �������� �������� ������.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_01"); //������ ���������. �� ������������ ����: �� ������� �������� ����. �� ��������� �� ����.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_02"); //� ��� ����: ��� �� ����� ������ � ������ �������, ��� �� �������� ���. ���� ���������� ������ ������. �������?

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BiffParty = TRUE;
	DJG_Biff_HalbeHalbe  = TRUE;
	B_Biff_SetRefuseTalk ();

	if (DJG_Biff_HalbeHalbe_again == FALSE)
	{
		DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
		DJG_Biff_HalbeHalbe_again = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_03"); //�� ��� � ������. �� ��� ������ ��� ���.
	};
};

func void DIA_Biff_ARBEITEN_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_lebenlassen_15_00"); //������, ��� ���� �������, ���� � ������� ���� � �����.
	B_BIFF_VERARSCHEN ();
	AI_StopProcessInfos (self);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};


///////////////////////////////////////////////////////////////////////
//	Info Geldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_GELDEINTREIBEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 9;
	condition	 = 	DIA_Biff_GELDEINTREIBEN_Condition;
	information	 = 	DIA_Biff_GELDEINTREIBEN_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int BIFF_LABERT_GELDEINTREIBEN;
func int DIA_Biff_GELDEINTREIBEN_Condition ()
{
	if (DJG_Biff_SCGold < Npc_HasItems(hero,ItMi_Gold)-1)
		&& ((Npc_GetBodyState(hero))!= BS_INVENTORY)				//Joly: wegen Truhen		 
		&& ((Npc_GetBodyState(hero))!= BS_MOBINTERACT_INTERRUPT)
		&& (((Npc_GetBodyState(hero))!= BS_STAND)||(BIFF_LABERT_GELDEINTREIBEN == TRUE))//Joly: wegen Pl�ndern von NSC-Invs	
		&& (((Npc_GetBodyState(hero))!= BS_ITEMINTERACT)||(BIFF_LABERT_GELDEINTREIBEN == TRUE))//Joly: wegen Geldbeutel	
		&& (DJG_Biff_HalbeHalbe == TRUE)
		&& (DJG_BiffParty == TRUE)	
		&& (DJG_Biff_Stay == FALSE)	
		{
			BIFF_LABERT_GELDEINTREIBEN = TRUE;
			return TRUE; 
		};
};

func void DIA_Biff_GELDEINTREIBEN_Info ()
{
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_07_00"); //�������! ����� �� �� �������, ��� �������� ������� ����������� ���? ����� �� ����!

	B_BiffsAnteil_Berechnung ();
	B_BiffsAnteil_PrintScreen ();

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);

	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "� �� ���� ������� ����.", DIA_Biff_GELDEINTREIBEN_zuTeuer );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "��� ���� ����.", DIA_Biff_GELDEINTREIBEN_geben );
};
func void DIA_Biff_GELDEINTREIBEN_geben ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_geben_15_00"); //��� ���� ����.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_geben_07_01"); //������. ����� � ����.
	AI_StopProcessInfos (self);
	B_GiveInvItems (other, self, ItMi_Gold, BiffsAnteil);
	B_Biff_SetRefuseTalk ();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00"); //� �� ���� ��������� ���� ����� �������.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01"); //������ ����. �� ������������ �� ��������.

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "�����, ������ ���� ���� ����������.", DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "��� ���� ����.", DIA_Biff_GELDEINTREIBEN_geben );

};
func void DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00"); //�����, ������ ���� ���� ����������.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01"); //��� �������. ����� � ������ ���� ����.

	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_Attack (self, other, AR_NONE, 1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);	
};

///////////////////////////////////////////////////////////////////////
//	Info IchBleibhier
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ICHBLEIBHIER		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 6;
	condition	 = 	DIA_Biff_ICHBLEIBHIER_Condition;
	information	 = 	DIA_Biff_ICHBLEIBHIER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_ICHBLEIBHIER_Condition ()
{
	if 		(
				((Npc_GetBodyState(hero))!= BS_INVENTORY)				//Joly: wegen Truhen
				&& ((Npc_GetBodyState(hero))!= BS_MOBINTERACT_INTERRUPT)
				&& (DJG_BiffParty == TRUE)
				&& (DJG_Biff_Stay == FALSE)	
				&& 	(
						(
							(
								//Joly: Biff st�rt nicht das Drachengespr�ch!
								((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01")<4000)	&& (Npc_IsDead(SwampDragon)== FALSE)&& (SwampDragon.flags != 0))
								||((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8")<2000)	&& (Npc_IsDead(RockDragon)== FALSE) && (RockDragon.flags != 0))
								||((Npc_GetDistToWP(self,"CASTLE_36")<4000)			&& (Npc_IsDead(FireDragon)== FALSE) && (FireDragon.flags != 0))
								||((Npc_GetDistToWP(self,"OW_ICEDRAGON_01")<4000)	&& (Npc_IsDead(IceDragon)== FALSE) 	&& (IceDragon.flags != 0))
							) 	
							&& (Npc_HasItems (hero,ItMi_InnosEye_Mis)>=1)
						)
						||(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02")<4500)//Joly: Biff kommt nicht in die Burg
					)
			)
				{
					return TRUE;
				};
};

func void DIA_Biff_ICHBLEIBHIER_Info ()
{
	AI_Output			(self, other, "DIA_Biff_ICHBLEIBHIER_07_00"); //����� ������� ���������. �� ��� ������. � � ���� ���������� ���� �����.

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,300);

	if (Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Swamp");
	};

	if (Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Rock");
	};

	if (Npc_GetDistToWP(self,"CASTLE_36")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Fire");
	};

	if (Npc_GetDistToWP(self,"OW_ICEDRAGON_01")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Ice");
	};

	if (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_AwayFromOC");
	};
	DJG_Biff_Stay = TRUE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Stay_AwayFromOC
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Stay_AwayFromOC		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	condition	 = 	DIA_Biff_Stay_AwayFromOC_Condition;
	information	 = 	DIA_Biff_Stay_AwayFromOC_Info;
	nr		 	 = 3;
	permanent	 = 	TRUE;

	description	 = 	"(����� ����� � ����� �����)";

};

func int DIA_Biff_Stay_AwayFromOC_Condition ()
{
		if 	(
				(Npc_GetDistToWP(self,"OW_PATH_298")<500)
				||(Npc_GetDistToWP(self,"LOCATION_19_01")<500)
			)
			&& (DJG_BiffParty == TRUE)	
			&& (DJG_Biff_Stay == TRUE)	
				{
					return TRUE;
				};
};

func void DIA_Biff_Stay_AwayFromOC_Info ()
{
	B_KommMit ();
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow");
	DJG_Biff_Stay = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Kohleweggeben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KOHLEWEGGEBEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	condition	 = 	DIA_Biff_KOHLEWEGGEBEN_Condition;
	information	 = 	DIA_Biff_KOHLEWEGGEBEN_Info;
	nr		 	 = 10;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_KOHLEWEGGEBEN_Condition ()
{
	if (DJG_Biff_SCGold > Npc_HasItems(hero,ItMi_Gold))
		&& (DJG_Biff_HalbeHalbe == TRUE)
		&& (DJG_BiffParty == TRUE)	
		&& (DJG_Biff_Stay == FALSE)	
		{
			//Joly:return TRUE;
		};
};

func void DIA_Biff_KOHLEWEGGEBEN_Info ()
{
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_00"); //�� ����������� ���� ������.
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_01"); //����� ��� ��� ��� ����.

	AI_StopProcessInfos (self);
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};


///////////////////////////////////////////////////////////////////////
//	Info BiffLosWerden
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_BIFFLOSWERDEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 11;
	condition	 = 	DIA_Biff_BIFFLOSWERDEN_Condition;
	information	 = 	DIA_Biff_BIFFLOSWERDEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"� �����, �� ���� ���� �������������� ����� ������� ����������.";
};

func int DIA_Biff_BIFFLOSWERDEN_Condition ()
{
	if (DJG_BiffParty == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Biff_BIFFLOSWERDEN_Info ()
{
	AI_Output			(other, self, "DIA_Biff_BIFFLOSWERDEN_15_00"); //� �����, �� ���� ���� �������������� ����� ������� ����������.
	AI_Output			(self, other, "DIA_Biff_BIFFLOSWERDEN_07_01"); //��� ������. � ����� ���� ������ � �������. �����.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
};

///////////////////////////////////////////////////////////////////////
//	Info MehrGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_MEHRGELD		(C_INFO)
{
	npc		 	= 	DJG_713_Biff;
	nr			 = 12;
	condition	 = 	DIA_Biff_MEHRGELD_Condition;
	information	 = 	DIA_Biff_MEHRGELD_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_MEHRGELD_Condition ()
{
	if 	(DJG_BiffParty == TRUE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (DJG_Biff_Stay == FALSE)	
		{
				return TRUE;
		};
};
var int DIA_Biff_MEHRGELD_Info_OneTime;
func void DIA_Biff_MEHRGELD_Info ()
{
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_00"); //��� ������-�� �������, ��� � ������ �������� � ���� ������ �����.

	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_01"); //100 ������� ����� ����������.
		if (DIA_Biff_MEHRGELD_Info_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_02"); //�� �����. � �� �����, ��� �� ����� ������ �������.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_03"); //��� ������ � �� ��������� � ���� � ��������� ���� ��� ��� �����.
			DIA_Biff_MEHRGELD_Info_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_04"); //� ���� ��� 100 �������.
	};
	
	Info_ClearChoices	(DIA_Biff_MEHRGELD);
	
	Info_AddChoice	(DIA_Biff_MEHRGELD, "� �� ���� ������� ����.", DIA_Biff_MEHRGELD_zuTeuer );
	Info_AddChoice	(DIA_Biff_MEHRGELD, "������. �� ����� ������.", DIA_Biff_MEHRGELD_ok );

};

func void DIA_Biff_MEHRGELD_ok ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_ok_15_00"); //������. �� ����� ������.

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_01"); //�� ��, ��� �����. ������, ����� ������.

			AI_StopProcessInfos (self);

			if (DJG_Biff_HalbeHalbe == TRUE)
			{
				DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
			};
			B_Biff_SetRefuseTalk ();
		}
		else
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_02"); //�� �� �����������! �� ���� �� ������ ��������� ����������.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_03"); //� �����, ��� ����� �������� ������� ��������.
			
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"Start");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			DJG_Biff_HalbeHalbe = FALSE;
			DJG_BiffParty = FALSE;
			DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
		};
};

func void DIA_Biff_MEHRGELD_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_zuTeuer_15_00"); //� �� ���� ������� ����.
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_zuTeuer_07_01"); //����� ���� �������� ������ ������ � ��������.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HEILUNG		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	4;
	condition	 = 	DIA_Biff_HEILUNG_Condition;
	information	 = 	DIA_Biff_HEILUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"���� ����� �������� �����?";
};

func int DIA_Biff_HEILUNG_Condition ()
{
	if (DJG_BiffParty == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Biff_HEILUNG_Info ()
{
	AI_Output			(other, self, "DIA_Biff_HEILUNG_15_00"); //���� ����� �������� �����?
	AI_Output			(self, other, "DIA_Biff_HEILUNG_07_01"); //�������. �� ��������.

	Info_ClearChoices	(DIA_Biff_HEILUNG);
	Info_AddChoice	(DIA_Biff_HEILUNG, "� ��� ���� ���-������ �����.", DIA_Biff_HEILUNG_spaeter );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(����� ��������� �������� �����)", DIA_Biff_HEILUNG_heiltrankLow );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(������ �������� �����)", DIA_Biff_HEILUNG_heiltrank );

};
func void DIA_Biff_HEILUNG_heiltrank ()
{
	if (B_GiveInvItems (other, self, ItPo_Health_03,1))
	{
	B_UseItem (self, ItPo_Health_03);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_02,1))
	{
	B_UseItem (self, ItPo_Health_02);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_01,1))
	{
	B_UseItem (self, ItPo_Health_01);
	}
	else
	{
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrank_07_00"); //� �����, � ���� ���������, ����� �� ����������� ��� ��� ����.
	};

	AI_StopProcessInfos (self);
};
func void DIA_Biff_HEILUNG_heiltrankLow ()
{
	if (B_GiveInvItems (other, self, ItPo_Health_01,1))
	{
	B_UseItem (self, ItPo_Health_01);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_02,1))
	{
	B_UseItem (self, ItPo_Health_02);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_03,1))
	{
	B_UseItem (self, ItPo_Health_03);
	}
	else
	{
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrankLow_07_00"); //� ���������, ��� � ���� ���. �������� � ����� ������� �����.
	};

	AI_StopProcessInfos (self);
};
func void DIA_Biff_HEILUNG_spaeter ()
{
	AI_Output			(other, self, "DIA_Biff_HEILUNG_spaeter_15_00"); //� ��� ���� ���-������ �����.
	AI_Output			(self ,other, "DIA_Biff_HEILUNG_spaeter_07_01"); //������ �� ������.
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DRACHENTOT		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	5;
	condition	 = 	DIA_Biff_DRACHENTOT_Condition;
	information	 = 	DIA_Biff_DRACHENTOT_Info;

	description	 = 	"��� ���. ��� ������� ������.";
};

func int DIA_Biff_DRACHENTOT_Condition ()
{
	if (DJG_BiffSurvivedLastDragon == TRUE) 
		{
				return TRUE;
		};
};

func void DIA_Biff_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_00"); //��� ���. ��� ������� ������.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_01"); //��. � � ��� ��� ���.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_02"); //�� ������, ��� ��� ��� ���������?
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_03"); //�����, ��.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_04"); //����. � � ������ ��������.
	B_GivePlayerXP (XP_BiffSurvivedLastDragon);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	DJG_713_Biff;
	nr			 = 	2;
	condition	 = 	DIA_Biff_KnowWhereEnemy_Condition;
	information	 = 	DIA_Biff_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"�� �� ����� �� ��������� ��������� ����������� �� ����?";
};
func int DIA_Biff_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Biff_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Biff_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Biff_KnowWhereEnemy_15_00"); //�� �� ����� �� ��������� ��������� ����������� �� ����?
	AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_01"); //���?
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_02"); //������. ��� ������� ��� ����� �����.
		AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_03"); //����� �� �������� ���� �������.
	}
	else 
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_04"); //� ��������� �������� ������� � ����������� �� ������ ������. ��� ������ ���� ��� �����.

		Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"��� ��������, � ��� ������� �� ����.",DIA_Biff_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"�� �� ������ ��������������?",DIA_Biff_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Biff_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_00"); //�� �� ������ ��������������?
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01"); //���� �� ������� �����. ��� �����...
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_02"); //��� ���� �� ������������, ������ ������, ��� �� ������� ������.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03"); //� ����� ������, � � ����. ���� �� ������������?
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_04"); //������� ��� ����� ��������� �� ������ ��������.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05"); //��� �������. � ��� � ����. ���������� � �������.

	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                       
    Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                       
    B_LogEntry (TOPIC_Crew,"����������� ����������� ������� ����� �������������� �� ���. ���� �� �������� ���������� ������, � ���� ������������ �� ����."); 
    
    B_GivePlayerXP (XP_Crewmember_Success);   

	self.flags 		 = NPC_FLAG_IMMORTAL;
	Biff_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	Biff_FollowsThroughPass = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"RunsToPass"); 

	Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
};

FUNC VOID DIA_Biff_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_No_15_00"); //��� ��������, � ��� ������� �� ����.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_No_07_01"); //��, ��. ����� �����������.

	Biff_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	Gleich geht�s los
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Pass		(C_INFO)
{
	npc			 = 	DJG_713_Biff;
	nr			 = 	55;
	condition	 = 	DIA_Biff_Pass_Condition;
	information	 = 	DIA_Biff_Pass_Info;
	PERMANENT 	 =  TRUE;

	description	 = 	"�� �������� ��� ����� ������?";
};
func int DIA_Biff_Pass_Condition ()
{	
	if (Npc_GetDistToWP(self,"START")<1000)
	&& (Biff_IsOnBoard == LOG_SUCCESS) 
		{
				return TRUE;
		};
};
func void DIA_Biff_Pass_Info ()
{
	AI_Output			(other, self, "DIA_Biff_Pass_15_00"); //�� �������� ��� ����� ������?
	AI_Output			(self, other, "DIA_Biff_Pass_07_01"); //������ �������. �����. � ����, �������, ����� ������ �����������.
	AI_StopProcessInfos (self);

};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Biff_PICKPOCKET (C_INFO)
{
	npc			= DJG_713_Biff;
	nr			= 900;
	condition	= DIA_Biff_PICKPOCKET_Condition;
	information	= DIA_Biff_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Biff_PICKPOCKET_Condition()
{
	C_Beklauen (92, 320);
};
 
FUNC VOID DIA_Biff_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Biff_PICKPOCKET);
	Info_AddChoice		(DIA_Biff_PICKPOCKET, DIALOG_BACK 		,DIA_Biff_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Biff_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Biff_PICKPOCKET_DoIt);
};

func void DIA_Biff_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Biff_PICKPOCKET);
};
	
func void DIA_Biff_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Biff_PICKPOCKET);
};

































