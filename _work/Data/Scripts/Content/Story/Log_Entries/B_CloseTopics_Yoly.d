// ***************************************************
//  	B_CloseTopics_Yoly ()	(verschiebt Topics in den zugehörigen Log-Ordner bei FAILED oder SUCCESS)	
// ***************************************************
func void B_CloseTopics_Yoly ()	
{	
//ADDON

	//1. Kapitel
	B_CloseTopic	(TOPIC_Addon_PickForConstantino, 0, Mil_310_schonmalreingelassen, 3);	
	B_CloseTopic	(TOPIC_Addon_Greg_NW, MIS_Addon_Greg_RakeCave, ENTERED_ADDONWORLD, 3);	
	B_CloseTopic	(TOPIC_Addon_Ornament, 0, ENTERED_ADDONWORLD, 3);	
	B_CloseTopic	(TOPIC_Addon_RingOfWater, RangerMeetingRunning, 0, 3);	
	B_CloseTopic	(TOPIC_Addon_HolRiordian, MIS_Addon_Saturas_BringRiordian2Me, 0, 3);	
	B_CloseTopic	(TOPIC_Addon_CavalornTheHut, 0, TOPIC_End_CavalornTheHut, 6);	
	B_CloseTopic	(TOPIC_Addon_KillBrago, MIS_Addon_Cavalorn_KillBrago, 0, 3);	
	B_CloseTopic	(TOPIC_Addon_Bandittrader, MIS_Vatras_FindTheBanditTrader, 0, 6);
	B_CloseTopic	(TOPIC_Addon_MissingPeople, 0, Sklaven_Flucht, 6);
	B_CloseTopic	(TOPIC_Addon_WhoStolePeople, MIS_Addon_Vatras_WhereAreMissingPeople, 0, 6);
	B_CloseTopic	(TOPIC_Addon_BringRangerToLares, MIS_Lares_BringRangerToMe, 0, 4);	
	B_CloseTopic	(TOPIC_Addon_KDW, 0, ENTERED_ADDONWORLD, 4); 			
	B_CloseTopic	(TOPIC_Addon_TeleportsNW, 0, SCUsed_AllNWTeleporststones, 6);	
	B_CloseTopic	(TOPIC_Addon_RangerHelpKDF, MIS_Addon_Daron_GetStatue, TOPIC_End_RangerHelpKDF, 2); 
	B_CloseTopic	(TOPIC_Addon_RangerHelpSLD, SLD_Aufnahme, TOPIC_End_RangerHelpSLD, 2); 
	B_CloseTopic	(TOPIC_Addon_RangerHelpMIL, MIL_Aufnahme, 0, 2); 
	B_CloseTopic	(TOPIC_Addon_Stoneplates, 0, PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1], 4); 
	B_CloseTopic	(TOPIC_Addon_FarimsFish, MIS_Addon_Farim_PaladinFisch, 0, 6); 
	B_CloseTopic	(TOPIC_Addon_Lucia, 0, TOPIC_END_Lucia, 6); 
	B_CloseTopic	(TOPIC_Addon_Erol, MIS_Addon_Erol_BanditStuff, 0, 4); 
	B_CloseTopic	(TOPIC_Addon_Joe, 0, TOPIC_END_Joe, 4); 
	B_CloseTopic	(TOPIC_Addon_BromorsGold, MIS_Bromor_LuciaStoleGold, 0, 6); 
	B_CloseTopic	(TOPIC_Addon_BaltramSkipTrade, 0, TOPIC_END_BaltramSkipTrade, 6); 

	//Addonworld
	B_CloseTopic	(TOPIC_Addon_TeleportsADW, 0, SC_ADW_ActivatedAllTelePortStones, 6);	
	B_CloseTopic	(TOPIC_Addon_Sklaven, 0, Sklaven_Flucht, 6);		
	B_CloseTopic	(TOPIC_Addon_RavenKDW, 0, RavenIsDead, 4); 
	B_CloseTopic	(TOPIC_Addon_Relicts, 0, Saturas_SCBroughtAllToken, 4); 
	B_CloseTopic	(TOPIC_Addon_Lance, 0, TOPIC_End_Lance, 6); 
	B_CloseTopic	(TOPIC_Addon_HousesOfRulers, MIS_Riordian_HousesOfRulers, RavenIsDead, 6);  
	B_CloseTopic	(TOPIC_Addon_CanyonOrcs, 0, TOPIC_END_CanyonOrcs, 6);  
	B_CloseTopic	(TOPIC_Addon_BDTRuestung, 0, MIS_Greg_ScoutBandits, 6);   //Joly:Ist korrekt so!!! Denn MIS_Greg_ScoutBandits == LOG_RUNNING == 1 !!!!!!!!!!!!!!!!
	B_CloseTopic	(TOPIC_Addon_Quarhodron, 0, Saturas_KnowsHow2GetInTempel, 4); 
	B_CloseTopic	(TOPIC_Addon_Kammern, 0, RavenIsDead, 4);
	B_CloseTopic	(TOPIC_Addon_Klaue, 0, BeliarsWeaponUpgrated, 4); 
	B_CloseTopic	(TOPIC_Addon_Klaue, 0, TOPIC_END_Klaue, 4); 
	B_CloseTopic	(TOPIC_Addon_Flut, 0, TOPIC_END_Flut, 4); 

	//Nach Addonworld
	B_CloseTopic	(TOPIC_Addon_VatrasAbloesung, 0, VatrasCanLeaveTown_Kap3, 4);		
	
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
               			
               			
               			
               					
               		
     
     
     
     
     
     




