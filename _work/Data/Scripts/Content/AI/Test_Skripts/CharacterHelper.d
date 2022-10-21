//**************************************
//Characterhelper
//**************************************
	INSTANCE MobsiBrief		(C_Item)
{
	name 				=	"MobsiBrief";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseMobsiBrief;
	scemeName			=	"MAP";
	description			= 	"MobsiBrief";
};
func void UseMobsiBrief ()
{
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE]=FALSE;
	
		var int nDocID;

		nDocID =	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID,  0, FONT_BookHeadline);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, "StandardBrief"									);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "Jetzt wird alles wieder gut"						);
					Doc_PrintLines	(nDocID,  0, "PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;"			);
					Doc_PrintLines	(nDocID,  0, "self.aivar[AIV_INVINCIBLE] = FALSE;"				);
					Doc_Show		(nDocID);
};
//****************************************************************************
//				Sack voll neuer addon waffen
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_Addon_Sack (C_Item)
{	
	name 				=	"Der Sack ist voller neuer Waffen!";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Sack;

	description			= 	name;
	TEXT[2]				= 	"Viele viele bunte Waffen";		
	
};

	FUNC VOID Use_Sack()
	{
		Print("Einen Haufen neuer Waffen gefunden!");
		
		CreateInvItems (self, ItMW_Addon_Knife01,1);
		CreateInvItems (self, ItMW_Addon_Stab01,1);
		CreateInvItems (self, ItMW_Addon_Stab02,1);
		CreateInvItems (self, ItMW_Addon_Stab03,1);
		CreateInvItems (self, ItMW_Addon_Stab04,1);
		CreateInvItems (self, ItMW_Addon_Stab05,1);
		CreateInvItems (self, ItMW_Addon_Hacker_1h_01,1);
		CreateInvItems (self, ItMW_Addon_Hacker_2h_01,1);
		CreateInvItems (self, ItMW_Addon_Hacker_2h_02,1);
		CreateInvItems (self, ItMW_Addon_Hacker_1h_02,1);
		CreateInvItems (self, ItMW_Addon_Keule_1h_01,1);
		
		CreateInvItems (self, ItMW_Addon_Keule_2h_01,1);
		
	};
INSTANCE ItFo_TestTrigger (C_Item)
{	
	name 				=	"Trigger die Adw";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	0;
	
	visual 				=	"ItFo_Honey.3DS";
	material 			=	MAT_STONE;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_TestTrigger;

	description			= 	name;
	

};

	FUNC VOID Use_TestTrigger()
	{
		ENTER_ADDONWORLD_FIRSTTIME_TRIGGER_FUNC ();
	};

INSTANCE CH (NPC_DEFAULT)
{
// ------ NSC ------
	name 		= "Characterhelper";
	guild 		= GIL_NONE;
	id 			= 0;
	voice 		= 15;
	flags       = 0 ;																
	npctype		= NPCTYPE_FRIEND ;
	
	//aivars
	aivar[AIV_IgnoresArmor] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	//B_SetFightSkills (self, 70); 
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------				
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, bodyTex_Player, -1);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_0;
};

