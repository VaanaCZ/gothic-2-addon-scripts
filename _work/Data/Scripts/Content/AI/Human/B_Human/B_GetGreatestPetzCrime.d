// ****************************************************
// B_GetPetzCrime
// --------------
// Liefert Petzcrime in Abhängigkeit von Home-Location
// wenn NSC keine Home-Location angehört --> CRIME_NONE
// ****************************************************

func int B_GetGreatestPetzCrime (var C_NPC slf)
{
	// ------ OldCamp ------
	if (C_NpcBelongsToOldCamp(slf))
	{
		if (PETZCOUNTER_OldCamp_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_OldCamp_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_OldCamp_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_OldCamp_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	// ------ City ------
	if (C_NpcBelongsToCity(slf))
	{
		if (PETZCOUNTER_City_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_City_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_City_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	// ------ Monastery ------
	if (C_NpcBelongsToMonastery(slf))
	{
		if (PETZCOUNTER_Monastery_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_Monastery_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_Monastery_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_Monastery_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	// ------ Farm ------
	if (C_NpcBelongsToFarm(slf))
	{
		if (PETZCOUNTER_Farm_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_Farm_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	// ------ Banditenlager Addon ------
	if (C_NpcBelongsToBL(slf))
	{
		if (PETZCOUNTER_BL_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_BL_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_BL_Attack > 0)
		{
			return CRIME_ATTACK;
		};
	};
		
	return CRIME_NONE;
};
		
		
