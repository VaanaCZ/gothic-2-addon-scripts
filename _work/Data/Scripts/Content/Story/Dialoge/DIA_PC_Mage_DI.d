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

	description = "Como en los viejos tiempos.";

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
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_00"); //Como en los viejos tiempos.
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_01"); //T� lo has dicho. Tengo curiosidad por ver si esta vez lo logras.
		AI_Output (other,self ,"DIA_Milten_DI_Hello_15_02"); //�Qu�?
		AI_Output (self ,other,"DIA_Milten_DI_Hello_03_03"); //Salvar el pellejo antes de que se vuelva a armar la gorda a tu alrededor.
	
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

	description	 = 	"�Puedes darme alguna poci�n?";
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
	AI_Output			(other, self, "DIA_Milten_DI_TRADE_15_00"); //�Puedes darme alguna poci�n?
	B_GiveTradeInv (self);
	//Joly: Mc ManaHealth
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItPo_Health_02, Npc_HasItems (self,ItPo_Health_02) );
	CreateInvItems 	(self, ItPo_Health_02,15  );
	
	Npc_RemoveInvItems	(self, ItPo_Mana_02, Npc_HasItems (self,ItPo_Mana_02) );
	CreateInvItems 	(self, ItPo_Mana_02, 15 );
	//////////////////////////////////////////////////////////////////////////////////////
	
	
	
	AI_Output			(self, other, "DIA_Milten_DI_TRADE_03_01"); //S�, mientras me queden existencias.
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

	description = "�Qu� consejo puedes darme?";

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
	AI_Output (other,self ,"DIA_Milten_DI_Rat_15_00"); //�Qu� consejo puedes darme?
	AI_Output (self ,other,"DIA_Milten_DI_Rat_03_01"); //Um. Es un gran honor que de entre todos me hayas elegido a m� para que te aconseje. Hay una sola cosa que no se me ha quitado de la cabeza en todo momento.
	AI_Output (self, other, "DIA_Milten_DI_Rat_03_02"); //�Has tra�do el Ojo de Innos?
	
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
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_01"); //(Indignado) Eres un... �Qu� vas a hacer si te topas con dragones aqu�, en la isla?
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_02"); //�Todav�a no te enteras? Hasta tenemos una mesa de trabajo de alquimista para recargar ese cacharro est�pido.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_nein_03_03"); //�Y qu� haces? Espero que tu dejadez no nos cueste la cabeza.
	Info_ClearChoices	(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja ()
{
	AI_Output			(other, self, "DIA_Milten_DI_Rat_ja_15_00"); //Naturalmente.
	AI_Output			(self, other, "DIA_Milten_DI_Rat_ja_03_01"); //Lo siento. Estoy haciendo preguntas est�pidas. Estoy algo nervioso.
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

	description	 = 	"He encontrado a Pedro.";
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
	AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_00"); //He encontrado a Pedro.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_01"); //(Sorprendido) �Qu�? �D�nde? �Aqu� en la isla? Maldita sea, es absolutamente incre�ble.
	AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_02"); //No ten�a ni idea de que fuera tan duro.
	B_GivePlayerXP (XP_Ambient);

	if (Npc_IsDead(Pedro_DI))
	{
		AI_Output			(other, self, "DIA_Milten_DI_PEDROTOT_15_03"); //Est� muerto.
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_04"); //�Ah, s�? De acuerdo. Descanse en paz. Aunque no puedo decir que lo sienta demasiado, me habr�a gustado charlar con �l.
	}
	else
	{
		AI_Output			(self, other, "DIA_Milten_DI_PEDROTOT_03_05"); //Dentro de poco tendr� que ajustar cuentas con �l.
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

	description = "Quiero mejorar mis habilidades m�gicas.";

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
	AI_Output (other,self ,"DIA_Milten_DI_TeachMagic_15_00"); //Quiero mejorar mis habilidades m�gicas.
	
	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_01"); //Har� todo lo posible.
	}
	else
	{
		if (DIA_Milten_DI_TeachMagic_OneTime == FALSE)
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_02"); //Te ayudar�, pero con la condici�n de que te asegures de que los orcos se quedan donde est�n.
				DIA_Milten_DI_TeachMagic_OneTime = TRUE;
			}
		else
			{
				AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_03_03"); //De acuerdo. �Qu� es lo que necesitas?
			};
	};
	
	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Crear runas", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 1 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00"); //Que la mano de Innos te gu�e.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	

	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Crear runas", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

