// ********************************************************
// 							EXIT 
// ********************************************************
INSTANCE DIA_Addon_Eremit_EXIT   (C_INFO)
{
	npc         = NONE_ADDON_115_Eremit;
	nr          = 999;
	condition   = DIA_Addon_Eremit_EXIT_Condition;
	information = DIA_Addon_Eremit_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
func INT DIA_Addon_Eremit_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Eremit_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ********************************************************
// 							Hallo 
// ********************************************************
instance DIA_Addon_Eremit_Hello (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 1;
	condition	= DIA_Addon_Eremit_Hello_Condition;
	information	= DIA_Addon_Eremit_Hello_Info;

	important	= TRUE;
};
func int DIA_Addon_Eremit_Hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Eremit_Hello_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_00"); //(p�ekvapen�) Co tady d�l�?
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_00"); //Co tady d�l�m?! A co tu sakra d�l� TY?
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_01"); //�el jsem do nejodlehlej�� ��sti ostrova, proto�e jsem cht�l m�t kone�n� klid!
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_02"); //Ob�ansk� v�lka, n�jezdy bandit�, tlupy sk�et�, co ti pomalu tlu�ou na dve�e...
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_03"); //To prost� nebylo pro m�. Tak jsem z toho ��lenstv� ode�el.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_04"); //Mo�n� �e tu n�jac� sk�eti jsou, ale moc jich nebude.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_05"); //A ��dn� LID� se tu � d�ky Innosovi � nikdy neuk�zali. (mrzut�) A� dodne�ka.
};

// ********************************************************
// 					Suche Steintafeln
// ********************************************************
instance DIA_Addon_Eremit_SeekTafeln (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 2;
	condition	= DIA_Addon_Eremit_SeekTafeln_Condition;
	information	= DIA_Addon_Eremit_SeekTafeln_Info;

	description	= "Hled�m n�jak� kamenn� tabulky...";
};
func int DIA_Addon_Eremit_SeekTafeln_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Eremit_SeekTafeln_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_02"); //Hled�m kamenn� tabulky. Nem� tu t�eba n�jak�?
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_06"); //(opatrn�) Ano, ale nech�v�m si je!
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_07"); //Jsou to jedin�, co se tu d� ��st.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_08"); //Sice jim je�t� nerozum�m, ale n�kter� texty u� se mi poda�ilo rozlu�tit.
};

// ********************************************************
// 				Wegen Steintafeln - TEACH
// ********************************************************
var int Eremit_Teach_Once;
// --------------------------------------------------------
instance DIA_Addon_Eremit_Teach (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 3;
	condition	= DIA_Addon_Eremit_Teach_Condition;
	information	= DIA_Addon_Eremit_Teach_Info;
	permanent 	= TRUE;
	description = "K t�m kamenn�m tabulk�m...";
};
func int DIA_Addon_Eremit_Teach_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Eremit_SeekTafeln))
	&& (Eremit_Teach_Once == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Eremit_Teach_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_03"); //Co se t��e t�ch kamenn�ch tabulek...
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_25"); //M�m t� nau�it, jak je ��st?
	if (MIS_Eremit_Klamotten != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_26"); //(rychle) Ale svoje ti ned�m! Mus� si naj�t vlastn�!
	};

	Info_ClearChoices (DIA_Addon_Eremit_Teach);
	Info_AddChoice (DIA_Addon_Eremit_Teach, DIALOG_BACK, DIA_Addon_Eremit_Teach_No);
	
	
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice (DIA_Addon_Eremit_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Eremit_Teach_Yes);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Info_AddChoice (DIA_Addon_Eremit_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Eremit_Teach_Yes);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		Info_AddChoice (DIA_Addon_Eremit_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Eremit_Teach_Yes);
	};
};

// ---------------------------------------------------------------
	func void B_Addon_Eremit_TeachLanguage()
	{	
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_27"); //No, je to pom�rn� jednoduch�. G je O, T je H a I je C. 
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_28"); //A� to pochop�, zbytek u� je docela logick�.
		
		/*
		
		if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
		{
			PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;
		}
		else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
		{
			PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
		}
		else
		{
			PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
		};
			
		*/	
				
		Eremit_Teach_Once = TRUE;
	};
