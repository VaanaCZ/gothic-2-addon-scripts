// ******************
// SPL_SummonSkeleton
// ******************

const int SPL_Cost_SummonSkeleton			= 60;


INSTANCE Spell_SummonSkeleton (C_Spell_Proto)	//ehem. Spell_Skeleton
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonSkeleton(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonSkeleton)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonSkeleton()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonSkeleton;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
	
	if (Npc_IsPlayer(self)) 
	{		
		Wld_SpawnNpcRange	(self,	Summoned_Skeleton,			1,	500);
	}
	else
	{
		Wld_SpawnNpcRange	(self,	Skeleton,			1,	500);
	};
};
