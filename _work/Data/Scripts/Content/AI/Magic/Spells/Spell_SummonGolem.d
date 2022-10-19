// ***************
// SPL_SummonGolem
// ***************

const int SPL_Cost_SummonGolem		= 80;


INSTANCE Spell_SummonGolem (C_Spell_Proto)	//ehem. Spell_Golem
{
	time_per_mana			= 0;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonGolem (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonGolem)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
	
};

func void Spell_Cast_SummonGolem()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonGolem;
	};
	
	if (Npc_IsPlayer(self)) 
	{		
		Wld_SpawnNpcRange( self,Summoned_Golem,1,500);
	}
	else
	{
		Wld_SpawnNpcRange( self,StoneGolem,1,500);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
