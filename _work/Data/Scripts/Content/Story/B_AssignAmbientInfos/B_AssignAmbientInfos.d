// *****************************************************
// B_AssignAmbientInfos
// --------------------
// Verteiler. Aufruf aller B_AssignAmbientInfos-Befehle,
// abhängig von Gilde und Geschlecht
// *****************************************************

FUNC VOID B_AssignAmbientInfos (var C_NPC slf)
{
	// ------ VLK ------
	if (slf.guild == GIL_VLK)	
	{	
		// ------ City ------
		if (slf.npctype == NPCTYPE_AMBIENT)
		{		
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Vlk_1 (slf);	};
			if (slf.voice == 6)		{	B_AssignAmbientInfos_Vlk_6 (slf);	};	
			if (slf.voice == 8) 	{	B_AssignAmbientInfos_Vlk_8 (slf);	};
			if (slf.voice == 16)	{	B_AssignAmbientInfos_Vlk_16 (slf);	};
			if (slf.voice == 17)	{	B_AssignAmbientInfos_Vlk_17 (slf);	};
		};
	};
	
	// ------ MIL -------
	if (slf.guild == GIL_MIL)
	{	
		if (slf.npctype == NPCTYPE_AMBIENT)
		{
			if (slf.voice == 6)		{	B_AssignAmbientInfos_Mil_6 (slf);	};
			if (slf.voice == 7) 	{	B_AssignAmbientInfos_Mil_7 (slf);	};
		};
		
		// ------ Waffenknechte / Burg im Minental ------
		if (slf.npctype == NPCTYPE_OCAMBIENT)
		{
			if (slf.voice == 1)		{	B_AssignAmbientInfos_OCVlk_1 (slf);	};
			if (slf.voice == 6)		{	B_AssignAmbientInfos_OCVlk_6 (slf);	};	
		};
	};
	
	// ------ PAL ------
	if (slf.guild == GIL_PAL)
	{	
		if (slf.npctype == NPCTYPE_AMBIENT)
		{
			if (slf.voice == 4)		{	B_AssignAmbientInfos_Pal_4 (slf);	};	
			if (slf.voice == 9) 	{	B_AssignAmbientInfos_Pal_9 (slf);	};
			if (slf.voice == 12) 	{	B_AssignAmbientInfos_Pal_12 (slf);	};
		};
		
		if (slf.npctype == NPCTYPE_OCAMBIENT)
		{	
			if (slf.voice == 4)		{	B_AssignAmbientInfos_OCPal_4 (slf);	};
			if (slf.voice == 9) 	{	B_AssignAmbientInfos_OCPal_9 (slf);	};
		};	
	};
	
	// ------ BAU (auf Onars Hof = Grossbauer) ------
	if (slf.guild == GIL_BAU)
	{	
		if (slf.npctype == NPCTYPE_AMBIENT)
		{
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Bau_1 (slf);	};
			if (slf.voice == 7) 	{	B_AssignAmbientInfos_Bau_7 (slf);	};
			if (slf.voice == 13) 	{	B_AssignAmbientInfos_Bau_13 (slf);	};
			if (slf.voice == 16)	{	B_AssignAmbientInfos_Bau_16 (slf);	};
		};
	};
	
	// ------ SLD ------
	if (slf.guild == GIL_SLD)
	{	
		if (slf.npctype == NPCTYPE_AMBIENT)
		{
			if (slf.voice == 6)		{	B_AssignAmbientInfos_Sld_6 (slf);	};	
			if (slf.voice == 7) 	{	B_AssignAmbientInfos_Sld_7 (slf);	};
		};
	};
	
	// ------ NOV ------
	if (slf.guild == GIL_NOV)
	{	
		if (slf.npctype == NPCTYPE_AMBIENT)
		{
			if (slf.voice == 3)		{	B_AssignAmbientInfos_Nov_3 (slf);	};
			if (slf.voice == 8) 	{	B_AssignAmbientInfos_Nov_8 (slf);	};
		};
	};
	
	// ------ PIR ------
	if (slf.guild == GIL_PIR)
	{	
		if (slf.npctype == NPCTYPE_AMBIENT)
		{
			if (slf.voice == 6)		{	B_AssignAmbientInfos_Addon_Pir_6 (slf);	};
			if (slf.voice == 7) 	{	B_AssignAmbientInfos_Addon_Pir_7 (slf);	};
		};
	};
	
	
	// ---------------------------------
	// ------ SHORT-AMBIENT-INFOS ------
	// ---------------------------------

	// ------ OUT -------
	if (slf.guild == GIL_OUT)
	{		
		// ------ NW Ambient-Bauern auf den kleinen Höfen -------
		if (slf.npctype == NPCTYPE_AMBIENT)
		{
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Out_1 (slf);	};
			if (slf.voice == 7) 	{	B_AssignAmbientInfos_Out_7 (slf);	};
			if (slf.voice == 13) 	{	B_AssignAmbientInfos_Out_13 (slf);	};
		};
		
		// ------ OW Ambient-Paladine ------
		if (slf.npctype == NPCTYPE_OCAMBIENT) //eigentlich 'OWambient'
		{
			if (slf.voice == 4)		{	B_AssignAmbientInfos_OWPal_4 (slf);	};
		};
	};
	
	// ------ STRF ------
	if (slf.guild == GIL_STRF)
	{	
		if (slf.npctype == NPCTYPE_AMBIENT)
		|| (slf.npctype == NPCTYPE_OCAMBIENT)
		{
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Strf_1	(slf);	};	
			if (slf.voice == 13) 	{	B_AssignAmbientInfos_Strf_13 (slf);	};
		};
		//-----Addon Sklaven----
		if (slf.npctype == NPCTYPE_BL_AMBIENT)
		{
			B_AssignAmbientInfos_Addon_Sklaven_3 (slf);
		};
	};
	
	// ------ BDT ------
	if (slf.guild == GIL_BDT)
	{	
		
		if (slf.npctype == NPCTYPE_AMBIENT)
		|| (slf.npctype == NPCTYPE_OCAMBIENT)
		{
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Bdt_1 (slf);	};
			if (slf.voice == 13) 	{	B_AssignAmbientInfos_Bdt_13 (slf);	};
		};
		
		//-------------------- Addon Welt Lager/Tal Banditen-------------------
		
		if (slf.npctype == NPCTYPE_BL_AMBIENT)
		{								
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Addon_BL_BDT_1 (slf);	};
			if (slf.voice == 13) 	{	B_AssignAmbientInfos_Addon_BL_Bdt_13 (slf);	};
		};
		if (slf.npctype == NPCTYPE_TAL_AMBIENT)
		{
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Addon_TAL_BDT_1 (slf);	};
			if (slf.voice == 13) 	{	B_AssignAmbientInfos_Addon_TAL_BDT_13 (slf);	};
		};
	};
	
	// ------ DMT ------
	if (slf.guild == GIL_DMT)
	{	
		if (slf.npctype == NPCTYPE_AMBIENT)
		|| (slf.npctype == NPCTYPE_OCAMBIENT)
		{
			if (slf.voice == 19) 	{	B_AssignDementorTalk (slf);		};	
		};
	};
};	





	
	

			

