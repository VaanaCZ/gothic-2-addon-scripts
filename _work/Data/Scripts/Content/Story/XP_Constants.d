// ***************************
// 		Erfahrungspunkte
// ***************************
//********************************************************************************
//									ADDON
//********************************************************************************

const int	XP_STUNTBONUS							= 100;
const int	XP_EXPLOITBONUS							= -100;

//Kapitel 1 ADDON
const int 	XP_Addon_Cavalorn_KillBrago				= 100;
const int 	XP_Addon_PickForConstantino				= 100;
const int 	XP_Addon_CavalornTrust					= 200;
const int 	XP_Addon_Cavalorn_Letter2Vatras			= 200;
const int 	XP_Addon_Cavalorn_Letter2Vatras_Opened	= 50;
const int 	XP_Addon_BringMissingOrnament			= 200;	//für jedes der 3 Ornamente
const int 	XP_Addon_Martin_GotRangar_Report		= 100;	//(nur Milizanwärter)
const int 	XP_Addon_Martin_GotRangar				= 300;	//(nur Milizanwärter)
const int 	XP_Addon_ReturnedLostInnosStatue_Daron	= 300;	//(nur KDFanwärter)
const int 	XP_Addon_ReportLostInnosStatue2Daron	= 100;	//(nur KDFanwärter)
const int 	XP_Addon_Cord_Look4Patrick				= 300;	//(nur SLDanwärter)
const int 	XP_Addon_Dexter_KnowsPatrick			= 100;	//(nur SLDanwärter)
const int 	XP_Addon_Farim_PaladinFisch				= 100;	
const int 	XP_Addon_Vatras_WhereAreMissingPeople	= 400;	
const int 	XP_Addon_SC_IsRanger					= 400;	
const int 	XP_Addon_RakeCavePlundered				= 100;	
const int 	XP_Addon_Greg_RakeCave					= 300;	
const int 	XP_Addon_Skip_BaltramPaket				= 100;	
const int 	XP_Addon_Bromor_LuciaGold				= 200;	
const int 	XP_Addon_LuciasLetter					= 100;	
const int 	XP_Addon_BringStoneplate				= 50;	//für jede Steintafel
const int 	XP_Addon_Fernando_HatsZugegeben			= 100;	
const int 	XP_Addon_Vatras_FindTheBanditTrader		= 200;	
const int 	XP_Addon_VatrasStonplate 				= 30;	//Pro zu ihm gebrachte Common Steintafel!
const int 	XP_Addon_FarimSchutz 					= 50;	
const int 	XP_Addon_FernandoMartin					= 200;	
const int 	XP_Addon_Vatras_MissingPeopleReport		= 50;	//pro Report bei Vatras für die missing People
const int 	XP_Addon_AllNWTeleporststones			= 200;
const int	XP_Greg_NW_GiveBauArmor					= 100;	

//Kapitel 2 ADDON	
const int 	XP_Addon_LookForMorgan					= 100;	//Für AlligatorJack Moran suchen
const int 	XP_Addon_MorganRumBringen				= 150;	//Bringe Morgan 3 Flasche Rum
const int 	XP_Addon_KrokoJagd						= 200;	//Alligatoren Jagd	
const int   XP_Addon_Francis_FreeBDTTower			= 0;  //RAUS
const int   XP_Addon_Henry_FreeBDTTower				= 200; 
const int	XP_Addon_HenryProofCrew					= 200;	//Überzeuge HenrysMänner
const int	XP_Addon_MorganProofCrew				= 200;	//Überzeuge MorgansMänner
const int 	XP_Addon_AlligatorJAck_BringMeat		= 200;	//Fleischlieferung an Morgan	
const int	XP_Addon_MorgansRing					= 200;	
const int   XP_ADDON_Garett_Bring_Kompass			= 300;
const int 	XP_Addon_JoinMorgansCrew				= 0;
const int	XP_Addon_JoinHenrysCrew					= 0; //gibts nicht mehr
const int 	XP_Bones_Goldmine						= 200;
const int 	XP_Greg_ScoutBandits					= 200;
const int	XP_Bill_SearchEsteban					= 200;
const int	XP_Addon_Bill_KillAngusMurder			= 200;
const int	XP_Addon_Bill_KillEsteban				= 0;	 // gibts nicht, mehr kann raus
const int	XP_Addon_FoundAllHouses					= 300;
const int	XP_Addon_Riordian_OrksWeg				= 300;
const int	XP_Addon_Riordian_FoundHouse			= 100; //5 mal für jedes Haus einen
const int 	XP_addon_ClearCanyon					= 250;
const int 	XP_Bones_GetBDTArmor					= 200;

