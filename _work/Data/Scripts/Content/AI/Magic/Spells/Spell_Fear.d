// ********
// SPL_Fear
// ********

const int SPL_Cost_Fear			= 50;
const int SPL_TIME_Fear			= 5;

INSTANCE Spell_Fear (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden in der "spell_fear.d" per "AI_SetNpcsToState(self,ZS_Flee, 1000);" bestimmt
};

func int Spell_Logic_Fear (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Fear)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Fear()
{
	if other.guild != GIL_DRAGON
	{
		AI_SetNpcsToState (self, ZS_MagicFlee, 1000); //-kairo
	};
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Fear;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
