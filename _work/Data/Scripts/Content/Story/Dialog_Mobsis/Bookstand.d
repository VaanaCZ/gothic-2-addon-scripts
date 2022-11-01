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
			B_LogEntry (TOPIC_FireContest,"Jako nowicjusz mam prawo zażądać Próby Ognia, a każdy z trzech magów należących do Najwyższej Rady przydzieli mi jakieś zadanie. Po ukończeniu wszystkich misji zostanę przyjęty do Kręgu Ognia.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Próba Ognia"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Nowicjusz może uważać, że jest gotowy na dołączenie do Kręgu Ognia, ale nie od razu dostąpi tego zaszczytu. Gdy dobrze się zastanowi i nadal będzie uparcie dążyć do swego celu, to może skorzystać z prawa zażądania Próby, nie może mu odmówić żaden mag. Cała procedura nie ogranicza się do Próby Magii - kandydat musi również zostać oświecony przez płomienie, gdy wyrazi taką wolę przed Najwyższą Radą, stanie przed PRÓBą OGNIA,");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "która sprawdzi jego zręczność, siłę i mądrość. Każde z trzech zadań zostanie zlecone przez innego członka Najwyższej Rady i dopiero po wykonaniu wszystkich trzech kandydat będzie mógł złożyć Przysięgę Ognia i zbratać się z płomieniami."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Taka jest wola Innosa i takoż się stanie."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Najwyższa Rada"					);
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
						Doc_PrintLines	( nDocID,  0, "...Mam nadzieję, że Bariera ochroni rudę przed zakusami Beliara. Król w swej naiwności wierzy, że stworzyliśmy ją, żeby nie dopuścić do ucieczek. Niechaj nadal tak sądzi, jeśli dzięki temu uda się nam osiągnąć nasze odleglejsze cele. Możemy tylko marzyć o czasie na przygotowanie się do nadchodzącej walki. To na nią skieruję całą swą moc, gdy tylko Bariera dookoła Górniczej Doliny zostanie ukończona.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Składniki runy 'święty pocisk': 1 porcja wody święconej, nie potrzeba zwoju z zaklęciem");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...Na runicznym stole oblałem wodą święconą, zgodnie z instrukcjami, pusty kamień runiczny. Kamień uległ zniszczeniu... To zaklęcie jest chyba przeznaczone tylko dla Wybrańca."); 
						Doc_PrintLines	( nDocID,  1, "Na straży klasztoru pozostawiłem świętą Aurę Innosa. Przeor będzie o nią dbał, dopóki nie objawi się Wybraniec."	);
						Doc_PrintLines	( nDocID,  1, "Łzy Innosa mogą odegrać ogromną rolę w nadchodzącej walce, niebezpiecznie więc trzymać je na widoku publicznym. Lepiej schowam je tu, w bibliotece."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Tworzenie run wymaga użycia odpowiednich składników. Cały proces wymaga jeszcze odpowiedniego stołu i pustego kamienia runicznego.");
			B_LogEntry (TOPIC_TalentRunes,"Składniki runy 'Tajny teleport': 1 porcja łez Innosa");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Aby móc się dostać do ukrytego miejsca, musisz stworzyć specjalną runę teleportującą - będzie ci do tego potrzebny pusty kamień runiczny i mała buteleczka wody święconej."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Jestem prawie pewien, że paladyni wykorzystywali łzy Innosa w dawno zapomnianym rytuale znanym jako Konsekracja Miecza. Za pomocą znalezionej wcześniej małej buteleczki powinienem więc nadać konsekrowanej broni dodatkową moc."	);
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
			B_LogEntry (TOPIC_TalentSmith,"Jeśli zechcę wykuć jakąś broń, to po pierwsze będzie mi potrzebny kawał surowej stali, który trzeba rozgrzać do czerwoności w kuźni, a następnie ukształtować na kowadle. Nadanie broni jakichś specjalnych charakterystyk będzie wymagało użycia dodatkowych składników.");
			B_LogEntry (TOPIC_TalentSmith,"Dodanie na przykład czterech bryłek rudy i pięciu porcji smoczej krwi umożliwi mi wykucie magicznego ostrza na smoki, a");
			B_LogEntry (TOPIC_TalentSmith,"pięciu bryłek rudy i pięciu porcji smoczej krwi - dużego magicznego ostrza na smoki.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Fragment księgi 'Broń smoczego pana'."); 
						Doc_PrintLines	( nDocID,  1, "Aby zbroicy ze smoczych łusek twardości nielichej dodać, pokryć trza łuski takowe rudą w dolinie na wyspie Karynis kopaną."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "By ostrze poślednie zdatnym dla smoczego pana uczynić, krwią smoków oblać je należy. Pięć porcji posoki sprawi, że ostrze ostre niezwykle będzie i moc niezrównaną zyska."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Uwaga: nazwa 'Karynis' nawiązuje prawdopodobnie do obszarów znanych obecnie jako Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

