//##########################################################################
//##
//##	Hier stehen alle Buchständermobsiscripte
//##
//##########################################################################


//*************************************
//	Buchständer in der Klosterbibliothek
//*************************************

FUNC VOID Use_Bookstand_01_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	if  (hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE; //für die Prüfung des Feuers 
			
			Log_CreateTopic (TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus	(TOPIC_FireContest,LOG_RUNNING);
			B_LogEntry (TOPIC_FireContest,"Jakožto novic mám právo na zkoušku ohnê. To znamená, že mi každý ze tâí mágù z nejvyšší rady zadá nêjaký úkol. Pokud je splním, budu pâijat do kruhu ohnê.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Zkouška ohnê"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "I když novic mùže mít pocit, že je pâipraven podstoupit zkoušku ohnê, neznamená to, že bude vybrán. Pokud ale na svém rozhodnutí stále trvá, má právo zkoušku požadovat a žádný mág mu v tom nesmí bránit. Ale nejenže musí projít zkouškou magie, musí také dojít osvícení skrze oheà. Pâednese-li své rozhodnutí nejvyšší radê, èeká ho ZKOUŠKA OHNÊ.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Zkouška provêâí jak novicovu moudrost, tak i sílu a obratnost. Proto se skládá celkem ze tâí èástí, z nichž každou mu zadá jeden mág nejvyšší rady ještê pâedtím, než složí pâísahu ohnê a bude spjat s tímto živlem."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Taková je Innosova vùle a tak se i stane."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Nejvyšší rada"					);
					Doc_Show		( nDocID );

			
	};
};

//*************************************
//	Buchständer in der Geheimen Bibliothek
//*************************************
//--------------------------------------
var int FinalDragonEquipment_Once;
//--------------------------------------

FUNC VOID Use_FINALDRAGONEQUIPMENT_S1()		//Buchständer in der geheimen Bibliothek 
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	
		var int nDocID;
		
		nDocID = 		Doc_Create		()			  ;							
						Doc_SetPages	( nDocID,  2 );                         
						Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0); 
						Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0);
					
						Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
						Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  	
	
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLines	( nDocID,  0, "...Doufám, že kupole ochrání rudu pâed zlobou Beliarovou. Král ve své naivitê vêâí, že jsme ji postavili proto, aby žádný z vêzàù neunikl. No, jestli tahle lest poslouží vyšším cílùm, aã se tak stane. Mohu jen doufat, že nám ještê zbývá dost èasu k pâípravê na boj. Jakmile kupole obklopí Hornické údolí, vynaložím všechnu svou moc, aby se boj už více nezdržoval.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"K pâípravê runy 'svaté stâely' je tâeba: 1 svêcená voda, žádný svitek s kouzlem");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...postupoval jsem podle instrukcí a prostê jsem na èistý runový kámen na runové tabulce nalil Innosovu svêcenou vodu. Ta jej ale zcela znièila - poèítám tedy, že tohle kouzlo mùže použít pouze Vyvolený."); 
						Doc_PrintLines	( nDocID,  1, "Klášter jsem svêâil pod ochranu svaté Innosovy aury. Opat se už o nêj postará, dokud se nám nezjeví Vyvolený."	);
						Doc_PrintLines	( nDocID,  1, "Možná že v nadcházejícím boji sehrají klíèovou roli Innosovy slzy. Nemohu je ale držet na místê, kde je každý uvidí - je to pâíliš nebezpeèné. Radši je nechám tady v knihovnê."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"K výrobê každé runy potâebuji urèité ingredience. Když je pak použiji na èistý runový kámen, mohu zvolenou runu vytvoâit podle runové tabulky.");
			B_LogEntry (TOPIC_TalentRunes,"Ingredience pro runu 'tajný teleport': 1 svêcená voda");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Pro každé z tajných míst musíš pomocí prázdného runového kamene a lahvièky svêcené vody vytvoâit teleportaèní runu, která tê pak pâenese do zvolené místnosti."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Teë už jsem si skoro jist, že právê Innosovy slzy používali za dávných èasù paladinové pâi dnes již zapomenutím rituálu svêcení meèe. Takže tahle malá lahvièka, co jsem našel, by mêla posvêcené zbrani propùjèit další sílu."	);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_Show		( nDocID );
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;	
			PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;	
			
			PrintScreen			(PRINT_LearnSmith, -1, -1, FONT_Screen, 2);
			Npc_SetTalentSkill 	(self, NPC_TALENT_SMITH, 1);
			Log_CreateTopic (TOPIC_TalentSmith,LOG_NOTE);
			B_LogEntry (TOPIC_TalentSmith,"K vykování takové zbranê potâebuji hlavnê kousek surové oceli. Tu doruda rozžhavím v kováâské výhni a pak ji budu kout na kovadlinê. U urèitých zbraní je také èasto zapotâebí použít jisté substance, které jim propùjèí jedineèné vlastnosti.");
			B_LogEntry (TOPIC_TalentSmith,"Pâidám-li 4 kousky rudy a pêtkrát draèí krev, mohu vykovat DRAKOBIJCE.");
			B_LogEntry (TOPIC_TalentSmith,"Když použiji 5 kouskù rudy a pêtkrát draèí krev, vykovám VELKÉHO DRAKOBIJCE.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Zdroj: Zbranê pána drakù."); 
						Doc_PrintLines	( nDocID,  1, "Chceš-li zbroj z draèích šupin co možná vytvrdit, musíš ji potáhnout rudou, která se têží v údolí na ostrovê Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Má-li být meè hoden pána drakù, pak musíš jeho èepel omoèit v draèí krvi. Pouhých 5 ampulek s touto vzácnou tekutinou dodá oceli nebývalou ostrost a prùraznost."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Poznámka: 'Karynis' je pravdêpodobnê místo dnes známé jako Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

