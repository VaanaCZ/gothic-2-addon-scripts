
//#############################################
//##
//##	Dracheninsel
//##
//############################################

instance VLK_439_Vatras_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vatras"; 
	guild 		= GIL_VLK;
	id 			= 4390;
	voice 		= 5;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: wird gebraucht im Kapitel 3 Hauptstory und aufs Schiff Kapitel 5	!!!!
	npctype		= NPCTYPE_FRIEND;

	// ------ aivar ------
	aivar[AIV_PARTYMEMBER] = TRUE;		
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																

	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Saturas, BodyTex_B, ITAR_KDW_H );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4390;
};

FUNC VOID Rtn_Start_4390	()
{	
	TA_Read_Bookstand  	(08,00,23,00,"SHIP_IN_22");
	TA_Sleep			(23,00,08,00,"SHIP_IN_04");
};