//Kapitel 3 ADDON
const int   XP_Addon_Andre_MissingPeople			= 600;  //(nur MIL oder PAL)Report bei Andre für Returning Missing People.
const int   XP_Addon_ForOneToken					= 400;  //für jede der 5 Steintafeln (Token) an Saturas abgegeben.
const int   XP_Addon_Myxir_GeistBeschwoeren			= 400;  //SC berichtet von geglückter Geistbeschwörung.
const int   XP_Addon_Saturas_RavensDead				= 1000;  //SC berichtet Saturas vom Tod Ravens
const int   XP_Addon_BeliarsWeaponAbgegeben			= 2000;  //SC trennt sich von Beliars Klaue
const int   XP_Addon_ActivatedTeleportStone			= 500;  //(5 mal) für jeden aktivierten Teleportstein. bei Merdarion.
const int   XP_Addon_CavalornsBeutel				= 500;  //Cavalorn kriegt seinen Beutel wieder.
const int   XP_Addon_LanceLeiche					= 100;  //SC hat Lance Leiche gefunden.
const int   XP_Addon_LanceRing						= 200;  //SC hat Lance Ring abgegeben.
const int   XP_Addon_HankHasSkipsGrog				= 200;  //Hanks Leiche mit dem Grog gefunden.
const int   XP_Addon_SkipsGrog						= 200;  //Skip den Grog zurück gegeben.
const int   XP_Addon_Morgan_LurkerPlatt				= 300;  //SC säubert Strand für Morgan.
const int   XP_ADDON_GregRavenLohn					= 1000;  //Greg Bericht
const int   XP_Addon_Owen_MalcomDead				= 300; 
const int   XP_Addon_Owen_ComesToHenry				= 300; 
const int   XP_Addon_Saturas_FreedMissingPeople		= 500; 
const int   XP_Addon_WackelBaum						= 200; 

//-----------------------------------------------------------------
//Banditenlager Addon Kapitel 2? Drei? Wer weiß es?
//-----------------------------------------------------------------				
const int  XP_Addon_HlpLogan			= 200; //Logan helfen
const int  XP_Addon_HlpEdgor			= 200;	//Edgor helfen			
const int  XP_Addon_Hinein				= 500;	//Spieler hat Franco erledigt
const int  XP_Addon_MINE				= 150;	//3x für Buddler in die mine schicken	

const int  XP_Addon_Fortuno_01			= 250; //Joint
const int  XP_Addon_Fortuno_02			= 250; //trank
const int  XP_Addon_Fortuno_03			= 250; //Geschichte

CONST int  XP_Addon_HunoStahl			= 200; //Stahl für Huno
CONST int  XP_Addon_LennarPaket			= 200; //Dietriche für lennar
const int  XP_Addon_Tom					= 100; //Tom nicht verpetzen

const int  XP_Addon_Auftraggeber		= 500; //Auftraggeber gefunden (Snaf)
const int  XP_Addon_Loushammer			= 150; //Schnapsbrennen für Snaf
const int  XP_Addon_Bloodywyn			= 500; //Bloodwyn rausgelockt

const int  XP_Addon_Flucht				= 500;	
//********************************************************************************
//									Gothic2
//********************************************************************************

// ------ AMBIENT XP -----
var int   XP_Ambient;		// kann für alle kleinen Ambient Sachen verwendet werden M.F.
const int 	XP_AmbientKap1			=  50;			
const int 	XP_AmbientKap2			= 100;			
const int 	XP_AmbientKap3			= 150;			
const int 	XP_AmbientKap4			= 200;			
const int 	XP_AmbientKap5			= 250;			
const int 	XP_AmbientKap6			= 300;	

const int	XP_Book_Level_1			= 50;
const int	XP_Book_Level_2			= 75;
const int	XP_Book_Level_3			= 100;

const int 	XP_Bookstand 			= 25;
// ------ Kapitel 1 ------
const int 	XP_BanditWeg			= 50;

const int 	XP_Schuldenbuch			= 200;

const int 	XP_BringOldCoin			= 10;	//Joly: für jede alte Münze, die SC zu Wasili bringt.	(kann bis zu 800 XP bringen! bis Kapitel 5 )	
const int 	XP_InnosSegen			= 50;			