FUNC VOID Rtn_Start_0 ()
{	
	TA_Stand_ArmsCrossed(08,00,23,00,"XXX");
    TA_Stand_ArmsCrossed(23,00,08,00,"XXX");
};
//***************************************************************************
//	Hero bekommt Level (1-50)
//***************************************************************************
func void B_SetHeroExp() 
{
    var string Attributes;

    hero.exp = (250*((hero.level+1))*(hero.level));
    hero.exp_next = (250*((hero.level+2))*(hero.level+1));
    hero.LP = (hero.level * LP_PER_LEVEL);
    
    hero.attribute[ATR_HITPOINTS_MAX] = 40 + (10* hero.level);
    hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
  
    Attributes = "Level Up!  Lernpunkte:";
    Attributes = ConcatStrings(Attributes, IntToString(hero.LP));
    Attributes = ConcatStrings(Attributes, "  Hitpoints:");
    Attributes = ConcatStrings(Attributes, IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
    
    PrintScreen	(Attributes, -1,-1,FONT_Screen,3);
    Snd_Play ("LEVELUP");    
};
//***************************************************************************
//	Hero bekommt Waffe 
//***************************************************************************
func void B_SetHeroWeapon()
{
    if hero.level <= 6
    {
       // CreateInvItems(hero,ItMw_1H_Axe_L_02,1);
      //  CreateInvItems(hero,ItMw_2H_Axe_L_02,1);
 	    CreateInvItems(hero,ItRw_Crossbow_L_01,1);
	}   
    else if hero.level <= 12
    {
     //   CreateInvItems(hero,ItMw_1H_Mace_L_07,1);
     //   CreateInvItems(hero,ItMw_2H_Mace_L_02,1);
 	    CreateInvItems(hero,ItRw_Bow_L_04,1);
 	    CreateInvItems(hero,ItRw_Crossbow_L_02,1);
    }
    else if hero.level <= 18
    {
     //   CreateInvItems(hero,ItMw_1H_Mace_M_02,1);
     //   CreateInvItems(hero,ItMw_2H_Axe_M_02,1);
   	    CreateInvItems(hero,ItRw_Bow_M_02,1);
   	    CreateInvItems(hero,ItRw_Crossbow_M_02,1);
    }
    else if hero.level <= 24
    {
    //    CreateInvItems(hero,ItMw_1H_Sword_M_04,1);
	//	CreateInvItems(hero,ItMw_2H_Axe_M_05,1);
        CreateInvItems(hero,ItRw_Bow_M_04,1);
         CreateInvItems(hero,ItRw_Crossbow_H_01,1);
 	    
    }
    else if hero.level <= 30
    {
   //     CreateInvItems(hero,ItMw_1H_Sword_H_03,1);
	//	CreateInvItems(hero,ItMw_2H_Axe_H_02,1);
        CreateInvItems(hero,ItRw_Bow_H_02,1);
        CreateInvItems(hero,ItRw_Crossbow_H_02,1);
  	    
    }
    else if hero.level <= 36
    {
    //    CreateInvItems(hero,ItMw_1H_Sword_H_05,1);
	//	CreateInvItems(hero,ItMw_2H_Sword_H_07,1);
        CreateInvItems(hero,ItRw_Bow_H_04,1);
        CreateInvItems(hero,ItRw_Bow_L_04,1);
        
    };
    AI_EquipBestMeleeWeapon(hero);
    AI_EquipBestRangedWeapon(hero);
    
   
};
//***************************************************************************
//	Hero bekommt Ausrüstung
//***************************************************************************
func void B_SetHeroEquipment()
{
	
    CreateInvItems(hero,ItRw_Arrow,100);
    CreateInvItems(hero,ItRw_Bolt,100);
    CreateInvItems(hero,ItLsTorch,30);
    CreateInvItems(hero,ItMi_Gold,500);
    CreateInvItems(hero,ItPo_Health_03,5);
    CreateInvItems(hero,ItPo_Mana_03,5);
    CreateInvItems(hero,ItKe_Lockpick,30);
  
};
//***************************************************************************
//	KDF bekommt Runen 
//***************************************************************************
FUNC VOID B_SetKDFRunes ()
{
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	{
		CreateInvItems(hero,ItRu_Light,1);
		CreateInvItems(hero,ItRu_Firebolt,1);
		CreateInvItems(hero,ItRu_LightHeal,1);
		CreateInvItems(hero,ItRu_SumGobSkel,1);
		CreateInvItems(hero,ItRu_Zap,1);
	
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2) 
	{
		CreateInvItems(hero,ItRu_InstantFireball,1);
		CreateInvItems(hero,ItRu_Icebolt,1);
		CreateInvItems(hero,ItRu_SumWolf,1);
		CreateInvItems(hero,ItRu_Windfist,1);
		CreateInvItems(hero,ItRu_Sleep,1);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3) 
	{
		CreateInvItems(hero,ItRu_MediumHeal,1);
		CreateInvItems(hero,ItRu_Firestorm,1);
		CreateInvItems(hero,ItRu_ThunderBall,1);
		CreateInvItems(hero,ItRu_SumSkel,1);
		CreateInvItems(hero,ItRu_Fear,1);
		CreateInvItems(hero,ItRu_IceCube,1);
		
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		
		CreateInvItems(hero,ItRu_SumGol,1);
		CreateInvItems(hero,ItRu_HarmUndead,1);
		CreateInvItems(hero,ItRu_LightningFlash,1);
		CreateInvItems(hero,ItRu_ChargeFireball,1);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		CreateInvItems(hero,ItRu_Pyrokinesis,1);
		CreateInvItems(hero,ItRu_IceWave,1);
		CreateInvItems(hero,ItRu_SumDemon,1);
		CreateInvItems(hero,ItRu_FullHeal,1);
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 6) 
	{
		CreateInvItems(hero,ItRu_Firerain,1);
		CreateInvItems(hero,ItRu_BreathOfDeath,1);
		CreateInvItems(hero,ItRu_MassDeath,1);
		CreateInvItems(hero,ItRu_ArmyOfDarkness,1);
		CreateInvItems(hero,ItRu_Shrink,1);
	};
};
//***************************************************************************
//	Paladin bekommt Runen
//***************************************************************************
func void B_SetPaladinEquipment ()
{
	 CreateInvItems(hero,ItRu_PalLight,1);
	 CreateInvItems(hero,ItRu_PalLightHeal,1);
	 CreateInvItems(hero,ItRu_PalHolyBolt,1);
	 CreateInvItems(hero,ItRu_PalMediumHeal,1);
	 CreateInvItems(hero,ItRu_PalRepelEvil,1);
	 CreateInvItems(hero,ItRu_PalFullHeal,1);
	 CreateInvItems(hero,ItRu_PalDestroyEvil,1);
	 CreateInvItems(hero,ItRu_PalTeleportSecret,1);	
};
//***************************************************************************
//	Rahmen-Infos
// 	Ende
//***************************************************************************
instance  CH_kriegen (C_INFO)
{
	npc			=  CH;
	nr			=  999;
	condition	=  CH_kriegen_Condition;
	information	=  CH_kriegen_Info;
	permanent	=  TRUE;
	description = "1 Erz geben";
};                       

FUNC int  CH_kriegen_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID  CH_kriegen_Info()
{
	
	B_GiveInvItems (other, self, Itmi_Nugget, 1);
};
//***************************************************************************
//	Rahmen-Infos
// 	Ende
//***************************************************************************
instance  CH_Geben (C_INFO)
{
	npc			=  CH;
	nr			=  999;
	condition	=  CH_Geben_Condition;
	information	=  CH_Geben_Info;
	permanent	=  TRUE;
	description = "zeig mal dingens";
};                       

FUNC int  CH_Geben_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID  CH_Geben_Info()
{
	//B_GiveInvItems (self, other, Itmi_Nugget, 2);
	
		 AI_PrintScreen ("Honig gegeben",	 -1, 34, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Brot gegeben",	 -1, 37, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Wein gegeben",     -1, 40, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Wurst gegeben",  	 -1, 43, FONT_ScreenSmall, 2);
};
//***************************************************************************
//	Rahmen-Infos
// 	Ende
//***************************************************************************
instance  CH_Exit (C_INFO)
{
	npc			=  CH;
	nr			=  999;
	condition	=  CH_Exit_Condition;
	information	=  CH_Exit_Info;
	permanent	=  TRUE;
	description = DIALOG_ENDE;
};                       

FUNC int  CH_Exit_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID  CH_Exit_Info()
{
	AI_StopProcessInfos	(self);
};
//***************************************************************************/
//	Reset, stellt PC_Hero wieder her, ohne Talente und mit Startwerten 
//***************************************************************************/
instance  CH_RESET (C_INFO)
{
	npc			=  CH;
	nr			=  20;
	condition	=  CH_RESET_Condition;
	information	=  CH_RESET_Info;
	permanent 	=  TRUE;
	description = "Totaler Reset";
};                       

FUNC int  CH_RESET_Condition()
{	
	if (LevelStart == TRUE)
	{	
		return TRUE;
	};	
};
FUNC VOID  CH_RESET_Info()
{
	
	hero.guild = GIL_NONE;
	Npc_SetTrueGuild (hero, GIL_NONE);
	
	hero.LP 	= 0;
	hero.level	= 0;
	hero.exp 	= 0;
	hero.exp_next = 500; 
	
	hero.attribute[ATR_STRENGTH] = 10; 
	hero.attribute[ATR_DEXTERITY]= 10; 
	
	hero.attribute[ATR_MANA_MAX] = 5; 
	hero.attribute[ATR_MANA] 	 = 5; 
	
	hero.attribute[ATR_HITPOINTS] 	  = 40; 
	hero.attribute[ATR_HITPOINTS_MAX] = 40; 
	
	Npc_SetTalentSkill (hero, NPC_TALENT_SMITH, 0); 
	Npc_SetTalentSkill (hero, NPC_TALENT_ALCHEMY, 0);
	Npc_SetTalentSkill (hero, NPC_TALENT_RUNES, 0);
	
	Npc_SetTalentSkill (hero, NPC_TALENT_MAGE, 0);
	
	Npc_SetTalentSkill (hero, NPC_TALENT_BOW, 0);
	other.HitChance[NPC_TALENT_BOW] = 0;
	
	Npc_SetTalentSkill (hero, NPC_TALENT_CROSSBOW, 0);
	other.HitChance[NPC_TALENT_CROSSBOW] = 0;
	
	Npc_SetTalentSkill (hero, NPC_TALENT_1H, 0);
	other.HitChance[NPC_TALENT_1H] = 0;
	
	Npc_SetTalentSkill (hero, NPC_TALENT_2H, 0);
	
	Npc_SetTalentSkill (hero, NPC_TALENT_MAGE, 0);
	other.HitChance[NPC_TALENT_2H] = 0;
	
	AI_UnequipArmor (hero); 
	
	PrintScreen ("PC_Hero wieder hergestellt", - 1, - 1, FONT_Screen, 2);   
	
};

//***************************************************************************
//	Language
//***************************************************************************

INSTANCE CH_Language (C_INFO)
{
	npc				= CH;
	nr				= 7;
	condition		= CH_Language_Condition;
	information		= CH_Language_Info;
	important		= 0;
	permanent		= 1;
	description		= "Sprache lernen"; 
};

FUNC INT CH_Language_Condition()
{
	if (MiscStart == TRUE)
	{		
		return TRUE;
	};
};
func VOID CH_Language_Info()
{
	Info_ClearChoices	(CH_Language);
	Info_AddChoice	(CH_Language, DIALOG_BACK, CH_Language_BACK );
	Info_AddChoice	(CH_Language, "Sprache der Priester (3)", CH_Language_Priest );
	Info_AddChoice	(CH_Language, "Sprache der Krieger (2)", CH_Language_Warrior );
	Info_AddChoice	(CH_Language, "Sprache der Bauern (1)", CH_Language_Peasant );
};
func void CH_Language_BACK ()
{
	Info_ClearChoices	(CH_Language);
};
func void CH_Language_Peasant ()
{
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;      
	Info_ClearChoices	(CH_Language);
};
func void CH_Language_Warrior ()
{
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;      
	Info_ClearChoices	(CH_Language);
};
func void CH_Language_Priest ()
{

	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;    
	Info_ClearChoices	(CH_Language);
};

//***************************************************************************
//	Gildenwahl
//***************************************************************************

INSTANCE CH_Guild (C_INFO)
{
	npc				= CH;
	nr				= 7;
	condition		= CH_Guild_Condition;
	information		= CH_Guild_Info;
	important		= 0;
	permanent		= 1;
	description		= "Gildenwahl"; 
};

FUNC INT CH_Guild_Condition()
{
	if (LevelStart == TRUE)
	{		
		return TRUE;
	};
};
func VOID CH_Guild_Info()
{
    Info_ClearChoices	(CH_Guild);
    Info_AddChoice	(CH_Guild, DIALOG_BACK		, CH_Guild_BACK);
    Info_AddChoice	(CH_Guild, "Novize"      	, CH_NOV);	    
    Info_AddChoice	(CH_Guild, "KDF"       		, CH_KDF);   
    Info_AddChoice	(CH_Guild, "Söldner"   		, CH_SLD);
    Info_AddChoice	(CH_Guild, "Drachenjäger"       , CH_DJG);
    Info_AddChoice	(CH_Guild, "Miliz"       	, CH_MIL);    
    Info_AddChoice	(CH_Guild, "Paladin"  		, CH_PAL);
    Info_AddChoice	(CH_Guild, "None"        	, CH_NONE);
    Info_AddChoice 	(CH_Guild, "Fake Bandit"        , CH_FakeBandit);	    
};
func void CH_Guild_BACK()
{
	Info_ClearChoices	(CH_Guild);
};
FUNC VOID CH_FakeBandit()
{
	CreateInvItems (hero, ITAR_BDT_M,1);
	CreateInvItems (hero, ITAR_BDT_H,1);
	CreateInvItems (hero, ITAR_Thorus_Addon,1);
	AI_EquipBestArmor (hero);
};
func void CH_NOV()
{
	Info_ClearChoices	(CH_Guild);
	
	other.guild = GIL_NOV;
	Npc_SetTrueGuild (other, GIL_NOV);
	CreateInvItem(hero,ITAR_NOV_L);
	AI_EquipArmor(hero,ITAR_NOV_L);
	        
};  

func void CH_KDF()
{
	Info_ClearChoices	(CH_Guild);
	
	other.guild = GIL_KDF;
	Npc_SetTrueGuild (other, GIL_KDF);
	CreateInvItem(hero,ITAR_KDF_L);
	AI_EquipArmor(hero,ITAR_KDF_L);
	
};  

func void CH_SLD()
{
	Info_ClearChoices	(CH_Guild);
	
	other.guild = GIL_SLD;
	Npc_SetTrueGuild (other, GIL_SLD);
	CreateInvItem(hero,ITAR_SLD_M);
	AI_EquipArmor(hero,ITAR_SLD_M);
};  

func void CH_DJG()
{
	Info_ClearChoices	(CH_Guild);
	
	other.guild = GIL_DJG;
	Npc_SetTrueGuild (other, GIL_DJG);
	CreateInvItem(hero,ITAR_DJG_M);
	AI_EquipArmor(hero,ITAR_DJG_M);
};  

func void CH_MIL()
{
	Info_ClearChoices	(CH_Guild);
	
	other.guild = GIL_MIL;
	Npc_SetTrueGuild (other, GIL_MIL);
	CreateInvItem(hero,ITAR_MIL_L);
	AI_EquipArmor(hero,ITAR_MIL_L);
};  

func void CH_PAL()
{
	Info_ClearChoices	(CH_Guild);
	
	other.guild = GIL_PAL;
	Npc_SetTrueGuild (other, GIL_PAL);
	CreateInvItem(hero,ITAR_PAL_M);
	AI_EquipArmor(hero,ITAR_PAL_M);
	B_SetPaladinEquipment ();
};  

func void CH_NONE()
{
	Info_ClearChoices	(CH_Guild);
	
	other.guild = GIL_NONE;
	Npc_SetTrueGuild (other, GIL_NONE);
	AI_UnequipArmor(hero);
};  
	


//***************************************************************************
//	E1 Levelwahl und Lernpunkte
//***************************************************************************
//---------------------
var int LevelStart ;
//---------------------
INSTANCE CH_Level_Start (C_INFO)
{
	npc				= CH;
	condition		= CH_Level_Start_Condition;
	information		= CH_Level_Start_Info;
	description		= "Level, Lernpunkte und Gilde"; 
	permanent		=  TRUE;
};

FUNC INT CH_Level_Start_Condition()
{	
	if (LevelStart == FALSE)
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{
		return TRUE;
	};
};
func VOID CH_Level_Start_Info()
{
	LevelStart = TRUE; 
};
//***************************************************************************
//	E2 Level Stopper 
//***************************************************************************
INSTANCE CH_Level_Stopper (C_INFO)
{
	npc				= CH;
	nr 				= 99;
	condition		= CH_Level_Stopper_Condition;
	information		= CH_Level_Stopper_Info;
	description		= "ZURÜCK"; 
	permanent		=  TRUE;
};

FUNC INT CH_Level_Stopper_Condition()
{	
	if (LevelStart == TRUE)
	{
		return TRUE;
	};
};
func VOID CH_Level_Stopper_Info()
{
	Info_ClearChoices (CH_Level_Stopper);
	LevelStart = FALSE; 
};
//***************************************************************************
//	E2  Lernpunkte
//***************************************************************************
INSTANCE CH_Lernpunkte (C_INFO)
{
	npc				= CH;
	nr 				=  5;
	condition		= CH_Lernpunkte_Condition;
	information		= CH_Lernpunkte_Info;
	description		= "Lernpunkte"; 
	permanent		=  TRUE;
};

FUNC INT CH_Lernpunkte_Condition()
{	
	if (LevelStart == TRUE)
	{
		return TRUE;
	};
};
func VOID CH_Lernpunkte_Info()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	Info_AddChoice (CH_Lernpunkte,DIALOG_BACK      ,CH_Lernpunkte_BACK);
	Info_AddChoice (CH_Lernpunkte,"Lernpunkte + 50",CH_Lernpunkte_50);
	Info_AddChoice (CH_Lernpunkte,"Lernpunkte + 25",CH_Lernpunkte_25);
	Info_AddChoice (CH_Lernpunkte,"Lernpunkte + 10",CH_Lernpunkte_10);
	Info_AddChoice (CH_Lernpunkte,"Lernpunkte + 5 ",CH_Lernpunkte_5);
};
FUNC VOID CH_Lernpunkte_BACK ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
};
FUNC VOID CH_Lernpunkte_50 ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	hero.LP = (hero.LP + 50);
	PrintScreen  ("+ 50 Lernpunkte", -1,-1,FONT_Screen,3);
	Snd_Play ("LEVELUP");    
};
FUNC VOID CH_Lernpunkte_25 ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	hero.LP = (hero.LP + 25);
	PrintScreen  ("+ 25 Lernpunkte", -1,-1,FONT_Screen,3);
	 Snd_Play ("LEVELUP");    
};
FUNC VOID CH_Lernpunkte_10 ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	hero.LP = (hero.LP + 10);
	PrintScreen  ("+ 10 Lernpunkte", -1,-1,FONT_Screen,3);
	 Snd_Play ("LEVELUP");    
};
FUNC VOID CH_Lernpunkte_5 ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	hero.LP = (hero.LP + 5);
	PrintScreen  ("+ 5 Lernpunkte", -1,-1,FONT_Screen,3);
	 Snd_Play ("LEVELUP");    
};
//***************************************************************************
//	Levelwahl 1- 25
//***************************************************************************
INSTANCE CH_Level_niedrig (C_INFO)
{
	npc				= CH;
	nr 				=  2;
	condition		= CH_Level_niedrig_Condition;
	information		= CH_Level_niedrig_Info;
	description		= "Level Wahl 1 - 25"; 
	permanent		=  TRUE;
};

FUNC INT CH_Level_niedrig_Condition()
{	
	if (LevelStart == TRUE)
	{
		return TRUE;
	};
};
func VOID CH_Level_niedrig_Info()
{

	Info_ClearChoices	(CH_Level_niedrig);
	
	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK	   , CH_Level_niedrig_BACK);
	
	Info_AddChoice		(CH_Level_niedrig, "Level 21 - 25" , CH_Level21);
	Info_AddChoice		(CH_Level_niedrig, "Level 16 - 20" , CH_Level16);
	Info_AddChoice		(CH_Level_niedrig, "Level 11 - 15" , CH_Level11);
	Info_AddChoice		(CH_Level_niedrig, "Level  6 - 10" , CH_Level6);
	Info_AddChoice		(CH_Level_niedrig, "Level  1 -  5" , CH_Level1);

};
//***************************************************************************
//	Levelwahl 26 - 50
//***************************************************************************
INSTANCE CH_Level_hoch (C_INFO)
{
	npc				= CH;
	nr 				=  3;
	condition		= CH_Level_hoch_Condition;
	information		= CH_Level_hoch_Info;
	description		= "Level Wahl 26 - 50"; 
	permanent		=  TRUE;
};

