// *********************
// B_GetTotalPetzCounter
// *********************

func int B_GetTotalPetzCounter (var C_NPC slf)
{
	// ------ OldCamp ------
	if (C_NpcBelongsToOldCamp(slf))
	{
		return (PETZCOUNTER_OldCamp_Murder + PETZCOUNTER_OldCamp_Theft + PETZCOUNTER_OldCamp_Attack + PETZCOUNTER_OldCamp_Sheepkiller);
	};
	
	// ------ City ------
	if (C_NpcBelongsToCity(slf))
	{
		return (PETZCOUNTER_City_Murder + PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller);
	};
	
	// ------ Monastery ------
	if (C_NpcBelongsToMonastery(slf))
	{
		return (PETZCOUNTER_Monastery_Murder + PETZCOUNTER_Monastery_Theft + PETZCOUNTER_Monastery_Attack + PETZCOUNTER_Monastery_Sheepkiller);
	};
	
	// ------ Farm ------
	if (C_NpcBelongsToFarm(slf))
	{
		return (PETZCOUNTER_Farm_Murder + PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller);
	};
	// ------ Banditenlager ------
	if (C_NpcBelongsToBL(slf))
	{
		return (PETZCOUNTER_BL_Murder + PETZCOUNTER_BL_Theft + PETZCOUNTER_BL_Attack); 
	};
		
	return 0; //default
};
