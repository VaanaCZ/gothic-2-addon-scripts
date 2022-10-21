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

	description = "Wie in alten Zeiten.";

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
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_00"); //Wie in alten Zeiten.
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_01"); //Du sagst es. Ich bin ja mal gespannt, ob es diesmal klappt.
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_02"); //Was?
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_03"); //Dass du deinen Hintern retten kannst, bevor wieder die ganze Höhle über dich hereinbricht!
	
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

	description	 = 	"Hast du ein paar Tränke übrig?";
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
	AI_Output			(other, self, "DIA_Milten_DI_TRADE_15_00"); //Hast du ein paar Tränke übrig?
	B_GiveTradeInv (self);
	//Joly: Mc ManaHealth
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItPo_Health_02, Npc_HasItems (self,ItPo_Health_02) );
	CreateInvItems 	(self, ItPo_Health_02,15  );
	
	Npc_RemoveInvItems	(self, ItPo_Mana_02, Npc_HasItems (self,ItPo_Mana_02) );
	CreateInvItems 	(self, ItPo_Mana_02, 15 );
	//////////////////////////////////////////////////////////////////////////////////////
	
	
	
	AI_Output			(self, other, "DIA_Milten_DI_TRADE_03_01"); //Solange der Vorrat reicht.
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

	description = "Welchen Rat kannst du mir geben?";

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
	AI_Output (other,self ,"DIA_Milten_DI_Rat_15_00"); //Welchen Rat kannst du mir geben?
	AI_Output (self ,other,"DIA_Milten_DI_Rat_03_01"); //Mmh. Es ehrt mich sehr, dass du gerade mich um Rat fragst. Mich beschäftigt schon die ganze Zeit nur eine Sache.
	AI_Output (self, other, "DIA_Milten_DI_Rat_03_02"); //Hast du das Auge Innos' mitgebacht?
	
	Info_ClearChoices	(DIA_Milten_DI_Rat);

	if (SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice	(DIA_Milten_DI_Rat, "Nein.", DIA_Milten_DI_Rat_nein );
	}
	else
	{
		Info_AddChoice	(DIA_Milten_DI_Rat, "Natürlich.", DIA_Milten_DI_Rat_ja );
	};
};	

func void DIA_Milten_DI_Rat_nein ()
{
	AI_Output			(other, self, "DIA_Milten_DI_Rat_nein_15_00"); //Nein.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_01"); //(entrüstet) Du bist doch ... Was wirst du denn tun, wenn dir hier auf der Insel Drachen begegnen?
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_02"); //Hast du denn gar nichts dazu gelernt? Sogar einen Alchemietisch haben wir hier, um das dämliche Ding wieder aufladen zu können.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_03"); //Und was machst du? Ich kann nur hoffen, dass uns deine Schlamperei nicht den Kopf kostet.
	Info_ClearChoices	(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja ()
{
	AI_Output			(other, self, "DIA_Milten_DI_Rat_ja_15_00"); //Natürlich.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_ja_03_01"); //Tut mir leid, dass ich so dumme Fragen stelle. Bin ein bisschen nervös?
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

	description	 = 	"Ich habe Pedro gefunden.";
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
	AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_00"); //Ich habe Pedro gefunden.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_01"); //(überrascht) Was? Wo? Hier auf der Insel? Verdammt, er ist aber auch wirklich unglaublich.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_02"); //Für so einen abgebrühten Mistkerl hätte ich ihn nun wirklich nicht gehalten.
	B_GivePlayerXP (XP_Ambient);

	if (Npc_IsDead(Pedro_DI))
	{
		AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_03"); //Er ist tot.
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_04"); //So? Nun ja. Friede seiner Seele. Obwohl ich nicht sagen kann, dass es mir sonderlich Leid tut, hätte ich ihn trotzdem gerne noch mal zur Rede gestellt.
	}
	else
	{
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_05"); //Ich werde mit ihm bei Zeiten noch ein Hühnchen rupfen.
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

	description = "Ich will meine magischen Fähigkeiten verbessern.";

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
	AI_Output (other,self ,"DIA_Milten_DI_TeachMagic_15_00"); //Ich will meine magischen Fähigkeiten verbessern.
	
	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_01"); //Ich werde mein Bestes geben.
	}
	else
	{
		if (DIA_Milten_DI_TeachMagic_OneTime == FALSE)
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_02"); //Ich helfe dir. Aber nur unter der Bedingung, dass du dafür sorgst, dass die Orks bleiben, wo sie sind.
				DIA_Milten_DI_TeachMagic_OneTime = TRUE;
			}
		else
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_03"); //Ok. Was brauchst du?
			};
	};
	
	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Runen herstellen", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 1 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00"); //Möge Innos' Hand dich leiten.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Runen herstellen", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 5 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00"); //Möge Innos' Licht dich erleuchten.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	
	
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Runen herstellen", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