FUNC INT CH_Level_hoch_Condition()
{	
	if (LevelStart == TRUE)
	{
		return TRUE;
	};
};
func VOID CH_Level_hoch_Info()
{

	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch, DIALOG_BACK	   , CH_Level_hoch_BACK);
	
	Info_AddChoice		(CH_Level_hoch, "Level 46 - 50" , CH_Level46);
	Info_AddChoice		(CH_Level_hoch, "Level 41 - 45" , CH_Level41);
	Info_AddChoice		(CH_Level_hoch, "Level 36 - 40" , CH_Level36);
	Info_AddChoice		(CH_Level_hoch, "Level 31 - 35" , CH_Level31);
	Info_AddChoice		(CH_Level_hoch, "Level 26 - 30" , CH_Level26);
};
//***************************************************************************
//	Level Funcs
//***************************************************************************
func void CH_Level46()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 50" , CH_Level_50);
	Info_AddChoice		(CH_Level_hoch, "Level 49" , CH_Level_49);
	Info_AddChoice		(CH_Level_hoch, "Level 48" , CH_Level_48);
	Info_AddChoice		(CH_Level_hoch, "Level 47" , CH_Level_47);
	Info_AddChoice		(CH_Level_hoch, "Level 46" , CH_Level_46);
};
func void CH_Level41()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 45" , CH_Level_45);
	Info_AddChoice		(CH_Level_hoch, "Level 44" , CH_Level_44);
	Info_AddChoice		(CH_Level_hoch, "Level 43" , CH_Level_43);
	Info_AddChoice		(CH_Level_hoch, "Level 42" , CH_Level_42);
	Info_AddChoice		(CH_Level_hoch, "Level 41" , CH_Level_41);
};
func void CH_Level36()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 40" , CH_Level_40);
	Info_AddChoice		(CH_Level_hoch, "Level 39" , CH_Level_39);
	Info_AddChoice		(CH_Level_hoch, "Level 38" , CH_Level_38);
	Info_AddChoice		(CH_Level_hoch, "Level 37" , CH_Level_37);
	Info_AddChoice		(CH_Level_hoch, "Level 36" , CH_Level_36);
};
func void CH_Level31()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 35" , CH_Level_35);
	Info_AddChoice		(CH_Level_hoch, "Level 34" , CH_Level_34);
	Info_AddChoice		(CH_Level_hoch, "Level 33" , CH_Level_33);
	Info_AddChoice		(CH_Level_hoch, "Level 32" , CH_Level_32);
	Info_AddChoice		(CH_Level_hoch, "Level 31" , CH_Level_31);
};

func void CH_Level26()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 30" , CH_Level_30);
	Info_AddChoice		(CH_Level_hoch, "Level 29" , CH_Level_29);
	Info_AddChoice		(CH_Level_hoch, "Level 28" , CH_Level_28);
	Info_AddChoice		(CH_Level_hoch, "Level 27" , CH_Level_27);
	Info_AddChoice		(CH_Level_hoch, "Level 26" , CH_Level_26);
};  
func void CH_Level21()
{
	Info_ClearChoices	(CH_Level_niedrig);
	
	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK		, CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 25" , CH_Level_25);
	Info_AddChoice		(CH_Level_niedrig, "Level 24" , CH_Level_24);
	Info_AddChoice		(CH_Level_niedrig, "Level 23" , CH_Level_23);
	Info_AddChoice		(CH_Level_niedrig, "Level 22" , CH_Level_22);
	Info_AddChoice		(CH_Level_niedrig, "Level 21" , CH_Level_21);
	
};  
func void CH_Level16()
{
	Info_ClearChoices	(CH_Level_niedrig);
	
	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK		, CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 20" , CH_Level_20);
	Info_AddChoice		(CH_Level_niedrig, "Level 19" , CH_Level_19);
	Info_AddChoice		(CH_Level_niedrig, "Level 18" , CH_Level_18);
	Info_AddChoice		(CH_Level_niedrig, "Level 17" , CH_Level_17);
	Info_AddChoice		(CH_Level_niedrig, "Level 16" , CH_Level_16);
};

func void CH_Level11()
{
	Info_ClearChoices	(CH_Level_niedrig);

	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK		, CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 15" , CH_Level_15);
	Info_AddChoice		(CH_Level_niedrig, "Level 14" , CH_Level_14);
	Info_AddChoice		(CH_Level_niedrig, "Level 13" , CH_Level_13);
	Info_AddChoice		(CH_Level_niedrig, "Level 12" , CH_Level_12);
	Info_AddChoice		(CH_Level_niedrig, "Level 11" , CH_Level_11);
};
func void CH_Level6()
{
	Info_ClearChoices	(CH_Level_niedrig);

	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK	    , CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 10" , CH_Level_10);
	Info_AddChoice		(CH_Level_niedrig, "Level  9" , CH_Level_9);
	Info_AddChoice		(CH_Level_niedrig, "Level  8" , CH_Level_8);
	Info_AddChoice		(CH_Level_niedrig, "Level  7" , CH_Level_7);
	Info_AddChoice		(CH_Level_niedrig, "Level  6" , CH_Level_6);
};

func void CH_Level1()
{
	Info_ClearChoices	(CH_Level_niedrig);

	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK		, CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 5" 	, CH_Level_5);
	Info_AddChoice		(CH_Level_niedrig, "Level 4" 	, CH_Level_4);
	Info_AddChoice		(CH_Level_niedrig, "Level 3" 	, CH_Level_3);
	Info_AddChoice		(CH_Level_niedrig, "Level 2" 	, CH_Level_2);
	Info_AddChoice		(CH_Level_niedrig, "Level 1" 	, CH_Level_1);
};
func void CH_Level_niedrig_BACK()
{
	Info_ClearChoices	(CH_Level_niedrig);
};
func void CH_Level_hoch_BACK()
{
	Info_ClearChoices	(CH_Level_hoch);
};

func void CH_Level_1()
{ 
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 1;
    
    
      B_SetHeroExp();
	  B_SetHeroWeapon();	
	  B_SetHeroEquipment();
};

func void CH_Level_2()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 2;
  
    
      B_SetHeroExp();
      B_SetHeroWeapon();
      B_SetHeroEquipment();
};

func void CH_Level_3()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 3;
  
    
      B_SetHeroExp();
      B_SetHeroWeapon();
      B_SetHeroEquipment();
};

func void CH_Level_4()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 4;
  
    
       B_SetHeroExp();
       B_SetHeroWeapon();
       B_SetHeroEquipment();
};

func void CH_Level_5()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 5;
  
    
     B_SetHeroExp();
     B_SetHeroWeapon();
     B_SetHeroEquipment();
};

func void CH_Level_6()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 6;
   
    
 	   B_SetHeroExp();
 	   B_SetHeroWeapon();
 	   B_SetHeroEquipment();
};

func void CH_Level_7()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 7;
    
    
      B_SetHeroExp();
      B_SetHeroWeapon();
      B_SetHeroEquipment();
};

func void CH_Level_8()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 8;
   
    
     B_SetHeroExp();
     B_SetHeroWeapon();
     B_SetHeroEquipment();
};

func void CH_Level_9()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 9;
    
    
       B_SetHeroExp();
       B_SetHeroWeapon();
       B_SetHeroEquipment();
};

func void CH_Level_10()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 10;
  
    
      B_SetHeroExp();
      B_SetHeroWeapon();
      B_SetHeroEquipment();
};

func void CH_Level_11()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 11;

    
 	   B_SetHeroExp();
 	   B_SetHeroWeapon();
 	   B_SetHeroEquipment();
};

func void CH_Level_12()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 12;
   
    
      B_SetHeroExp();
	  B_SetHeroWeapon();
	  B_SetHeroEquipment();
};

func void CH_Level_13()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 13;
   
    
      B_SetHeroExp();
	  B_SetHeroWeapon();
	  B_SetHeroEquipment();
};

func void CH_Level_14()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 14;
  
    
     B_SetHeroExp();
	 B_SetHeroWeapon();
	 B_SetHeroEquipment();
};

func void CH_Level_15()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 15;
   
    
 	   B_SetHeroExp();
	   B_SetHeroWeapon();
	   B_SetHeroEquipment();
};

func void CH_Level_16()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 16;
  
    
     B_SetHeroExp();
	 B_SetHeroWeapon();
	 B_SetHeroEquipment();
};

func void CH_Level_17()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 17;
    
    
 	 B_SetHeroExp();
	 B_SetHeroWeapon();
	 B_SetHeroEquipment();
};

func void CH_Level_18()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 18;
    
    
      B_SetHeroExp();
	  B_SetHeroWeapon();
	  B_SetHeroEquipment();
};	

func void CH_Level_19()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 19;
  
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_20()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 20;
 
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_21()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 21;
 
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_22()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 22;
 
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_23()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 23;
  
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_24()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 24;
  
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_25()
{
	Info_ClearChoices	(CH_Level_niedrig);

    hero.level = 25;
   
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_26()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 26;
  
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_27()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 27;
  
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_28()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 28;
  
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_29()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 29;
 
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_30()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 30;
 
    
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_31()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 31;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_32()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 32;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_33()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 33;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_34()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 34;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_35()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 35;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_36()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 36;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_37()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 37;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_38()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 38;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_39()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 39;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_40()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 40;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_41()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 41;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_42()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 42;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_43()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 43;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_44()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 44;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_45()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 45;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_46()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 46;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_47()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 47;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_48()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 48;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_49()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 49;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};
func void CH_Level_50()
{
	Info_ClearChoices	(CH_Level_hoch);

    hero.level = 50;
 
    B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};//*********************************************
//Geschick und Stärke
//*********************************************
//---------------------------
var int AttributeStart;
//---------------------------
INSTANCE DIA_CH_Attribute_Start (C_INFO)
{
	npc			= CH;
	nr			= 3;
	condition	= DIA_CH_Attribute_Start_Condition;
	information	= DIA_CH_Attribute_Start_Info;
	permanent	= TRUE;
	description = "Stärke und Geschick";
};                       

FUNC INT DIA_CH_Attribute_Start_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Attribute_Start_Info()
{
	AttributeStart = TRUE;
};
//*********************************************
// Attribute Stopper
//*********************************************
INSTANCE DIA_CH_Attribute_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Attribute_Stopper_Condition;
	information	= DIA_CH_Attribute_Stopper_Info;
	permanent	= TRUE;
	description = "ZURÜCK";
};                       

FUNC INT DIA_CH_Attribute_Stopper_Condition()
{
	if (AttributeStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Attribute_Stopper_Info()
{
	AttributeStart = FALSE;
};
//*********************************************
// Attribute Stärke 
//*********************************************
INSTANCE DIA_CH_Strength (C_INFO)
{
	npc			= CH;
	nr			= 2;
	condition	= DIA_CH_Strength_Condition;
	information	= DIA_CH_Strength_Info;
	permanent	= TRUE;
	description = "Stärke steigern";
};                       

FUNC INT DIA_CH_Strength_Condition()
{
	if (AttributeStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Strength_Info()
{
	Info_ClearChoices (DIA_CH_Strength);
	Info_AddChoice 	  (DIA_CH_Strength, DIALOG_BACK, DIA_CH_Strength_BACK);
	
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 20"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*20)		,DIA_CH_Strength_20);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 10"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*10)		,DIA_CH_Strength_10);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 5"			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_CH_Strength_5);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 1"			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_CH_Strength_1);
	
	
};
FUNC VOID DIA_CH_Strength_BACK()
{
	Info_ClearChoices (DIA_CH_Strength);
};
FUNC VOID DIA_CH_Strength_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices (DIA_CH_Strength);
	Info_AddChoice 	  (DIA_CH_Strength, DIALOG_BACK, DIA_CH_Strength_BACK);
	
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 20"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*20)		,DIA_CH_Strength_20);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 10"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*10)		,DIA_CH_Strength_10);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 5"			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_CH_Strength_5);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 1"			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_CH_Strength_1);
};
FUNC VOID DIA_CH_Strength_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices (DIA_CH_Strength);
	Info_AddChoice 	  (DIA_CH_Strength, DIALOG_BACK, DIA_CH_Strength_BACK);
	
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 20"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*20)		,DIA_CH_Strength_20);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 10"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*10)		,DIA_CH_Strength_10);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 5"			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_CH_Strength_5);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 1"			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_CH_Strength_1);
};
FUNC VOID DIA_CH_Strength_10()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 10, T_MAX);
	
	Info_ClearChoices (DIA_CH_Strength);
	Info_AddChoice 	  (DIA_CH_Strength, DIALOG_BACK, DIA_CH_Strength_BACK);
	
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 20"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*20)		,DIA_CH_Strength_20);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 10"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*10)		,DIA_CH_Strength_10);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 5"			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_CH_Strength_5);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 1"			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_CH_Strength_1);
};
FUNC VOID DIA_CH_Strength_20()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 20, T_MAX);
	
	Info_ClearChoices (DIA_CH_Strength);
	Info_AddChoice 	  (DIA_CH_Strength, DIALOG_BACK, DIA_CH_Strength_BACK);
	
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 20"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*20)		,DIA_CH_Strength_20);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 10"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*10)		,DIA_CH_Strength_10);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 5"			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_CH_Strength_5);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Stärke + 1"			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_CH_Strength_1);
};
//******************************************************************************************
// Attribut Geschicklichkeit 
//******************************************************************************************
INSTANCE DIA_CH_Dex (C_INFO)
{
	npc			= CH;
	nr			= 3;
	condition	= DIA_CH_Dex_Condition;
	information	= DIA_CH_Dex_Info;
	permanent	= TRUE;
	description = "Geschicklichkeit steigern";
};                       

