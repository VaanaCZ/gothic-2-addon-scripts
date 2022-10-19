// *************
// SPL_Waterfist	/k4
// *************

const int SPL_Cost_Waterfist	= 25;
const int SPL_Damage_Waterfist	= 125;


INSTANCE Spell_Waterfist	(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Waterfist;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Waterfist	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Waterfist)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Waterfist()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Waterfist;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
