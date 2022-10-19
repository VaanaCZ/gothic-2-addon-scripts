/////////////////////////////////////////
// Unicorn //////////////////////////////
/////////////////////////////////////////

instance PIR_1393_Addon_InExtremo_Unicorn(Npc_Default)
{
	//-------- primary data --------
	
	name =					"Unicorn";
	npctype		= 	npctype_main;
   	guild =					GIL_NONE;
	level =					4;
	flags =					0;
	
	voice =					4;
	id =					1393;
	flags      					 =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	20;
	attribute[ATR_DEXTERITY]	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] 	=	88;
		
	//-------- inventory --------                                    
	CreateInvItem (self, ItMi_IELaute);
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,	"HUMANS.MDS");
	//							Body-Mesh						Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 	(self,	"HUM_IE_UNICORN_INSTRUMENT",	DEFAULT,	DEFAULT,	"HUM_HEAD_UNICORN", DEFAULT, 	DEFAULT, 	-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1393;
};

FUNC VOID Rtn_Start_1393 ()
{	
	TA_Stand_Eating	(05,00,20,00,"WP_PICK");
	TA_Stand_Eating	(20,00,05,00,"WP_PICK");
};

FUNC VOID Rtn_Concert_1393 ()
{	
	TA_Concert	(05,00,20,00,"WP_PICK");
	TA_Concert	(20,00,05,00,"WP_PICK");
};