FUNC INT DIA_CH_Dex_Condition()
{
	if (AttributeStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dex_Info()
{
	Info_ClearChoices (DIA_CH_Dex);
	Info_AddChoice 	  (DIA_CH_Dex, DIALOG_BACK, DIA_CH_Dex_BACK);
	
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 20"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*20)		,DIA_CH_DEX_20);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 10"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*10)		,DIA_CH_DEX_10);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 5"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_CH_DEX_5);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 1"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_CH_DEX_1);
};
FUNC VOID DIA_CH_Dex_BACK()
{
	Info_ClearChoices (DIA_CH_Dex);
};
// ------ 1 Geschick ------
func void DIA_CH_DEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices (DIA_CH_Dex);
	Info_AddChoice (DIA_CH_Dex, DIALOG_BACK, DIA_CH_Dex_BACK);
	
	
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 20"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*20)		,DIA_CH_DEX_20);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 10"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*10)		,DIA_CH_DEX_10);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 5"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_CH_DEX_5);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 1"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_CH_DEX_1);
};

// ------ 5 Geschick ------
func void DIA_CH_DEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices (DIA_CH_Dex);
	Info_AddChoice (DIA_CH_Dex, DIALOG_BACK, DIA_CH_Dex_BACK);
	
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 20"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*20)		,DIA_CH_DEX_20);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 10"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*10)		,DIA_CH_DEX_10);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 5"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_CH_DEX_5);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 1"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_CH_DEX_1);
};
// ------ 10 Geschick ------
func void DIA_CH_DEX_10()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 10, T_MAX);
	
	Info_ClearChoices (DIA_CH_Dex);
	Info_AddChoice (DIA_CH_Dex, DIALOG_BACK, DIA_CH_Dex_BACK);
	
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 20"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*20)		,DIA_CH_DEX_20);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 10"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*10)		,DIA_CH_DEX_10);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 5"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_CH_DEX_5);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 1"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_CH_DEX_1);
};
// ------ 20 Geschick ------
func void DIA_CH_DEX_20()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 20, T_MAX);
	
	Info_ClearChoices (DIA_CH_Dex);
	Info_AddChoice (DIA_CH_Dex, DIALOG_BACK, DIA_CH_Dex_BACK);
	
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 20"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*20)		,DIA_CH_DEX_20);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 10"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*10)		,DIA_CH_DEX_10);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 5"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_CH_DEX_5);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Geschick + 1"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_CH_DEX_1);
};

//******************************************************************************************
// MAGIE: Mana, Runen, Kreise
//******************************************************************************************
//---------------------------
var int MagieStart;
//---------------------------
INSTANCE DIA_CH_MAGIE (C_INFO)
{
	npc			= CH;
	nr			= 3;
	condition	= DIA_CH_MAGIE_Condition;
	information	= DIA_CH_MAGIE_Info;
	permanent	= TRUE;
	description = "MAGIE: Mana, Runen, Kreise";
};                       

FUNC INT DIA_CH_MAGIE_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_MAGIE_Info()
{
	MagieStart = TRUE;
};
//*********************************************
// MAGIE Stopper
//*********************************************

INSTANCE DIA_CH_MAGIE_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_MAGIE_Stopper_Condition;
	information	= DIA_CH_MAGIE_Stopper_Info;
	permanent	= TRUE;
	description = "ZURÜCK";
};                       

FUNC INT DIA_CH_MAGIE_Stopper_Condition()
{
	if (MagieStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_MAGIE_Stopper_Info()
{
	MagieStart = FALSE;
};
//*********************************************
// Mana
//*********************************************

INSTANCE DIA_CH_Mana (C_INFO)
{
	npc			= CH;
	nr			= 3;
	condition	= DIA_CH_Mana_Condition;
	information	= DIA_CH_Mana_Info;
	permanent	= TRUE;
	description = "Mana steigern";
};                       

FUNC INT DIA_CH_Mana_Condition()
{ 
	if (MagieStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Mana_Info()
{
	Info_ClearChoices (DIA_CH_Mana);

	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 20"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*20)		,DIA_CH_MANA_20);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 10"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*10)		,DIA_CH_MANA_10);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 5"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_CH_MANA_5);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 1"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_CH_MANA_1);
	
};
FUNC VOID DIA_CH_Mana_BACK()
{
	Info_ClearChoices (DIA_CH_Mana);
};
// ------ 1 Mana ------
func void DIA_CH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MAX);

	Info_ClearChoices (DIA_CH_Mana);
	Info_AddChoice (DIA_CH_Mana, DIALOG_BACK, DIA_CH_Mana_BACK);
	
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 20"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*20)		,DIA_CH_MANA_20);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 10"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*10)		,DIA_CH_MANA_10);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 5"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_CH_MANA_5);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 1"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_CH_MANA_1);
};

// ------ 5 Mana ------
func void DIA_CH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MAX);
	
	Info_ClearChoices (DIA_CH_Mana);
	Info_AddChoice 	  (DIA_CH_Mana, DIALOG_BACK, DIA_CH_Mana_BACK);
	
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 20"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*20)		,DIA_CH_MANA_20);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 10"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*10)		,DIA_CH_MANA_10);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 5"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_CH_MANA_5);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 1"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_CH_MANA_1);
};
// ------ 10 Mana ------
func void DIA_CH_MANA_10()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 10, T_MAX);
	
	Info_ClearChoices (DIA_CH_Mana);
	Info_AddChoice (DIA_CH_Mana, DIALOG_BACK, DIA_CH_Mana_BACK);
	
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 20"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*20)		,DIA_CH_MANA_20);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 10"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*10)		,DIA_CH_MANA_10);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 5"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_CH_MANA_5);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 1"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_CH_MANA_1);
};
// ------ 20 Mana ------
func void DIA_CH_MANA_20()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 20, T_MAX);
	
	Info_ClearChoices (DIA_CH_Mana);
	Info_AddChoice (DIA_CH_Mana, DIALOG_BACK, DIA_CH_Mana_BACK);
	
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 20"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*20)		,DIA_CH_MANA_20);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 10"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*10)		,DIA_CH_MANA_10);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 5"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_CH_MANA_5);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 1"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_CH_MANA_1);
};
//*********************************************
// Kreise
//*********************************************

INSTANCE DIA_CH_KREISE (C_INFO)
{
	npc			= CH;
	nr			= 4;
	condition	= DIA_CH_KREISE_Condition;
	information	= DIA_CH_KREISE_Info;
	permanent	= TRUE;
	description = "Die magischen Kreise";
};                       

FUNC INT DIA_CH_KREISE_Condition()
{
	if (MagieStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_KREISE_Info()
{
	Info_ClearChoices (DIA_CH_KREISE);
	Info_AddChoice	  (DIA_CH_KREISE, DIALOG_BACK, CH_KREISE_BACK);
	
	//Info_AddChoice	  (DIA_CH_KREISE,"Paladin-Runen",  CH_Training_Runen_Paladin);
	
	Info_AddChoice 	  (DIA_CH_KREISE,"Sechster Kreis",CH_KREISE_6);
	Info_AddChoice 	  (DIA_CH_KREISE,"Fünfter Kreis", CH_KREISE_5);
	Info_AddChoice 	  (DIA_CH_KREISE,"Vierter Kreis", CH_KREISE_4);
	Info_AddChoice 	  (DIA_CH_KREISE,"Dritter Kreis", CH_KREISE_3);
	Info_AddChoice 	  (DIA_CH_KREISE,"Zweiter Kreis", CH_KREISE_2);
	Info_AddChoice 	  (DIA_CH_KREISE,"Erster Kreis",  CH_KREISE_1);  
	
};
//***************************************************************************
// Talente Magische Kreise
//***************************************************************************
FUNC VOID CH_KREISE_BACK()
{
	Info_ClearChoices (DIA_CH_KREISE);
};
FUNC VOID CH_KREISE_1()
{
	Info_ClearChoices (DIA_CH_KREISE);
	B_TeachMagicCircle (self, other, 1);
	B_SetKDFRunes ();
};
FUNC VOID CH_KREISE_2()
{
	Info_ClearChoices (DIA_CH_KREISE);
	B_TeachMagicCircle (self, other, 2);
	B_SetKDFRunes ();
};
FUNC VOID CH_KREISE_3()
{
	Info_ClearChoices (DIA_CH_KREISE);
	B_TeachMagicCircle (self, other, 3);
	B_SetKDFRunes ();
};
FUNC VOID CH_KREISE_4()
{
	Info_ClearChoices (DIA_CH_KREISE);
	B_TeachMagicCircle (self, other, 4);
	B_SetKDFRunes ();
};
FUNC VOID CH_KREISE_5()
{
	Info_ClearChoices (DIA_CH_KREISE);
	B_TeachMagicCircle (self, other, 5);
	B_SetKDFRunes ();
};
FUNC VOID CH_KREISE_6()
{
	Info_ClearChoices (DIA_CH_KREISE);
	B_TeachMagicCircle (self, other, 6);
	B_SetKDFRunes ();
};
//*********************************************
// Runen
//*********************************************

INSTANCE DIA_CH_Runen (C_INFO)
{
	npc			= CH;
	nr			= 5;
	condition	= DIA_CH_Runen_Condition;
	information	= DIA_CH_Runen_Info;
	permanent	= TRUE;
	description = "Runen basteln";
};                       

FUNC INT DIA_CH_Runen_Condition()
{
	if (MagieStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Runen_Info()
{
	
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice	  (DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_BACK);
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice		(DIA_CH_Runen, B_BuildLearnString("6. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 6))			,DIA_CH_Runen_6);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice		(DIA_CH_Runen, B_BuildLearnString("5. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 5))			,DIA_CH_Runen_5);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice		(DIA_CH_Runen, B_BuildLearnString("4. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 4))			,DIA_CH_Runen_4);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice		(DIA_CH_Runen, B_BuildLearnString("3. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 3))			,DIA_CH_Runen_3);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice		(DIA_CH_Runen, B_BuildLearnString("2. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 2))			,DIA_CH_Runen_2);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 1)
	{ 
		Info_AddChoice		(DIA_CH_Runen, B_BuildLearnString("1. Kreis der Magie"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 1))			,DIA_CH_Runen_1);
	};
};
//**********************************************************
// BACK
//**********************************************************
FUNC VOID DIA_CH_Runen_BACK()
{
	Info_ClearChoices (DIA_CH_Runen);
};
//**********************************************************
// Erster Kreis 
//**********************************************************
FUNC VOID DIA_CH_Runen_1 ()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice	(DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_BACK);
	
	if	(PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)) ,CH_Training_Runen_Circle_1_SPL_SummonGoblinSkeleton);
	};
	if (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_LightHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightHeal)) ,CH_Training_Runen_Circle_1_SPL_LightHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_Zap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Zap)) ,CH_Training_Runen_Circle_1_SPL_Zap);
	};
	if (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_Firebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firebolt)) ,CH_Training_Runen_Circle_1_SPL_Firebolt);
	};
	if (PLAYER_TALENT_RUNES [SPL_LIGHT] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_LIGHT, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LIGHT)) ,CH_Training_Runen_Circle_1_SPL_LIGHT);
	};
};
//**********************************************************
FUNC VOID CH_Training_Runen_Circle_1_SPL_LIGHT()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LIGHT);	
	
};
FUNC VOID CH_Training_Runen_Circle_1_SPL_Firebolt()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firebolt);	
	
};
FUNC VOID CH_Training_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Zap);	
};
FUNC VOID CH_Training_Runen_Circle_1_SPL_LightHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightHeal);	

};
FUNC VOID CH_Training_Runen_Circle_1_SPL_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
	
};
//**********************************************************
// Zweiter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_CH_Runen_2()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice	(DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,CH_Training_Runen_Circle_2_SPL_InstantFireball);
	};
	if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,CH_Training_Runen_Circle_2_SPL_Icebolt);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,CH_Training_Runen_Circle_2_SPL_SummonWolf);
	};
	if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,CH_Training_Runen_Circle_2_SPL_WINDFIST);
	};
	if (PLAYER_TALENT_RUNES [SPL_Sleep] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_Sleep, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Sleep)) ,CH_Training_Runen_Circle_2_SPL_Sleep);
	};
};
//**********************************************************

