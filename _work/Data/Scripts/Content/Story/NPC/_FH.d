

INSTANCE FH (NPC_DEFAULT)
{
	//-------- primary data --------
	name			= "Face Helper";
	Npctype			= NPCTYPE_FRIEND;
	guild			= GIL_NONE;
	level			= 999;			// real 15, aber 999 damit er nicht vor dem Brückegolem flieht!
	voice			= 5;
	id				= 1311;
	flags			= 0;

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	45;
	attribute[ATR_DEXTERITY] 	=	35;
	attribute[ATR_MANA_MAX] 	=	50;
	attribute[ATR_MANA] 		=	50;
	attribute[ATR_HITPOINTS_MAX]	=	220;
	attribute[ATR_HITPOINTS] 	=	220;
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex
	Mdl_SetVisualBody (self,				"hum_body_Naked0", 		1,		0,		"Hum_Head_Bald", 		0, 		0,			NO_ARMOR);

    fight_tactic	=	FAI_HUMAN_STRONG;
		
	//-------- inventory --------
	
	//-------- ai --------
	daily_routine	=	Rtn_start_1311;
};

FUNC VOID Rtn_start_1311 ()
{	
	TA_Smalltalk	(08,00,	23,00,"XXX");    
	TA_Smalltalk	(23,00,	08,00,"XXX");
};

