// ****************
// B_GetPlayerCrime
// ****************

func int B_GetPlayerCrime (var C_NPC slf)
{
	// EXIT IF...
	
	// ------ wenn Schlägerei länger als 2 Tage her, Crime "verjährt" ------
	if (slf.aivar[AIV_NpcSawPlayerCommit] <= CRIME_ATTACK) //WICHTIG! Alles was weniger schlimm ist, als Attack darf höchstens dieselbe Verjährungszeit haben!
	{
		if (slf.aivar[AIV_NpcSawPlayerCommitDay] < (Wld_GetDay()-2))
		{
			return CRIME_NONE;
		};
	};
	
	// ------ wenn seit der Tat Absolution erteilt wurde, ist die Tat vergeben  ------
	if (slf.aivar[AIV_CrimeAbsolutionLevel] < B_GetCurrentAbsolutionLevel(slf))
	{
		//Für NSCs, die nicht City/Monastery/Farm angehören, 
		//ist B_GetCurrentAbsolutionLevel immer 0, 
		//somit ist die Abfrage hier immer false
																	
		return CRIME_NONE;
	};
	
	// FUNC
	
	// ------ Inhalt der AIV(=Crime) zurückliefern ------
	return slf.aivar[AIV_NpcSawPlayerCommit];
};