FUNC VOID CH_Training_Runen_Circle_2_SPL_InstantFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID CH_Training_Runen_Circle_2_SPL_Icebolt()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
FUNC VOID CH_Training_Runen_Circle_2_SPL_SummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	

};
FUNC VOID CH_Training_Runen_Circle_2_SPL_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	

};
FUNC VOID CH_Training_Runen_Circle_2_SPL_Sleep()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Sleep);	
	
};
//**********************************************************
// Dritter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_CH_Runen_3()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice	(DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_MediumHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MediumHeal)) ,CH_Training_Runen_Circle_3_SPL_MediumHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_ChargeZap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeZap)) ,CH_Training_Runen_Circle_4_SPL_ThunderBall);
	};
	if (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_Firestorm, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firestorm)) ,CH_Training_Runen_Circle_5_SPL_Firestorm);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,CH_Training_Runen_Circle_3_SPL_SummonSkeleton);
	};
	if (PLAYER_TALENT_RUNES [SPL_Fear] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_Fear, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Fear)) ,CH_Training_Runen_Circle_3_SPL_Fear);
	};
	if (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_IceCube, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceCube)) ,CH_Training_Runen_Circle_3_SPL_IceCube);
	};
};
//**********************************************************
FUNC VOID CH_Training_Runen_Circle_3_SPL_MediumHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MediumHeal);	
	
};
FUNC VOID CH_Training_Runen_Circle_3_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightningFlash);	
	
};
FUNC VOID CH_Training_Runen_Circle_3_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball);	
	
};
FUNC VOID CH_Training_Runen_Circle_3_SPL_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
	
};
FUNC VOID CH_Training_Runen_Circle_3_SPL_Fear()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Fear);	
	
};
FUNC VOID CH_Training_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceCube);	

};
//**********************************************************
// Vierter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_CH_Runen_4()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice	(DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_BACK);
	
	
	if (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,CH_Training_Runen_Circle_4_SPL_SummonGolem);
	};
	if (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_DestroyUndead, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_DestroyUndead)) ,CH_Training_Runen_Circle_4_SPL_DestroyUndead);
	};
	
	if (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_LightningFlash, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightningFlash)) ,CH_Training_Runen_Circle_3_SPL_LightningFlash);
	};
	if (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_ChargeFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeFireball)) ,CH_Training_Runen_Circle_3_SPL_ChargeFireball);
	};
};
//**********************************************************
FUNC VOID CH_Training_Runen_Circle_4_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeZap);		
};
FUNC VOID CH_Training_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);		
};
FUNC VOID CH_Training_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes (self, other, SPL_DestroyUndead);		
};
FUNC VOID CH_Training_Runen_Circle_4_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis);		
};
//**********************************************************
// Fünfter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_CH_Runen_5()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice	(DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_BACK);
	
	
	if (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_IceWave, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceWave)) ,CH_Training_Runen_Circle_5_SPL_IceWave);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,CH_Training_Runen_Circle_5_SPL_SummonDemon);
	};
	if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_FullHeal)) ,CH_Training_Runen_Circle_5_SPL_FullHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE) 
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_Pyrokinesis, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Pyrokinesis)) ,CH_Training_Runen_Circle_4_SPL_Pyrokinesis);
	};
};
//**********************************************************
FUNC VOID CH_Training_Runen_Circle_5_SPL_Firestorm()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firestorm);	
};
FUNC VOID CH_Training_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceWave);	
};
FUNC VOID CH_Training_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID CH_Training_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_FullHeal);	
};
//**********************************************************
// Sechster Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_CH_Runen_6()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice	(DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,CH_Training_Runen_Circle_6_SPL_Firerain);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,CH_Training_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,CH_Training_Runen_Circle_6_SPL_MassDeath);
	};
	if (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,CH_Training_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Runen, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,CH_Training_Runen_Circle_6_SPL_Shrink);
	};
};
//**********************************************************
FUNC VOID CH_Training_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID CH_Training_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID CH_Training_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID CH_Training_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
FUNC VOID CH_Training_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};

//***************************************************************************************************************************************
// Kampftalente
//***************************************************************************************************************************************



//*********************************************
//KampfStart 
//*********************************************
//----------------------------
var int KampfStart;
//----------------------------
INSTANCE DIA_CH_Kampf_Start (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Kampf_Start_Condition;
	information	= DIA_CH_Kampf_Start_Info;
	permanent	= TRUE;
	description = "Kampftalente (Nah - und Fernkampf)";
};                       

FUNC INT DIA_CH_Kampf_Start_Condition()
{
	if (KampfStart == FALSE)
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (LevelStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Start_Info()
{
	KampfStart = TRUE;
};
//*********************************************
//Kampf Stopper
//*********************************************
INSTANCE DIA_CH_Kampf_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Kampf_Stopper_Condition;
	information	= DIA_CH_Kampf_Stopper_Info;
	permanent	= TRUE;
	description = "ZURÜCK";
};                       

FUNC INT DIA_CH_Kampf_Stopper_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Stopper_Info()
{
	KampfStart = FALSE;
};
//*********************************************
//Kampf Einhand
//*********************************************
INSTANCE DIA_CH_Kampf_Einhand (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Kampf_Einhand_Condition;
	information	= DIA_CH_Kampf_Einhand_Info;
	permanent	= TRUE;
	description = "Einhandwaffen";
};                       

FUNC INT DIA_CH_Kampf_Einhand_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Einhand_Info()
{
	Info_ClearChoices (DIA_CH_Kampf_Einhand);
	Info_AddChoice	  (DIA_CH_Kampf_Einhand, DIALOG_BACK, DIA_CH_Kampf_Einhand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*20)		,CH_Training_Combat_1H_20);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*10)		,CH_Training_Combat_1H_10);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)		,CH_Training_Combat_1H_5);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))		,CH_Training_Combat_1H_1);
};
FUNC VOID DIA_CH_Kampf_Einhand_BACK()
{
	Info_ClearChoices (DIA_CH_Kampf_Einhand);
};
// ------ 1% Waffentalent ------
func void CH_Training_Combat_1H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100);
	
	Info_ClearChoices	(DIA_CH_Kampf_Einhand);
	Info_AddChoice	    (DIA_CH_Kampf_Einhand, DIALOG_BACK, DIA_CH_Kampf_Einhand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*20)		,CH_Training_Combat_1H_20);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*10)		,CH_Training_Combat_1H_10);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)		,CH_Training_Combat_1H_5);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))		,CH_Training_Combat_1H_1);
};

// ------ 5% Waffentalent ------
func void CH_Training_Combat_1H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100);
	
	Info_ClearChoices	(DIA_CH_Kampf_Einhand);
	Info_AddChoice	    (DIA_CH_Kampf_Einhand, DIALOG_BACK, DIA_CH_Kampf_Einhand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*20)		,CH_Training_Combat_1H_20);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*10)		,CH_Training_Combat_1H_10);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,CH_Training_Combat_1H_5);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,CH_Training_Combat_1H_1);
};

// ------ 10% Waffentalent ------
func void CH_Training_Combat_1H_10()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 10, 100);
	
	Info_ClearChoices	(DIA_CH_Kampf_Einhand);
	Info_AddChoice	    (DIA_CH_Kampf_Einhand, DIALOG_BACK, DIA_CH_Kampf_Einhand_BACK);

	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*20)		,CH_Training_Combat_1H_20);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*10)		,CH_Training_Combat_1H_10);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,CH_Training_Combat_1H_5);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,CH_Training_Combat_1H_1);
};

// ------20% Waffentalent ------
func void CH_Training_Combat_1H_20()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 20, 100);
	
	Info_ClearChoices	(DIA_CH_Kampf_Einhand);
	Info_AddChoice	    (DIA_CH_Kampf_Einhand, DIALOG_BACK, DIA_CH_Kampf_Einhand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*20)		,CH_Training_Combat_1H_20);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*10)		,CH_Training_Combat_1H_10);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)			,CH_Training_Combat_1H_5);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("Einhand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,CH_Training_Combat_1H_1);
};
//******************************************************************************************
//Kampf Zweihand
//******************************************************************************************
INSTANCE DIA_CH_Kampf_Zweihand (C_INFO)
{
	npc			= CH;
	nr			= 7;
	condition	= DIA_CH_Kampf_Zweihand_Condition;
	information	= DIA_CH_Kampf_Zweihand_Info;
	permanent	= TRUE;
	description = "Zweihandwaffen";
};                       

FUNC INT DIA_CH_Kampf_Zweihand_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Zweihand_Info()
{
	Info_ClearChoices (DIA_CH_Kampf_Zweihand );
	Info_AddChoice	  (DIA_CH_Kampf_Zweihand , DIALOG_BACK, DIA_CH_Kampf_Zweihand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*20)			,CH_Training_Combat_2H_20);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*10)			,CH_Training_Combat_2H_10);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)				,CH_Training_Combat_2H_5);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))				,CH_Training_Combat_2H_1);
};
FUNC VOID DIA_CH_Kampf_Zweihand_BACK()
{
	Info_ClearChoices (DIA_CH_Kampf_Zweihand );
};
// ------ 1% Waffentalent ------
func void CH_Training_Combat_2H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices (DIA_CH_Kampf_Zweihand );
	Info_AddChoice	  (DIA_CH_Kampf_Zweihand , DIALOG_BACK, DIA_CH_Kampf_Zweihand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*20)			,CH_Training_Combat_2H_20);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*10)			,CH_Training_Combat_2H_10);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)				,CH_Training_Combat_2H_5);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))				,CH_Training_Combat_2H_1);
};

// ------ 5% Waffentalent ------
func void CH_Training_Combat_2H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices (DIA_CH_Kampf_Zweihand );
	Info_AddChoice	  (DIA_CH_Kampf_Zweihand , DIALOG_BACK, DIA_CH_Kampf_Zweihand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*20)			,CH_Training_Combat_2H_20);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*10)			,CH_Training_Combat_2H_10);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)				,CH_Training_Combat_2H_5);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))				,CH_Training_Combat_2H_1);
};

// ------ 10% Waffentalent ------
func void CH_Training_Combat_2H_10()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 10, 100);
	
	Info_ClearChoices (DIA_CH_Kampf_Zweihand );
	Info_AddChoice	  (DIA_CH_Kampf_Zweihand , DIALOG_BACK, DIA_CH_Kampf_Zweihand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*20)			,CH_Training_Combat_2H_20);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*10)			,CH_Training_Combat_2H_10);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)				,CH_Training_Combat_2H_5);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))				,CH_Training_Combat_2H_1);
};

