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

	description = "Comme au bon vieux temps.";

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
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_00"); //C’est comme au bon vieux temps.
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_01"); //Comme vous dites. Mais cette fois-ci, je me demande si vous y arriverez...
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_02"); //A quoi ?
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_03"); //A sauver votre peau avant que tout se déchaîne autour de vous.
	
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

	description	 = 	"Avez-vous quelques potions dont vous pourriez vous séparer ?";
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
	AI_Output			(other, self, "DIA_Milten_DI_TRADE_15_00"); //Vous n’auriez pas quelques potions de trop ?
	B_GiveTradeInv (self);
	//Joly: Mc ManaHealth
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItPo_Health_02, Npc_HasItems (self,ItPo_Health_02) );
	CreateInvItems 	(self, ItPo_Health_02,15  );
	
	Npc_RemoveInvItems	(self, ItPo_Mana_02, Npc_HasItems (self,ItPo_Mana_02) );
	CreateInvItems 	(self, ItPo_Mana_02, 15 );
	//////////////////////////////////////////////////////////////////////////////////////
	
	
	
	AI_Output			(self, other, "DIA_Milten_DI_TRADE_03_01"); //Tant qu’il me reste des provisions...
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

	description = "Quel conseil pouvez-vous me donner ?";

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
	AI_Output (other,self ,"DIA_Milten_DI_Rat_15_00"); //Auriez-vous des conseils à me donner ?
	AI_Output (self ,other,"DIA_Milten_DI_Rat_03_01"); //Hmm... c’est un grand honneur que vous me faites en vous tournant vers moi pour recevoir des conseils. Mais cela fait un bon moment que je ne pense qu’à une seule et unique chose...
	AI_Output (self, other, "DIA_Milten_DI_Rat_03_02"); //Avez-vous l’Œil d’Innos avec vous ?
	
	Info_ClearChoices	(DIA_Milten_DI_Rat);

	if (SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice	(DIA_Milten_DI_Rat, "Non.", DIA_Milten_DI_Rat_nein );
	}
	else
	{
		Info_AddChoice	(DIA_Milten_DI_Rat, "Naturellement.", DIA_Milten_DI_Rat_ja );
	};
};	

func void DIA_Milten_DI_Rat_nein ()
{
	AI_Output			(other, self, "DIA_Milten_DI_Rat_nein_15_00"); //Non.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_01"); //(indigné) Vous êtes si... que ferez-vous si vous rencontrez des dragons sur l’île ?
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_02"); //N’avez-vous pas encore compris depuis le temps ? Nous avons même un établi d’alchimiste qui nous permettrait de le recharger...
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_03"); //Et qu’est-ce que vous fabriquez ? J’espère que votre fainéantise ne nous condamnera pas tous !
	Info_ClearChoices	(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja ()
{
	AI_Output			(other, self, "DIA_Milten_DI_Rat_ja_15_00"); //Bien sûr.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_ja_03_01"); //Pardon, je vous pose des questions idiotes. C’est que je suis un peu nerveux.
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

	description	 = 	"J'ai trouvé Pedro.";
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
	AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_00"); //J’ai retrouvé Pedro.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_01"); //(surpris) Quoi ? Où ? Ici sur l’île ? Bon sang, ce sale type est absolument incroyable.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_02"); //Je ne l’aurais jamais cru capable de survivre.
	B_GivePlayerXP (XP_Ambient);

	if (Npc_IsDead(Pedro_DI))
	{
		AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_03"); //Il est mort.
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_04"); //Oh. Bah, paix à son âme. Je mentirais si je vous disais que je le regrette, mais j’aurais bien aimé lui dire deux mots avant.
	}
	else
	{
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_05"); //J’ai un compte à régler avec lui, et le plus tôt sera le mieux.
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

	description = "Je veux améliorer mes compétences magiques.";

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
	AI_Output (other,self ,"DIA_Milten_DI_TeachMagic_15_00"); //Je souhaiterais augmenter mes capacités magiques.
	
	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_01"); //Je vais faire de mon mieux.
	}
	else
	{
		if (DIA_Milten_DI_TeachMagic_OneTime == FALSE)
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_02"); //D’accord pour vous aider, mais seulement à la condition que vous fassiez en sorte que les orques restent où ils sont.
				DIA_Milten_DI_TeachMagic_OneTime = TRUE;
			}
		else
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_03"); //D’accord. De quoi avez-vous besoin ?
			};
	};
	
	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Créer des runes.", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 1 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00"); //Puisse la main d’Innos vous guider.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Créer des runes.", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 5 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00"); //Puisse la lumière d’Innos éclairer votre voie.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	
	
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Créer des runes.", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

