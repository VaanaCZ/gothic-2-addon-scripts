// *************************************************************************************
// C_PredatorFoundPrey
// -------------------
// Monster erkennen NUR Menschen oder andere Monster,
// wenn in B_InitMonster Attitudes die Attitüde zu other auf HOSTILE gesetzt ist.
// Sie reagieren auf diese "Feinde" mit B_AssessEnemy
// Folgende Ausnahmen gehen in ZS_MM_Hunt (--> ZS_MM_Attack), weil other ihre Beute ist!
// Die Beute flieht getriggert durch PERC_ASSESSWARN (gesendet von Jäger)
// *************************************************************************************

func INT C_PredatorFoundPrey (var C_NPC slf, var C_NPC oth)
{
	// ------ Wolf jagt... ------
	if (slf.guild == GIL_WOLF) && (slf.aivar[AIV_MM_REAL_ID] != ID_Keiler) //Wolf und Warg		
	{
		if (oth.guild == GIL_SHEEP)			{	return TRUE;	};
		if (oth.guild == GIL_GIANT_RAT)		{	return TRUE;	};
		if (oth.guild == GIL_MOLERAT)		{	return TRUE;	};
		if (oth.guild == GIL_SCAVENGER)	&& (oth.aivar[AIV_MM_REAL_ID] != ID_ORCBITER)	{	return TRUE;	};
	};
	
	// ------ Lurker jagt... ------
	if (slf.guild == GIL_LURKER)			
	{
		if (oth.guild == GIL_GOBBO)		{	return TRUE;	};
	};
	
	// ------ Snapper jagt... ------
	if (slf.guild == GIL_SNAPPER) //Snapper und Dragon Snapper		
	{
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
		if (oth.guild == GIL_GOBBO)				{	return TRUE;	};
		if (oth.guild == GIL_SHEEP)				{	return TRUE;	};
		if (oth.guild == GIL_GIANT_RAT)			{	return TRUE;	};
		if (oth.guild == GIL_MOLERAT)			{	return TRUE;	};
		if (oth.guild == GIL_SCAVENGER)	&& (oth.aivar[AIV_MM_REAL_ID] != ID_ORCBITER)	{	return TRUE;	};
	};
	
	// ------ Shadowbeast jagt... ------
	if (slf.guild == GIL_SHADOWBEAST)			
	{
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
		if (oth.guild > GIL_SEPERATOR_ORC)		{	return TRUE;	};
		if (oth.guild == GIL_SHEEP)				{	return TRUE;	};
		if (oth.guild == GIL_GIANT_RAT)			{	return TRUE;	};
		if (oth.guild == GIL_MOLERAT)			{	return TRUE;	};
		if (oth.guild == GIL_SCAVENGER)	&& (oth.aivar[AIV_MM_REAL_ID] != ID_ORCBITER)	{	return TRUE;	};
	};
	
	return FALSE;
};


     
                                                                           
                                                                           
                                                            
                                                                           
                          
	                           

                           
                           
                 
                               
	                           
                                                                           
                                                                           
















