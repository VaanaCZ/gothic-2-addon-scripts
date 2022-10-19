/////////////////////////////////////////
// Thomas, the Forger ///////////////////
/////////////////////////////////////////
instance PIR_1392_Addon_InExtremo_ThomasTheForger (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Thomas the forger";
   	npctype	= npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	flags =					0;
	
	voice =					8;
	id =					1392;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
	
	//-------- inventory --------                                    
	CreateInvItem (self, ItMi_IECello);
//	CreateInvItem (self, ItMiCellobow);
		
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh					Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody 	(self,	"HUM_IE_THOMAS_INSTRUMENT",	DEFAULT,	DEFAULT,	"HUM_HEAD_THOMAS", 	DEFAULT,  	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1392;
};

FUNC VOID Rtn_Start_1392 ()
{	
	TA_Stand_Eating	(05,00,20,00,"WP_COOK_PAN");
	TA_Stand_Eating	(20,00,05,00,"WP_COOK_PAN");
};
FUNC VOID Rtn_Concert_1392 ()
{	
	TA_Concert	(05,00,20,00,"WP_COOK_PAN");
	TA_Concert	(20,00,05,00,"WP_COOK_PAN");
};
