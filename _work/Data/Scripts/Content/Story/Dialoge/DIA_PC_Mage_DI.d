// ************************************************************
// 	  				   EXIT 
// ************************************************************

INSTANCE DIA_Milten_DI_EXIT(C_INFO)
{
	npc			= PC_Mage_DI;
	nr			= 999;
	condition	= DIA_Milten_DI_EXIT_Condition;
	information	= DIA_Milten_DI_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};      
                 
FUNC INT DIA_Milten_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Milten_DI_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*************************************************************
//Hello!
//*************************************************************

INSTANCE DIA_Milten_DI_Hello(C_INFO)
{
	npc			= PC_Mage_DI;
	nr			= 3;
	condition	= DIA_Milten_DI_Hello_Condition;
	information	= DIA_Milten_DI_Hello_Info;

	description = "Jako za star˝ch Ëas˘.";

};                       

FUNC INT DIA_Milten_DI_Hello_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Milten_DI_Hello_Info()
{	
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_00"); //Jako za star˝ch Ëas˘.
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_01"); //Jak ¯Ìk·ö. Jsem zvÏdav˝, jestli se ti to tentokr·t poda¯Ì.
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_02"); //Co?
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_03"); //Zachr·nit si zadek d¯Ìv, neû zase propukne peklo.
	
};	
 
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Milten_DI_TRADE		(C_INFO)
{
	npc		 = 	PC_Mage_DI;
	nr          = 12;
	condition	 = 	DIA_Milten_DI_TRADE_Condition;
	information	 = 	DIA_Milten_DI_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

	description	 = 	"Nem˘ûeö postr·dat p·r lektvar˘?";
};

func int DIA_Milten_DI_TRADE_Condition ()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Milten_DI_Hello))
		{
				return TRUE;
		};
};

func void DIA_Milten_DI_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Milten_DI_TRADE_15_00"); //Nem˘ûeö postr·dat p·r lektvar˘?
	B_GiveTradeInv (self);
	//Joly: Mc ManaHealth
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItPo_Health_02, Npc_HasItems (self,ItPo_Health_02) );
	CreateInvItems 	(self, ItPo_Health_02,15  );
	
	Npc_RemoveInvItems	(self, ItPo_Mana_02, Npc_HasItems (self,ItPo_Mana_02) );
	CreateInvItems 	(self, ItPo_Mana_02, 15 );
	//////////////////////////////////////////////////////////////////////////////////////
	
	
	
	AI_Output			(self, other, "DIA_Milten_DI_TRADE_03_01"); //Ber, dokud jsou.
};
//*************************************************************
//Rat!
//*************************************************************

