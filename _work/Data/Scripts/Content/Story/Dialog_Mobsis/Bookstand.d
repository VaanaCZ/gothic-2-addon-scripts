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
			B_LogEntry (TOPIC_FireContest,"Jakožto novic mám právo na zkoušku ohně. To znamená, že mi každý ze tří mágů z nejvyšší rady zadá nějaký úkol. Pokud je splním, budu přijat do kruhu ohně.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Zkouška ohně"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "I když novic může mít pocit, že je připraven podstoupit zkoušku ohně, neznamená to, že bude vybrán. Pokud ale na svém rozhodnutí stále trvá, má právo zkoušku požadovat a žádný mág mu v tom nesmí bránit. Ale nejenže musí projít zkouškou magie, musí také dojít osvícení skrze oheň. Přednese-li své rozhodnutí nejvyšší radě, čeká ho ZKOUŠKA OHNĚ.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Zkouška prověří jak novicovu moudrost, tak i sílu a obratnost. Proto se skládá celkem ze tří částí, z nichž každou mu zadá jeden mág nejvyšší rady ještě předtím, než složí přísahu ohně a bude spjat s tímto živlem."); 
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
						Doc_PrintLines	( nDocID,  0, "...Doufám, že kupole ochrání rudu před zlobou Beliarovou. Král ve své naivitě věří, že jsme ji postavili proto, aby žádný z vězňů neunikl. No, jestli tahle lest poslouží vyšším cílům, ať se tak stane. Mohu jen doufat, že nám ještě zbývá dost času k přípravě na boj. Jakmile kupole obklopí Hornické údolí, vynaložím všechnu svou moc, aby se boj už více nezdržoval.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"K přípravě runy 'svaté střely' je třeba: 1 svěcená voda, žádný svitek s kouzlem");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...postupoval jsem podle instrukcí a prostě jsem na čistý runový kámen na runové tabulce nalil Innosovu svěcenou vodu. Ta jej ale zcela zničila - počítám tedy, že tohle kouzlo může použít pouze Vyvolený."); 
						Doc_PrintLines	( nDocID,  1, "Klášter jsem svěřil pod ochranu svaté Innosovy aury. Opat se už o něj postará, dokud se nám nezjeví Vyvolený."	);
						Doc_PrintLines	( nDocID,  1, "Možná že v nadcházejícím boji sehrají klíčovou roli Innosovy slzy. Nemohu je ale držet na místě, kde je každý uvidí - je to příliš nebezpečné. Radši je nechám tady v knihovně."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"K výrobě každé runy potřebuji určité ingredience. Když je pak použiji na čistý runový kámen, mohu zvolenou runu vytvořit podle runové tabulky.");
			B_LogEntry (TOPIC_TalentRunes,"Ingredience pro runu 'tajný teleport': 1 svěcená voda");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Pro každé z tajných míst musíš pomocí prázdného runového kamene a lahvičky svěcené vody vytvořit teleportační runu, která tě pak přenese do zvolené místnosti."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Teď už jsem si skoro jist, že právě Innosovy slzy používali za dávných časů paladinové při dnes již zapomenutím rituálu svěcení meče. Takže tahle malá lahvička, co jsem našel, by měla posvěcené zbrani propůjčit další sílu."	);
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
			B_LogEntry (TOPIC_TalentSmith,"K vykování takové zbraně potřebuji hlavně kousek surové oceli. Tu doruda rozžhavím v kovářské výhni a pak ji budu kout na kovadlině. U určitých zbraní je také často zapotřebí použít jisté substance, které jim propůjčí jedinečné vlastnosti.");
			B_LogEntry (TOPIC_TalentSmith,"Přidám-li 4 kousky rudy a pětkrát dračí krev, mohu vykovat DRAKOBIJCE.");
			B_LogEntry (TOPIC_TalentSmith,"Když použiji 5 kousků rudy a pětkrát dračí krev, vykovám VELKÉHO DRAKOBIJCE.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Zdroj: Zbraně pána draků."); 
						Doc_PrintLines	( nDocID,  1, "Chceš-li zbroj z dračích šupin co možná vytvrdit, musíš ji potáhnout rudou, která se těží v údolí na ostrově Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Má-li být meč hoden pána draků, pak musíš jeho čepel omočit v dračí krvi. Pouhých 5 ampulek s touto vzácnou tekutinou dodá oceli nebývalou ostrost a průraznost."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Poznámka: 'Karynis' je pravděpodobně místo dnes známé jako Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