// ------20% Waffentalent ------
func void CH_Training_Combat_2H_20()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 20, 100);
	
	Info_ClearChoices (DIA_CH_Kampf_Zweihand );
	Info_AddChoice	  (DIA_CH_Kampf_Zweihand , DIALOG_BACK, DIA_CH_Kampf_Zweihand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*20)			,CH_Training_Combat_2H_20);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*10)			,CH_Training_Combat_2H_10);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)				,CH_Training_Combat_2H_5);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Zweihand-Waffen + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))				,CH_Training_Combat_2H_1);
};
//***************************************************************************************************************************************
// FERNKAMPF Bogen und Armbrust
//***************************************************************************************************************************************


//******************************************************************************************
//Kampf Bogen
//******************************************************************************************
INSTANCE DIA_CH_Kampf_Bogen (C_INFO)
{
	npc			= CH;
	nr			= 8;
	condition	= DIA_CH_Kampf_Bogen_Condition;
	information	= DIA_CH_Kampf_Bogen_Info;
	permanent	= TRUE;
	description = "Bogen";
};                       

FUNC INT DIA_CH_Kampf_Bogen_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Bogen_Info()
{
	Info_ClearChoices (DIA_CH_Kampf_Bogen );
	Info_AddChoice	  (DIA_CH_Kampf_Bogen , DIALOG_BACK, DIA_CH_Kampf_Bogen_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*20)			,CH_Training_Combat_BOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*10)			,CH_Training_Combat_BOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5)			,CH_Training_Combat_BOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,CH_Training_Combat_BOW_1);
	
};
FUNC VOID DIA_CH_Kampf_Bogen_BACK()
{
	Info_ClearChoices (DIA_CH_Kampf_Bogen );
};
// ------ 1% Waffentalent ------
func void CH_Training_Combat_BOW_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 100);
	
	
	Info_ClearChoices (DIA_CH_Kampf_Bogen );
	Info_AddChoice	  (DIA_CH_Kampf_Bogen , DIALOG_BACK, DIA_CH_Kampf_Bogen_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*20)			,CH_Training_Combat_BOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*10)			,CH_Training_Combat_BOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5)			,CH_Training_Combat_BOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,CH_Training_Combat_BOW_1);
};

// ------ 5% Waffentalent ------
func void CH_Training_Combat_BOW_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 100);
	
	Info_ClearChoices (DIA_CH_Kampf_Bogen );
	Info_AddChoice	  (DIA_CH_Kampf_Bogen , DIALOG_BACK, DIA_CH_Kampf_Bogen_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*20)			,CH_Training_Combat_BOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*10)			,CH_Training_Combat_BOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5)			,CH_Training_Combat_BOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,CH_Training_Combat_BOW_1);
};

// ------ 10% Waffentalent ------
func void CH_Training_Combat_BOW_10()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 10, 100);
	
	Info_ClearChoices (DIA_CH_Kampf_Bogen );
	Info_AddChoice	  (DIA_CH_Kampf_Bogen , DIALOG_BACK, DIA_CH_Kampf_Bogen_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*20)			,CH_Training_Combat_BOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*10)			,CH_Training_Combat_BOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5)			,CH_Training_Combat_BOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,CH_Training_Combat_BOW_1);
};

// ------20% Waffentalent ------
func void CH_Training_Combat_BOW_20()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 20, 100);
	
	Info_ClearChoices (DIA_CH_Kampf_Bogen );
	Info_AddChoice	  (DIA_CH_Kampf_Bogen , DIALOG_BACK, DIA_CH_Kampf_Bogen_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*20)			,CH_Training_Combat_BOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*10)			,CH_Training_Combat_BOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5)			,CH_Training_Combat_BOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bogen + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,CH_Training_Combat_BOW_1);
};

//******************************************************************************************
//Kampf Armbrust
//******************************************************************************************
INSTANCE DIA_CH_Kampf_Armbrust (C_INFO)
{
	npc			= CH;
	nr			= 8;
	condition	= DIA_CH_Kampf_Armbrust_Condition;
	information	= DIA_CH_Kampf_Armbrust_Info;
	permanent	= TRUE;
	description = "Armbrust";
};                       

FUNC INT DIA_CH_Kampf_Armbrust_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Armbrust_Info()
{
	Info_ClearChoices (DIA_CH_Kampf_Armbrust );
	Info_AddChoice	  (DIA_CH_Kampf_Armbrust , DIALOG_BACK, DIA_CH_Kampf_Armbrust_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*20)			,CH_Training_Combat_CROSSBOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*10)			,CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)			,CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,CH_Training_Combat_CROSSBOW_1);
};
FUNC VOID DIA_CH_Kampf_Armbrust_BACK()
{
	Info_ClearChoices (DIA_CH_Kampf_Armbrust );
};
// ------ 1% Waffentalent ------
func void CH_Training_Combat_CROSSBOW_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 100);
	
	
	Info_ClearChoices (DIA_CH_Kampf_Armbrust );
	Info_AddChoice	  (DIA_CH_Kampf_Armbrust , DIALOG_BACK, DIA_CH_Kampf_Armbrust_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*20)			,CH_Training_Combat_CROSSBOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*10)			,CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)			,CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,CH_Training_Combat_CROSSBOW_1);
};

// ------ 5% Waffentalent ------
func void CH_Training_Combat_CROSSBOW_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 100);
	
	Info_ClearChoices (DIA_CH_Kampf_Armbrust );
	Info_AddChoice	  (DIA_CH_Kampf_Armbrust , DIALOG_BACK, DIA_CH_Kampf_Armbrust_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*20)			,CH_Training_Combat_CROSSBOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*10)			,CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)			,CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,CH_Training_Combat_CROSSBOW_1);
};

// ------ 10% Waffentalent ------
func void CH_Training_Combat_CROSSBOW_10()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 10, 100);
	
	Info_ClearChoices (DIA_CH_Kampf_Armbrust );
	Info_AddChoice	  (DIA_CH_Kampf_Armbrust , DIALOG_BACK, DIA_CH_Kampf_Armbrust_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*20)			,CH_Training_Combat_CROSSBOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*10)			,CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)			,CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,CH_Training_Combat_CROSSBOW_1);
};

// ------20% Waffentalent ------
func void CH_Training_Combat_CROSSBOW_20()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 20, 100);
	
	Info_ClearChoices	(DIA_CH_Kampf_Armbrust);
	Info_AddChoice	    (DIA_CH_Kampf_Armbrust, DIALOG_BACK, DIA_CH_Kampf_Armbrust_BACK);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,CH_Training_Combat_CROSSBOW_1);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)			,CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*10)			,CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Armbrust + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*20)			,CH_Training_Combat_CROSSBOW_20);
};

//*********************************************
//Diebestalente  
//*********************************************
//----------------------------
var int DiebStart;
//----------------------------
INSTANCE DIA_CH_Dieb_Start (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Dieb_Start_Condition;
	information	= DIA_CH_Dieb_Start_Info;
	permanent	= TRUE;
	description = "Diebestalente";
};                       

FUNC INT DIA_CH_Dieb_Start_Condition()
{
	if (KampfStart == FALSE)
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (LevelStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dieb_Start_Info()
{
	DiebStart = TRUE;
};
//*********************************************
//Dieb Stopper
//*********************************************
INSTANCE DIA_CH_Dieb_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Dieb_Stopper_Condition;
	information	= DIA_CH_Dieb_Stopper_Info;
	permanent	= TRUE;
	description = "ZURÜCK";
};                       

FUNC INT DIA_CH_Dieb_Stopper_Condition()
{
	if (DiebStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dieb_Stopper_Info()
{
	DiebStart = FALSE;
};
//*********************************************
//Dieb Taschendiebstahl
//*********************************************
INSTANCE DIA_CH_Dieb_Steal (C_INFO)
{
	npc			= CH;
	nr			= 7;
	condition	= DIA_CH_Dieb_Steal_Condition;
	information	= DIA_CH_Dieb_Steal_Info;
	permanent	= TRUE;
	description = "Taschendiebstahl";
};                       

FUNC INT DIA_CH_Dieb_Steal_Condition()
{
	if (DiebStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dieb_Steal_Info()
{
	Info_ClearChoices  	(DIA_CH_Dieb_Steal);
	Info_AddChoice 		(DIA_CH_Dieb_Steal,DIALOG_BACK,DIA_CH_Dieb_Steal_BACK);
	
	Info_AddChoice		(DIA_CH_Dieb_Steal, B_BuildLearnString("Taschendiebstahl"	, B_GetLearnCostTalent(other, NPC_TALENT_PICKPOCKET, 1))		,CH_Training_Thief_Pickpocket);
};
//*********************************************
//Dieb Schleichen
//*********************************************
INSTANCE DIA_CH_Dieb_Schleichen (C_INFO)
{
	npc			= CH;
	nr			= 8;
	condition	= DIA_CH_Dieb_Schleichen_Condition;
	information	= DIA_CH_Dieb_Schleichen_Info;
	permanent	= TRUE;
	description = "Schleichen";
};                       

FUNC INT DIA_CH_Dieb_Schleichen_Condition()
{
	if (DiebStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dieb_Schleichen_Info()
{
	Info_ClearChoices  	(DIA_CH_Dieb_Schleichen);
	Info_AddChoice 		(DIA_CH_Dieb_Schleichen,DIALOG_BACK,DIA_CH_Dieb_Schleichen_BACK);
	
	Info_AddChoice		(DIA_CH_Dieb_Schleichen, B_BuildLearnString("Schleichen"	, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1))		,CH_Training_Thief_Sneak);
};
//*********************************************
//Dieb Schlösser öffnen
//*********************************************
INSTANCE DIA_CH_Dieb_Picklock (C_INFO)
{
	npc			= CH;
	nr			= 9;
	condition	= DIA_CH_Dieb_Picklock_Condition;
	information	= DIA_CH_Dieb_Picklock_Info;
	permanent	= TRUE;
	description = "Schlösser öffnen";
};                       

FUNC INT DIA_CH_Dieb_Picklock_Condition()
{
	if (DiebStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dieb_Picklock_Info()
{
	Info_ClearChoices  	(DIA_CH_Dieb_Picklock );
	Info_AddChoice 		(DIA_CH_Dieb_Picklock ,DIALOG_BACK,DIA_CH_Dieb_Picklock_BACK);
	
	Info_AddChoice		(DIA_CH_Dieb_Picklock , B_BuildLearnString("Schlösser knacken"	, B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1))		,CH_Training_Thief_Picklock);
};
//*********************************************
//Alle Diebestalente auf einen Schlag 
//*********************************************
INSTANCE DIA_CH_Dieb_Alle (C_INFO)
{
	npc			= CH;
	nr			= 12;
	condition	= DIA_CH_Dieb_Alle_Condition;
	information	= DIA_CH_Dieb_Alle_Info;
	permanent	= TRUE;
	description = "Alle Diebestalente lernen";
};                       

FUNC INT DIA_CH_Dieb_Alle_Condition()
{
	if (DiebStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dieb_Alle_Info()
{
	var int kosten_alle;
	kosten_alle = 
	(
			B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1)
		+ 	B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1)
		+ 	B_GetLearnCostTalent(other, NPC_TALENT_PICKPOCKET, 1)
	);
	
	Info_ClearChoices  	(DIA_CH_Dieb_Alle );
	Info_AddChoice 		(DIA_CH_Dieb_Alle ,DIALOG_BACK,DIA_CH_Dieb_Alle_BACK);
	
	Info_AddChoice		(DIA_CH_Dieb_Alle , B_BuildLearnString("Alle Diebestalente", kosten_alle), CH_Training_Thief_Alle);
};
//***************************************************************************
// Talente Diebesfähigkeiten
//***************************************************************************
FUNC VOID DIA_CH_Dieb_Alle_BACK()
{
	Info_ClearChoices (DIA_CH_Dieb_Alle);
	
	B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK);
	B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET);
	B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK);
};
FUNC VOID CH_Training_Thief_Alle()
{
	Info_ClearChoices (DIA_CH_Dieb_Alle);
};
FUNC VOID DIA_CH_Dieb_Steal_BACK()
{
	Info_ClearChoices (DIA_CH_Dieb_Steal);
};
FUNC VOID DIA_CH_Dieb_Schleichen_BACK()
{
	Info_ClearChoices (DIA_CH_Dieb_Schleichen);
};
FUNC VOID DIA_CH_Dieb_Picklock_BACK()
{
	Info_ClearChoices (DIA_CH_Dieb_Picklock);
};
FUNC VOID CH_Training_Thief_Picklock()
{
	Info_ClearChoices 	(DIA_CH_Dieb_Picklock);
	B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK);
};
FUNC VOID CH_Training_Thief_Pickpocket()
{
	Info_ClearChoices 	(DIA_CH_Dieb_Steal);
	B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET);	
};
FUNC VOID CH_Training_Thief_Sneak()
{
	Info_ClearChoices 	(DIA_CH_Dieb_Schleichen);
	B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK);
};




//*********************************************
//Sonstige Talente   (Misc)
//*********************************************
//----------------------------
var int MiscStart;
//----------------------------
INSTANCE DIA_CH_Misc_Start (C_INFO)
{
	npc			= CH;
	nr			= 20;
	condition	= DIA_CH_Misc_Start_Condition;
	information	= DIA_CH_Misc_Start_Info;
	permanent	= TRUE;
	description = "Sonstiges (Tränke,Trophäen,Schmieden,Paladin-Runen,Sprache)";
};                       

FUNC INT DIA_CH_Misc_Start_Condition()
{
	if (KampfStart == FALSE)
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (LevelStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Start_Info()
{
	MiscStart = TRUE;
};
//*********************************************
//Dieb Stopper
//*********************************************
INSTANCE DIA_CH_Misc_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Misc_Stopper_Condition;
	information	= DIA_CH_Misc_Stopper_Info;
	permanent	= TRUE;
	description = "ZURÜCK";
};                       

FUNC INT DIA_CH_Misc_Stopper_Condition()
{
	if (MiscStart == TRUE)
	&& (AlchemyStart == FALSE)
	&& (SmithStart == FALSE)
	&& (AnimalStart == FALSE)
	&& (PaladinStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Stopper_Info()
{
	MiscStart = FALSE;
};
//*********************************************
//Alchemie
//*********************************************
//---------------------------------------------
var int AlchemyStart;
//---------------------------------------------
INSTANCE DIA_CH_Misc_Alchemie (C_INFO)
{
	npc			= CH;
	nr			= 10;
	condition	= DIA_CH_Misc_Alchemie_Condition;
	information	= DIA_CH_Misc_Alchemie_Info;
	permanent	= TRUE;
	description = "Alchemie - die Kunst Tränke zu brauen";
};                       

FUNC INT DIA_CH_Misc_Alchemie_Condition()
{
	if (MiscStart == TRUE)
	&& (AlchemyStart == FALSE)
	&& (SmithStart == FALSE)
	&& (AnimalStart == FALSE)
	&& (PaladinStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Alchemie_Info()
{
	AlchemyStart = TRUE;
};
//*********************************************
//Alchemie Stopper
//*********************************************
INSTANCE DIA_CH_Misc_Alchemie_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Misc_Alchemie_Stopper_Condition;
	information	= DIA_CH_Misc_Alchemie_Stopper_Info;
	permanent	= TRUE;
	description = "ZURÜCK";
};                       

FUNC INT DIA_CH_Misc_Alchemie_Stopper_Condition()
{
	if (AlchemyStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Alchemie_Stopper_Info()
{
	AlchemyStart = FALSE;
};
//*********************************************
//Heiltränke aller Art
//*********************************************
INSTANCE DIA_CH_Misc_Health (C_INFO)
{
	npc			= CH;
	nr			= 5;
	condition	= DIA_CH_Misc_Health_Condition;
	information	= DIA_CH_Misc_Health_Info;
	permanent	= TRUE;
	description = "Heiltränke aller Art";
};                       

FUNC INT DIA_CH_Misc_Health_Condition()
{
	if (AlchemyStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Health_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Health);
	Info_AddChoice (DIA_CH_Misc_Health,DIALOG_BACK,DIA_CH_Misc_Health_BACK);
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Health, B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), CH_Training_Alchemy_POTION_Health_01);	  
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Health, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), CH_Training_Alchemy_POTION_Health_02);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Health, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), CH_Training_Alchemy_POTION_Health_03);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Health, B_BuildLearnString ("Permanenter Heiltrank", 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), CH_Training_Alchemy_POTION_Perm_Health);
	};
};
FUNC VOID DIA_CH_Misc_Health_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Health);
};
FUNC VOID CH_Training_Alchemy_POTION_Health_01 ()
{
	Info_ClearChoices (DIA_CH_Misc_Health);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
};
FUNC VOID CH_Training_Alchemy_POTION_Health_02 ()
{
	Info_ClearChoices (DIA_CH_Misc_Health);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
};
FUNC VOID CH_Training_Alchemy_POTION_Health_03 ()
{
	Info_ClearChoices (DIA_CH_Misc_Health);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03);
};
FUNC VOID CH_Training_Alchemy_POTION_Perm_Health ()
{
	Info_ClearChoices (DIA_CH_Misc_Health);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health);
};
//*********************************************
//Manatränke aller Art
//*********************************************
INSTANCE DIA_CH_Misc_Mana (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Misc_Mana_Condition;
	information	= DIA_CH_Misc_Mana_Info;
	permanent	= TRUE;
	description = "Manatränke aller Art";
};                       