const int	XP_LobartHolRueben		= 50;
const int	XP_HildaHolPfanne		= 50;
const int 	XP_MalethKillBandits	= 100;
const int 	XP_VinoWein				= 50;

const int	XP_PayForGritta			= 50;
const int 	XP_Matteo_Gold			= 100;
const int   XP_AlriksSword			= 100;
const int	XP_Baltram_ScoutAkil	= 100;
const int	XP_Kardif_Blame4Attila	= 50;
const int	XP_Attila_MetHim		= 50;
const int	XP_Canthars_KomproBrief = 100;
const int 	XP_Nagur_Bote 			= 100;
 
const int 	XP_VatrasTruth 			= 100; 
const int 	XP_Zustimmung 			= 100;  
const int 	XP_Lehrling 			= 300;   

const int 	XP_BecomeMiliz 			= 400;   
const int 	XP_BecomeMercenary 		= 400;
const int 	XP_BecomeMage 			= 400;
const int	XP_AufnahmeNovize		= 250;

const int 	XP_CantharImKnast 		= 200;    
 
const int	XP_NagurGotThief     	= 50;
const int	XP_RengaruGotThief     	= 50;
const int   XP_NagurOnlyGaveMoney	= 50;

const int	XP_Mission1				= 100;
const int	XP_Mission2				= 100;
const int	XP_Mission3				= 100;
const int	XP_Mission4				= 100;
const int	XP_Mission5				= 100;

const int 	XP_GuildOfThievesPlatt	= 500;
const int 	XP_Andre_Auslieferung	= 100; //gibt's für jeden ausgelieferten NPC 
const int 	XP_Andre_Bonus			= 100; // nur wenn Spieler genug Ansehen hat UND sich kein Verbrechen zu Schulden hat kommen lassen. 
const int 	XP_Warehouse_Super		= 100;
const int 	XP_Redlight				= 100;
const int 	XP_LobartBugs			= 100;
const int 	XP_FoundPeck			=  50;
const int	XP_Vatras_Message		= 100;
const int	XP_Garvell_Infos		=  50;
const int	XP_Bartok_Deal			=  50;
const int   XP_Hakon_Bandits		= 100;
const int 	XP_Jora_Gold			= 100;
const int	XP_Bosper_Bogen			= 150;
const int 	XP_CoragonsSilber		= 150;
const int 	XP_Harad_Orc			= 200;
const int 	XP_Constantino_Herbs	= 200;
const int 	XP_Attila_Friend		= 300; 

const int	XP_Edda_Statue			=  100;
const int	XP_MIS_Ignaz_Charm		=  100;
const int	XP_DragomirsArmbrust	=  150;


//---------Diebesgilde--------------------

const int	XP_CassiaBlutkelche		=  300;
const int	XP_CassiaRing			=  100;
const int	XP_RamirezSextant		=  200;
const int	XP_JesperTruhe			=  150;

//------ Bauernhöfe ----------------------

const int	XP_Thekla_BlameSylvio	=  50;
const int	XP_BronkoGehtAnDieArbeit=  50;
const int	XP_Torlof_SekobsKohlebekommen = 100;
const int	XP_Balthasar_BengarsWeide= 100;
const int	XP_Bengar_MILIZKLATSCHEN = 100;
const int	XP_Gaan_WaldSnapper		 = 100;	 

const int	XP_Torlof_GenugStimmen	 = 250;	 
const int	XP_Cord_Approved		 = 100;	 
const int	XP_CipherPaket			 = 300;	 
const int	XP_CipherWeed			 = 100;	
const int	XP_Rod					 = 100;
const int	XP_Sagitta_Sonnenaloe	 = 200;

const int	XP_KickBullco			 = 100;
const int	XP_PepeWolves			 = 250;

	




const int	XP_Akil_SLDWegVomHof	 = 100;	 
const int	XP_Akil_SLDWegVomHofEhre = 150;
const int	XP_Akil_Tot 			 =  50;
const int	XP_EgillEhnimStreit		 =  50;

//---------Taverne------------------------
const int	XP_Randolph_WettkampfStart=	50;
const int	XP_Rukhar_WettkampfVorbei= 	50;	 
const int	XP_Rukhar_Lost			 = 	50;

//------ Magieraufnahme ------------------
const int 	XP_NeorasPflanzen		= 100;
const int 	XP_NeorasRezept			=  50;
const int 	XP_MardukBeten			=  50;
const int 	XP_Feger				=  50;
const int 	XP_ParlanFegen			= 100;
const int 	XP_IsgarothWolf			= 100;
const int 	XP_GoraxEssen			= 200;
const int 	XP_GoraxWein			= 150;
const int 	XP_KarrasCharm			= 200;

