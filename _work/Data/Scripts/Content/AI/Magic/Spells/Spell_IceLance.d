// *************
// SPL_Icelance	/K2
// *************

const int SPL_Cost_Icelance		= 20;
const int SPL_Damage_Icelance	= 100;


INSTANCE Spell_Icelance		(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Icelance;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Icelance	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Icelance)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Icelance()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Icelance;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
