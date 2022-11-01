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
			B_LogEntry (TOPIC_FireContest,"Jakožto novic mám právo na zkoušku ohnę. To znamená, že mi každý ze tâí mágů z nejvyšší rady zadá nęjaký úkol. Pokud je splním, budu pâijat do kruhu ohnę.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Zkouška ohnę"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "I když novic může mít pocit, že je pâipraven podstoupit zkoušku ohnę, neznamená to, že bude vybrán. Pokud ale na svém rozhodnutí stále trvá, má právo zkoušku požadovat a žádný mág mu v tom nesmí bránit. Ale nejenže musí projít zkouškou magie, musí také dojít osvícení skrze oheŕ. Pâednese-li své rozhodnutí nejvyšší radę, čeká ho ZKOUŠKA OHNĘ.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Zkouška provęâí jak novicovu moudrost, tak i sílu a obratnost. Proto se skládá celkem ze tâí částí, z nichž každou mu zadá jeden mág nejvyšší rady ještę pâedtím, než složí pâísahu ohnę a bude spjat s tímto živlem."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Taková je Innosova vůle a tak se i stane."					);
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
						Doc_PrintLines	( nDocID,  0, "...Doufám, že kupole ochrání rudu pâed zlobou Beliarovou. Král ve své naivitę vęâí, že jsme ji postavili proto, aby žádný z vęzŕů neunikl. No, jestli tahle lest poslouží vyšším cílům, aă se tak stane. Mohu jen doufat, že nám ještę zbývá dost času k pâípravę na boj. Jakmile kupole obklopí Hornické údolí, vynaložím všechnu svou moc, aby se boj už více nezdržoval.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"K pâípravę runy 'svaté stâely' je tâeba: 1 svęcená voda, žádný svitek s kouzlem");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...postupoval jsem podle instrukcí a prostę jsem na čistý runový kámen na runové tabulce nalil Innosovu svęcenou vodu. Ta jej ale zcela zničila - počítám tedy, že tohle kouzlo může použít pouze Vyvolený."); 
						Doc_PrintLines	( nDocID,  1, "Klášter jsem svęâil pod ochranu svaté Innosovy aury. Opat se už o nęj postará, dokud se nám nezjeví Vyvolený."	);
						Doc_PrintLines	( nDocID,  1, "Možná že v nadcházejícím boji sehrají klíčovou roli Innosovy slzy. Nemohu je ale držet na místę, kde je každý uvidí - je to pâíliš nebezpečné. Radši je nechám tady v knihovnę."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"K výrobę každé runy potâebuji určité ingredience. Když je pak použiji na čistý runový kámen, mohu zvolenou runu vytvoâit podle runové tabulky.");
			B_LogEntry (TOPIC_TalentRunes,"Ingredience pro runu 'tajný teleport': 1 svęcená voda");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Pro každé z tajných míst musíš pomocí prázdného runového kamene a lahvičky svęcené vody vytvoâit teleportační runu, která tę pak pâenese do zvolené místnosti."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Teë už jsem si skoro jist, že právę Innosovy slzy používali za dávných časů paladinové pâi dnes již zapomenutím rituálu svęcení meče. Takže tahle malá lahvička, co jsem našel, by męla posvęcené zbrani propůjčit další sílu."	);
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
			B_LogEntry (TOPIC_TalentSmith,"K vykování takové zbranę potâebuji hlavnę kousek surové oceli. Tu doruda rozžhavím v kováâské výhni a pak ji budu kout na kovadlinę. U určitých zbraní je také často zapotâebí použít jisté substance, které jim propůjčí jedinečné vlastnosti.");
			B_LogEntry (TOPIC_TalentSmith,"Pâidám-li 4 kousky rudy a pętkrát dračí krev, mohu vykovat DRAKOBIJCE.");
			B_LogEntry (TOPIC_TalentSmith,"Když použiji 5 kousků rudy a pętkrát dračí krev, vykovám VELKÉHO DRAKOBIJCE.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Zdroj: Zbranę pána draků."); 
						Doc_PrintLines	( nDocID,  1, "Chceš-li zbroj z dračích šupin co možná vytvrdit, musíš ji potáhnout rudou, která se tęží v údolí na ostrovę Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Má-li být meč hoden pána draků, pak musíš jeho čepel omočit v dračí krvi. Pouhých 5 ampulek s touto vzácnou tekutinou dodá oceli nebývalou ostrost a průraznost."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Poznámka: 'Karynis' je pravdępodobnę místo dnes známé jako Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

