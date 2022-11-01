// **************************************************
// B_AddPetzCrime
// --------------
// Erhöht Petzcrime-Counter der übergebenen Crime
// in der der Home-Location
// **************************************************

func void B_AddPetzCrime (var C_NPC slf, var int crime)
{
	// ------ OldCamp ------
	if (C_NpcBelongsToOldCamp(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_OldCamp_Murder = PETZCOUNTER_OldCamp_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_OldCamp_Theft = PETZCOUNTER_OldCamp_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_OldCamp_Attack = PETZCOUNTER_OldCamp_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_OldCamp_Sheepkiller = PETZCOUNTER_OldCamp_Sheepkiller + 1;
		};
	};
	
	// ------ City ------
	if (C_NpcBelongsToCity(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_City_Murder = PETZCOUNTER_City_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_City_Theft = PETZCOUNTER_City_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_City_Attack = PETZCOUNTER_City_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_City_Sheepkiller = PETZCOUNTER_City_Sheepkiller + 1;
		};
	};
	
	// ------ Monastery ------
	if (C_NpcBelongsToMonastery(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_Monastery_Murder = PETZCOUNTER_Monastery_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_Monastery_Theft = PETZCOUNTER_Monastery_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Monastery_Attack = PETZCOUNTER_Monastery_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Monastery_Sheepkiller = PETZCOUNTER_Monastery_Sheepkiller + 1;
		};
	};

	// ------ Farm ------
	if (C_NpcBelongsToFarm(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_Farm_Murder = PETZCOUNTER_Farm_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_Farm_Theft = PETZCOUNTER_Farm_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Farm_Attack = PETZCOUNTER_Farm_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Farm_Sheepkiller = PETZCOUNTER_Farm_Sheepkiller + 1;
		};
	};
	// ------ Banditenlager Addon ------
	if (C_NpcBelongsToBL(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_BL_Murder = PETZCOUNTER_BL_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_BL_Theft = PETZCOUNTER_BL_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_BL_Attack = PETZCOUNTER_BL_Attack + 1;
		};
	
	};
};