const int 	XP_SCHNITZELJAGD		= 200;
const int 	XP_RUNE					= 200;
const int 	XP_GOLEM				= 200;

const int	XP_HelpDyrian			= 100;	//Ambient: Dyrian will im Kloster bleiben
const int	XP_HelpOpolos			= 100;	//Ambient: Opolos will aus dem Kloster
const int	XP_HelpBabo				= 100;	//Ambient: Babo will in den Garten

const int   XP_GoraxBote			= 100;
const int   XP_GoraxBoteDead		=  50;

// ------ Kapitel 2 ------
const int 	XP_ScoutMine			= 500; 	
const int 	XP_BringMeat			= 150; // Ambient Mission VLK_4108_Engor Burg im Minental
const int 	XP_BaltramTrade			= 150;

const int 	XP_FoundJergan			= 50;
const int 	XP_FajethKillSnapper	= 200;
const int 	XP_BilgotEscort			= 300;

const int 	XP_Marcos_Jungs			= 150;
const int 	XP_TengronRing			= 150;

const int 	XP_Marcos_Ore			= 300;
const int 	XP_Silvestro_Ore		= 300;
const int 	XP_Fajeth_Ore			= 300;

const int 	XP_RescueGorn			= 500;
const int 	XP_KervoKillLurker		= 200;

const int 	XP_Maria_Teller			= 200;
const int 	XP_Cipher_KrautPaket 	= 200;


// ------ Kapitel 3 ------
const int 	XP_SCKnowsInnosEyeIsBroken 	= 500;
const int 	XP_RitualInnosEyeRuns		= 500;
const int	XP_RescueBennet				= 750;
const int	XP_InnosEyeIsRepaired   	= 750;
const int   XP_KillLighthouseBandits	= 400;
const int   XP_SCFoundObsessedNpc		= 400;
const int   XP_VinoFreeFromDMT			= 400; //Joly: nur KDF
const int   XP_HealHilda				= 300;
const int   XP_FoundMalethsGehstock		= 400; //Joly: nur DJG
const int	XP_BabosDocs				= 300; //Hoshi: nur DJG/sld und PAL/Mil	
const int	XP_SekobDMTWEG				= 400;
const int   XP_HyglasBringBook      	= 300; //Hoshi nur Kdf und Pal/Mil
const int	XP_HannaRetrieveLetter		= 300; //für alle
const int 	XP_HelpDiegoNW				= 600; //Finde Diegos Schatz	
const int   XP_DiegosResidence			= 400; //ein neues Haus für Diego	
const int   XP_DiegoHasANewHome 		= 300; //Endlich daheinm!

const int   XP_FoundMalakFLEEFROMPASS 	= 400; //Malaks Versteck gefunden.
const int   XP_Malak_BACKTOBENGAR	 	= 300; //Malaks geht wieder zu Bengar
const int   XP_BengarsHelpingSLD    	= 300; //Wolf passt auf Bengars Hof auf!
const int   XP_BengarsHelpingSLDArrived = 300; //Wolf passt auf Bengars Hof auf!
const int	XP_GetMalakBack				= 200;
const int	XP_Ulthar_SchreineGereinigt	= 500; 	//Wenn alle Schreine gereinigt sind (nur PAL)
const int	XP_BringSerpentesMinenAnteil= 75; 	//Für jedes Minenanteil, dass SC zu Serpentes bringt ,  10 X  XP_BringSerpentesMinenAnteil = 750 (nur PAL)
const int	XP_SalandrilInKloster		= 400; 	//Salandril bühst seine Sünden im Kloster (KDF und SLD,DJG)
const int	XP_Akil_SchafDiebe			= 400; 	//SC hat Schafdiebe getötet
const int	XP_AkilsSchaf				= 200; 	//Schaf ist wieder da.
const int	XP_FoundVinosKellerei		= 400; 	//Moleratefett anngewendet und VinosKellerei geöffnet
const int	XP_TheklasPaket				= 300; 	//SC von Sagitta ein Packet 
const int	XP_SC_KnowsMadPsi			= 300; 	//Karras findet heraus, dass die Suchenden vorher Psioniker waren (KDF)
const int	XP_Lester_KnowsMadPsi 		= 300; 	//Lester weiß jetzt, dass die Suchenden vorher Psioniker waren (KDF)
const int	XP_Angar_KnowsMadPsi 		= 300; 	//Angar weiß jetzt, dass die Suchenden vorher Psioniker waren (KDF)
const int	XP_Karras_FoundBlessedStone	= 500; 	//SC hat gesegnetes Gesetin gefunden und bei Karras abgeliefert (KDF)
const int	XP_JudgeRichter				= 300; 	//SC hat belastendes Material gegen den Richter 			(SLD) 
const int	XP_BringHolyHammer			= 300; 	//SC klaut dem Richter den heiligen hammer aus dem Kloster (SLD) 
const int	XP_KillMorgahard			= 300; 	//SC tötet Morgahard für den Richter. 						(SLD) 
const int 	XP_FoundMorgahard			= 500;	//Morgahard gefunden (SLD) 
const int 	XP_SwordBlessed				= 400;	//Schwert wurde geweiht
const int 	XP_Torlof_DMT				= 300;  //für torlof den DMT getötet
const int 	XP_Raoul_KillTrollBlack		= 500; 
const int 	XP_Gorax_KILLPEDRO_GotMission = 600; 


