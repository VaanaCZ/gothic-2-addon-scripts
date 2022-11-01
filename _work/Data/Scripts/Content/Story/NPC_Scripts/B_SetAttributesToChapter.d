// *************************************
// B_SetAttributesToChapter
// -------------------------------------
// setzt die NSC-Attribute und den LEVEL
// abhängig vom Kapitel
// in dem sie als Gegner vorkommen
// *************************************

func void B_SetAttributesToChapter (var C_NPC slf, var int kap)
{
	Npc_SetTalentSkill (slf, NPC_TALENT_MAGE, 6);
	
	// ------ SPIELSTART NSCs -------
	if (kap == 0)
	{
		slf.level = 3;//nicht 0 wegen XP (10 * Level)
		
		slf.attribute[ATR_STRENGTH] 		= 10;
		slf.aivar[REAL_STRENGTH]			= 10;
		slf.attribute[ATR_DEXTERITY] 		= 10;
		slf.aivar[REAL_DEXTERITY]			= 10;
		slf.attribute[ATR_MANA_MAX] 		= 1000;
		slf.aivar[REAL_MANA_MAX]			= 1000;
		slf.attribute[ATR_MANA] 			= 1000;
		slf.attribute[ATR_HITPOINTS_MAX] 	= 40;
		slf.attribute[ATR_HITPOINTS] 		= 40;
	};
		
	// ------ Kapitel 1 NSCs -------
	if (kap == 1)
	{
		slf.level = 10;
		
		slf.attribute[ATR_STRENGTH] 		= 50;
		slf.aivar[REAL_STRENGTH]			= 50;
		slf.attribute[ATR_DEXTERITY] 		= 50;
		slf.aivar[REAL_DEXTERITY]			= 50;
		slf.attribute[ATR_MANA_MAX] 		= 1000;
		slf.aivar[REAL_MANA_MAX]			= 1000;
		slf.attribute[ATR_MANA] 			= 1000;
		slf.attribute[ATR_HITPOINTS_MAX]	= 160;
		slf.attribute[ATR_HITPOINTS] 		= 160;
	};
	
	// ------ Kapitel 2 NSCs -------
	if (kap == 2)
	{
		slf.level = 20;
		
		slf.attribute[ATR_STRENGTH] 		= 100;
		slf.aivar[REAL_STRENGTH]			= 100;
		slf.attribute[ATR_DEXTERITY] 		= 100;
		slf.aivar[REAL_DEXTERITY]			= 100;
		slf.attribute[ATR_MANA_MAX] 		= 1000;
		slf.aivar[REAL_MANA_MAX]			= 1000;
		slf.attribute[ATR_MANA] 			= 1000;
		slf.attribute[ATR_HITPOINTS_MAX]	= 280;
		slf.attribute[ATR_HITPOINTS] 		= 280;
	};
	
	// ------ Kapitel 3 NSCs -------
	if (kap == 3)
	{
		slf.level = 30;
		
		slf.attribute[ATR_STRENGTH] 		= 125;
		slf.aivar[REAL_STRENGTH]			= 125;
		slf.attribute[ATR_DEXTERITY] 		= 125;
		slf.aivar[REAL_DEXTERITY]			= 125;
		slf.attribute[ATR_MANA_MAX] 		= 1000;
		slf.aivar[REAL_MANA_MAX]			= 1000;
		slf.attribute[ATR_MANA] 			= 1000;
		slf.attribute[ATR_HITPOINTS_MAX]	= 400;
		slf.attribute[ATR_HITPOINTS] 		= 400;
	};
	
	// ------ Kapitel 4 NSCs -------
	if (kap == 4)
	{
		slf.level = 40;
		
		slf.attribute[ATR_STRENGTH] 		= 150;
		slf.aivar[REAL_STRENGTH]			= 150;
		slf.attribute[ATR_DEXTERITY] 		= 150;
		slf.aivar[REAL_DEXTERITY]			= 150;
		slf.attribute[ATR_MANA_MAX] 		= 1000;
		slf.attribute[ATR_MANA] 			= 1000;
		slf.aivar[REAL_MANA_MAX]			= 1000;
		slf.attribute[ATR_HITPOINTS_MAX]	= 520;
		slf.attribute[ATR_HITPOINTS] 		= 520;
	};
	
	// ------ Kapitel 5 NSCs -------
	if (kap == 5)
	{
		slf.level = 50;
		
		slf.attribute[ATR_STRENGTH] 		= 175;
		slf.aivar[REAL_STRENGTH]			= 175;
		slf.attribute[ATR_DEXTERITY] 		= 175;
		slf.aivar[REAL_DEXTERITY]			= 175;
		slf.attribute[ATR_MANA_MAX] 		= 1000;
		slf.aivar[REAL_MANA_MAX]			= 1000;
		slf.attribute[ATR_MANA] 			= 1000;
		slf.attribute[ATR_HITPOINTS_MAX]	= 640;
		slf.attribute[ATR_HITPOINTS] 		= 640;
	};
	
	// ------ Kapitel 6 NSCs -------
	if (kap >= 6)
	{
		slf.level = 60;
		
		slf.attribute[ATR_STRENGTH] 		= 200;
		slf.aivar[REAL_STRENGTH]			= 200;
		slf.attribute[ATR_DEXTERITY] 		= 200;
		slf.aivar[REAL_DEXTERITY]			= 200;
		slf.attribute[ATR_MANA_MAX] 		= 1000;
		slf.aivar[REAL_MANA_MAX]			= 1000;
		slf.attribute[ATR_MANA] 			= 1000;
		slf.attribute[ATR_HITPOINTS_MAX]	= 760;
		slf.attribute[ATR_HITPOINTS] 		= 760;
	};
	
	// ------ XP für NSCs ------
	slf.exp				= (500*((slf.level+1)/2)*(slf.level+1));
	slf.exp_next		= (500*((slf.level+2)/2)*(slf.level+1));
};
