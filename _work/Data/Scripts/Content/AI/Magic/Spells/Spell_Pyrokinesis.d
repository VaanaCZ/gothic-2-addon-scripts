// ***************
// SPL_Pyrokinesis  ALIAS  ChargeFireStorm
// ***************

const int SPL_Cost_FireStorm		= 200; //4*50
const int STEP_Firestorm			= 50;
const int SPL_Damage_FireStorm 		= 75;

	// obsolete:
	const int SPL_PYRO_DAMAGE_PER_SEC = 20;	// wird in ZS_Pyro (Pyrokinese-Opfer) benutzt, dort KEIN Rüstungsschutz!
	////////////

INSTANCE Spell_Pyrokinesis (C_Spell_Proto)
{
	time_per_mana			= 30;
	damage_per_level		= SPL_Damage_FireStorm;		
	damageType				= DAM_MAGIC;				
	canTurnDuringInvest     = TRUE;
};

func int Spell_Logic_Pyrokinesis (var int manaInvested)
{
	if (self.attribute[ATR_MANA]<STEP_Firestorm) 
	{
		return SPL_DONTINVEST;	
	};
	
	if (manaInvested <= STEP_Firestorm*1)
	{
		self.aivar[AIV_SpellLevel] = 1; //Start mit Level 1
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if (manaInvested > (STEP_Firestorm*1))
	&& (self.aivar[AIV_SpellLevel] <= 1)
	{
		self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - STEP_Firestorm);

		if (self.attribute[ATR_MANA]<0) 
		{
	   		self.attribute[ATR_MANA]=0;
		};
		
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL; //Lev2 erreicht
	}
	else if (manaInvested > (STEP_Firestorm*2))
	&& (self.aivar[AIV_SpellLevel] <= 2)
	{
		self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - STEP_Firestorm);

		if (self.attribute[ATR_MANA]<0) 
		{
	   		self.attribute[ATR_MANA]=0;
		};
	
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL; //Lev3 erreicht
	}
	else if (manaInvested > (STEP_Firestorm*3))
	&& (self.aivar[AIV_SpellLevel] <= 3)
	{	
		self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - STEP_Firestorm);

		if (self.attribute[ATR_MANA]<0) 
		{
	   		self.attribute[ATR_MANA]=0;
		};
	
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL; //Lev4 erreicht
	}
	else if (manaInvested > (STEP_Firestorm*3))
	&& (self.aivar[AIV_SpellLevel] == 4)
	{
		return SPL_DONTINVEST;	
	};

	return SPL_STATUS_CANINVEST_NO_MANADEC;	
};

func void Spell_Cast_Pyrokinesis(var int spellLevel)
{	
	self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - STEP_Firestorm);

	if (self.attribute[ATR_MANA]<0) 
	{
	   self.attribute[ATR_MANA]=0;
	};
		
	self.aivar[AIV_SelectSpell] += 1;
};