// ---------------------------------------------------------------
func void DIA_Addon_Eremit_Teach_No()
{
	Info_ClearChoices (DIA_Addon_Eremit_Teach);
};

func void DIA_Addon_Eremit_Teach_Yes()
{
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_29"); //Mysl�m, �e v�c u� t� v tomhle nenau��m.
		Eremit_Teach_Once = TRUE;
	}
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else //Keine Language
	{
		if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_1))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	};
};

// ********************************************************
// 					Klamotten geben
// ********************************************************
instance DIA_Addon_Eremit_Klamotten (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 4;
	condition	= DIA_Addon_Eremit_Klamotten_Condition;
	information	= DIA_Addon_Eremit_Klamotten_Info;
	permanent 	= TRUE;
	description = "M�m pro tebe n�jak� o�acen�...";
};
func int DIA_Addon_Eremit_Klamotten_Condition ()
{
	if (MIS_Eremit_Klamotten == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Eremit_Klamotten_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_01"); //M�m pro tebe n�jak� oble�en�.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_19"); //V�n�? Uka� mi je, uvid�me, jestli mi sedne.
	
	Info_ClearChoices (DIA_Addon_Eremit_Klamotten);
	Info_AddChoice (DIA_Addon_Eremit_Klamotten, DIALOG_BACK, DIA_Addon_Eremit_Klamotten_BACK);
	if (Npc_HasItems (other, ITAR_PIR_L_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat lehkou pir�tskou zbroj", DIA_Addon_Eremit_Klamotten_PIR_L);
	};
	if (Npc_HasItems (other, ITAR_PIR_M_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat st�edn� t�kou pir�tskou zbroj", DIA_Addon_Eremit_Klamotten_PIR_M);
	};
	if (Npc_HasItems (other, ITAR_PIR_H_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat zbroj pir�tsk�ch kapit�n�", DIA_Addon_Eremit_Klamotten_PIR_H);
	};
	//if (Npc_HasItems (other, ITAR_Thorus_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Gardistenr�stung geben", DIA_Addon_Eremit_Klamotten_Thorus);
	//};
	//if (Npc_HasItems (other, ITAR_OreBaron_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Erzbaronr�stung geben", DIA_Addon_Eremit_Klamotten_OreBaron);
	//};
	//if (Npc_HasItems (other, ITAR_Bloodwyn_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Bloodwyn's R�stung geben", DIA_Addon_Eremit_Klamotten_Bloodwyn);
	//};
	//if (Npc_HasItems (other, ITAR_Raven_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Raven's R�stung geben", DIA_Addon_Eremit_Klamotten_Raven);
	//};
	if (Npc_HasItems (other, ITAR_RANGER_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat zbroj kruhu vody", DIA_Addon_Eremit_Klamotten_Ranger);
	};
	if (Npc_HasItems (other, ITAR_KDW_L_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat lehk� roucho kruhu vody", DIA_Addon_Eremit_Klamotten_KDW_L);
	};
	if (Npc_HasItems (other, ITAR_KDW_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat t�k� roucho kruhu vody", DIA_Addon_Eremit_Klamotten_KDW_H);
	};
	if (Npc_HasItems (other, ITAR_Governor) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat velitelsk� kab�tec", DIA_Addon_Eremit_Klamotten_Governor);
	};
	if (Npc_HasItems (other, ITAR_JUDGE) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat soudcovsk� roucho", DIA_Addon_Eremit_Klamotten_Judge);
	};
	if (Npc_HasItems (other, ITAR_SMITH) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat kov��skou z�st�ru", DIA_Addon_Eremit_Klamotten_Smith);
	};
	if (Npc_HasItems (other, ITAR_BARKEEPER) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat hostinskou z�st�ru", DIA_Addon_Eremit_Klamotten_Barkeeper);
	};
	if (Npc_HasItems (other, ITAR_VLK_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat m��ansk� od�v I", DIA_Addon_Eremit_Klamotten_VLK_L);
	};
	if (Npc_HasItems (other, ITAR_VLK_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat m��ansk� od�v II", DIA_Addon_Eremit_Klamotten_VLK_M);
	};
	if (Npc_HasItems (other, ITAR_VLK_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat m��ansk� od�v III", DIA_Addon_Eremit_Klamotten_VLK_H);
	};
	if (Npc_HasItems (other, ITAR_VlkBabe_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat m��ansk� �at I", DIA_Addon_Eremit_Klamotten_VlkBabe_L);
	};
	if (Npc_HasItems (other, ITAR_VlkBabe_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat m��ansk� �at II", DIA_Addon_Eremit_Klamotten_VlkBabe_M);
	};
	if (Npc_HasItems (other, ITAR_VlkBabe_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat m��ansk� �at III", DIA_Addon_Eremit_Klamotten_VlkBabe_H);
	};
	/*
	if (Npc_HasItems (other, ITAR_MIL_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Milizr�stung geben", DIA_Addon_Eremit_Klamotten_MIL_L);
	};
	if (Npc_HasItems (other, ITAR_MIL_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Milizr�stung geben", DIA_Addon_Eremit_Klamotten_MIL_M);
	};
	if (Npc_HasItems (other, ITAR_PAL_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Paladinr�stung geben", DIA_Addon_Eremit_Klamotten_PAL_M);
	};
	if (Npc_HasItems (other, ITAR_PAL_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Paladinr�stung geben", DIA_Addon_Eremit_Klamotten_PAL_H);
	};
	*/
	if (Npc_HasItems (other, ITAR_PAL_SKEL) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat starou paladinskou zbroj", DIA_Addon_Eremit_Klamotten_PAL_SKEL);
	};
	if (Npc_HasItems (other, ITAR_BAU_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat lehk� selsk� od�v", DIA_Addon_Eremit_Klamotten_BAU_L);
	};
	if (Npc_HasItems (other, ITAR_BAU_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat st�edn� t�k� selsk� od�v", DIA_Addon_Eremit_Klamotten_BAU_M);
	};
	if (Npc_HasItems (other, ITAR_BauBabe_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat lehk� selsk� �at", DIA_Addon_Eremit_Klamotten_BauBabe_L);
	};
	if (Npc_HasItems (other, ITAR_BauBabe_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat st�edn� t�k� selsk� �at", DIA_Addon_Eremit_Klamotten_BauBabe_M);
	};
	/*
	if (Npc_HasItems (other, ITAR_SLD_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte S�ldnerr�stung geben", DIA_Addon_Eremit_Klamotten_SLD_L);
	};
	if (Npc_HasItems (other, ITAR_SLD_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere S�ldnerr�stung geben", DIA_Addon_Eremit_Klamotten_SLD_M);
	};
	if (Npc_HasItems (other, ITAR_SLD_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere S�ldnerr�stung geben", DIA_Addon_Eremit_Klamotten_SLD_H);
	};
	*/
	if (Npc_HasItems (other, ITAR_DJG_Crawler) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat zbroj z d�ln�ho �erva", DIA_Addon_Eremit_Klamotten_DJG_Crawler);
	};
	/*
	if (Npc_HasItems (other, ITAR_DJG_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Drachenj�gerr�stung geben", DIA_Addon_Eremit_Klamotten_DJG_L);
	};
	if (Npc_HasItems (other, ITAR_DJG_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Drachenj�gerr�stung geben", DIA_Addon_Eremit_Klamotten_DJG_M);
	};
	if (Npc_HasItems (other, ITAR_DJG_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Drachenj�gerr�stung geben", DIA_Addon_Eremit_Klamotten_DJG_H);
	};
	if (Npc_HasItems (other, ITAR_NOV_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Novizenrobe geben", DIA_Addon_Eremit_Klamotten_Nov_L);
	};
	if (Npc_HasItems (other, ITAR_KDF_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Robe des Feuers geben", DIA_Addon_Eremit_Klamotten_KdF_L);
	};
	if (Npc_HasItems (other, ITAR_KDF_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Robe des Feuers geben", DIA_Addon_Eremit_Klamotten_KdF_H);
	};
	*/
	if (Npc_HasItems (other, ITAR_Leather_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat ko�enou zbroj", DIA_Addon_Eremit_Klamotten_Leather);
	};
	//if (Npc_HasItems (other, ITAR_BDT_M) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Banditenr�stung geben", DIA_Addon_Eremit_Klamotten_BDT_M);
	//};
	//if (Npc_HasItems (other, ITAR_BDT_H) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Banditenr�stung geben", DIA_Addon_Eremit_Klamotten_BDT_H);
	//};
	if (Npc_HasItems (other, ITAR_XARDAS) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat roucho temn�ch um�n�", DIA_Addon_Eremit_Klamotten_Xardas);
	};
	if (Npc_HasItems (other, ITAR_Lester) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat Lesterovo roucho", DIA_Addon_Eremit_Klamotten_Lester);
	};
	if (Npc_HasItems (other, ITAR_Diego) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat Diegovu zbroj", DIA_Addon_Eremit_Klamotten_Diego);
	};
	if (Npc_HasItems (other, ITAR_CorAngar) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat Cor Angarovu zbroj", DIA_Addon_Eremit_Klamotten_CorAngar);
	};
	if (Npc_HasItems (other, ITAR_Prisoner) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat kop��sk� kalhoty", DIA_Addon_Eremit_Klamotten_Prisoner);
	};
	if (Npc_HasItems (other, ITAR_Dementor) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "P�edat roucho p�tra��", DIA_Addon_Eremit_Klamotten_Dementor);
	};
};
// -------------------------------------------------------------
	func void B_Eremit_Tatsache()
	{
		AI_EquipBestArmor (self);
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_20"); //To teda jo!
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_21"); //Ale co te� budu d�lat? Dal jsem v�ecko zlato pir�t�m za to, �e m� sem zavezli.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_22"); //Nem��u ti nab�dnout nic v�c ne� p�r star�ch kamenn�ch tabulek. 
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_23"); //Tum�, vezmi si je. Poohl�dnu se po jin�ch.
		
		B_GiveInvItems (self,other,ItWr_DexStonePlate3_Addon,1);
		B_GiveInvItems (self,other,ItWr_StonePlateCommon_Addon ,1);     
		
		MIS_Eremit_Klamotten = LOG_SUCCESS;
		B_GivePlayerXP (200);
		
		Info_ClearChoices (DIA_Addon_Eremit_Klamotten);
	};
// -------------------------------------------------------------

func void DIA_Addon_Eremit_Klamotten_BACK()
{
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_24"); //Skv�l�. Nap�ed mi tu v�ecko rozhod� a pak... (povzdechne si)
	Info_ClearChoices (DIA_Addon_Eremit_Klamotten);
};
func void DIA_Addon_Eremit_Klamotten_PIR_L()
{
	B_GiveInvItems (other, self, ITAR_PIR_L_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PIR_M()
{
	B_GiveInvItems (other, self, ITAR_PIR_M_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PIR_H()
{
	B_GiveInvItems (other, self, ITAR_PIR_H_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Thorus()
{
	B_GiveInvItems (other, self, ITAR_Thorus_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_OreBaron()
{
	B_GiveInvItems (other, self, ITAR_OreBaron_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Bloodwyn()
{
	B_GiveInvItems (other, self, ITAR_Bloodwyn_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Raven()
{
	B_GiveInvItems (other, self, ITAR_Raven_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Ranger()
{
	B_GiveInvItems (other, self, ITAR_RANGER_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_KDW_L()
{
	B_GiveInvItems (other, self, ITAR_KDW_L_Addon, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_KDW_H()
{
	B_GiveInvItems (other, self, ITAR_KDW_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Governor()
{
	B_GiveInvItems (other, self, ITAR_Governor, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Judge()
{
	B_GiveInvItems (other, self, ITAR_JUDGE, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Smith()
{
	B_GiveInvItems (other, self, ITAR_SMITH, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Barkeeper()
{
	B_GiveInvItems (other, self, ITAR_BARKEEPER, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VLK_L()
{
	B_GiveInvItems (other, self, ITAR_VLK_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VLK_M()
{
	B_GiveInvItems (other, self, ITAR_VLK_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VLK_H()
{
	B_GiveInvItems (other, self, ITAR_VLK_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VlkBabe_L()
{
	B_GiveInvItems (other, self, ITAR_VlkBabe_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VlkBabe_M()
{
	B_GiveInvItems (other, self, ITAR_VlkBabe_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_VlkBabe_H()
{
	B_GiveInvItems (other, self, ITAR_VlkBabe_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_MIL_L()
{
	B_GiveInvItems (other, self, ITAR_MIL_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_MIL_M()
{
	B_GiveInvItems (other, self, ITAR_MIL_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PAL_M()
{
	B_GiveInvItems (other, self, ITAR_PAL_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PAL_H()
{
	B_GiveInvItems (other, self, ITAR_PAL_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_PAL_SKEL()
{
	B_GiveInvItems (other, self, ITAR_PAL_SKEL, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BAU_L()
{
	B_GiveInvItems (other, self, ITAR_BAU_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BAU_M()
{
	B_GiveInvItems (other, self, ITAR_BAU_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BauBabe_L()
{
	B_GiveInvItems (other, self, ITAR_BauBabe_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BauBabe_M()
{
	B_GiveInvItems (other, self, ITAR_BauBabe_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_SLD_L()
{
	B_GiveInvItems (other, self, ITAR_SLD_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_SLD_M()
{
	B_GiveInvItems (other, self, ITAR_SLD_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_SLD_H()
{
	B_GiveInvItems (other, self, ITAR_SLD_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_DJG_Crawler()
{
	B_GiveInvItems (other, self, ITAR_DJG_Crawler, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_DJG_L()
{
	B_GiveInvItems (other, self, ITAR_DJG_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_DJG_M()
{
	B_GiveInvItems (other, self, ITAR_DJG_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_DJG_H()
{
	B_GiveInvItems (other, self, ITAR_DJG_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Nov_L()
{
	B_GiveInvItems (other, self, ITAR_NOV_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_KdF_L()
{
	B_GiveInvItems (other, self, ITAR_KDF_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_KdF_H()
{
	B_GiveInvItems (other, self, ITAR_KDF_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Leather()
{
	B_GiveInvItems (other, self, ITAR_Leather_L, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BDT_M()
{
	B_GiveInvItems (other, self, ITAR_BDT_M, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_BDT_H()
{
	B_GiveInvItems (other, self, ITAR_BDT_H, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Xardas()
{
	B_GiveInvItems (other, self, ITAR_XARDAS, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Lester()
{
	B_GiveInvItems (other, self, ITAR_Lester, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Diego()
{
	B_GiveInvItems (other, self, ITAR_Diego, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_CorAngar()
{
	B_GiveInvItems (other, self, ITAR_CorAngar, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Prisoner()
{
	B_GiveInvItems (other, self, ITAR_Prisoner, 1);
	B_Eremit_Tatsache();
};
func void DIA_Addon_Eremit_Klamotten_Dementor()
{
	B_GiveInvItems (other, self, ITAR_Dementor, 1);
	B_Eremit_Tatsache();
};



// ********************************************************
// 							PERM
// ********************************************************
instance DIA_Addon_Eremit_PERM (C_INFO)
{
	npc		 	= NONE_ADDON_115_Eremit;
	nr		 	= 99;
	condition	= DIA_Addon_Eremit_PERM_Condition;
	information	= DIA_Addon_Eremit_PERM_Info;
	permanent 	= TRUE;
	description = "Tak co? Jak ti jde �ivot poustevn�ka?";
};
func int DIA_Addon_Eremit_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Eremit_PERM_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_04"); //A co? Jak se ti �ije jako poustevn�kovi?
	
	if (MIS_Eremit_Klamotten == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_09"); //(hrd�) V�ecko jsem si ud�lal s�m. Zbran�, n�stroje, chatr�, prost� v�ecko.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_10"); //Kdy� jsem sem p�i�el, nem�l jsem nic ne� dobrou n�ladu.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_11"); //Jen�e ob�as...
		AI_Output (other, self, "DIA_Addon_Eremit_Doppelt_15_01"); //Ano? 
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_12"); //Ob�as bych byl r�d, kdybych si s sebou byl vzal aspo� n�jak� oble�en�.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_13"); //Neum�m tk�t ani vyd�l�vat k��e.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_14"); //A noci v t�hle ��sti ostrova nejsou zrovna nejteplej��.
		MIS_Eremit_Klamotten = LOG_RUNNING;
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_15"); //Za��d�m to. 
		if (MIS_Eremit_Klamotten == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Addon_Eremit_Add_04_18"); //S oble�en�m v pohod� p�e�iju zimu! A potom... no, potom uvid�me...
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Eremit_Add_04_16"); //Po��d lep�� ne� v Khorinidu!
			AI_Output (self, other, "DIA_Addon_Eremit_Add_04_17"); //Dokonce i bez �at�.
		};
	};
};	
	