INSTANCE DIA_Milten_DI_Rat(C_INFO)
{
	npc			= PC_Mage_DI;
	nr			= 3;
	condition	= DIA_Milten_DI_Rat_Condition;
	information	= DIA_Milten_DI_Rat_Info;

	description = "Co mi m˘ûeö d·t za radu?";

};                       
FUNC INT DIA_Milten_DI_Rat_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Milten_DI_Hello))
	&& (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Milten_DI_Rat_Info()
{	
	AI_Output (other,self ,"DIA_Milten_DI_Rat_15_00"); //Co mi m˘ûeö d·t za radu?
	AI_Output (self ,other,"DIA_Milten_DI_Rat_03_01"); //Hmm. Je to velk· Ëest, ûe ze vöech lidÌ se pt·ö na radu pr·vÏ mÏ. Celou dobu myslÌm na jedinou vÏc.
	AI_Output (self, other, "DIA_Milten_DI_Rat_03_02"); //P¯inesl jsi Innosovo oko?
	
	Info_ClearChoices	(DIA_Milten_DI_Rat);

	if (SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice	(DIA_Milten_DI_Rat, "Ne.", DIA_Milten_DI_Rat_nein );
	}
	else
	{
		Info_AddChoice	(DIA_Milten_DI_Rat, "Samoz¯ejmÏ.", DIA_Milten_DI_Rat_ja );
	};
};	

func void DIA_Milten_DI_Rat_nein ()
{
	AI_Output			(other, self, "DIA_Milten_DI_Rat_nein_15_00"); //Ne.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_01"); //(pobou¯enÏ) Ty jsi tak... Co udÏl·ö, kdyû tady na ostrovÏ narazÌö na draky?
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_02"); //Copak jsi jeötÏ nedostal rozum? M·me tady dokonce alchymistickou kolonu, abychom tu pitomou vÏc mohli zase nabÌt.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_03"); //Co to ksakru dÏl·ö? Douf·m, ûe n·s tvoje nedbalost nebude st·t krk.
	Info_ClearChoices	(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja ()
{
	AI_Output			(other, self, "DIA_Milten_DI_Rat_ja_15_00"); //Samoz¯ejmÏ.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_ja_03_01"); //PromiÚ, ûe se tak hloupÏ pt·m. Jsem trochu nervÛznÌ.
 	B_GivePlayerXP (XP_Ambient);
 	Info_ClearChoices	(DIA_Milten_DI_Rat);

};

///////////////////////////////////////////////////////////////////////
//	Info PEDROTOT
///////////////////////////////////////////////////////////////////////
instance DIA_Milten_DI_PEDROTOT		(C_INFO)
{
	npc			 = 	PC_Mage_DI;
	nr          = 	3;	
	condition	 = 	DIA_Milten_DI_PEDROTOT_Condition;
	information	 = 	DIA_Milten_DI_PEDROTOT_Info;

	description	 = 	"Naöel jsem Pedra.";
};

func int DIA_Milten_DI_PEDROTOT_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
		{
				return TRUE;
		};
};

func void DIA_Milten_DI_PEDROTOT_Info ()
{
	AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_00"); //Naöel jsem Pedra.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_01"); //(p¯ekvapenÏ) Coûe? Kde? Tady na ostrovÏ? Sakra, to je naprosto k neuvÏ¯enÌ.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_02"); //V·ûnÏ jsem netuöil, ûe to je tak tvrd˝ parchant.
	B_GivePlayerXP (XP_Ambient);

	if (Npc_IsDead(Pedro_DI))
	{
		AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_03"); //Je mrtv˝.
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_04"); //V·ûnÏ? Dobr·. Pokoj jeho duöi. Nem˘ûu sice ¯Ìct, ûe by mi ho bylo nÏjak lÌto, ale stejnÏ bych s nÌm r·d prohodil slovo.
	}
	else
	{
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_05"); //P¯ed ned·vnem jsme se trochu chytili.
	};
};

//*************************************************************
//TeachMagic!
//*************************************************************

INSTANCE DIA_Milten_DI_TeachMagic(C_INFO)
{
	npc			= PC_Mage_DI;
	nr			= 31;
	condition	= DIA_Milten_DI_TeachMagic_Condition;
	information	= DIA_Milten_DI_TeachMagic_Info;
	permanent	 = 	TRUE;

	description = "R·d bych si vylepöil svÈ magickÈ schopnosti.";

};                       
FUNC INT DIA_Milten_DI_TeachMagic_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};

var int DIA_Milten_DI_TeachMagic_OneTime;
FUNC VOID DIA_Milten_DI_TeachMagic_Info()
{	
	AI_Output (other,self ,"DIA_Milten_DI_TeachMagic_15_00"); //R·d bych si vylepöil svÈ magickÈ schopnosti.
	
	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_01"); //UvidÌm, co bude v m˝ch sil·ch.
	}
	else
	{
		if (DIA_Milten_DI_TeachMagic_OneTime == FALSE)
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_02"); //Pom˘ûu ti, ale jen pod podmÌnkou, ûe se postar·ö, aby sk¯eti z˘stali tam, kde jsou.
				DIA_Milten_DI_TeachMagic_OneTime = TRUE;
			}
		else
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_03"); //Dobr·. Co pot¯ebujeö?
			};
	};
	
	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Tvorba run", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 1 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00"); //Nechù tvÈ kroky vede ruka Innosova.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Tvorba run", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 5 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00"); //Nechù ti na cestu svÌtÌ svÏtlo Innosovo.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	
	
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Tvorba run", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