FUNC INT DIA_CH_Misc_Mana_Condition()
{
	if (AlchemyStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Mana_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Mana);
	Info_AddChoice (DIA_CH_Misc_Mana,DIALOG_BACK,DIA_CH_Misc_Mana_BACK);
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Mana, B_BuildLearnString ("Permanenter Manatrank"	, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), CH_Training_Alchemy_POTION_Perm_Mana);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Mana, B_BuildLearnString ("Manaelixier", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), CH_Training_Alchemy_POTION_Mana_03);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Mana, B_BuildLearnString ("Manaextrakt", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), CH_Training_Alchemy_POTION_Mana_02);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Mana, B_BuildLearnString ("Manaessenz", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), CH_Training_Alchemy_POTION_Mana_01);
	};
};
FUNC VOID DIA_CH_Misc_Mana_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Mana);
};
FUNC VOID CH_Training_Alchemy_POTION_Mana_01 ()
{
	Info_ClearChoices (DIA_CH_Misc_Mana);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
};
FUNC VOID CH_Training_Alchemy_POTION_Mana_02 ()
{
	Info_ClearChoices (DIA_CH_Misc_Mana);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
};
FUNC VOID CH_Training_Alchemy_POTION_Mana_03 ()
{
	Info_ClearChoices (DIA_CH_Misc_Mana);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
};
FUNC VOID CH_Training_Alchemy_POTION_Perm_Mana ()
{
	Info_ClearChoices (DIA_CH_Misc_Mana);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
};
//*********************************************
//Spezielle Tränke 
//*********************************************
INSTANCE DIA_CH_Misc_Special (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Misc_Special_Condition;
	information	= DIA_CH_Misc_Special_Info;
	permanent	= TRUE;
	description = "Spezielle Tränke";
};                       

FUNC INT DIA_CH_Misc_Special_Condition()
{
	if (AlchemyStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Special_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Special);
	Info_AddChoice (DIA_CH_Misc_Special,DIALOG_BACK,DIA_CH_Misc_Special_BACK);
	
	if ( PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Special, B_BuildLearnString ("Auge aufladen", 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, CHARGE_Innoseye)), CH_Training_Alchemy_Charge_InnosEye);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Special, B_BuildLearnString ("Trank der Geschwindigkeit"	, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)), CH_Training_Alchemy_POTION_Speed);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Special, B_BuildLearnString ("Elixier der Stärke"		, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), CH_Training_Alchemy_POTION_Perm_STR);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice	  (DIA_CH_Misc_Special, B_BuildLearnString ("Geschicklichkeitstrank"		, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), CH_Training_Alchemy_POTION_Perm_DEX);
	};
	
};
FUNC VOID DIA_CH_Misc_Special_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Special);
};
FUNC VOID CH_Training_Alchemy_POTION_Speed ()
{
	Info_ClearChoices (DIA_CH_Misc_Special);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Speed);	
};
FUNC VOID CH_Training_Alchemy_POTION_Perm_STR ()
{
	Info_ClearChoices (DIA_CH_Misc_Special);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR);
};
FUNC VOID CH_Training_Alchemy_POTION_Perm_DEX ()
{
	Info_ClearChoices (DIA_CH_Misc_Special);
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX);
};
FUNC VOID CH_Training_Alchemy_CHARGE_INNOSEYE ()
{
	Info_ClearChoices (DIA_CH_Misc_Special);
	B_TeachPlayerTalentAlchemy (self, other, CHARGE_INNOSEYE);
};

//*********************************************
//Schmieden Start
//*********************************************
var int SmithStart;
//---------------------------------------------
INSTANCE DIA_CH_Misc_SmithStart (C_INFO)
{
	npc			= CH;
	nr			= 10;
	condition	= DIA_CH_Misc_SmithStart_Condition;
	information	= DIA_CH_Misc_SmithStart_Info;
	permanent	= TRUE;
	description = "Schmieden - Männergruppe";
};                       
FUNC INT DIA_CH_Misc_SmithStart_Condition()
{
	if (MiscStart == TRUE)
	&& (AlchemyStart == FALSE)
	&& (SmithStart == FALSE)
	&& (AnimalStart == FALSE)
	&& (PaladinStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_SmithStart_Info()
{
	SmithStart = TRUE;
};
//*********************************************
//Schmieden Stopper
//*********************************************
INSTANCE DIA_CH_Misc_SmithStopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Misc_SmithStopper_Condition;
	information	= DIA_CH_Misc_SmithStopper_Info;
	permanent	= TRUE;
	description = "ZURÜCK";
};                       

FUNC INT DIA_CH_Misc_SmithStopper_Condition()
{
	if (SmithStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_SmithStopper_Info()
{
	SmithStart = FALSE;
};
//*********************************************
//Schmieden Niedrig
//*********************************************
INSTANCE DIA_CH_Misc_Smithniedrig (C_INFO)
{
	npc			= CH;
	nr			= 8;
	condition	= DIA_CH_Misc_Smithniedrig_Condition;
	information	= DIA_CH_Misc_Smithniedrig_Info;
	permanent	= TRUE;
	description = "Die ersten 5  Waffen";
};                       

FUNC INT DIA_CH_Misc_Smithniedrig_Condition()
{
	if (SmithStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Smithniedrig_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Smithniedrig);
	Info_AddChoice (DIA_CH_Misc_Smithniedrig,DIALOG_BACK,DIA_CH_Misc_Smithniedrig_BACK);
	
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice		(DIA_CH_Misc_Smithniedrig, B_BuildLearnString(NAME_ItMw_1H_Common_01	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common)) ,CH_Training_Smith_Common);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	{
		Info_AddChoice		(DIA_CH_Misc_Smithniedrig, B_BuildLearnString(NAME_ItMw_1H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))	,CH_Training_Smith_1hSpecial1);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	{
		Info_AddChoice		(DIA_CH_Misc_Smithniedrig, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,CH_Training_Smith_2hSpecial1);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	{
		Info_AddChoice		(DIA_CH_Misc_Smithniedrig, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,CH_Training_Smith_1hSpecial2);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	{
		Info_AddChoice		(DIA_CH_Misc_Smithniedrig, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,CH_Training_Smith_2hSpecial2);
	};
};
//*********************************************
//Schmieden Hoch
//*********************************************
INSTANCE DIA_CH_Misc_SmithHoch (C_INFO)
{
	npc			= CH;
	nr			= 9;
	condition	= DIA_CH_Misc_SmithHoch_Condition;
	information	= DIA_CH_Misc_SmithHoch_Info;
	permanent	= TRUE;
	description = "Die letzten 4 Waffen";
};                       

FUNC INT DIA_CH_Misc_SmithHoch_Condition()
{
	if (SmithStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_SmithHoch_Info()
{
	Info_ClearChoices (DIA_CH_Misc_SmithHoch);
	Info_AddChoice (DIA_CH_Misc_SmithHoch,DIALOG_BACK,DIA_CH_Misc_SmithHoch_BACK);
	
	if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
	{
		Info_AddChoice		(DIA_CH_Misc_SmithHoch, B_BuildLearnString(NAME_ItMw_1H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_03))		,CH_Training_Smith_1hSpecial3);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
	{
		Info_AddChoice		(DIA_CH_Misc_SmithHoch, B_BuildLearnString(NAME_ItMw_2H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_03))		,CH_Training_Smith_2hSpecial3);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
	{
		Info_AddChoice		(DIA_CH_Misc_SmithHoch, B_BuildLearnString(NAME_ItMw_1H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_04))		,CH_Training_Smith_1hSpecial4);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
	{
		Info_AddChoice		(DIA_CH_Misc_SmithHoch, B_BuildLearnString(NAME_ItMw_2H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_04))		,CH_Training_Smith_2hSpecial4);
	};
};
//***************************************************************************
// Talente Schmiede
//***************************************************************************
FUNC VOID DIA_CH_Misc_Smithniedrig_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Smithniedrig);
};
FUNC VOID DIA_CH_Misc_SmithHoch_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_SmithHoch);
};
//------------------niedrig--------------------------------
FUNC VOID CH_Training_Smith_Common ()
{
	Info_ClearChoices (DIA_CH_Misc_Smithniedrig);
	B_TeachPlayerTalentSmith (self, other, WEAPON_Common);
};
FUNC VOID CH_Training_Smith_1hSpecial1 ()
{
	Info_ClearChoices (DIA_CH_Misc_Smithniedrig);
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};
FUNC VOID CH_Training_Smith_2hSpecial1 ()
{
	Info_ClearChoices (DIA_CH_Misc_Smithniedrig);
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);
};
FUNC VOID CH_Training_Smith_1hSpecial2 ()
{
	Info_ClearChoices (DIA_CH_Misc_Smithniedrig);
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};
FUNC VOID CH_Training_Smith_2hSpecial2 ()
{
	Info_ClearChoices (DIA_CH_Misc_Smithniedrig);
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};
//---------------------hoch---------------------------------
FUNC VOID CH_Training_Smith_1hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_03);
};
FUNC VOID CH_Training_Smith_2hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_03);
};
FUNC VOID CH_Training_Smith_1hSpecial4 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_04);
};
FUNC VOID CH_Training_Smith_2hSpecial4 ()
{

	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_04);
};



