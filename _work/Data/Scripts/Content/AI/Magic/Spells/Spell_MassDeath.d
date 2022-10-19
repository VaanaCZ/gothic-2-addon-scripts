// *************
// SPL_MassDeath
// *************

const int SPL_Cost_MassDeath		= 150;
const int SPL_Damage_MassDeath 		= 500;


INSTANCE Spell_MassDeath (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_MassDeath;	
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt getötet
};

func int Spell_Logic_Massdeath (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_MassDeath)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Massdeath()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_MassDeath;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
