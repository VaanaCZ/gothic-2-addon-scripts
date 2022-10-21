// **************
// SPL_SuckEnergy	K2
// **************

const int SPL_Cost_SuckEnergy			= 30;
const int SPL_SuckEnergy_Damage			= 100;	
const int SPL_TIME_SuckEnergy			= 9;	

instance Spell_SuckEnergy (C_Spell_Proto)
{
	time_per_mana			= 50;					//Wert wird nicht gebraucht - Spell wirkt INSTANT
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;
};

func int Spell_Logic_SuckEnergy (var int manaInvested) //Parameter manaInvested wird hier nicht benutzt
{
	if (manaInvested == 0) { return SPL_RECEIVEINVEST;  };
	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SuckEnergy)
	{
		return SPL_SENDCAST; //Spell wird auch gecasted, wenn keine Auswirkungen (other geht nicht in ZS) Mana is dann weg - Pech gehabt! (soll so sein!)
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SuckEnergy()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SuckEnergy;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
