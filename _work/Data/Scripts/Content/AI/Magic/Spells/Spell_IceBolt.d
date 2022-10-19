// ***********
// SPL_IceBolt
// ***********

const int SPL_Cost_IceBolt		= 10;
const int SPL_Damage_IceBolt 	= 50;



INSTANCE Spell_IceBolt (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_IceBolt;
};

func int Spell_Logic_IceBolt (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_IceBolt)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_IceBolt()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_IceBolt;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
