
// ****************************************************
// POTIONALCHEMY_S1
// --------------
// Funktion wird durch Labortisch-Mobsi-Benutzung aufgerufen!
// benötigtes Item dafür: ItMi_Flask
// *****************************************************
FUNC VOID POTIONALCHEMY_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_POTIONALCHEMY;
		Ai_ProcessInfos (her);
	};
}; 

//*******************************************************
//	PotionAlchemy Dialog abbrechen
//*******************************************************
INSTANCE PC_PotionAlchemy_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_PotionAlchemy_End_Condition;
	information		= PC_PotionAlchemy_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_PotionAlchemy_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (BoozeStart == FALSE)
	&& (TabakStart == FALSE)
	&& (HealthStart == FALSE)
	&& (ManaStart == FALSE)
	&& (SpecialStart == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PotionAlchemy_End_Info()
{
	CreateInvItems (self, ItMi_Flask,1);
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
//Tränke herstellen  Dialoge 
//--------
//********************************************************



//*******************************************************
//Schnaps brennen 
//*******************************************************
var int BoozeStart;
//----------------------
INSTANCE PC_Booze_Start (C_Info)
{
	npc				= PC_Hero;
	nr				= 10;
	condition		= PC_Booze_Start_Condition;
	information		= PC_Booze_Start_Info;
	permanent		= TRUE;
	description		= "Schnaps brennen"; 
};

FUNC INT PC_Booze_Start_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (BoozeStart == FALSE)
	&& (TabakStart == FALSE)
	&& (HealthStart == FALSE)
	&& (ManaStart == FALSE)
	&& (SpecialStart == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Booze_Start_Info()
{
	BoozeStart = TRUE;
};
//*******************************************************
INSTANCE PC_Booze_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_Booze_Stop_Condition;
	information		= PC_Booze_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_Booze_Stop_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (BoozeStart == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Booze_Stop_Info()
{
	BoozeStart = FALSE;
};
//*******************************************************
INSTANCE PC_Booze_Lou (C_Info)
{
	npc				= PC_Hero;
	nr				= 5;
	condition		= PC_Booze_Lou_Condition;
	information		= PC_Booze_Lou_Info;
	permanent		= TRUE;
	description		= "Lou's Hammer versuchen..."; 
};

FUNC INT PC_Booze_Lou_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (BoozeStart == TRUE)
	&& (Knows_LousHammer == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Booze_Lou_Info()
{
	if (Npc_HasItems (self, ItPl_SwampHerb) >= 1)
	&& (Npc_HasItems (self, ItPl_Beet)		>= 2)
	&& (Npc_HasItems (self, ItAt_SharkTeeth)>= 1)
	&& (Npc_HasItems (self, ItFo_Addon_Rum) >= 1)
	{
		Npc_RemoveInvItems (self, ItPl_SwampHerb,1);
		Npc_RemoveInvItems (self, ItPl_Beet,2);
		Npc_RemoveInvItems (self, ItAt_SharkTeeth,1);
		Npc_RemoveInvItems (self, ItFo_Addon_Rum,1);
		
		Print (PRINT_AlchemySuccess);
		CreateInvItems (self, ItFo_Addon_LousHammer,1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
INSTANCE PC_Booze_Schlaf (C_Info)
{
	npc				= PC_Hero;
	nr				= 6;
	condition		= PC_Booze_Schlaf_Condition;
	information		= PC_Booze_Schlaf_Info;
	permanent		= TRUE;
	description		= "Lou's Hammer mit doppelter Menge Rum."; 
};

FUNC INT PC_Booze_Schlaf_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (BoozeStart == TRUE)
	&& (Knows_Schlafhammer == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Booze_Schlaf_Info()
{
	if (Npc_HasItems (self, ItPl_SwampHerb) >= 1)
	&& (Npc_HasItems (self, ItPl_Beet)		>= 2)
	&& (Npc_HasItems (self, ItAt_SharkTeeth)>= 1)
	&& (Npc_HasItems (self, ItFo_Addon_Rum) >= 2)
	{
		Npc_RemoveInvItems (self, ItPl_SwampHerb,1);
		Npc_RemoveInvItems (self, ItPl_Beet,2);
		Npc_RemoveInvItems (self, ItAt_SharkTeeth,1);
		Npc_RemoveInvItems (self, ItFo_Addon_Rum,2);
		
		Print (PRINT_AlchemySuccess);
		CreateInvItems (self, ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};
	B_ENDPRODUCTIONDIALOG ();
};

//********************************
INSTANCE PC_Booze_SchnellerHering (C_Info)
{
	npc				= PC_Hero;
	nr				= 5;
	condition		= PC_Booze_SchnellerHering_Condition;
	information		= PC_Booze_SchnellerHering_Info;
	permanent		= TRUE;
	description		= "Schnellen Hering mixen."; 
};

FUNC INT PC_Booze_SchnellerHering_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (BoozeStart == TRUE)
	&& (Knows_SchnellerHering == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Booze_SchnellerHering_Info()
{
	if (Npc_HasItems (self, ItPl_Speed_Herb_01) >= 1)
	&& (Npc_HasItems (self, ItFo_Fish) >= 1)
	&& (Npc_HasItems (self, ItFo_Addon_Rum) >= 1)
	{
		Npc_RemoveInvItems (self, ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems (self, ItFo_Addon_Rum,1);
		Npc_RemoveInvItems (self, ItFo_Fish,1);
		
		Print (PRINT_AlchemySuccess);
		CreateInvItems (self, ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);	
	};
	B_ENDPRODUCTIONDIALOG ();
};	
//*******************************************************
// Aufladen des Auge Innos
//*******************************************************
INSTANCE PC_Charge_InnosEye (C_INFO)
{
	nr       		= 1;
	npc				= PC_Hero;
	condition		= PC_Charge_InnosEye_Condition;
	information		= PC_Charge_InnosEye_Info;
	permanent		= TRUE;
	description		= "Das Auge Innos wieder aufladen."; 
};
FUNC INT PC_Charge_InnosEye_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] == TRUE)
	&& (Npc_HasItems (hero,ItMi_InnosEye_Discharged_MIS) >= 1))
	&& (BoozeStart == FALSE)
	&& (TabakStart == FALSE)
	&& (HealthStart == FALSE)
	&& (ManaStart == FALSE)
	&& (SpecialStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID PC_Charge_InnosEye_Info ()
{
	if 	(
			(
				(Npc_HasItems (hero, ItAt_IcedragonHeart) >= 1)
				|| 		(Npc_HasItems (hero, ItAt_RockdragonHeart)	>= 1)
				|| 		(Npc_HasItems (hero, ItAt_FiredragonHeart)	>= 1)
				|| 		(Npc_HasItems (hero, ItAt_SwampdragonHeart)	>= 1)	
			)
			&& 		(Npc_HasItems (hero, ItMi_InnosEye_Discharged_MIS)    >= 1)	
		) 
	{
		if 		(Npc_HasItems (hero, ItAt_SwampdragonHeart	)	>= 1){Npc_RemoveInvItems (hero,ItAt_SwampdragonHeart  ,1);}
		else if	(Npc_HasItems (hero, ItAt_RockdragonHeart	) 	>= 1){Npc_RemoveInvItems (hero,ItAt_RockdragonHeart	  ,1);}
		else if	(Npc_HasItems (hero, ItAt_FiredragonHeart	) 	>= 1){Npc_RemoveInvItems (hero,ItAt_FiredragonHeart	  ,1);}
		else if	(Npc_HasItems (hero, ItAt_IcedragonHeart	) 	>= 1){Npc_RemoveInvItems (hero,ItAt_IcedragonHeart	  ,1);};
	
		Npc_RemoveInvItems (hero,ItMi_InnosEye_Discharged_MIS	  ,1);
		
		CreateInvItems	   (hero,ItMi_InnosEye_MIS,1);  
		
		Print (PRINT_AlchemySuccessInnoseye);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
//Mana Tränke 
//*******************************************************
var int ManaStart;
//----------------------
INSTANCE PC_Mana_Start (C_Info)
{
	npc				= PC_Hero;
	nr				= 6;
	condition		= PC_Mana_Start_Condition;
	information		= PC_Mana_Start_Info;
	permanent		= TRUE;
	description		= "Manatränke brauen"; 
};

FUNC INT PC_Mana_Start_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (ManaStart == FALSE)
	&& (BoozeStart == FALSE)
	&& (TabakStart == FALSE)
	&& (HealthStart == FALSE)
	&& (SpecialStart == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Mana_Start_Info()
{
	ManaStart = TRUE;
};
//*******************************************************
INSTANCE PC_Mana_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_Mana_Stop_Condition;
	information		= PC_Mana_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_Mana_Stop_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (ManaStart == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID PC_Mana_Stop_Info()
{
	ManaStart = FALSE;
};
//*******************************************************
INSTANCE PC_ItPo_Mana_01 (C_INFO)
{
	nr       		= 2;
	npc				= PC_Hero;
	condition		= PC_ItPo_Mana_01_Condition;
	information		= PC_ItPo_Mana_01_Info;
	permanent		= TRUE;
	description		= "Mana Essenz (2 Feuernesseln, 1 Feldknöterich)"; 
};

FUNC INT PC_ItPo_Mana_01_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	&& (ManaStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Mana_01_Info ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_01) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb)    >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_01,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  ,1);
		
		CreateInvItems 	   (hero,ItPo_Mana_01,1); 
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

//*******************************************************
INSTANCE PC_ItPo_Mana_02 (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_ItPo_Mana_02_Condition;
	information		= PC_ItPo_Mana_02_Info;
	permanent		= TRUE;
	description		= "Mana Extrakt (2 Feuerkraut, 1 Feldknöterich) "; 
};
FUNC INT PC_ItPo_Mana_02_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	&& (ManaStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Mana_02_Info ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb)    >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Mana_02,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
INSTANCE PC_ItPo_Mana_03 (C_INFO)
{
	nr       		= 4;
	npc				= PC_Hero;
	condition		= PC_ItPo_Mana_03_Condition;
	information		= PC_ItPo_Mana_03_Info;
	permanent		= TRUE;
	description		= "Mana Elixier (2 Feuerwurzeln, 1 Feldknöterich)"; 
};

FUNC INT PC_ItPo_Mana_03_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	&& (ManaStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Mana_03_Info ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_03) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	  >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_03,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Mana_03,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
INSTANCE PC_ItPo_Mana_04 (C_INFO)
{
	nr       		= 4;
	npc				= PC_Hero;
	condition		= PC_ItPo_Mana_04_Condition;
	information		= PC_ItPo_Mana_04_Info;
	permanent		= TRUE;
	description		= "Manatrunk (3 Mana Essenzen, 1 Feldknöterich)"; 
};

FUNC INT PC_ItPo_Mana_04_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == TRUE))
	&& (ManaStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Mana_04_Info ()
{
	if (Npc_HasItems (hero, ItPo_Mana_01) >= 3) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	  >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPo_Mana_01,3);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Mana_Addon_04,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
//Heiltränke 
//*******************************************************
var int HealthStart;
//----------------------
INSTANCE PC_Health_Start (C_Info)
{
	npc				= PC_Hero;
	nr				= 7;
	condition		= PC_Health_Start_Condition;
	information		= PC_Health_Start_Info;
	permanent		= TRUE;
	description		= "Heiltränke brauen"; 
};

FUNC INT PC_Health_Start_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (HealthStart == FALSE)
	&& (BoozeStart == FALSE)
	&& (TabakStart == FALSE)
	&& (ManaStart == FALSE)
	&& (SpecialStart == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Health_Start_Info()
{
	HealthStart = TRUE;
};
//*******************************************************
INSTANCE PC_Health_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_Health_Stop_Condition;
	information		= PC_Health_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_Health_Stop_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (HealthStart == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID PC_Health_Stop_Info()
{
	HealthStart = FALSE;
};
//*******************************************************
INSTANCE PC_ItPo_Health_01 (C_INFO)
{
	nr       		= 2;
	npc				= PC_Hero;
	condition		= PC_ItPo_Health_01_Condition;
	information		= PC_ItPo_Health_01_Info;
	permanent		= TRUE;
	description		= "Essenz der Heilung (2 Heilplanzen, 1 Feldknöterich)"; 
};

FUNC INT PC_ItPo_Health_01_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	&& (HealthStart == TRUE)
	{		
			return TRUE;
	};

};

FUNC VOID PC_ItPo_Health_01_Info ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	 >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Health_Herb_01,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	    ,1);
		
		CreateInvItem	   (hero,ItPo_Health_01);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
INSTANCE PC_ItPo_Health_02 (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_ItPo_Health_02_Condition;
	information		= PC_ItPo_Health_02_Info;
	permanent		= TRUE;
	description		= "Extrakt der Heilung (2 Heilkräuter, 1 Feldknöterich)"; 
};

FUNC INT PC_ItPo_Health_02_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	&& (HealthStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Health_02_Info ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_02) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	 >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  	,1);
		
		CreateInvItems	   (hero,ItPo_Health_02,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
INSTANCE PC_ItPo_Health_03 (C_INFO)
{
	nr       		= 4;
	npc				= PC_Hero;
	condition		= PC_ItPo_Health_03_Condition;
	information		= PC_ItPo_Health_03_Info;
	permanent		= TRUE;
	description		= "Elixier der Heilung (2 Heilwurzeln, 1 Feldknöterich)"; 
};
FUNC INT PC_ItPo_Health_03_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	&& (HealthStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Health_03_Info ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_03) >= 2) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	  	>= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Health_Herb_03,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  	,1);
		
		CreateInvItems	   (hero,ItPo_Health_03,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
INSTANCE PC_ItPo_Health_04 (C_INFO)
{
	nr       		= 4;
	npc				= PC_Hero;
	condition		= PC_ItPo_Health_04_Condition;
	information		= PC_ItPo_Health_04_Info;
	permanent		= TRUE;
	description		= "Heiltrunk (3 Essenzen der Heilung, 1 Feldknöterich)"; 
};
FUNC INT PC_ItPo_Health_04_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_04] == TRUE))
	&& (HealthStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Health_04_Info ()
{
	if (Npc_HasItems (hero, ItPo_Health_01) >= 3) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb) 	  	>= 1) 
	{
		Npc_RemoveInvItems (hero,ItPo_Health_01,3);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	  	,1);
		
		CreateInvItems	   (hero,ItPo_Health_Addon_04,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
//Spezielle Tränke 
//*******************************************************
var int SpecialStart;
//----------------------
INSTANCE PC_Special_Start (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Special_Start_Condition;
	information		= PC_Special_Start_Info;
	permanent		= TRUE;
	description		= "Spezielle Tränke brauen"; 
};

FUNC INT PC_Special_Start_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (SpecialStart == FALSE)
	&& (BoozeStart == FALSE)
	&& (TabakStart == FALSE)
	&& (HealthStart == FALSE)
	&& (ManaStart == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Special_Start_Info()
{
	SpecialStart = TRUE;
};
//*******************************************************
INSTANCE PC_Special_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_Special_Stop_Condition;
	information		= PC_Special_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_Special_Stop_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (SpecialStart == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID PC_Special_Stop_Info()
{
	SpecialStart = FALSE;
};
//*******************************************************
INSTANCE PC_ItPo_Addon_Geist (C_INFO)
{
	nr       		= 2;
	npc				= PC_Hero;
	condition		= PC_ItPo_Addon_Geist_Condition;
	information		= PC_ItPo_Addon_Geist_Info;
	permanent		= TRUE;
	description		= "Elixier der Geistveränderung"; 
};

FUNC INT PC_ItPo_Addon_Geist_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (Knows_MCELIXIER == TRUE))
	&& (SpecialStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Addon_Geist_Info ()
{
	if (Npc_HasItems (hero, ItAt_Sting) 		   >= 2) 
	&& (Npc_HasItems (hero, ItPo_Mana_02) 	  	   >= 1) 
	&& (Npc_HasItems (hero, ItPo_Health_01) 	   >= 1) 
	&& (Npc_HasItems (hero, ItFo_Addon_Pfeffer_01) >= 1) 
	{
		Npc_RemoveInvItems (hero,ItAt_Sting					,2);
		Npc_RemoveInvItems (hero,ItPo_Mana_02	  			,1);
		Npc_RemoveInvItems (hero,ItPo_Health_01	  			,1);
		Npc_RemoveInvItems (hero,ItFo_Addon_Pfeffer_01	  	,1);
		
		if (Knows_Bloodfly == TRUE)
		{
			CreateInvItems	   (hero,ItPo_Addon_Geist_02,1);  
		}
		else
		{
			CreateInvItems	   (hero,ItPo_Addon_Geist_01,1);  
		};
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();			
};
//*******************************************************
INSTANCE PC_ItPo_Perm_Health (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_ItPo_Perm_Health_Condition;
	information		= PC_ItPo_Perm_Health_Info;
	permanent		= TRUE;
	description		= "Elixier des Lebens (1 Heilwurzel, 1 Kronstöckel)"; 
};

FUNC INT PC_ItPo_Perm_Health_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE))
	&& (SpecialStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Perm_Health_Info ()
{
	if (Npc_HasItems (hero, ItPl_Health_Herb_03) 	>= 1) 
	&& (Npc_HasItems (hero, ItPl_Perm_Herb) 	  	>= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Health_Herb_03,1);
		Npc_RemoveInvItems (hero,ItPl_Perm_Herb	  	,1);
		
		CreateInvItems	   (hero,ItPo_Perm_Health,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();			
};
//*******************************************************
INSTANCE PC_ItPo_Perm_Mana (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_ItPo_Perm_Mana_Condition;
	information		= PC_ItPo_Perm_Mana_Info;
	permanent		= TRUE;
	description		= "Elixier des Geistes (1 Feuerwurzel, 1 Kronstöckl)"; 
};

FUNC INT PC_ItPo_Perm_Mana_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE))
	&& (SpecialStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Perm_Mana_Info ()
{
	if (Npc_HasItems (hero, ItPl_Mana_Herb_03) 	  >= 1) 
	&& (Npc_HasItems (hero, ItPl_Perm_Herb) 	  >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems (hero,ItPl_Perm_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Perm_Mana,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();			
};
//*******************************************************
INSTANCE PC_ItPo_Dex (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_ItPo_Dex_Condition;
	information		= PC_ItPo_Dex_Info;
	permanent		= TRUE;
	description		= "Trank des Geschicks (1 Goblin Beere, 1 Kronstöckl)"; 
};

FUNC INT PC_ItPo_Dex_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == TRUE))
	&& (SpecialStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Dex_Info ()
{
	if (Npc_HasItems (hero, ItPl_Dex_Herb_01) 		  >= 1) 
	&& (Npc_HasItems (hero, ItPl_Perm_Herb) 	  >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Dex_Herb_01	  , 1);
		Npc_RemoveInvItems (hero,ItPl_Perm_Herb	  , 1);
		
		CreateInvItems	   (hero,ItPo_Perm_Dex,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
INSTANCE PC_ItPo_Strg (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_ItPo_Strg_Condition;
	information		= PC_ItPo_Strg_Info;
	permanent		= TRUE;
	description		= "Trank der Stärke (1 Drachenwurzel, 1 Kronstöckl)"; 
};

FUNC INT PC_ItPo_Strg_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE))
	&& (SpecialStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Strg_Info ()
{
	if (Npc_HasItems (hero, ItPl_Strength_Herb_01)    >= 1) 
	&& (Npc_HasItems (hero, ItPl_Perm_Herb) 	   >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Strength_Herb_01, 1);
		Npc_RemoveInvItems (hero,ItPl_Perm_Herb	  ,1);
		
		CreateInvItems	   (hero,ItPo_Perm_STR,1);  
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
INSTANCE PC_ItPo_Speed (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_ItPo_Speed_Condition;
	information		= PC_ItPo_Speed_Info;
	permanent		= TRUE;
	description		= "Trank der Geschwindigkeit (1 Snapperkraut, 1 Feldknöterich)"; 
};

FUNC INT PC_ItPo_Speed_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE))
	&& (SpecialStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_Speed_Info ()
{
	if (Npc_HasItems (hero, ItPl_Speed_Herb_01) >= 1) 
	&& (Npc_HasItems (hero, ItPl_Temp_Herb)  >= 1) 
	{
		Npc_RemoveInvItems (hero,ItPl_Speed_Herb_01, 1);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	 ,1);
		
		CreateInvItems	   (hero,ItPo_Speed,1);  
		Print (PRINT_AlchemySuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
//Tabak Verarbeitung
//*******************************************************
var int TabakStart;
//----------------------
INSTANCE PC_Tabak_Start (C_Info)
{
	npc				= PC_Hero;
	nr				= 11;
	condition		= PC_Tabak_Start_Condition;
	information		= PC_Tabak_Start_Info;
	permanent		= TRUE;
	description		= "Tabak mischen und Stengel drehen"; 
};

FUNC INT PC_Tabak_Start_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (TabakStart == FALSE)
	&& (BoozeStart == FALSE)
	&& (HealthStart == FALSE)
	&& (ManaStart == FALSE)
	&& (SpecialStart == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Tabak_Start_Info()
{
	TabakStart = TRUE;
};
//*******************************************************
INSTANCE PC_Tabak_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_Tabak_Stop_Condition;
	information		= PC_Tabak_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_Tabak_Stop_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (TabakStart == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID PC_Tabak_Stop_Info()
{
	TabakStart = FALSE;
};
//*******************************************************
//				Joint drehen
//*******************************************************
INSTANCE PC_ItMi_Joint (C_INFO)
{
	nr       		= 10;
	npc				= PC_Hero;
	condition		= PC_ItMi_Joint_Condition;
	information		= PC_ItMi_Joint_Info;
	permanent		= TRUE;
	description		= "Sumpfkraut verarbeiten (1 Stengel)"; 
};

FUNC INT PC_ItMi_Joint_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (TabakStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMi_Joint_Info ()
{
	if (Npc_HasItems (hero, ItPl_SwampHerb) >= 1)
	{
		Npc_RemoveInvItems (hero,ItPl_SwampHerb	 ,1);
		CreateInvItems	   (hero,ItMi_Joint,1);  
	
		Print (PRINT_JointSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
//	Grünen Novizen herstellen
//*******************************************************
INSTANCE PC_ItMi_Addon_Joint_01 (C_INFO)
{
	nr       		= 11;
	npc				= PC_Hero;
	condition		= PC_ItMi_Addon_Joint_01_Condition;
	information		= PC_ItMi_Addon_Joint_01_Info;
	permanent		= TRUE;
	description		= "Grünen Novizen herstellen (1 Stengel)"; 
};

FUNC INT PC_ItMi_Addon_Joint_01_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (TabakStart == TRUE)
	&& (Green_Extrem == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID PC_ItMi_Addon_Joint_01_Info ()
{
	if (Npc_HasItems (hero, ItPl_SwampHerb) >= 2)
	&& (Npc_HasItems (hero, ItPl_Temp_Herb)  >= 1)
	{
		Npc_RemoveInvItems (hero,ItPl_SwampHerb	 ,2);
		Npc_RemoveInvItems (hero,ItPl_Temp_Herb	 ,1);
		CreateInvItems	   (hero,ItMi_Addon_Joint_01,1);  
	
		Print (PRINT_Addon_Joint_01_Success);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
//					Tabak mischen 
//*******************************************************
INSTANCE PC_ItMi_Tabak (C_INFO)
{
	nr       		= 10;
	npc				= PC_Hero;
	condition		= PC_ItMi_Tabak_Condition;
	information		= PC_ItMi_Tabak_Info;
	permanent		= TRUE;
	description		= "Tabak mischen..."; 
};

FUNC INT PC_ItMi_Tabak_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (Npc_HasItems (hero, ItMi_ApfelTabak) >= 1)
	&& (TabakStart == TRUE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMi_Tabak_Info ()
{
	Npc_RemoveInvItems (hero,ItMi_ApfelTabak ,1);
	
	Info_ClearChoices (PC_ItMi_Tabak);
	
	Info_AddChoice 	(PC_ItMi_Tabak,DIALOG_BACK,PC_ItMi_Tabak_BACK);	
	
	if (Npc_HasItems (hero, ItFo_Honey) >=1)
	{
		Info_AddChoice 	(PC_ItMi_Tabak,"...mit Honig",PC_ItMi_Tabak_Honey);
	};
	if (Npc_HasItems (hero, ItPl_SwampHerb) >=1)
	{
		Info_AddChoice 	(PC_ItMi_Tabak,"...mit Sumpfkraut",PC_ItMi_Tabak_Swampherb);
	};
	if (Npc_HasItems (hero, ItPl_Mushroom_01) >=1)
	{
		Info_AddChoice 	(PC_ItMi_Tabak,"...mit Dunkelpilz",PC_ItMi_Tabak_Mushroom_01);
	};
	
};
FUNC VOID PC_ItMi_Tabak_BACK()
{
	Info_ClearChoices (PC_ItMi_Tabak);
};
FUNC VOID PC_ItMi_Tabak_Honey()
{
	CreateInvItems (hero, ItMi_Honigtabak,1 );
	Print (PRINT_TabakSuccess);
	
	B_ENDPRODUCTIONDIALOG ();		
};
FUNC VOID PC_ItMi_Tabak_Swampherb()
{
	CreateInvItems (hero,ItMi_SumpfTabak,1 );
	Print (PRINT_TabakSuccess);
	
	B_ENDPRODUCTIONDIALOG ();		
};
FUNC VOID PC_ItMi_Tabak_Mushroom_01()
{
	CreateInvItems (hero,ItMi_PilzTabak,1 );
	Print (PRINT_TabakSuccess);
	
	B_ENDPRODUCTIONDIALOG ();		
};


INSTANCE PC_ItPo_MegaDrink (C_INFO)
{
	nr       		= 2;
	npc				= PC_Hero;
	condition		= PC_ItPo_MegaDrink_Condition;
	information		= PC_ItPo_MegaDrink_Info;
	permanent		= TRUE;
	description		= "Dracheneitrunk (10 Drachenei, 1 schwarze Perle, 1 Schwefel)"; 
};

FUNC INT PC_ItPo_MegaDrink_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == TRUE))
	&& (BoozeStart == FALSE)
	&& (TabakStart == FALSE)
	&& (HealthStart == FALSE)
	&& (ManaStart == FALSE)
	&& (SpecialStart == FALSE)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItPo_MegaDrink_Info ()
{
	if (Npc_HasItems (hero, ItAt_DragonEgg_MIS) >= 10) 
	&& (Npc_HasItems (hero, ItMi_DarkPearl)    >= 1) 
	&& (Npc_HasItems (hero, ItMi_Sulfur)    >= 1) 
	{
		Npc_RemoveInvItems (hero,ItAt_DragonEgg_MIS ,10);
		Npc_RemoveInvItems (hero,ItMi_DarkPearl	  ,1);
		Npc_RemoveInvItems (hero,ItMi_Sulfur	  ,1);
		
		CreateInvItems 	   (hero,ItPo_MegaDrink,1); 
		Print (PRINT_AlchemySuccess);
	}
		else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_Flask,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
