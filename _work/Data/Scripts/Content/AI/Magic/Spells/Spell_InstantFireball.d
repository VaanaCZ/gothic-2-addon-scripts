// *******************
// SPL_InstantFireball
// *******************

const int SPL_Cost_InstantFireball			= 15;
const int SPL_Damage_InstantFireball 		= 75;


INSTANCE Spell_InstantFireball (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_DAMAGE_InstantFireball;
	damageType				= DAM_MAGIC;									// war vorher DAM_FIRE
};

func int Spell_Logic_InstantFireball (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_InstantFireball)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_InstantFireball()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_InstantFireball;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
