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
			B_LogEntry (TOPIC_FireContest,"Als Novize habe ich das Recht die Pr�fung des Feuers zu fordern. Dabei wird mir jeder der drei Magier aus dem hohen Rat eine Pr�fung stellen. Wenn ich sie bestehe, werde ich in den Kreis des Feuers aufgenommen.");
		};
	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Die Pr�fung des Feuers"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
				
					
					Doc_PrintLines	( nDocID,  0, "So ein Novize nicht erw�hlt ist, mag es sein, das er trotzdem die Bereitschaft versp�rt sich der Pr�fung der Magie zu unterwerfen. Wenn er diesen Entschlu� reiflich �berlegt hat und er darauf besteht, ist es ihm gew�hrt, die Pr�fung zu verlangen und kein Magier darf sie ihm verweigern. Doch nicht nur die Pr�fung der Magie wird ihm auferlegt, sondern er soll durch das Feuer seine Erleuchtung finden. Wenn er vor dem hohen Rat darauf besteht, so soll ihm die PR�FUNG DES FEUERS gew�hrt werden.");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "In dieser Pr�fung soll gleicherma�en die Klugheit, St�rke und das Geschick des Novizen gefordert werden. So soll er drei Pr�fungen erf�llen, jede empfangen durch einen der Magier des hohen Rates, bevor er den Eid der Flamme schw�rt und den Bund mit dem Feuer eingehen kann. "); 
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
						Doc_PrintLines	( nDocID,  0, "...Ich hoffe, dass die Kuppel das Erz vor dem Zugriff Beliars zu sch�tzen vermag. Der K�nig ist einf�ltig genug zu glauben, dass wir die Kuppel zum Schutz vor Ausbr�chen errichten, doch solange wir mit diesen Ratschlagen unsere h�heren Zeile erreichen, soll es uns recht sein. Ich hoffe, das uns genug Zeit bleibt uns auf den Kampf vorzubereiten. Sobald die Kuppel um das Minental erschaffen ist, werde ich mit all meiner mir zur Verf�gung stehenden Macht versuchen in den bevorstehenden Kampf einzugreifen. ");
						Doc_PrintLines	( nDocID,  0, "");
			
					
	
			
		if  (hero.guild == GIL_KDF)
		{	
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE; 
			B_LogEntry (TOPIC_TalentRunes,"Zutaten f�r die Rune �Heiliges Geschoss�: 1 geweihtes Wasser, aber keine Spruchrolle");
			
			
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "...ich habe, genau nach Anleitung einfach Innos geweihtes Wasser auf einen Runenrohling getr�ufelt und am Runentisch zusammengef�hrt. Der Runenstein ist zerst�rt, ich glaube, dieser Spruch ist wirklich nur dem Einen zug�nglich."); 
						Doc_PrintLines	( nDocID,  1, "Die Heilige Aura Innos habe ich dem Klosterschtz �bergeben. Sie wird von nun an, vom Klostervorsteher aufbewahrt, bis zu dem Tag, an dem sich der Eine offenbart."	);
						Doc_PrintLines	( nDocID,  1, "Die Tr�nen Innos m�gen in dem bevorstehenden Kampf eine Rolle spielen. Doch ist es wohl zu gef�hrlich sie offen aufzubewahren. Ich werde sie hier in der Bibliothek lassen."	);
						Doc_Show		( nDocID );
						
						
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE; 		
			PrintScreen	(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);
			
			Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry (TOPIC_TalentRunes,"Um eine Rune zu erschaffen, ben�tige ich f�r jede Rune unterschiedliche Zutaten. Mit diesen Zutaten und einem Runenrohling kann ich dann die gew�nschte Rune am Runentisch erschaffen.");
			B_LogEntry (TOPIC_TalentRunes,"Zutaten f�r die Rune �Geheimer Teleport�: 1 Geweihtes Wasser");
			
			
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Um in den geheimen Ort zu gelangen muss man eine Teleportrune bauen. Dazu ben�tigst du einen Runenrohling und eine kleines Fl�schchen geweihtes Wasser. Mit der erstellten Runen kannst du dich in den Raum teleporteiren."); 
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Ich bin nun sehr sicher, dass es die Tr�nen Innos waren, mit den die Paladine aus der vorderen Zeit, die l�ngst vergessene Hohe Schwertweihe abgehalten haben. Es sollte also m�glich sein, mit dem von mir entdeckten Fl�schchen eine geweihten Waffe zusa�tzliche Kraft zu geben."	);
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
			B_LogEntry (TOPIC_TalentSmith,"Um eine Waffe zu schmiede, brauche ich zun�chst ein St�ck Rohstahl. An einem Schmiedefeuer muss ich den Stahl erhitzen und anschlie�end an einem Amboss in die gew�nschte Form bringen. F�r hochwertigere Waffe ben�tigt man h�ufig noch Substanzen, welche der Waffe besondere Eigenschaften verleihen.");
			B_LogEntry (TOPIC_TalentSmith,"Wenn ich 4 Erz und 5 Drachenblut hinzugebe, kann ich mir einen �ERZ-DRACHENT�TER� schmieden.");
			B_LogEntry (TOPIC_TalentSmith,"Wenn ich 5 Erz und 5 Drachenblut hinzugebe, kann ich mir einen �GRO�EN ERZ-DRACHENT�TER� schmieden.");
			PlayerGetsFinalDJGArmor = TRUE;
		
						
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Aus den Waffen des Dracheherren."); 
						Doc_PrintLines	( nDocID,  1, "�Um einem Panzer aus Drachenschuppen die h�chste H�rte zu verleihen, so kann man die Schuppen mit dem Erz �berzeihen, welches in dem Tal der Insel Karynis gef�rdert wird."					);
						Doc_PrintLine	( nDocID,  1, "");
						Doc_PrintLines	( nDocID,  1, "Um eine dem Drachenherren w�rdige Klinge zu erhalten, muss man die Klinge in Drachenblut tr�nken. Schon die Beigabe einer Menge von 5 kleinen Phiolen verleiht dem Stahl eine H�rte und Sch�rfe, der nichts entgegen zu setzten ist."					);
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

