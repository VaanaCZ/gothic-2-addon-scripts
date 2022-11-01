/////////////////////////////////////////
// Lutter ///////////////////////////////
/////////////////////////////////////////
instance PIR_1395_Addon_InExtremo_Lutter(Npc_Default)
{
	//-------- primary data --------
	
	name =					"Люттер";
   	npctype		= 	npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	voice =					7;
	id =					1395;
	flags      				=   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;

	//-------- inventory --------                                    
	CreateInvItem (self, ItMi_IEDrumscheit);
	//CreateInvItem (self, ItMiCellobow);
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh					Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"Hum_IE_Lutter_INSTRUMENT",	DEFAULT,	DEFAULT,	"HUM_HEAD_Lutter", 	DEFAULT,  	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1395;
};

FUNC VOID Rtn_Start_1395 ()
{	
	TA_Stand_Eating	(05,00,20,00,"WP_STAND");
	TA_Stand_Eating	(20,00,05,00,"WP_STAND");
};
FUNC VOID Rtn_Concert_1395 ()
{	
	TA_Concert	(05,00,20,00,"WP_STAND");
	TA_Concert	(20,00,05,00,"WP_STAND");
};