// ------ Kapitel 4 ------
const int 	XP_AngarDJGUndeadMage	= 750;
const int 	XP_AngarDJGAgain		= 350;
const int 	XP_GornDJGPlateauClear	= 600;
const int 	XP_CipherDJGDeadDragon	= 600;
const int 	XP_SylvioDJGIceGolemDead= 600;
const int 	XP_BrutusMeatbugs		= 350;
const int 	XP_GeroldGiveFood		= 350;
const int 	XP_KillHosh_Pak			= 600;	
const int 	XP_UrshakFound			= 500;
const int 	XP_UrshakBecomesShaman	= 750;
const int 	XP_SengrathFound		= 600;
const int 	XP_BiffSurvivedLastDragon = 1000;
const int 	XP_SavedTalbin			= 600;
const int	XP_KarrasResearchDMT	= 500;

const int 	XP_PAL_OrcRing			= 250;		//Joly: PAL-SC kann etwa 25 Ringe finden!!!!!! 			-> ca. 25 x XP_PAL_OrcRing
const int   XP_KDF_BringAlmanach   	= 450; 		//Joly: nur Kdf XP für einen gefundenen Almanach 		-> ca. 10 x XP_KDF_BringAlmanach
const int 	XP_DJG_BringDragonEgg	= 350;		//Joly: DJG-SC kann etwa 12 Dracheneier finden!!		-> ca. 12 x XP_DJG_BringDragonEgg

const int 	XP_KilledOrkOberst		= 1000;		//Joly: NUR PAL
const int 	XP_KilledLobartOrks		= 600;		//Joly: NUR PAL und DJG
const int 	XP_Neoras_DragonEgg		= 600;		//Joly: NUR PAL und KDF
const int 	XP_Dar_BringOrcEliteRing= 600;		//Joly: NUR DJG und KDF
const int 	XP_Garond_KilledDragon	= 500;		
const int 	XP_FerrosSword			= 400;		
const int 	XP_KerolothsGeldbeutel	= 400;		
const int 	XP_Addon_JanSellsArmor	= 600;		//Joly:nur DJG

// ------ Kapitel 5 ------
const int 	XP_HallsofIrdorathIsOpen 	= 1000;
const int 	XP_SCKnowsWayToIrdorath 	= 2000; 
const int 	XP_FinalDragonEquipment		= 1000;
const int 	XP_PyrokarClearDemonTower 	= 1000;
const int 	XP_Jack_NewLighthouseOfficer= 1000;
const int   XP_OpenSecretLibrary        = 1000;
const int 	XP_ScoutSecretLibrary       = 1000;
const int 	XP_SavedRosi		        = 750;
const int 	XP_HealRandolph		        = 500;	 //Joly: nur PAL
const int 	XP_RichtersPermissionForShip  = 1500; //Joly: nur DJG 
const int 	XP_Crewmember_Success		= 500;	//Für jedes Crewmitglied!!	 
const int	XP_Captain_Success			= 2000; //ich habe einen Kapitän lalalalala
const int  	XP_SwordBlessed2			= 1000; //Letzte Schwertweihe!!

// ------ Kapitel 6 ------

const int 	XP_Mario_Ambush		        = 5000;	
const int 	XP_Pedro_SerpentesMission   = 3000;	 //Joly: nur DJG