// ------ 5 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if (B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH))
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00"); //Que la luz de Innos te ilumine.
	};

	Info_ClearChoices 	(DIA_Milten_DI_TeachMagic);
	Info_AddChoice 	  	(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice		(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Milten_DI_TeachMagic_MANA_5);
	
	
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	  	(DIA_Milten_DI_TeachMagic, 	"Crear runas", DIA_Milten_DI_TeachMagic_RUNES);
	};	
};

FUNC VOID DIA_Milten_DI_TeachMagic_RUNES ()
{
	Info_ClearChoices (DIA_Milten_DI_TeachMagic);
	Info_AddChoice	  (DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	
	AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00"); //�Oh, no! No es mi especialidad, pero nos las apa�aremos.

	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice	  (DIA_Milten_DI_TeachMagic,"Runas de palad�n", DIA_Milten_DI_TeachMagic_Runen_Paladin);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic,"Cuarto c�rculo", DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic,"Quinto c�rculo", DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 6) 
	{
		Info_AddChoice 	  (DIA_Milten_DI_TeachMagic,"Sexto c�rculo", DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	}
	else
	{
		AI_Output (self ,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01"); //Oh. Todav�a no est�s preparado. Aprende antes los c�rculos superiores, y luego te ayudar�.
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
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Luz", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLight)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	{ 
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Curaci�n", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLightHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Flecha sagrada", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalHolyBolt)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt);
	};
	if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Curaci�n grande", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalMediumHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Da�ar al mal", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalRepelEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Curaci�n total", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalFullHeal)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice	(DIA_Milten_DI_TeachMagic, B_BuildLearnString ("Destruir el mal", B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalDestroyEvil)) ,DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil);
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
// F�nfter Kreis 
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

	description	 = 	"�Te dice algo este libro, el Alman�que de los pose�dos?";
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
	AI_Output			(other, self, "DIA_Milten_DI_DementorObsessionBook_15_00"); //�Te dice algo este libro, el Almanaque de los Pose�dos?
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_01"); //Pyrokar es el experto en este tipo de libros.
	AI_Output			(self, other, "DIA_Milten_DI_DementorObsessionBook_03_02"); //Lo siento. No s� lo bastante como para decir nada inteligente al respecto.
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

	description	 = 	"�Tienes experiencia con huevos de drag�n?";
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
	AI_Output			(other, self, "DIA_Milten_DI_DragonEgg_15_00"); //�Tienes experiencia con huevos de drag�n?
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_01"); //No, la verdad es que no. He o�do que un alquimista inteligente consigui� en cierta ocasi�n elaborar una poci�n potente con ellos.
	AI_Output			(self, other, "DIA_Milten_DI_DragonEgg_03_02"); //No me pidas la f�rmula. No tengo ni idea.
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

	description = "Muy bien. �Se acab�!";

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
		AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_00"); //De acuerdo. �Se acab�! El templo se ha quedado sin su poder.
		
		if (DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_01"); //�C�mo es que siempre lo consigues, eh?
			AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_02"); //Que me aspen si lo s�.
			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_03"); //(Se r�e) �Vamos a estar tranquilos en alg�n momento? Desde luego, nos lo hemos merecido.
			
			if (hero.guild == GIL_KDF)
				{
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_04"); //�Ahora qu� vas a hacer?
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_05"); //Me estoy pensando fundar una academia y predicar nuestra fe. Pero podr�a hacer alguna otra cosa.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_06"); //Nunca me he arrepentido de convertirme en mago de fuego. �C�mo te sientes?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_07"); //No estoy seguro.
					AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_08"); //(Se r�e) Seco, como siempre. Eh, t�o. Acabas de salvar el mundo. �No es motivo para alegrarse?
					AI_Output (other,self ,"DIA_Milten_DI_UndeadDragonDead_15_09"); //Um. Tal vez.
				};		

			AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_10"); //Vamos, amigo m�o, creo que necesitas echar una cabezadita.
			DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
		};
		
		AI_Output (self ,other,"DIA_Milten_DI_UndeadDragonDead_03_11"); //Deber�as ir a ver al capit�n y decirle que leve anclas.

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