FUNC VOID DIA_Milten_DI_TeachMagic_RUNES ()
{
	Info_ClearChoices (DIA_Milten_DI_TeachMagic);
	Info_AddChoice	  (DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	
	AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00"); //Oh je! Das ist nun wirklich nicht mein Spezialgebiet, aber wir kriegen das schon hin.

	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice	  (DIA_Milten_DI_TeachMagic,"Paladin-Runen", DIA_Milten_DI_TeachMagic_Runen_Paladin);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Vierter Kreis", DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Fünfter Kreis", DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 6) 
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Sechster Kreis", DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	}
	else
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01"); //Oh. Du bist ja noch gar nicht bereit. Lerne erst die höheren Kreise, dann kann ich dir helfen.
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
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Licht", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLight)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	{ 
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Heilung", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLightHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Heiliger Pfeil", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalHolyBolt)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt);
	};
	if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Grosse Heilung", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalMediumHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Bösem Schaden", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalRepelEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Vollheilung", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalFullHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Böses Vernichten", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalDestroyEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil);
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

	description	 = 	"Sagt dir dieses Buch, Almanach der Besessenen, irgendetwas?";
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
	AI_Output			(other, self, "DIA_Milten_DI_DementorObsessionBook_15_00"); //Sagt dir dieses Buch, Almanach der Besessenen, irgendetwas?
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_01"); //Pyrokar ist der Experte für diese Art von Büchern.
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_02"); //Tut mir Leid. Ich weiß zu wenig, um etwas Intelligentes darüber sagen zu können.
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

	description	 = 	"Hast du Erfahrung mit Dracheneiern?";
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
	AI_Output			(other, self, "DIA_Milten_DI_DragonEgg_15_00"); //Hast du Erfahrung mit Dracheneiern?
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_01"); //Nein, nicht wirklich. Ich habe davon gehört, dass einst ein cleverer Alchemist daraus einen mächtigen Trank brauen konnte.
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_02"); //Aber jetzt frag mich jetzt bitte nicht nach dem Rezept. Ich habe keine Ahnung.
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

	description = "So. Jetzt ist Schluss!";

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
		AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_00"); //So. Jetzt ist Schluss! Der Tempel ist entmachtet.
		
		if (DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_01"); //Wie schaffst du das eigentlich immer, hm?
			AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_02"); //Das weiß ich auch nicht.
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_03"); //(lacht) Werden jemals zur Ruhe kommen? Verdient hätten wir es jedenfalls.
			
			if (hero.guild == GIL_KDF)
				{
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_04"); //Was wirst du nun tun?
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_05"); //Ich denke darüber nach, eine eigene Akademie zu gründen und unseren Glauben weiter zu verkünden. Aber es kann auch anders kommen.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_06"); //Ich habe es nie bereut, ein Magier des Feuers geworden zu sein. Wie siehst du das?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_07"); //Bin mir nicht sicher.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_08"); //(lacht) Trocken, wie immer. Hey, Mann. Du hast gerade die Welt gerettet. Ist das kein Grund, sich zu freuen?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_09"); //Mmh.
				};		

			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_10"); //Na komm, mein Freund, ich glaube, du brauchst jetzt erst einmal 'ne Mütze Schlaf.
			DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
		};
		
		AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_11"); //Geh am besten gleich zum Kapitän und lass uns ablegen.

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


