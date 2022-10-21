// *********
// SPL_Charm
// *********

const int SPL_Cost_Charm		= 50;
const int SPL_Damage_Charm 		= 0;


INSTANCE Spell_Charm(C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	damage_per_level		= SPL_Damage_Charm;
	damageType				= DAM_MAGIC;						// war vorher DAM_FIRE
};

func int Spell_Logic_Charm(var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_Charm)
	{
		//---STORY: Ignaz-Mission-----------------------------
		if (other.aivar[AIV_NpcSawPlayerCommit] != CRIME_NONE)
		&& (MIS_Ignaz_Charm == LOG_RUNNING)
		{
			Charm_Test = TRUE;
		};
		//----------------------------------------------------
			
		B_DeletePetzCrime (other); ///hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
 		other.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
 		other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
 		
 		// ------ Opfer (other) ist nicht GILDEN-Hostile zu other ------
		if (Wld_GetGuildAttitude(other.guild, self.guild) != ATT_HOSTILE)
		{	
			// ------ ABER temp_hostile (d.h. hat gerade gegen den Spieler gekämpft) ------
			if (Npc_GetAttitude (other, self) == ATT_HOSTILE)
			{
				Npc_SetTempAttitude(other, Wld_GetGuildAttitude(other.guild, self.guild));
			};
		};
 		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Charm()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Charm;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
