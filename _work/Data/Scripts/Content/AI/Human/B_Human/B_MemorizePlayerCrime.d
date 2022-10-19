// ***********************************************************************
// B_MemorizePlayerCrime
// ---------------------	
// Neue Tat überschreibt alte Tat, wenn sie schwerer oder gleichschwer ist
// Tag wird gemerkt
// CrimeAbsolutionLevel wird gemerkt
// ---------------------------------
// Ausserdem wird gepetzt, wenn NSC Mitglied einet Petz-Gruppe ist
// ***********************************************************************

func void B_MemorizePlayerCrime (var C_NPC slf, var C_NPC taeter, var int crime)
{	
	// EXIT IF...
	
	// ------ Sicherheitsabfrage ------
	if (!Npc_IsPlayer (taeter))
	{
		return;
	};
	
	// ------ Gilden, die nicht auf Crimes reagieren ------
	if (slf.guild == GIL_DMT)
	//|| (slf.guild == GIL_BDT) Addon Banditen reagieren auf Crimes, allerdings nur die im Lager 
	{
		return;
	};
	
	// FUNC
	
	// ------ PETZCRIME für HomeLocation überschreiben, wenn schwerer als vorherige ------
	if (crime > B_GetPlayerCrime(slf)) 
	{
		B_DeletePetzCrime(slf);
		
		B_AddPetzCrime(slf, crime);
	};

	// ------ neue Straftat überschreibt alte, wenn sie schwerer (oder gleichschwer) ist ------	
	if (crime >= B_GetPlayerCrime(slf))
	{
		slf.aivar[AIV_NpcSawPlayerCommit] 		= crime;
		slf.aivar[AIV_NpcSawPlayerCommitDay] 	= Wld_GetDay();
		slf.aivar[AIV_CrimeAbsolutionLevel] 	= B_GetCurrentAbsolutionLevel(slf); //bleibt für NSCs, die NICHT zu City/Monastery/Farm gehören, immer 0 
	};
};




