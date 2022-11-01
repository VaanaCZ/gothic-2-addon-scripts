// ***************************************************
//  	B_DragonKillCounter	(Setzt die Countervariable "MIS_KilledDragons", wieviele Drachen der SC schon getötet hat.)	
// ***************************************************
var int SwapDragnIsDead;
var int RckDragnIsDead;	
var int FreDragnIsDead; 	
var int IcDragnIsDead; 	
func int B_DragonKillCounter (var C_NPC current_dragon)
{
	var C_NPC Ravn; Ravn = Hlp_GetNpc (BDT_1090_Addon_Raven);
	if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (Ravn)))
	{
		if (RavenIsDead == FALSE)
		{
			PlayVideoEx	("EXTRO_RAVEN.BIK", TRUE,FALSE);
			RavenIsDead = TRUE;
			B_RemoveNpc (Myxir_ADW);
		};
	};

	if (current_dragon.guild == GIL_DRAGON) 	 
	{
		var C_NPC SwapDragn; 	SwapDragn 		= Hlp_GetNpc(Dragon_Swamp);
		var C_NPC RckDragn; 	RckDragn 		= Hlp_GetNpc(Dragon_Rock); 
		var C_NPC FreDragn; 	FreDragn 		= Hlp_GetNpc(Dragon_Fire); 
		var C_NPC IcDragn; 		IcDragn 		= Hlp_GetNpc(Dragon_Ice);  

		if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (SwapDragn)))
		&& (SwapDragnIsDead == FALSE)
		{
			MIS_KilledDragons = (MIS_KilledDragons + 1);
			SwapDragnIsDead = TRUE;
		};
		
		if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (RckDragn)))
		&& (RckDragnIsDead == FALSE)
		{
			MIS_KilledDragons = (MIS_KilledDragons + 1);
			RckDragnIsDead = TRUE;
		};
		
		if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (FreDragn)))
		&& (FreDragnIsDead == FALSE)
		{
			MIS_KilledDragons = (MIS_KilledDragons + 1);
			FreDragnIsDead = TRUE;
		};
	
		if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (IcDragn)))
		&& (IcDragnIsDead == FALSE)
		{
			MIS_KilledDragons = (MIS_KilledDragons + 1);
			IcDragnIsDead = TRUE;
		};
	};

	if (MIS_KilledDragons == 4)
	{
		MIS_AllDragonsDead = TRUE;

		// Biff hat den letzten Drachenkampf überlebt.
			
		if (DJG_BiffParty == TRUE)
			&& ((Npc_IsDead(Biff)) == FALSE)
			{
				DJG_BiffSurvivedLastDragon = TRUE;
			};
	};
	
	if (current_dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		UndeadDragonIsDead = TRUE;
		
		Log_CreateTopic (TOPIC_BackToShip, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BackToShip, LOG_RUNNING);
		B_LogEntry (TOPIC_BackToShip, PRINT_DragKillCount); 

		AI_Teleport	(hero, "UNDEAD_ENDTELEPORT");	 

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			PlayVideoEx	("EXTRO_PAL.BIK", TRUE,FALSE);
		}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			PlayVideoEx	("EXTRO_DJG.BIK", TRUE,FALSE);
		}
		else
		{
			PlayVideoEx	("EXTRO_KDF.BIK", TRUE,FALSE);
		};
	};
};




