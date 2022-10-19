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
			B_LogEntry (TOPIC_FireContest,"Jakoto novic mám právo na zkoušku ohnì. To znamená, e mi kadı ze tøí mágù z nejvyšší rady zadá nìjakı úkol. Pokud je splním, budu pøijat do kruhu ohnì.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Zkouška ohnì"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "I kdy novic mùe mít pocit, e je pøipraven podstoupit zkoušku ohnì, neznamená to, e bude vybrán. Pokud ale na svém rozhodnutí stále trvá, má právo zkoušku poadovat a ádnı mág mu v tom nesmí bránit. Ale nejene musí projít zkouškou magie, musí také dojít osvícení skrze oheò. Pøednese-li své rozhodnutí nejvyšší radì, èeká ho ZKOUŠKA OHNÌ.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Zkouška provìøí jak novicovu moudrost, tak i sílu a obratnost. Proto se skládá celkem ze tøí èástí, z nich kadou mu zadá jeden mág nejvyšší rady ještì pøedtím, ne sloí pøísahu ohnì a bude spjat s tímto ivlem."); 
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
						Doc_PrintLines	( nDocID,  0, "...Doufám, e kupole ochrání rudu pøed zlobou Beliarovou. Král ve své naivitì vìøí, e jsme ji postavili proto, aby ádnı z vìzòù neunikl. No, jestli tahle lest poslouí vyšším cílùm, a se tak stane. Mohu jen doufat, e nám ještì zbıvá dost èasu k pøípravì na boj. Jakmile kupole obklopí Hornické údolí, vynaloím všechnu svou moc, aby se boj u více nezdroval.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"K pøípravì runy 'svaté støely' je tøeba: 1 svìcená voda, ádnı svitek s kouzlem");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...postupoval jsem podle instrukcí a prostì jsem na èistı runovı kámen na runové tabulce nalil Innosovu svìcenou vodu. Ta jej ale zcela znièila - poèítám tedy, e tohle kouzlo mùe pouít pouze Vyvolenı."); 
						Doc_PrintLines	( nDocID,  1, "Klášter jsem svìøil pod ochranu svaté Innosovy aury. Opat se u o nìj postará, dokud se nám nezjeví Vyvolenı."	);
						Doc_PrintLines	( nDocID,  1, "Moná e v nadcházejícím boji sehrají klíèovou roli Innosovy slzy. Nemohu je ale dret na místì, kde je kadı uvidí - je to pøíliš nebezpeèné. Radši je nechám tady v knihovnì."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"K vırobì kadé runy potøebuji urèité ingredience. Kdy je pak pouiji na èistı runovı kámen, mohu zvolenou runu vytvoøit podle runové tabulky.");
			B_LogEntry (TOPIC_TalentRunes,"Ingredience pro runu 'tajnı teleport': 1 svìcená voda");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Pro kadé z tajnıch míst musíš pomocí prázdného runového kamene a lahvièky svìcené vody vytvoøit teleportaèní runu, která tì pak pøenese do zvolené místnosti."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Teï u jsem si skoro jist, e právì Innosovy slzy pouívali za dávnıch èasù paladinové pøi dnes ji zapomenutím rituálu svìcení meèe. Take tahle malá lahvièka, co jsem našel, by mìla posvìcené zbrani propùjèit další sílu."	);
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
			B_LogEntry (TOPIC_TalentSmith,"K vykování takové zbranì potøebuji hlavnì kousek surové oceli. Tu doruda rozhavím v kováøské vıhni a pak ji budu kout na kovadlinì. U urèitıch zbraní je také èasto zapotøebí pouít jisté substance, které jim propùjèí jedineèné vlastnosti.");
			B_LogEntry (TOPIC_TalentSmith,"Pøidám-li 4 kousky rudy a pìtkrát draèí krev, mohu vykovat DRAKOBIJCE.");
			B_LogEntry (TOPIC_TalentSmith,"Kdy pouiji 5 kouskù rudy a pìtkrát draèí krev, vykovám VELKÉHO DRAKOBIJCE.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Zdroj: Zbranì pána drakù."); 
						Doc_PrintLines	( nDocID,  1, "Chceš-li zbroj z draèích šupin co moná vytvrdit, musíš ji potáhnout rudou, která se tìí v údolí na ostrovì Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Má-li bıt meè hoden pána drakù, pak musíš jeho èepel omoèit v draèí krvi. Pouhıch 5 ampulek s touto vzácnou tekutinou dodá oceli nebıvalou ostrost a prùraznost."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Poznámka: 'Karynis' je pravdìpodobnì místo dnes známé jako Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

