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
			B_LogEntry (TOPIC_FireContest,"Jako nowicjusz mam prawo za¿¹daæ Próby Ognia, a ka¿dy z trzech magów nale¿¹cych do Najwy¿szej Rady przydzieli mi jakieœ zadanie. Po ukoñczeniu wszystkich misji zostanê przyjêty do Krêgu Ognia.");
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
				
					
					Doc_PrintLines	( nDocID,  0, "Nowicjusz mo¿e uwa¿aæ, ¿e jest gotowy na do³¹czenie do Krêgu Ognia, ale nie od razu dost¹pi tego zaszczytu. Gdy dobrze siê zastanowi i nadal bêdzie uparcie d¹¿yæ do swego celu, to mo¿e skorzystaæ z prawa za¿¹dania Próby, nie mo¿e mu odmówiæ ¿aden mag. Ca³a procedura nie ogranicza siê do Próby Magii - kandydat musi równie¿ zostaæ oœwiecony przez p³omienie, gdy wyrazi tak¹ wolê przed Najwy¿sz¹ Rad¹, stanie przed PRÓB¹ OGNIA,");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "która sprawdzi jego zrêcznoœæ, si³ê i m¹droœæ. Ka¿de z trzech zadañ zostanie zlecone przez innego cz³onka Najwy¿szej Rady i dopiero po wykonaniu wszystkich trzech kandydat bêdzie móg³ z³o¿yæ Przysiêgê Ognia i zbrataæ siê z p³omieniami."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Taka jest wola Innosa i tako¿ siê stanie."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Najwy¿sza Rada"					);
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
						Doc_PrintLines	( nDocID,  0, "...Mam nadziejê, ¿e Bariera ochroni rudê przed zakusami Beliara. Król w swej naiwnoœci wierzy, ¿e stworzyliœmy j¹, ¿eby nie dopuœciæ do ucieczek. Niechaj nadal tak s¹dzi, jeœli dziêki temu uda siê nam osi¹gn¹æ nasze odleglejsze cele. Mo¿emy tylko marzyæ o czasie na przygotowanie siê do nadchodz¹cej walki. To na ni¹ skierujê ca³¹ sw¹ moc, gdy tylko Bariera dooko³a Górniczej Doliny zostanie ukoñczona.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Sk³adniki runy 'œwiêty pocisk': 1 porcja wody œwiêconej, nie potrzeba zwoju z zaklêciem");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...Na runicznym stole obla³em wod¹ œwiêcon¹, zgodnie z instrukcjami, pusty kamieñ runiczny. Kamieñ uleg³ zniszczeniu... To zaklêcie jest chyba przeznaczone tylko dla Wybrañca."); 
						Doc_PrintLines	( nDocID,  1, "Na stra¿y klasztoru pozostawi³em œwiêt¹ Aurê Innosa. Przeor bêdzie o ni¹ dba³, dopóki nie objawi siê Wybraniec."	);
						Doc_PrintLines	( nDocID,  1, "£zy Innosa mog¹ odegraæ ogromn¹ rolê w nadchodz¹cej walce, niebezpiecznie wiêc trzymaæ je na widoku publicznym. Lepiej schowam je tu, w bibliotece."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Tworzenie run wymaga u¿ycia odpowiednich sk³adników. Ca³y proces wymaga jeszcze odpowiedniego sto³u i pustego kamienia runicznego.");
			B_LogEntry (TOPIC_TalentRunes,"Sk³adniki runy 'Tajny teleport': 1 porcja ³ez Innosa");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Aby móc siê dostaæ do ukrytego miejsca, musisz stworzyæ specjaln¹ runê teleportuj¹c¹ - bêdzie ci do tego potrzebny pusty kamieñ runiczny i ma³a buteleczka wody œwiêconej."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Jestem prawie pewien, ¿e paladyni wykorzystywali ³zy Innosa w dawno zapomnianym rytuale znanym jako Konsekracja Miecza. Za pomoc¹ znalezionej wczeœniej ma³ej buteleczki powinienem wiêc nadaæ konsekrowanej broni dodatkow¹ moc."	);
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
			B_LogEntry (TOPIC_TalentSmith,"Jeœli zechcê wykuæ jak¹œ broñ, to po pierwsze bêdzie mi potrzebny kawa³ surowej stali, który trzeba rozgrzaæ do czerwonoœci w kuŸni, a nastêpnie ukszta³towaæ na kowadle. Nadanie broni jakichœ specjalnych charakterystyk bêdzie wymaga³o u¿ycia dodatkowych sk³adników.");
			B_LogEntry (TOPIC_TalentSmith,"Dodanie na przyk³ad czterech bry³ek rudy i piêciu porcji smoczej krwi umo¿liwi mi wykucie magicznego ostrza na smoki, a");
			B_LogEntry (TOPIC_TalentSmith,"piêciu bry³ek rudy i piêciu porcji smoczej krwi - du¿ego magicznego ostrza na smoki.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Fragment ksiêgi 'Broñ smoczego pana'."); 
						Doc_PrintLines	( nDocID,  1, "Aby zbroicy ze smoczych ³usek twardoœci nielichej dodaæ, pokryæ trza ³uski takowe rud¹ w dolinie na wyspie Karynis kopan¹."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "By ostrze poœlednie zdatnym dla smoczego pana uczyniæ, krwi¹ smoków oblaæ je nale¿y. Piêæ porcji posoki sprawi, ¿e ostrze ostre niezwykle bêdzie i moc niezrównan¹ zyska."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Uwaga: nazwa 'Karynis' nawi¹zuje prawdopodobnie do obszarów znanych obecnie jako Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

