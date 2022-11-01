// ***************************************************
//  	B_CloseTopics_Mattes ()	(verschiebt Topics in den zugehörigen Log-Ordner bei FAILED oder SUCCESS)	
// ***************************************************
	
func void B_CloseTopics_Mattes ()	
{	
	//--------Addon----------------------
	B_CloseTopic	(Topic_Addon_Fortuno, 0, SC_KnowsFortunoInfos, 6); 
	B_CloseTopic	(Topic_Addon_Hammer, MIS_SnafHammer, 0, 6); 
	B_CloseTopic	(Topic_Addon_Buddler, MIS_Send_Buddler, 0, 4); 
	B_CloseTopic	(Topic_Addon_Logan,MIS_HlpLogan,0,4);
	B_CloseTopic	(Topic_Addon_Stoneplate,MIS_HlpEdgor,0,4); 
	B_CloseTopic	(Topic_Addon_Esteban,MIS_Judas,0,4); 
	B_CloseTopic	(Topic_Addon_Huno,MIS_Huno_Stahl,0,6); 
	B_CloseTopic	(Topic_Addon_Fisk,MIS_Lennar_Lockpick,0,6); 
	B_CloseTopic	(Topic_Addon_Tempel,MIS_BloodwynRaus,0,4); 
	B_CloseTopic	(Topic_Addon_Franco,0,Player_HasTalkedToBanditCamp,4); 
	B_CloseTopic	(Topic_Addon_Senyan,Senyan_Erpressung,0,4); 
	
	//-----Kapitel 1----------------------
	
	B_CloseTopic	(TOPIC_Bandits, MIS_Steckbriefe, 0, 4); 
	
	//-----Lobarts Hof--------------------
	
	B_CloseTopic	(TOPIC_Kleidung, 0, Lobart_Kleidung_Verkauft, 2);	
	B_CloseTopic	(TOPIC_Rueben, MIS_Lobart_Rueben, 0, 3);	
	B_CloseTopic	(TOPIC_Ruebenbringen, MIS_Lobart_RuebenToHilda, 0, 3);
	B_CloseTopic	(TOPIC_Vino, MIS_Vino_Wein, 0, 3);
	B_CloseTopic	(TOPIC_Hilda, MIS_Hilda_PfanneKaufen, 0, 3);
	B_CloseTopic	(TOPIC_Maleth, MIS_Maleth_Bandits, 0, 3);
	
	//----------Zugang zur Stadt--------------------
	B_CloseTopic	(TOPIC_City, 0, Mil_310_schonmalreingelassen, 2);
	
	//----------Oberes Viertel--------------------
	B_CloseTopic	(TOPIC_Lehrling, MIS_Apprentice, 0, 6);
	B_CloseTopic	(TOPIC_OV, 0, Mil_305_schonmalreingelassen, 2);
	
	//----------------Lehrling in Khorinis--------------------
	B_CloseTopic	(TOPIC_Thorben, MIS_Thorben_GetBlessings, 0, 6);
	B_CloseTopic	(TOPIC_Thorben, MIS_Apprentice, 0, 6);
	B_CloseTopic	(TOPIC_BosperWolf, MIS_Bosper_WolfFurs, 0, 6);
	B_CloseTopic	(TOPIC_BosperBogen, MIS_Bosper_Bogen, 0, 6);
	B_CloseTopic	(TOPIC_ConstantinoPlants, MIS_Constantino_BringHerbs, 0, 6);
	B_CloseTopic	(TOPIC_HaradOrk, MIS_Harad_Orc, 0, 6);
	
	//----------------Händler und Diebe--------------------
	B_CloseTopic	(TOPIC_Canthar,MIS_Canthars_KomproBrief , 0, 3);
	B_CloseTopic	(TOPIC_HakonBanditen, MIS_HakonBandits, 0, 6);
	B_CloseTopic	(TOPIC_Jora, Jora_Gold, 0, 6);
	B_CloseTopic	(TOPIC_JoraDieb, Jora_Dieb, 0, 6);
	B_CloseTopic	(TOPIC_Matteo, MIS_Matteo_Gold, 0, 6);
	B_CloseTopic	(TOPIC_Nagur, MIS_Nagur_Bote, 0, 6);
	B_CloseTopic	(TOPIC_Baltram, MIS_Baltram_ScoutAkil, 0, 6);
	
	
	
	B_CloseTopic	(Topic_CassiaRing, MIS_CassiaRing, 0, 6);
	B_CloseTopic	(Topic_CassiaKelche, MIS_CassiaKelche, 0, 6);
	B_CloseTopic	(Topic_RamirezSextant, 0,Ramirez_Sextant, 6);
	
	//---------------Hafenviertel und Sonstiges -------------------------
	B_CloseTopic	(TOPIC_Ignaz, MIS_Ignaz_Charm, 0, 6);
	B_CloseTopic	(TOPIC_AlrikSchwert, MIS_Alrik_Sword, 0, 6);
	B_CloseTopic	(TOPIC_Alwin, MIS_AttackFellan, 0, 6);
	B_CloseTopic	(TOPIC_Garvell, MIS_Garvell_Infos, 0, 3);
	

	//---------------Aufnahme erste Gilde -------------------------
	B_CloseTopic	(TOPIC_BecomeMIL,MIL_Aufnahme , 0, 2);
	B_CloseTopic	(TOPIC_BecomeSLD,SLD_Aufnahme , 0, 2);
	B_CloseTopic	(TOPIC_BecomeKdF,KDF_Aufnahme , 0, 2);
					
	//--------------- Miliz Missionen  -------------------------				
	B_CloseTopic	(TOPIC_Peck,MIS_Andre_Peck , 0, 6);
	B_CloseTopic	(TOPIC_Warehouse,MIS_ANDRE_WAREHOUSE , 0, 6);
	B_CloseTopic	(TOPIC_Redlight,MIS_Andre_REDLIGHT , 0, 6);
	B_CloseTopic	(TOPIC_Feldraeuber,MIS_AndreHelpLobart , 0, 6);
	
	
	//--------------- KLOSTER  -------------------------				
	
	B_CloseTopic	(Topic_Kloster,0 , NOV_Aufnahme, 2);
	B_CloseTopic	(Topic_Gemeinschaft,MIS_KlosterArbeit , 0, 2);
	 
	B_CloseTopic	(Topic_Neorasrezept,MIS_Neorasrezept  , 0, 2);
	B_CloseTopic	(Topic_NeorasPflanzen,MIS_NeorasPflanzen , 0, 2);
	B_CloseTopic	(Topic_IsgarothWolf,MIS_IsgarothWolf , 0, 2);
	B_CloseTopic	(Topic_ParlanFegen,MIS_ParlanFegen  , 0, 2);
	B_CloseTopic	(Topic_GoraxEssen,MIS_GoraxEssen  , 0, 2);
	B_CloseTopic	(Topic_GoraxWein,MIS_GoraxWein , 0, 2);
	
	B_CloseTopic	(Topic_OpolosRezept,Opolos_Rezept , 0, 2);
	B_CloseTopic	(Topic_MardukBeten,MIS_MardukBeten , 0, 2);
	B_CloseTopic	(Topic_BaboTrain,0 , Babo_Training, 2);
  
  	B_CloseTopic	(Topic_KarrasCharm,MIS_KarrasVergessen , 0, 2);
	
	B_CloseTopic	(TOPIC_FireContest,0 , Fire_Contest, 2);
	B_CloseTopic	(TOPIC_Golem,MIS_GOLEM , 0, 2);
	B_CloseTopic	(TOPIC_Rune,MIS_RUNE , 0, 2);
	B_CloseTopic	(TOPIC_Schnitzeljagd,MIS_SCHNITZELJAGD , 0, 2);
 	
 	B_CloseTopic	(Topic_BaboGaertner,MIS_HelpBabo , 0, 2);
 	B_CloseTopic	(Topic_DyrianDrin,MIS_HelpDyrian , 0, 2);
 	B_CloseTopic	(Topic_OpolosStudy,MIS_HelpOpolos , 0, 2);
 		
 	//--------------- SÖLDNER  -------------------------				
 	B_CloseTopic	(TOPIC_BecomeSLD,SLD_Aufnahme , 0, 2);
	B_CloseTopic	(TOPIC_SLDRespekt,0 , Torlof_GenugStimmen, 2);
	
	B_CloseTopic	(TOPIC_TorlofPacht,MIS_Torlof_HolPachtVonSekob , 0, 3);
	B_CloseTopic	(TOPIC_TorlofMiliz,MIS_Torlof_BengarMilizKlatschen , 0, 3);
	
	B_CloseTopic	(TOPIC_JarvisSLDKo,MIS_Jarvis_SldKO , 0, 2);
 	B_CloseTopic	(TOPIC_CordProve,0 , Cord_Approved, 2);
 	B_CloseTopic	(Topic_CipherHerb,MIS_Cipher_BringWeed ,0, 2);
 	B_CloseTopic	(Topic_CipherPaket,MIS_Cipher_Paket ,0, 6); 
	B_CloseTopic	(Topic_RodWette,0 ,Rod_WetteGewonnen, 2); 
	B_CloseTopic	(TOPIC_FesterRauber,MIS_Fester_KillBugs ,0, 6); 
	B_CloseTopic	(TOPIC_TheklaEintopf,MIS_Thekla_Paket ,0, 6); 
	
	B_CloseTopic	(TOPIC_SagittaHerb,MIS_Sagitta_Herb ,0, 6); 
	B_CloseTopic	(TOPIC_PepeWolves,MIS_Pepe_KillWolves ,0, 6); 
	B_CloseTopic	(TOPIC_KickBullco,MIS_Pepe_KickBullco ,0, 4); 
	
	B_CloseTopic	(Topic_Frieden,MIS_Lee_Friedensangebot ,0, 6); 


	//--------------- Kapitel 2  -------------------------

	B_CloseTopic	(TOPIC_MISOLDWORLD,MIS_OLDWORLD ,0, 3); 
	B_CloseTopic	(TOPIC_ScoutMine, MIS_ScoutMine,0, 3); 
	B_CloseTopic	(TOPIC_RescueGorn, MIS_RescueGorn,0, 3); 

	B_CloseTopic	(TOPIC_FajethKillSnapper, MIS_Fajeth_Kill_Snapper,0, 3); 
	
	B_CloseTopic	(Topic_OricBruder, 0,OricBruder, 3);
	B_CloseTopic	(TopicBrutusKasse, 0,Brutus_TeachSTR, 6);
	B_CloseTopic	(Topic_TengronRing, 0,TengronRing, 6); 
	B_CloseTopic	(TOPIC_BringMeat, MIS_Engor_BringMeat,0,6); 
	B_CloseTopic	(TOPIC_BilgotEscort, MIS_RescueBilgot,TschuessBilgot,6); 
	B_CloseTopic	(Topic_MarcosJungs, MIS_Marcos_Jungs,0,3);
	
	B_CloseTopic	(TOPIC_Botschaft, MIS_Vatras_Message,0,6); 
	B_CloseTopic	(TOPIC_Lutero, Lutero_Krallen,0,6); 
	B_CloseTopic	(TOPIC_Fernando, 0,Fernando_Erz,6); 
	
	//--------------- Reste  -------------------------
	B_CloseTopic	(TOPIC_PyrokarClearDemonTower, MIS_PyrokarClearDemonTower,0,6); 	
	B_CloseTopic	(TOPIC_HyglasBringBook, MIS_HyglasBringBook,0,6); 	
	B_CloseTopic	(Topic_BabosDocs, MIS_BabosDocs,0,6); 	
	
	B_CloseTopic	(TOPIC_Wolf_BringCrawlerPlates, MIS_Wolf_BringCrawlerPlates,0,6); 	
	B_CloseTopic	(TOPIC_HelpDiegoNW, MIS_HelpDiegoNW,0,6); 	
	B_CloseTopic	(TOPIC_DiegosResidence, MIS_DiegosResidence,0,6); 	

};
