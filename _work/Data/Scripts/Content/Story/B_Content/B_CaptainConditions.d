// ***************************************************
//  	B_CaptainConditions	(Wann ist ein Kapitän bereit im Kapitel 5 zur Dracheninsel  zu fahren.)	
// ***************************************************

func int B_CaptainConditions (var C_NPC Captain)
{
 	if (Kapitel == 5)
 	&& (SCGotCaptain == TRUE)
	&& (Npc_HasItems (hero,ItWr_Seamap_Irdorath))
	&& (crewmember_Count >= Min_Crew)
	&& (Npc_GetDistToWP(Captain,"NW_WAITFOR_SHIP_CAPTAIN")<2000)  
	&& ((MIS_ShipIsFree == TRUE) 
		|| 	(
				(Npc_IsDead(Schiffswache_212))
			 && (Npc_IsDead(Schiffswache_213)))
			)			
		{
				MIS_ShipIsFree = TRUE;
				return TRUE;
		};
};