FUNC VOID DIA_Milten_DI_TeachMagic_RUNES ()
{
	Info_ClearChoices (DIA_Milten_DI_TeachMagic);
	Info_AddChoice	  (DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	
	AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00"); //Ale ne! To v·ûnÏ nenÌ m˘j obor, ale nÏjak to holt zvl·dneme.

	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice	  (DIA_Milten_DI_TeachMagic,"PaladinskÈ runy", DIA_Milten_DI_TeachMagic_Runen_Paladin);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Ëtvrt˝ kruh", DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," p·t˝ kruh", DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 6) 
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," öest˝ kruh", DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	}
	else
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01"); //Aha. JeötÏ po¯·d nejsi ˙plnÏ p¯ipraven. Nejd¯Ìv se nauË vyööÌ kruhy, pak ti budu schopen pomoci.
	};
};

//***************************************************************************
// Talente Runen
//----------------------
// Paladin Runen
//----------------------
//***************************************************************************

FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Paladin ()
{
	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_PalLight] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("SvÏtlo", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLight)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	{ 
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("LÈËenÌ", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLightHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Svat˝ öÌp", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalHolyBolt)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt);
	};
	if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("SilnÈ lÈËenÌ", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalMediumHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Zaûehn·nÌ zla", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalRepelEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("VylÈËenÌ", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalFullHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("ZniËenÌ zla", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalDestroyEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil);
	};
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalLight);  
	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalLightHeal);  
	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalHolyBolt);  
	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalMediumHeal);  

};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalRepelEvil);  
	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalFullHeal);  
	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalDestroyEvil);  
	
};

//**********************************************************
// Vierter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_4()
{
	Info_ClearChoices (DIA_Milten_DI_TeachMagic);
	Info_AddChoice	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	
	
	if (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_SummonGolem);
	};
	if (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE) 
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_DestroyUndead, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_DestroyUndead)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_DestroyUndead);
	};
	if (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE) 
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_LightningFlash, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightningFlash)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_LightningFlash);
	};
	if (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_ChargeFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeFireball)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball);
	};
	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball);		
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);		
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes (self, other, SPL_DestroyUndead);		
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightningFlash);		
};
//**********************************************************
// F¸nfter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_5()
{
	Info_ClearChoices (DIA_Milten_DI_TeachMagic);
	Info_AddChoice	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	
	
	if (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_IceWave, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceWave)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_IceWave);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_SummonDemon);
	};
	if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_FullHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_FullHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_Pyrokinesis, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Pyrokinesis)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis);	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceWave);	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_FullHeal);	
};
//**********************************************************
// Sechster Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_6()
{
	Info_ClearChoices (DIA_Milten_DI_TeachMagic);
	Info_AddChoice	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);

	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_MassDeath);
	};
	if (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Shrink);
	};
};

FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
FUNC VOID DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};

FUNC VOID DIA_Milten_DI_TeachMagic_BACK()
{
	Info_ClearChoices	(DIA_Milten_DI_TeachMagic);
};

///////////////////////////////////////////////////////////////////////
//	Info DementorObsessionBook
///////////////////////////////////////////////////////////////////////
instance DIA_Milten_DI_DementorObsessionBook		(C_INFO)
{
	npc			 = 	PC_Mage_DI;
	nr          = 	99;	
	condition	 = 	DIA_Milten_DI_DementorObsessionBook_Condition;
	information	 = 	DIA_Milten_DI_DementorObsessionBook_Info;

	description	 = 	"Tahle kniha, Almanach posedl˝ch, ne¯Ìk· ti to nic?";
};

func int DIA_Milten_DI_DementorObsessionBook_Condition ()
{	
	if  (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))
		{
				return TRUE;
		};
};

