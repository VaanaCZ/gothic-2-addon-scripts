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

	description = "Proprio come ai vecchi tempi.";

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
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_00"); //Proprio come ai vecchi tempi.
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_01"); //L'hai detto. Sono curioso di vedere se ne uscirai vivo questa volta.
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_02"); //Cosa?
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_03"); //Salvarti nuovamente la pelle prima che scoppi l'inferno intorno a te.
	
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

	description	 = 	"Hai qualche pozione da parte?";
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
	AI_Output			(other, self, "DIA_Milten_DI_TRADE_15_00"); //Hai qualche pozione da darmi?
	B_GiveTradeInv (self);
	//Joly: Mc ManaHealth
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItPo_Health_02, Npc_HasItems (self,ItPo_Health_02) );
	CreateInvItems 	(self, ItPo_Health_02,15  );
	
	Npc_RemoveInvItems	(self, ItPo_Mana_02, Npc_HasItems (self,ItPo_Mana_02) );
	CreateInvItems 	(self, ItPo_Mana_02, 15 );
	//////////////////////////////////////////////////////////////////////////////////////
	
	
	
	AI_Output			(self, other, "DIA_Milten_DI_TRADE_03_01"); //Finché durano le scorte.
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

	description = "Cosa puoi consigliarmi?";

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
	AI_Output (other,self ,"DIA_Milten_DI_Rat_15_00"); //Che consigli puoi darmi?
	AI_Output (self ,other,"DIA_Milten_DI_Rat_03_01"); //Mmmh, è un grande onore che, tra tutti, tu chieda proprio a me un consiglio. In tutto questo tempo ho avuto un solo pensiero fisso.
	AI_Output (self, other, "DIA_Milten_DI_Rat_03_02"); //Hai portato l'Occhio di Innos?
	
	Info_ClearChoices	(DIA_Milten_DI_Rat);

	if (SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice	(DIA_Milten_DI_Rat, "No.", DIA_Milten_DI_Rat_nein );
	}
	else
	{
		Info_AddChoice	(DIA_Milten_DI_Rat, "Naturalmente.", DIA_Milten_DI_Rat_ja );
	};
};	

func void DIA_Milten_DI_Rat_nein ()
{
	AI_Output			(other, self, "DIA_Milten_DI_Rat_nein_15_00"); //No.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_01"); //(sdegnato) Sei così... Cosa farai allora se incontrerai dei draghi qui sull'isola?
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_02"); //Non sei diventato più saggio nel frattempo? Abbiamo persino un banco dell'alchimista qui, quindi possiamo ricaricare quella dannata cosa.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_03"); //E tu cosa mi combini? Posso solo sperare che la tua trascuratezza non ci costi la vita.
	Info_ClearChoices	(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja ()
{
	AI_Output			(other, self, "DIA_Milten_DI_Rat_ja_15_00"); //Certo.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_ja_03_01"); //Perdonami, ti ho fatto una domanda proprio stupida. Sono un po' nervoso.
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

	description	 = 	"Ho trovato Pedro.";
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
	AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_00"); //Ho trovato Pedro.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_01"); //(sorpreso) Cosa? Dove? Qui, sull'isola? Dannazione, ma è incredibile.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_02"); //Non avevo idea che fosse un bastardo così resistente.
	B_GivePlayerXP (XP_Ambient);

	if (Npc_IsDead(Pedro_DI))
	{
		AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_03"); //È morto.
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_04"); //Davvero? D'accordo. Pace all'anima sua. Per quanto non possa dire che mi dispiaccia molto, mi sarebbe comunque piaciuto scambiare quattro chiacchiere con lui.
	}
	else
	{
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_05"); //Ho un conto in sospeso con lui, da saldare il prima possibile.
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

	description = "Voglio migliorare le mie abilità magiche.";

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
	AI_Output (other,self ,"DIA_Milten_DI_TeachMagic_15_00"); //Voglio migliorare le mie abilità magiche.
	
	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_01"); //Farò del mio meglio.
	}
	else
	{
		if (DIA_Milten_DI_TeachMagic_OneTime == FALSE)
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_02"); //Ti aiuterò, ma solo a condizione che ti assicuri che gli orchi restino dove sono.
				DIA_Milten_DI_TeachMagic_OneTime = TRUE;
			}
		else
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_03"); //D'accordo, di cosa hai bisogno?
			};
	};
	
	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Creare rune", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 1 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00"); //Possa la mano di Innos guidarti.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Creare rune", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 5 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00"); //Possa la luce di Innos illuminarti.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	
	
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Creare rune", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

FUNC VOID DIA_Milten_DI_TeachMagic_RUNES ()
{
	Info_ClearChoices (DIA_Milten_DI_TeachMagic);
	Info_AddChoice	  (DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	
	AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00"); //Oh, no! Non è davvero la mia specialità, ma ce la caveremo in qualche modo.

	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice	  (DIA_Milten_DI_TeachMagic,"Rune del paladino", DIA_Milten_DI_TeachMagic_Runen_Paladin);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Quarto Circolo", DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Quinto Circolo", DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 6) 
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Sesto Circolo", DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	}
	else
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01"); //Oh, non sei ancora pronto. Prima impara i circoli più alti, poi potrò aiutarti.
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
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Luce", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLight)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	{ 
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Cura", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLightHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Freccia sacra", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalHolyBolt)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt);
	};
	if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Cura superiore", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalMediumHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Danneggia il male", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalRepelEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Cura totale", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalFullHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Distruggi il male", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalDestroyEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil);
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
// Fünfter Kreis 
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

	description	 = 	"Questo libro, l’Almanacco dei Posseduti, ti fa venire in mente qualcosa?";
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
	AI_Output			(other, self, "DIA_Milten_DI_DementorObsessionBook_15_00"); //Questo libro, l'Almanacco dei Posseduti, ti dice qualcosa?
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_01"); //Pyrokar è l'esperto di questo tipo di libri.
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_02"); //Mi spiace, so troppo poco per poter dire qualcosa di utile a riguardo.
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

	description	 = 	"Hai esperienza con le uova di drago?";
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
	AI_Output			(other, self, "DIA_Milten_DI_DragonEgg_15_00"); //Hai esperienza con le uova di drago?
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_01"); //No, direi di no. Ho sentito dire che un abile alchimista una volta riuscì a creare una potente pozione da esse.
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_02"); //Ma non chiedermi la ricetta, ti prego. Non ne ho idea.
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

	description = "Va bene. Basta!";

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
		AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_00"); //D'accordo. Ecco fatto! Il tempio è finalmente stato privato dei suoi poteri.
		
		if (DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_01"); //Come fai a uscirne tutte le volte, mmh?
			AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_02"); //Che io sia dannato se lo so.
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_03"); //(ride) Avremo mai un po' di pace? Di certo ce la meritiamo.
			
			if (hero.guild == GIL_KDF)
				{
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_04"); //Cosa farai ora?
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_05"); //Sto pensando di fondare una mia accademia e predicare la nostra fede. Ma potrei anche cambiare idea.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_06"); //Non ho mai rimpianto di essere diventato un Mago del Fuoco. Cosa ne pensi?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_07"); //Non ne sono così sicuro.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_08"); //(ride) Pungente, come sempre. Ehi, amico, hai appena salvato il mondo. Non è forse una ragione per rallegrarsi?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_09"); //Mmmh, forse.
				};		

			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_10"); //Suvvia, amico mio, penso che la prima cosa che dovresti fare ora sia un bel sonnellino.
			DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
		};
		
		AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_11"); //Dovresti andare subito dal capitano e dirgli di levare l'ancora.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
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


