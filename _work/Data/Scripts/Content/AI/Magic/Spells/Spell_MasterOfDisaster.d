// ********************
// SPL_MasterOfDisaster
// ********************

const int SPL_Cost_MasterOfDisaster		= 60;
const int SPL_Damage_MasterOfDisaster	= 300;


INSTANCE Spell_MasterOfDisaster	(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level 		= SPL_DAMAGE_MasterOfDisaster;
	damageType				= 	DAM_MAGIC;	
};

func int Spell_Logic_MasterOfDisaster	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_MasterOfDisaster)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_MasterOfDisaster()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_MasterOfDisaster;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