//*********************************************
//Animlatrophys
//*********************************************
var int AnimalStart;
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_Start (C_INFO)
{
	npc			= CH;
	nr			= 8;
	condition	= DIA_CH_Misc_Animal_Start_Condition;
	information	= DIA_CH_Misc_Animal_Start_Info;
	permanent	= TRUE;
	description = "Animaltrophys";
};                       

FUNC INT DIA_CH_Misc_Animal_Start_Condition()
{
	if (MiscStart == TRUE)
	&& (AlchemyStart == FALSE)
	&& (SmithStart == FALSE)
	&& (AnimalStart == FALSE)
	&& (PaladinStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Animal_Start_Info()
{
	AnimalStart = TRUE;
};
//--------------------------------------------
//Animal Trophys Stopper
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Misc_Animal_Stopper_Condition;
	information	= DIA_CH_Misc_Animal_Stopper_Info;
	permanent	= TRUE;
	description = "ZURÜCK";
};                       

FUNC INT DIA_CH_Misc_Animal_Stopper_Condition()
{
	if (AnimalStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Animal_Stopper_Info()
{
	AnimalStart = FALSE;
};
//--------------------------------------------
//Animal Trophys Allgemein
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_allg (C_INFO)
{
	npc			= CH;
	nr			= 5;
	condition	= DIA_CH_Misc_Animal_allg_Condition;
	information	= DIA_CH_Misc_Animal_allg_Info;
	permanent	= TRUE;
	description = "Zähne, Fell, Klauen, Herzen";
};                       

FUNC INT DIA_CH_Misc_Animal_allg_Condition()
{
	if (AnimalStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Animal_allg_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_allg);
	Info_AddChoice (DIA_CH_Misc_Animal_allg,DIALOG_BACK,DIA_CH_Misc_Animal_allg_BACK);
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_allg, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  CH_Training_TROPHYS_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_allg, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  CH_Training_TROPHYS_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_allg, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  CH_Training_TROPHYS_Fur);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_allg, B_BuildLearnString ("Herzen nehmen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  CH_Training_TROPHYS_Heart);
	};
};

FUNC VOID CH_Training_TROPHYS_Teeth ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth);
};
FUNC VOID CH_Training_TROPHYS_Claws ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws);
};
FUNC VOID CH_Training_TROPHYS_Fur ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur);
};
FUNC VOID CH_Training_TROPHYS_Heart ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart);
};
//--------------------------------------------
FUNC VOID DIA_CH_Misc_Animal_allg_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_allg);
};
//--------------------------------------------
//Animal Trophys Speziell
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_Speziell (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Misc_Animal_Speziell_Condition;
	information	= DIA_CH_Misc_Animal_Speziell_Info;
	permanent	= TRUE;
	description = "Flügel, Stachel, Zangen, Platten";
};                       

FUNC INT DIA_CH_Misc_Animal_Speziell_Condition()
{
	if (AnimalStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Animal_Speziell_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_Speziell);
	Info_AddChoice (DIA_CH_Misc_Animal_Speziell,DIALOG_BACK,DIA_CH_Misc_Animal_Speziell_BACK);
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_Speziell, B_BuildLearnString ("Blutfliegenstachel",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  CH_Training_TROPHYS_BFSting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_Speziell, B_BuildLearnString ("Blutfliegenflügel",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  CH_Training_TROPHYS_BFWing);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_Speziell, B_BuildLearnString ("Crawlerplatten nehmen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  CH_Training_TROPHYS_CrawlerPlate	);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_Speziell, B_BuildLearnString ("Zangen rausschneiden",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  CH_Training_TROPHYS_Mandibles	);
	};
};
//--------------------------------------------
FUNC VOID DIA_CH_Misc_Animal_Speziell_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_Speziell);
};
FUNC VOID CH_Training_TROPHYS_BFSting ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing);
};
FUNC VOID CH_Training_TROPHYS_BFWing ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting);
};
FUNC VOID CH_Training_TROPHYS_CrawlerPlate ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles);
};
FUNC VOID CH_Training_TROPHYS_Mandibles ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate);
};
//--------------------------------------------
//Animal Trophys Blut, Hörner, Schuppen
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_other (C_INFO)
{
	npc			= CH;
	nr			= 7;
	condition	= DIA_CH_Misc_Animal_other_Condition;
	information	= DIA_CH_Misc_Animal_other_Info;
	permanent	= TRUE;
	description = "Blut, Schuppen, Hörner, Zunge";
};                       

FUNC INT DIA_CH_Misc_Animal_other_Condition()
{
	if (AnimalStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Animal_other_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_other);
	Info_AddChoice 	(DIA_CH_Misc_Animal_other,DIALOG_BACK,DIA_CH_Misc_Animal_other_BACK);
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Horn des Schattenläufers",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  CH_Training_TROPHYS_ShadowHorn );
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Feuerzunge",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)),  CH_Training_TROPHYS_FireTongue);
	};
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Drachensnapperhorn",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  CH_Training_TROPHYS_DrgSnapperHorn);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Drachenschuppen ziehen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  CH_Training_TROPHYS_DragonScale);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Drachenblut zapfen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)),  CH_Training_TROPHYS_DragonBlood);
	};
};
//--------------------------------------------
FUNC VOID DIA_CH_Misc_Animal_other_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_other);
};
FUNC VOID CH_Training_TROPHYS_ShadowHorn ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn);
};
FUNC VOID CH_Training_TROPHYS_FireTongue ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_FireTongue);
};

FUNC VOID CH_Training_TROPHYS_DrgSnapperHorn ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn);
};
FUNC VOID CH_Training_TROPHYS_DragonScale ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale);
};
FUNC VOID CH_Training_TROPHYS_DragonBlood ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood);
};

//***************************************************************************
// Paladin Start
//***************************************************************************
var int PaladinStart;
//-------------------
INSTANCE DIA_CH_Misc_PaladinStart (C_INFO)
{
	npc			= CH;
	nr			= 7;
	condition	= DIA_CH_Misc_PaladinStart_Condition;
	information	= DIA_CH_Misc_PaladinStart_Info;
	permanent	= TRUE;
	description = "Paladin Runen";
};                       

FUNC INT DIA_CH_Misc_PaladinStart_Condition()
{
	if (MiscStart == TRUE)
	&& (AlchemyStart == FALSE)
	&& (SmithStart == FALSE)
	&& (AnimalStart == FALSE)
	&& (PaladinStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_PaladinStart_Info()
{
	PaladinStart = TRUE;
};
//***************************************************************************
// Paladin Stopper
//***************************************************************************
INSTANCE DIA_CH_Misc_PaladinStopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Misc_PaladinStopper_Condition;
	information	= DIA_CH_Misc_PaladinStopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};                       

FUNC INT DIA_CH_Misc_PaladinStopper_Condition()
{
	if (PaladinStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_PaladinStopper_Info()
{
	PaladinStart = FALSE;
};
//***************************************************************************
// Paladin Heal
//***************************************************************************
INSTANCE DIA_CH_Misc_PalHeal (C_INFO)
{
	npc			= CH;
	nr			= 5;
	condition	= DIA_CH_Misc_PalHeal_Condition;
	information	= DIA_CH_Misc_PalHeal_Info;
	permanent	= TRUE;
	description = "Licht und Heilsprüche";
};                       

FUNC INT DIA_CH_Misc_PalHeal_Condition()
{
	if (PaladinStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_PalHeal_Info()
{
	Info_ClearChoices (DIA_CH_Misc_PalHeal);
	Info_AddChoice (DIA_CH_Misc_PalHeal,DIALOG_BACK,DIA_CH_Misc_PalHeal_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Misc_PalHeal, B_BuildLearnString (NAME_SPL_PalFullHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalFullHeal)) ,CH_Training_Runen_Paladin_SPL_PalFullHeal);
	};
	if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Misc_PalHeal, B_BuildLearnString (NAME_SPL_PalMediumHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalMediumHeal)) ,CH_Training_Runen_Paladin_SPL_PalMediumHeal);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_PalHeal, B_BuildLearnString (NAME_SPL_PalLightHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLightHeal)) ,CH_Training_Runen_Paladin_SPL_PalLightHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalLight] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Misc_PalHeal, B_BuildLearnString (NAME_SPL_PalLight, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalLight)) ,CH_Training_Runen_Paladin_SPL_PalLight);
	};
};
FUNC VOID DIA_CH_Misc_PalHeal_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_PalHeal);
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalLight()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalLight);  
	
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalLightHeal()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalLightHeal);  
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalMediumHeal()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalMediumHeal);  
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalFullHeal()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalFullHeal);  
	
};
//***************************************************************************
// Paladin Kampf
//***************************************************************************
INSTANCE DIA_CH_Misc_PalKampf (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Misc_PalKampf_Condition;
	information	= DIA_CH_Misc_PalKampf_Info;
	permanent	= TRUE;
	description = "Kampfsprüche";
};                       

FUNC INT DIA_CH_Misc_PalKampf_Condition()
{
	if (PaladinStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_PalKampf_Info()
{
	Info_ClearChoices (DIA_CH_Misc_PalKampf);
	Info_AddChoice (DIA_CH_Misc_PalKampf,DIALOG_BACK,DIA_CH_Misc_PalKampf_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Misc_PalKampf, B_BuildLearnString (NAME_SPL_PalDestroyEvil, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalDestroyEvil)) ,CH_Training_Runen_Paladin_SPL_PalDestroyEvil);
	};
	if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Misc_PalKampf, B_BuildLearnString (NAME_SPL_PalRepelEvil, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalRepelEvil)) ,CH_Training_Runen_Paladin_SPL_PalRepelEvil);
	};
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice	(DIA_CH_Misc_PalKampf, B_BuildLearnString (NAME_SPL_PalHolyBolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_PalHolyBolt)) ,CH_Training_Runen_Paladin_SPL_PalHolyBolt);
	};
};
//***************************************************************************
FUNC VOID DIA_CH_Misc_PalKampf_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_PalKampf);
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalHolyBolt()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalHolyBolt);  
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalRepelEvil()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalRepelEvil);  
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalDestroyEvil()
{
	B_TeachPlayerTalentRunes	(self, other,SPL_PalDestroyEvil);  
};
