//Gothic 2

	B_CloseTopic	(TOPIC_Bronkoeingeschuechtert, MIS_Sekob_Bronko_eingeschuechtert, 0, 6);	
	B_CloseTopic	(TOPIC_BalthasarsSchafe, MIS_Balthasar_BengarsWeide, 0, 6);	

	if((hero.guild != GIL_NONE)&&(hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))	//Joly: Kapitel 2 und nicht bei Lee
	{
		Log_SetTopicStatus(TOPIC_BalthasarsSchafe, LOG_OBSOLETE);
	};

	B_CloseTopic	(TOPIC_AkilsSLDStillthere, 0, TOPIC_END_AkilsSLDStillthere, 6);	
	B_CloseTopic	(TOPIC_Wettsaufen, MIS_Rukhar_Wettkampf, 0, 6);	
	B_CloseTopic	(TOPIC_GaanSchnaubi, MIS_Gaan_Snapper, 0, 6);	
	B_CloseTopic	(TOPIC_GromAskTeacher, 0, Grom_TeachAnimalTrophy, 6);	
	B_CloseTopic	(TOPIC_DragomirsArmbrust, MIS_DragomirsArmbrust, 0, 6);	
	B_CloseTopic	(TOPIC_KillLighthouseBandits, MIS_Jack_KillLighthouseBandits, 0, 6);	
	B_CloseTopic	(TOPIC_Torlof_Dmt, MIS_Torlof_Dmt, 0, 6);	
	B_CloseTopic	(TOPIC_HannaRetrieveLetter, MIS_HannaRetrieveLetter, 0, 6);	
	B_CloseTopic	(Topic_MarcosJungs, MIS_Marcos_Jungs, 0, 6);	

	// Kapitel 3
	B_CloseTopic	(TOPIC_Buster_KillShadowbeasts, MIS_Buster_KillShadowbeasts_DJG, 0, 6);	
	B_CloseTopic	(TOPIC_Ulthar_HeileSchreine_PAL, MIS_Ulthar_HeileSchreine_PAL, 0, 6);	
	B_CloseTopic	(TOPIC_DEMENTOREN, 0, TOPIC_END_DEMENTOREN, 999);	
	B_CloseTopic	(TOPIC_INNOSEYE, 0, TOPIC_END_INNOSEYE, 4);	
	B_CloseTopic	(TOPIC_TraitorPedro, 0, SCFoundPedro, 999);	
	B_CloseTopic	(TOPIC_SekobDMT, 0, TOPIC_END_SekobDMT, 6);	
	B_CloseTopic	(TOPIC_AkilSchafDiebe, MIS_Akil_SchafDiebe, 0, 6);	
	B_CloseTopic	(TOPIC_HealHilda, MIS_HealHilda, 0, 6);	
	B_CloseTopic	(TOPIC_MalethsGehstock, 0, TOPIC_END_MalethsGehstock, 6);	
	B_CloseTopic	(TOPIC_BengarALLEIN, MIS_GetMalakBack, 0, 6);	
	B_CloseTopic	(TOPIC_BengarALLEIN, MIS_BengarsHelpingSLD, 0, 6);	
	B_CloseTopic	(TOPIC_MinenAnteile, 0, TOPIC_END_MinenAnteile, 6);	
	B_CloseTopic	(TOPIC_RichterLakai, MIS_Lee_JudgeRichter, 0, 6);	
	B_CloseTopic	(TOPIC_KillHoshPak, MIS_KillHoshPak, 0, 6);	
	B_CloseTopic	(TOPIC_URSHAK, 0, URSHAK_SUCKED, 6);	
	
	// Kapitel 4
	B_CloseTopic	(TOPIC_DRACHENJAGD, 0, MIS_AllDragonsDead, 5);	
	B_CloseTopic	(TOPIC_LobartsOrKProblem, 0, TOPIC_END_LobartsOrKProblem, 6);	
	B_CloseTopic	(TOPIC_SylvioKillIceGolem, MIS_DJG_Sylvio_KillIceGolem, TOPIC_END_SylvioKillIceGolem, 6);	
	B_CloseTopic	(TOPIC_Dragonhunter, 0, MIS_AllDragonsDead, 5);	
	B_CloseTopic	(TOPIC_AngarsAmulett, 0, DJG_AngarGotAmulett, 5);	
	B_CloseTopic	(TOPIC_JanBecomesSmith, MIS_JanBecomesSmith, 0, 6);	
	B_CloseTopic	(TOPIC_FerrosSword, MIS_FerrosSword, 0, 6);	
	B_CloseTopic	(TOPIC_DRACHENEIER, 0, TOPIC_END_DRACHENEIER, 6);	
	B_CloseTopic	(TOPIC_DRACHENEIERNeoras, MIS_Neoras_DragonEgg, 0, 6);
	B_CloseTopic	(TOPIC_OrcElite, 0, TOPIC_END_OrcElite, 6);
	B_CloseTopic	(TOPIC_KillTrollBlack, MIS_Raoul_KillTrollBlack, 0, 6);
	B_CloseTopic	(TOPIC_Dar_BringOrcEliteRing, MIS_Dar_BringOrcEliteRing, 0, 6);
	B_CloseTopic	(TOPIC_FoundVinosKellerei, 0, FoundVinosKellerei, 6);
	B_CloseTopic	(TOPIC_BrutusMeatbugs, 0, TOPIC_END_BrutusMeatbugs, 6);
	B_CloseTopic	(TOPIC_GeroldGiveFood, MIS_GeroldGiveFood, 0, 6);
	B_CloseTopic	(TOPIC_Sengrath_Missing, 0, TOPIC_END_Sengrath_Missing, 6);
	B_CloseTopic	(TOPIC_Talbin_Runs, 0, TOPIC_END_Talbin_Runs, 6);
	B_CloseTopic	(TOPIC_KerolothsGeldbeutel, 0, TOPIC_END_KerolothsGeldbeutel, 6);

	// Kapitel 5
	B_CloseTopic	(TOPIC_BuchHallenVonIrdorath, 0, MIS_SCKnowsWayToIrdorath, 6);	
	B_CloseTopic	(TOPIC_bringRosiBackToSekob, MIS_bringRosiBackToSekob, 0, 6);	
	B_CloseTopic	(TOPIC_RosisFlucht, MIS_RosisFlucht, 0, 6);	
	B_CloseTopic	(TOPIC_HealRandolph, MIS_HealRandolph, 0, 6);	
	
	// Kapitel 6
	B_CloseTopic	(TOPIC_HallenVonIrdorath, 0, UndeadDragonIsDead, 999);	
	B_CloseTopic	(TOPIC_MyCrew, 0, UndeadDragonIsDead, 999);	
};

