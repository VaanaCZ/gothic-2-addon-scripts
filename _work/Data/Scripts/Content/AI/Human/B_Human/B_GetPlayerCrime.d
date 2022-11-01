// ****************
// B_GetPlayerCrime
// ****************

func int B_GetPlayerCrime (var C_NPC slf)
{
	// EXIT IF...
	
	// ------ wenn Schlдgerei lдnger als 2 Tage her, Crime "verjдhrt" ------
	if (slf.aivar[AIV_NpcSawPlayerCommit] <= CRIME_ATTACK) //WICHTIG! Alles was weniger schlimm ist, als Attack darf hцchstens dieselbe Verjдhrungszeit haben!
	{
		if (slf.aivar[AIV_NpcSawPlayerCommitDay] < (Wld_GetDay()-2))
		{
			return CRIME_NONE;
		};
	};
	
	// ------ wenn seit der Tat Absolution erteilt wurde, ist die Tat vergeben  ------
	if (slf.aivar[AIV_CrimeAbsolutionLevel] < B_GetCurrentAbsolutionLevel(slf))
	{
		//Fьr NSCs, die nicht City/Monastery/Farm angehцren, 
		//ist B_GetCurrentAbsolutionLevel immer 0, 
		//somit ist die Abfrage hier immer false
																	
		return CRIME_NONE;
	};
	
	// FUNC
	
	// ------ Inhalt der AIV(=Crime) zurьckliefern ------
	return slf.aivar[AIV_NpcSawPlayerCommit];
};














