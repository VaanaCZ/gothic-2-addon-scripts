// *********
// SPL_Light
// *********

const int SPL_Cost_PalLight			= 10;
const int SPL_Cost_LIGHT			= 10;

const int SPL_Duration_PalLIGHT		= 5;	//fester Wert wird nur für die IT_Runenverwendet (Zeit in Minuten)
const int SPL_Duration_LIGHT		= 5;	//fester Wert wird nur für die IT_Runenverwendet (Zeit in Minuten)	


INSTANCE Spell_Light (C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_PalLight (C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


// ------ SPL_PalLight ------
func int Spell_Logic_PalLight(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_PalLight)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_PalLight()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalLight;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};

// ------ SPL_LIGHT ------
func int Spell_Logic_Light(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Light)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Light()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Light;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
