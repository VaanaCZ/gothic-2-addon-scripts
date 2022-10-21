/////////////////////////////////////////
// Yellow Pfeiffer //////////////////////
/////////////////////////////////////////
instance PIR_1394_Addon_InExtremo_YellowPfeiffer (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Yellow Pfeiffer";
   	npctype		= 	npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	flags =					0;
	
	voice =					9;
	id =					1394;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
		
	//-------- inventory --------                                    
	CreateInvItem (self, ItMi_IEDudelGelb);
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh						Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"Hum_IE_Pfeiffer_INSTRUMENT",	DEFAULT,	DEFAULT,	"HUM_HEAD_Pfeiffer", DEFAULT,  	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1394;
};

FUNC VOID Rtn_Start_1394 ()
{	
	TA_Stand_Guarding	(05,00,20,00,"WP_COOK_CAULDRON");
	TA_Stand_Guarding	(20,00,05,00,"WP_COOK_CAULDRON");
};

FUNC VOID Rtn_Concert_1394 ()
{	
	TA_Concert	(05,00,20,00,"WP_COOK_CAULDRON");
	TA_Concert	(20,00,05,00,"WP_COOK_CAULDRON");
};