FUNC VOID DIA_Milten_DI_TeachMagic_RUNES ()
{
	Info_ClearChoices (DIA_Milten_DI_TeachMagic);
	Info_AddChoice	  (DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	
	AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00"); //Oh, non ! Ce n’est vraiment pas ma spécialité, mais nous devrions pouvoir nous débrouiller.

	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice	  (DIA_Milten_DI_TeachMagic,"Runes des paladins", DIA_Milten_DI_TeachMagic_Runen_Paladin);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Quatrième Cercle", DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Cinquième Cercle", DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 6) 
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic," Sixième Cercle", DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	}
	else
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01"); //Oh. Vous n’êtes pas encore tout à fait prêt. Commencez par apprendre les cercles supérieurs, et après je pourrai vous aider.
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
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Lumière", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLight)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	{ 
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Soin", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLightHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Flèche sainte", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalHolyBolt)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt);
	};
	if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Soin majeur", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalMediumHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Blessure du mal", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalRepelEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Guérison totale", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalFullHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Destruction du mal", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalDestroyEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil);
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

	description	 = 	"Est-ce que le livre l'Almanach des Possédés vous dit quelque chose ?";
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
	AI_Output			(other, self, "DIA_Milten_DI_DementorObsessionBook_15_00"); //Est-ce que ce livre, l'Almanach des Possédés, vous rappelle quelque chose ?
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_01"); //C’est Pyrokar, l’expert de ce type d’ouvrage.
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_02"); //Je regrette, mais j’en sais trop peu pour vous dire quoi que ce soit d’utile à ce sujet.
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

	description	 = 	"Avez-vous une quelconque expérience avec les œufs de dragon ?";
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
	AI_Output			(other, self, "DIA_Milten_DI_DragonEgg_15_00"); //Vous y connaissez-vous en œufs de dragon ?
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_01"); //Pas vraiment, non, même si j’ai entendu dire qu’un alchimiste particulièrement doué avait réussi à s’en servir d’ingrédient pour préparer une puissante potion.
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_02"); //Mais ne me demandez surtout pas la recette, je n’ai pas la moindre idée de ce qu’elle peut bien être.
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

	description = "Très bien. C'est ça !";

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
		AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_00"); //Ça y est, le temple a perdu tout son pouvoir !
		
		if (DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_01"); //Comment faites-vous pour toujours y arriver, hein ?
			AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_02"); //Je n’en ai pas la moindre idée.
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_03"); //(rires) Connaîtrons-nous jamais la paix ? Nous l'avons pourtant méritée.
			
			if (hero.guild == GIL_KDF)
				{
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_04"); //Qu'allez-vous faire à présent ?
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_05"); //Je pense fonder ma propre académie et prêcher notre foi. Mais ça pourrait tourner autrement.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_06"); //Je n'ai jamais regretté d'être devenu un Magicien du feu. Qu'en penses-tu ?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_07"); //Je ne sais pas trop.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_08"); //(rires) Ça me donne soif, comme toujours. Hé, sauver le monde, ça se fête non ?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_09"); //Hmm... Peut-être.
				};		

			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_10"); //Allez l'ami, ce qu'il vous faut maintenant c'est un bon somme.
			DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
		};
		
		AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_11"); //Vous devriez allez voir le capitaine et lui dire de lever l'ancre.

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


