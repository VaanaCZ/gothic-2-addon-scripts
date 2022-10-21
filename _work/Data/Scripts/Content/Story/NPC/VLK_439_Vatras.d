//#############################################
//##
//##	Neue Welt
//##
//############################################

instance VLK_439_Vatras (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vatras"; 
	guild 		= GIL_VLK;
	id 			= 439;
	voice 		= 5;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: NPC_FLAG_IMMORTAL		
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																

	
	// ------ Inventory ------
	CreateInvItems 		(self, ItSc_LightHeal,2);
	CreateInvItems 		(self, ItSc_Zap,2);
	CreateInvItems 		(self, ItSc_Icebolt,2);
	CreateInvItems 		(self, ItSc_Light,2);
	CreateInvItems 		(self, ItSc_TrfScavenger,1);	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Saturas, BodyTex_B, ITAR_KDW_H );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_439;
};

FUNC VOID Rtn_Start_439	()
{	
	TA_Preach_Vatras	(05,05,20,10,	"NW_CITY_MERCHANT_TEMPLE_FRONT");
    TA_Pray_Innos_FP  	(20,10,05,05,	"NW_CITY_MERCHANT_TEMPLE_IN");
};

FUNC VOID Rtn_RitualInnosEyeRepair_439	()
{	
	TA_Stand_Guarding	(08,00,20,00,	"NW_TROLLAREA_RITUAL_04");	
    TA_Stand_Guarding	(20,00,08,00,	"NW_TROLLAREA_RITUAL_04");
};

FUNC VOID Rtn_RitualInnosEye_439 ()
{	
	TA_Circle	(08,00,23,00,"NW_TROLLAREA_RITUAL_04");
    TA_Circle	(23,00,08,00,"NW_TROLLAREA_RITUAL_04");
};


FUNC VOID Rtn_WAITFORSHIP_439	()
{	
	TA_Sit_Bench  	(08,00,23,00,"NW_WAITFOR_SHIP_04");
	TA_Sit_Bench	(23,00,08,00,"NW_WAITFOR_SHIP_04");
};

FUNC VOID Rtn_Ship_439	()
{	
	TA_Read_Bookstand  	(08,00,23,00,"SHIP_IN_22");
	TA_Sleep			(23,00,08,00,"SHIP_IN_04");
};

FUNC VOID Rtn_PRAY_439	()
{	
	TA_Pray_Innos_FP	(05,05,20,10,	"NW_CITY_MERCHANT_TEMPLE_FRONT");
    TA_Pray_Innos_FP  	(20,10,05,05,	"NW_CITY_MERCHANT_TEMPLE_IN");
};
