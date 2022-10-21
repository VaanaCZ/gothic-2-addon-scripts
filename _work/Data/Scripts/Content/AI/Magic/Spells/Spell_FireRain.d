// ************
// SPL_FireRain
// ************

const int SPL_Cost_FireRain			= 150;
const int SPL_Damage_FireRain 		= 500;


INSTANCE Spell_FireRain (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_FireRain; 							
	damageType				= DAM_MAGIC;										
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_Firerain	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_FireRain)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Firerain()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_FireRain;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};




