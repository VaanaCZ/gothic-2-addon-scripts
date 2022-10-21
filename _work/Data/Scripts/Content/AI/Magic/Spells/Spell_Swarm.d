// ***********
// SPL_Swarm	K4
// ***********

const int SPL_Cost_Swarm			= 20;	
const int SPL_Swarm_Damage			= 80;	
const int SPL_TIME_Swarm			= 6;	


instance Spell_Swarm (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - Spell wirkt INSTANT
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
};

func int Spell_Logic_Swarm (var int manaInvested) //Parameter manaInvested wird hier nicht benutzt
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_Swarm)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Swarm;
		return SPL_SENDCAST; //Spell wird auch gecasted, wenn keine Auswirkungen (other geht nicht in ZS) Mana is dann weg - Pech gehabt! (soll so sein!)
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Swarm()
{
	//self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Sleep;			// nicht drin, wegen Kommentar oben
	
	self.aivar[AIV_SelectSpell] += 1;
};

/*
		&& (other.flags != NPC_FLAG_IMMORTAL) 
		&& (Npc_GetDistToNpc (self,other) <= 1000)
		&& (other.guild != GIL_KDF)
		&& (other.guild != GIL_DMT)
		&& (other.guild != GIL_PAL)
*/
		
