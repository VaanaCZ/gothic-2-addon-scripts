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
			B_LogEntry (TOPIC_FireContest,"Als Novize habe ich das Recht die Prüfung des Feuers zu fordern. Dabei wird mir jeder der drei Magier aus dem hohen Rat eine Prüfung stellen. Wenn ich sie bestehe, werde ich in den Kreis des Feuers aufgenommen.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Die Prüfung des Feuers"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "So ein Novize nicht erwählt ist, mag es sein, das er trotzdem die Bereitschaft verspürt sich der Prüfung der Magie zu unterwerfen. Wenn er diesen Entschluß reiflich überlegt hat und er darauf besteht, ist es ihm gewährt, die Prüfung zu verlangen und kein Magier darf sie ihm verweigern. Doch nicht nur die Prüfung der Magie wird ihm auferlegt, sondern er soll durch das Feuer seine Erleuchtung finden. Wenn er vor dem hohen Rat darauf besteht, so soll ihm die PRÜFUNG DES FEUERS gewährt werden.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "In dieser Prüfung soll gleichermaßen die Klugheit, Stärke und das Geschick des Novizen gefordert werden. So soll er drei Prüfungen erfüllen, jede empfangen durch einen der Magier des hohen Rates, bevor er den Eid der Flamme schwört und den Bund mit dem Feuer eingehen kann. "); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "So ist es Innos Wille und so soll es geschehen. "					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Der hohe Rat"					);
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
						Doc_PrintLines	( nDocID,  0, "...Ich hoffe, dass die Kuppel das Erz vor dem Zugriff Beliars zu schützen vermag. Der König ist einfältig genug zu glauben, dass wir die Kuppel zum Schutz vor Ausbrüchen errichten, doch solange wir mit diesen Ratschlagen unsere höheren Zeile erreichen, soll es uns recht sein. Ich hoffe, das uns genug Zeit bleibt uns auf den Kampf vorzubereiten. Sobald die Kuppel um das Minental erschaffen ist, werde ich mit all meiner mir zur Verfügung stehenden Macht versuchen in den bevorstehenden Kampf einzugreifen. ");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´Heiliges Geschoss´: 1 geweihtes Wasser, aber keine Spruchrolle");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...ich habe, genau nach Anleitung einfach Innos geweihtes Wasser auf einen Runenrohling geträufelt und am Runentisch zusammengeführt. Der Runenstein ist zerstört, ich glaube, dieser Spruch ist wirklich nur dem Einen zugänglich."); 
						Doc_PrintLines	( nDocID,  1, "Die Heilige Aura Innos habe ich dem Klosterschtz übergeben. Sie wird von nun an, vom Klostervorsteher aufbewahrt, bis zu dem Tag, an dem sich der Eine offenbart."	);
						Doc_PrintLines	( nDocID,  1, "Die Tränen Innos mögen in dem bevorstehenden Kampf eine Rolle spielen. Doch ist es wohl zu gefährlich sie offen aufzubewahren. Ich werde sie hier in der Bibliothek lassen."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Um eine Rune zu erschaffen, benötige ich für jede Rune unterschiedliche Zutaten. Mit diesen Zutaten und einem Runenrohling kann ich dann die gewünschte Rune am Runentisch erschaffen.");
			B_LogEntry (TOPIC_TalentRunes,"Zutaten für die Rune ´Geheimer Teleport´: 1 Geweihtes Wasser");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Um in den geheimen Ort zu gelangen muss man eine Teleportrune bauen. Dazu benötigst du einen Runenrohling und eine kleines Fläschchen geweihtes Wasser. Mit der erstellten Runen kannst du dich in den Raum teleporteiren."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Ich bin nun sehr sicher, dass es die Tränen Innos waren, mit den die Paladine aus der vorderen Zeit, die längst vergessene Hohe Schwertweihe abgehalten haben. Es sollte also möglich sein, mit dem von mir entdeckten Fläschchen eine geweihten Waffe zusaätzliche Kraft zu geben."	);
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
			B_LogEntry (TOPIC_TalentSmith,"Um eine Waffe zu schmiede, brauche ich zunächst ein Stück Rohstahl. An einem Schmiedefeuer muss ich den Stahl erhitzen und anschließend an einem Amboss in die gewünschte Form bringen. Für hochwertigere Waffe benötigt man häufig noch Substanzen, welche der Waffe besondere Eigenschaften verleihen.");
			B_LogEntry (TOPIC_TalentSmith,"Wenn ich 4 Erz und 5 Drachenblut hinzugebe, kann ich mir einen ´ERZ-DRACHENTÖTER´ schmieden.");
			B_LogEntry (TOPIC_TalentSmith,"Wenn ich 5 Erz und 5 Drachenblut hinzugebe, kann ich mir einen ´GROßEN ERZ-DRACHENTÖTER´ schmieden.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Aus den Waffen des Dracheherren."); 
						Doc_PrintLines	( nDocID,  1, "´Um einem Panzer aus Drachenschuppen die höchste Härte zu verleihen, so kann man die Schuppen mit dem Erz überzeihen, welches in dem Tal der Insel Karynis gefördert wird."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Um eine dem Drachenherren würdige Klinge zu erhalten, muss man die Klinge in Drachenblut tränken. Schon die Beigabe einer Menge von 5 kleinen Phiolen verleiht dem Stahl eine Härte und Schärfe, der nichts entgegen zu setzten ist."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Anmerkung: Mit Karynis ist zeifelsfrei das heutige Khorinis gemeint.");
						Doc_Show		( nDocID );
		};
		
		if FinalDragonEquipment_Once == FALSE
		{
			B_GivePlayerXP (XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

