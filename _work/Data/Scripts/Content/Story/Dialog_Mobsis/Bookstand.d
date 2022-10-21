//##########################################################################
//##
//##	Hier stehen alle Buchst�ndermobsiscripte
//##
//##########################################################################


//*************************************
//	Buchst�nder in der Klosterbibliothek
//*************************************

FUNC VOID Use_Bookstand_01_S1()		//Buchst�nder in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
	if  (hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE; //f�r die Pr�fung des Feuers 
			
			Log_CreateTopic (TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus	(TOPIC_FireContest,LOG_RUNNING);
			B_LogEntry (TOPIC_FireContest,"Come novizio, ho il diritto di richiedere una Prova del Fuoco. Questo obbliga ciascuno dei tre maghi dell'Alto Concilio a preparare una prova. Se passer� queste prove, sar� accettato nel Circolo del Fuoco.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "La Prova del Fuoco"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "Sebbene un novizio possa sentirsi pronto per sottoporsi alla Prova della Magia, potrebbe non essere necessariamente scelto. Se, tuttavia, avr� considerato attentamente la propria decisione e insister�, gli verr� accordato il diritto di richiedere la Prova, e nessun mago potr� negargliela. Ma egli non solo dovr� superare la Prova della Magia, ma dovr� anche raggiungere l'illuminazione attraverso il fuoco. Se insiste di fronte all'Alto Concilio, dovr� essere sottoposto alla PROVA DEL FUOCO.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "La Prova dovr� verificare la saggezza, la forza e la destrezza del novizio. Pertando egli dovr� superare tre prove, ognuna presentata da un mago dell'Alto Concilio, prima di affrontare il Giuramento del Fuoco e unirsi al patto con il fuoco."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Questo � il volere di Innos e cos� deve essere."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "L'Alto Concilio"					);
					Doc_Show		( nDocID );

			
	};
};

//*************************************
//	Buchst�nder in der Geheimen Bibliothek
//*************************************
//--------------------------------------
var int FinalDragonEquipment_Once;
//--------------------------------------

FUNC VOID Use_FINALDRAGONEQUIPMENT_S1()		//Buchst�nder in der geheimen Bibliothek 
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
						Doc_PrintLines	( nDocID,  0, "� Spero che la cupola possa proteggere il metallo dalla minaccia di Beliar. Il re � abbastanza ingenuo da credere che la cupola sia stata costruita come protezione contro eventuali fughe. Beh, fino a quando questo stratatagemma ci permetter� di raggiungere obiettivi pi� elevati, lasciamoglielo credere. Posso solo sperare che avremo abbastanza tempo per prepararci alla battaglia. Appena la cupola intorno alla Valle delle Miniere sar� stata eretta, user� tutti i poteri a mia disposizione per intervenire nell'imminente battaglia.");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Ingredienti per la runa 'Dardo sacro': 1 acqua santa, nessuna pergamena.");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "� Ho seguito le istruzioni e ho semplicemente versato l'acqua santa di Innos su una pietra runica vuota, sopra un tavolo runico. La pietra � andata distrutta. Sospetto che questo incantesimo sia accessibile solamente all'Eletto."); 
						Doc_PrintLines	( nDocID,  1, "Ho lasciato l'aura sacra di Innos a protezione del monastero. L'abate se ne occuper� fino a quando l'Eletto non si riveler�."	);
						Doc_PrintLines	( nDocID,  1, "Le Lacrime di Innos potrebbero giocare un ruolo fondamentale nella futura battaglia. Tuttavia � troppo rischioso conservarle dove tutti possano vederle. Far� meglio a lasciarle qui nella biblioteca."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Per creare una runa mi servono alcuni ingredienti, a seconda della runa desiderata. Utilizzando questi ingredienti e una pietra runica vuota posso creare la runa desiderata su un tavolo runico.");
			B_LogEntry (TOPIC_TalentRunes,"Ingredienti per la runa 'Teletrasporto segreto': 1 acqua santa");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Devi creare una runa di teletrasporto per raggiungere il luogo segreto. Per farlo avrai bisogno di una pietra runica vuota e di una bottiglia di acqua santa. Puoi utilizzare la runa per teletrasportarti nella stanza."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Sono ragionevolmente sicuro che le Lacrime di Innos siano ci� che gli antichi paladini utilizzarono nel dimenticato rituale della Consacrazione della Spada. Questo significa che dovrei essere in grado di utilizzare la bottiglietta che ho trovato per potenziare un'arma consacrata."	);
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
			B_LogEntry (TOPIC_TalentSmith,"Per forgiare un'arma, ho innanzitutto bisogno di un pezzo di acciaio grezzo. Dovr� poi scaldarlo nel fuoco di una fucina fino a quando non sar� incandescente e poi plasmarlo su un'incudine. Le armi speciali spesso richiedono l'uso di certe sostanze che possano offrire caratteristiche particolari.");
			B_LogEntry (TOPIC_TalentSmith,"Se aggiungo 4 pepite metallifere e 5 sangue di drago, posso forgiare un'AMMAZZADRAGHI DI METALLO.");
			B_LogEntry (TOPIC_TalentSmith,"Se aggiungo 5 pepite metallifere e 5 sangue di drago, posso forgiare un'AMMAZZADRAGHI DI METALLO.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Da: Le armi del signore dei draghi."); 
						Doc_PrintLines	( nDocID,  1, "Per rendere un'armatura di scaglie di drago il pi� resistente possibile, le scaglie dovranno essere ricoperte con il metallo estratto dalla valle dell'isola di Karynis."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Per rendere una lama degna di un signore dei draghi, lessa dovr� essere immersa nel sangue di drago. Persino 5 fiale di sangue potranno fornire all'acciaio ineguagliabile affilatezza e resistenza."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Nota: 'Karynis' � riferito all'isola nota come Khorinis.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

