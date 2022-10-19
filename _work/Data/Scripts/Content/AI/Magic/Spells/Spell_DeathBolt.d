// ***************
// SPL_Deathbolt
// ***************

const int SPL_Cost_Deathbolt	= 25;
const int SPL_Damage_Deathbolt	= 125;


INSTANCE Spell_Deathbolt (C_Spell_Proto)
{
	time_per_mana			= 0;			//Spell wirkt Instant
	damage_per_level 		= SPL_Damage_Deathbolt; 
};

func int Spell_Logic_Deathbolt (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Deathbolt)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Deathbolt ()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Deathbolt;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
