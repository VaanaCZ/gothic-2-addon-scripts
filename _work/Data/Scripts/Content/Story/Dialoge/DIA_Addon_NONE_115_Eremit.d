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
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_00"); //(pøekvapenì) Co tady dìláš?
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_00"); //Co tady dìlám?! A co tu sakra dìláš TY?
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_01"); //Šel jsem do nejodlehlejší èásti ostrova, protože jsem chtìl mít koneènì klid!
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_02"); //Obèanská válka, nájezdy banditù, tlupy skøetù, co ti pomalu tluèou na dveøe...
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_03"); //To prostì nebylo pro mì. Tak jsem z toho šílenství odešel.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_04"); //Možná že tu nìjací skøeti jsou, ale moc jich nebude.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_05"); //A žádní LIDÉ se tu – díky Innosovi – nikdy neukázali. (mrzutì) Až dodneška.
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

	description	= "Hledám nìjaké kamenné tabulky...";
};
func int DIA_Addon_Eremit_SeekTafeln_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Eremit_SeekTafeln_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_02"); //Hledám kamenné tabulky. Nemáš tu tøeba nìjaké?
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_06"); //(opatrnì) Ano, ale nechávám si je!
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_07"); //Jsou to jediné, co se tu dá èíst.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_08"); //Sice jim ještì nerozumím, ale nìkteré texty už se mi podaøilo rozluštit.
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
	description = "K tìm kamenným tabulkám...";
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
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_03"); //Co se týèe tìch kamenných tabulek...
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_25"); //Mám tì nauèit, jak je èíst?
	if (MIS_Eremit_Klamotten != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_26"); //(rychle) Ale svoje ti nedám! Musíš si najít vlastní!
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
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_27"); //No, je to pomìrnì jednoduché. G je O, T je H a I je C. 
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_28"); //Až to pochopíš, zbytek už je docela logický.
		
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
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_29"); //Myslím, že víc už tì v tomhle nenauèím.
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
	description = "Mám pro tebe nìjaké ošacení...";
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
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_01"); //Mám pro tebe nìjaké obleèení.
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_19"); //Vážnì? Ukaž mi je, uvidíme, jestli mi sedne.
	
	Info_ClearChoices (DIA_Addon_Eremit_Klamotten);
	Info_AddChoice (DIA_Addon_Eremit_Klamotten, DIALOG_BACK, DIA_Addon_Eremit_Klamotten_BACK);
	if (Npc_HasItems (other, ITAR_PIR_L_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat lehkou pirátskou zbroj", DIA_Addon_Eremit_Klamotten_PIR_L);
	};
	if (Npc_HasItems (other, ITAR_PIR_M_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat støednì tìžkou pirátskou zbroj", DIA_Addon_Eremit_Klamotten_PIR_M);
	};
	if (Npc_HasItems (other, ITAR_PIR_H_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat zbroj pirátských kapitánù", DIA_Addon_Eremit_Klamotten_PIR_H);
	};
	//if (Npc_HasItems (other, ITAR_Thorus_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Gardistenrüstung geben", DIA_Addon_Eremit_Klamotten_Thorus);
	//};
	//if (Npc_HasItems (other, ITAR_OreBaron_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Erzbaronrüstung geben", DIA_Addon_Eremit_Klamotten_OreBaron);
	//};
	//if (Npc_HasItems (other, ITAR_Bloodwyn_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Bloodwyn's Rüstung geben", DIA_Addon_Eremit_Klamotten_Bloodwyn);
	//};
	//if (Npc_HasItems (other, ITAR_Raven_Addon) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Raven's Rüstung geben", DIA_Addon_Eremit_Klamotten_Raven);
	//};
	if (Npc_HasItems (other, ITAR_RANGER_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat zbroj kruhu vody", DIA_Addon_Eremit_Klamotten_Ranger);
	};
	if (Npc_HasItems (other, ITAR_KDW_L_Addon) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat lehké roucho kruhu vody", DIA_Addon_Eremit_Klamotten_KDW_L);
	};
	if (Npc_HasItems (other, ITAR_KDW_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat tìžké roucho kruhu vody", DIA_Addon_Eremit_Klamotten_KDW_H);
	};
	if (Npc_HasItems (other, ITAR_Governor) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat velitelský kabátec", DIA_Addon_Eremit_Klamotten_Governor);
	};
	if (Npc_HasItems (other, ITAR_JUDGE) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat soudcovské roucho", DIA_Addon_Eremit_Klamotten_Judge);
	};
	if (Npc_HasItems (other, ITAR_SMITH) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat kováøskou zástìru", DIA_Addon_Eremit_Klamotten_Smith);
	};
	if (Npc_HasItems (other, ITAR_BARKEEPER) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat hostinskou zástìru", DIA_Addon_Eremit_Klamotten_Barkeeper);
	};
	if (Npc_HasItems (other, ITAR_VLK_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat mìšanský odìv I", DIA_Addon_Eremit_Klamotten_VLK_L);
	};
	if (Npc_HasItems (other, ITAR_VLK_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat mìšanský odìv II", DIA_Addon_Eremit_Klamotten_VLK_M);
	};
	if (Npc_HasItems (other, ITAR_VLK_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat mìšanský odìv III", DIA_Addon_Eremit_Klamotten_VLK_H);
	};
	if (Npc_HasItems (other, ITAR_VlkBabe_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat mìšanský šat I", DIA_Addon_Eremit_Klamotten_VlkBabe_L);
	};
	if (Npc_HasItems (other, ITAR_VlkBabe_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat mìšanský šat II", DIA_Addon_Eremit_Klamotten_VlkBabe_M);
	};
	if (Npc_HasItems (other, ITAR_VlkBabe_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat mìšanský šat III", DIA_Addon_Eremit_Klamotten_VlkBabe_H);
	};
	/*
	if (Npc_HasItems (other, ITAR_MIL_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Milizrüstung geben", DIA_Addon_Eremit_Klamotten_MIL_L);
	};
	if (Npc_HasItems (other, ITAR_MIL_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Milizrüstung geben", DIA_Addon_Eremit_Klamotten_MIL_M);
	};
	if (Npc_HasItems (other, ITAR_PAL_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Paladinrüstung geben", DIA_Addon_Eremit_Klamotten_PAL_M);
	};
	if (Npc_HasItems (other, ITAR_PAL_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Paladinrüstung geben", DIA_Addon_Eremit_Klamotten_PAL_H);
	};
	*/
	if (Npc_HasItems (other, ITAR_PAL_SKEL) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat starou paladinskou zbroj", DIA_Addon_Eremit_Klamotten_PAL_SKEL);
	};
	if (Npc_HasItems (other, ITAR_BAU_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat lehký selský odìv", DIA_Addon_Eremit_Klamotten_BAU_L);
	};
	if (Npc_HasItems (other, ITAR_BAU_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat støednì tìžký selský odìv", DIA_Addon_Eremit_Klamotten_BAU_M);
	};
	if (Npc_HasItems (other, ITAR_BauBabe_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat lehký selský šat", DIA_Addon_Eremit_Klamotten_BauBabe_L);
	};
	if (Npc_HasItems (other, ITAR_BauBabe_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat støednì tìžký selský šat", DIA_Addon_Eremit_Klamotten_BauBabe_M);
	};
	/*
	if (Npc_HasItems (other, ITAR_SLD_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Söldnerrüstung geben", DIA_Addon_Eremit_Klamotten_SLD_L);
	};
	if (Npc_HasItems (other, ITAR_SLD_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Söldnerrüstung geben", DIA_Addon_Eremit_Klamotten_SLD_M);
	};
	if (Npc_HasItems (other, ITAR_SLD_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Söldnerrüstung geben", DIA_Addon_Eremit_Klamotten_SLD_H);
	};
	*/
	if (Npc_HasItems (other, ITAR_DJG_Crawler) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat zbroj z dùlního èerva", DIA_Addon_Eremit_Klamotten_DJG_Crawler);
	};
	/*
	if (Npc_HasItems (other, ITAR_DJG_L) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Leichte Drachenjägerrüstung geben", DIA_Addon_Eremit_Klamotten_DJG_L);
	};
	if (Npc_HasItems (other, ITAR_DJG_M) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Drachenjägerrüstung geben", DIA_Addon_Eremit_Klamotten_DJG_M);
	};
	if (Npc_HasItems (other, ITAR_DJG_H) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Drachenjägerrüstung geben", DIA_Addon_Eremit_Klamotten_DJG_H);
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
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat koženou zbroj", DIA_Addon_Eremit_Klamotten_Leather);
	};
	//if (Npc_HasItems (other, ITAR_BDT_M) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Mittlere Banditenrüstung geben", DIA_Addon_Eremit_Klamotten_BDT_M);
	//};
	//if (Npc_HasItems (other, ITAR_BDT_H) > 0)
	//{
	//	Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Schwere Banditenrüstung geben", DIA_Addon_Eremit_Klamotten_BDT_H);
	//};
	if (Npc_HasItems (other, ITAR_XARDAS) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat roucho temných umìní", DIA_Addon_Eremit_Klamotten_Xardas);
	};
	if (Npc_HasItems (other, ITAR_Lester) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat Lesterovo roucho", DIA_Addon_Eremit_Klamotten_Lester);
	};
	if (Npc_HasItems (other, ITAR_Diego) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat Diegovu zbroj", DIA_Addon_Eremit_Klamotten_Diego);
	};
	if (Npc_HasItems (other, ITAR_CorAngar) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat Cor Angarovu zbroj", DIA_Addon_Eremit_Klamotten_CorAngar);
	};
	if (Npc_HasItems (other, ITAR_Prisoner) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat kopáèské kalhoty", DIA_Addon_Eremit_Klamotten_Prisoner);
	};
	if (Npc_HasItems (other, ITAR_Dementor) > 0)
	{
		Info_AddChoice (DIA_Addon_Eremit_Klamotten, "Pøedat roucho pátraèù", DIA_Addon_Eremit_Klamotten_Dementor);
	};
};
// -------------------------------------------------------------
	func void B_Eremit_Tatsache()
	{
		AI_EquipBestArmor (self);
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_20"); //To teda jo!
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_21"); //Ale co teï budu dìlat? Dal jsem všecko zlato pirátùm za to, že mì sem zavezli.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_22"); //Nemùžu ti nabídnout nic víc než pár starých kamenných tabulek. 
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_23"); //Tumáš, vezmi si je. Poohlédnu se po jiných.
		
		B_GiveInvItems (self,other,ItWr_DexStonePlate3_Addon,1);
		B_GiveInvItems (self,other,ItWr_StonePlateCommon_Addon ,1);     
		
		MIS_Eremit_Klamotten = LOG_SUCCESS;
		B_GivePlayerXP (200);
		
		Info_ClearChoices (DIA_Addon_Eremit_Klamotten);
	};
// -------------------------------------------------------------

func void DIA_Addon_Eremit_Klamotten_BACK()
{
	AI_Output (self, other, "DIA_Addon_Eremit_Add_04_24"); //Skvìlý. Napøed mi tu všecko rozhodíš a pak... (povzdechne si)
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
	description = "Tak co? Jak ti jde život poustevníka?";
};
func int DIA_Addon_Eremit_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Eremit_PERM_Info ()
{
	AI_Output (other, self, "DIA_Addon_Eremit_Add_15_04"); //A co? Jak se ti žije jako poustevníkovi?
	
	if (MIS_Eremit_Klamotten == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_09"); //(hrdì) Všecko jsem si udìlal sám. Zbranì, nástroje, chatrè, prostì všecko.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_10"); //Když jsem sem pøišel, nemìl jsem nic než dobrou náladu.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_11"); //Jenže obèas...
		AI_Output (other, self, "DIA_Addon_Eremit_Doppelt_15_01"); //Ano? 
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_12"); //Obèas bych byl rád, kdybych si s sebou byl vzal aspoò nìjaké obleèení.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_13"); //Neumím tkát ani vydìlávat kùže.
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_14"); //A noci v téhle èásti ostrova nejsou zrovna nejteplejší.
		MIS_Eremit_Klamotten = LOG_RUNNING;
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Eremit_Add_04_15"); //Zaøídím to. 
		if (MIS_Eremit_Klamotten == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Addon_Eremit_Add_04_18"); //S obleèením v pohodì pøežiju zimu! A potom... no, potom uvidíme...
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Eremit_Add_04_16"); //Poøád lepší než v Khorinidu!
			AI_Output (self, other, "DIA_Addon_Eremit_Add_04_17"); //Dokonce i bez šatù.
		};
	};
};	
	


