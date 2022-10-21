//-------------------------------------------------------------------------------------
//				Milten_03 //oben
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Milten_03_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Es ist spät geworden."					);
					Doc_PrintLines	( nDocID,  0, "Mit dem Zusammenbruch der alten Mine ist auch die Stimmung der Erzbarone zusammmengebrochen."	);
					Doc_PrintLines	( nDocID,  0, "Gomez ist wie ein Pulverfaß, das kurz vor dem explodieren steht.  "					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Corristo");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Er glaubt das dieser neue Kerl schuld am Zusammenbruch der Mine ist. Dieser Mann ist in der Tat ungewöhnlich. Aber er sollte sich hier besser nicht mehr blicken lassen.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Corristo");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Gomez ist jähzorniger denn je zuvor und ich glaube zu wissen was er vorhat. Wir müssen unbedingt die Wassermagier unterrichten, bevor es zu spät ist. "					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Corristo"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Vielleicht gelingt es uns eine Katastrophe zu verhindern. Nicht auszudenken was passieren würde, wenn er die freie Mine, "					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Milten_02 //unten
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Milten_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Ich war so frei, mich hier ein wenig einzurichten. Wer hätte gedacht, das ich einmal der einzige Magier des Lagers sein werde?"					);
					Doc_PrintLines	( nDocID,  0, "Nun ja, ich kann mich nicht wirklich darüber freuen, das ich wieder hier bin. Eigentlich sollte ich zusehen, das ich hier wegkomme."	);
					Doc_PrintLines	( nDocID,  0, "Diese Expedition ist einfach nicht erfolgreich."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Die Schürfer sind gestern aufgebrochen. Sie haben Diego mitgenommen - würde mich nicht wundern, wenn er abhaut. "					);
					Doc_PrintLines	( nDocID,  1, "Denn er wird garantiert keine Spitzhacke schwingen. "					);
					Doc_PrintLines	( nDocID,  1, "Nun, ich werde die Zeit nutzen, um mich in die Kunst der Alchemie einzuarbeiten. "					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Milten"					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Milten_01 //unten
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Milten_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		//	if (Npc_IsPlayer(self))
		//	{
		//		B_SetPlayerMap(ItWr_Map_OldWorld);
		//	};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_OldWorld.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);

	};
};
//-------------------------------------------------------------------------------------
//				Engor //unten
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Engor_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Bestand");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Haben einigen Kram vorgefunden - kaum noch verwertbares Material, darunter wie folgt"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "3 Kisten alte Stoffe"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "8 Kisten rostige Eisenware"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "4 Kisten kaputte Rüstungsteile ");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "5 Kisten Leder und Fellwaren (stinken schon!)");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "2 Kisten Spitzhacken"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "3 Kisten Werkzeuge"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "16 Kisten Gesteinsbrocken (kaum Erzgehalt)"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "1 Kiste mit rostigen Rasiermessern"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "4 Kisten kaputtes Geschirr "					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "56 Fässer Wasser"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "1 Kiste Sumpf...- (was auch immer es war, es ist verdorben.)"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Engor"					);
					Doc_Show		( nDocID );

	};
};

 
