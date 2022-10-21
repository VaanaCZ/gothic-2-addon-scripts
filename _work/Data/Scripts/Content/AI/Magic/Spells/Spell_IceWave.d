// ***********
// SPL_IceWave
// ***********

const int	SPL_Cost_IceWave			=	120;
//SPL_FREEZE_DAMAGE	und SPL_TIME_FREEZE	siehe SPL_IceCube


INSTANCE Spell_IceWave (C_Spell_Proto)
{
	time_per_mana			= 0;					// Wert wird nicht gebraucht - INSTANT-Spell
	damage_per_level 		= 60;					// Relativer Schaden je nach Opfer wird im zs_MagicFreeze angegeben!
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt "eingefroren"
};

func int Spell_Logic_IceWave(var int manaInvested) //Parameter wird hier nicht gebraucht
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_IceWave)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_IceWave()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_IceWave;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