func void DIA_Milten_DI_DementorObsessionBook_Info ()
{
	AI_Output			(other, self, "DIA_Milten_DI_DementorObsessionBook_15_00"); //Tahle kniha, Almanach posedl˝ch, ne¯Ìk· ti to nic?
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_01"); //Na tenhle druh knih je odbornÌk Pyrokar.
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_02"); //Omlouv·m se. VÌm toho p¯Ìliö m·lo na to, abych o nÏËem takovÈm ¯ekl cokoliv smysluplnÈho.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DragonEgg
///////////////////////////////////////////////////////////////////////
instance DIA_Milten_DI_DragonEgg		(C_INFO)
{
	npc			 = 	PC_Mage_DI;
	nr          = 	99;	
	condition	 = 	DIA_Milten_DI_DragonEgg_Condition;
	information	 = 	DIA_Milten_DI_DragonEgg_Info;

	description	 = 	"M·ö zkuöenosti s draËÌmi vejci?";
};

func int DIA_Milten_DI_DragonEgg_Condition ()
{	
	if  (Npc_HasItems (other,ItAt_DragonEgg_MIS))
		{
				return TRUE;
		};
};

func void DIA_Milten_DI_DragonEgg_Info ()
{
	AI_Output			(other, self, "DIA_Milten_DI_DragonEgg_15_00"); //M·ö zkuöenosti s draËÌmi vejci?
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_01"); //Ne, moc ne. Ale slyöel jsem, ûe jeden chytr˝ alchymista z nich pr˝ dok·zal va¯it mocnÈ lektvary.
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_02"); //Recept po mnÏ vöak nechtÏj. NetuöÌm, jak to dÏlal.
	B_GivePlayerXP (XP_Ambient);
};

//*************************************************************
//	UndeadDragonDead
//*************************************************************

INSTANCE DIA_Milten_DI_UndeadDragonDead (C_INFO)
{
	npc			= PC_Mage_DI;
	nr			= 31;
	condition	= DIA_Milten_DI_UndeadDragonDead_Condition;
	information	= DIA_Milten_DI_UndeadDragonDead_Info;
	permanent	= TRUE;

	description = "Tak, a je to!";

};
                       
FUNC INT DIA_Milten_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Milten_DI_UndeadDragonDead_OneTime;
FUNC VOID DIA_Milten_DI_UndeadDragonDead_Info()
{	
		AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_00"); //Tak, a je to! Chr·m je teÔ zbaven˝ svÈ sÌly.
		
		if (DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_01"); //Jak ty to vûdycky dÏl·ö?
			AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_02"); //Aù se propadnu, jestli to vÌm.
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_03"); //(se smÌchem) DoËk·me se v˘bec nÏkdy klidu? UrËitÏ bychom si to zaslouûili.
			
			if (hero.guild == GIL_KDF)
				{
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_04"); //Co m·ö v pl·nu teÔ?
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_05"); //R·d bych si zaloûil vlastnÌ akademii a k·zal naöi vÌru. Ale moûn· to dopadne trochu jinak.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_06"); //Nikdy jsem nelitoval, ûe jsem se stal ohniv˝m m·gem. Jak to vidÌö ty?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_07"); //J· si nejsem tak ˙plnÏ jist.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_08"); //(se smÌchem) Suchar, jako obvykle. Hej, chlape. Pr·vÏ jsi zachr·nil svÏt. Copak to nenÌ d˘vod k oslav·m?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_09"); //Hmm. Moûn·.
				};		

			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_10"); //Ale no tak, kamar·de. MyslÌm, ûe pr·vÏ pot¯ebujeme po¯·dn˝ho pan·ka.
			DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
		};
		
		AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_11"); //MÏl bys jÌt rovnou za kapit·nem a ¯Ìct mu, aù zvedne kotvy.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"ZaËÌt");
};	

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mage_DI_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_DI;
	nr			= 900;
	condition	= DIA_Mage_DI_PICKPOCKET_Condition;
	information	= DIA_Mage_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Mage_DI_PICKPOCKET_Condition()
{
	C_Beklauen (45, 120);
};
 
FUNC VOID DIA_Mage_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mage_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Mage_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Mage_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mage_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mage_DI_PICKPOCKET_DoIt);
};

func void DIA_Mage_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mage_DI_PICKPOCKET);
};
	
func void DIA_Mage_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mage_DI_PICKPOCKET);
};


