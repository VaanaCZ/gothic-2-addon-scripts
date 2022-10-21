// ******************
// SPL_Concussionbolt
// ******************

const int SPL_Cost_Concussionbolt	= 40;
const int SPL_Damage_Concussionbolt	= 200;

INSTANCE Spell_Concussionbolt (C_Spell_Proto)
{
	time_per_mana			= 0;			//Spell wirkt Instant
	damage_per_level 		= SPL_Damage_Concussionbolt; 
};

func int Spell_Logic_Concussionbolt (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Concussionbolt)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Concussionbolt()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Concussionbolt;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
