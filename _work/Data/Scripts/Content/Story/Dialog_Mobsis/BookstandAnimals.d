//##########################################################################
//##
//##	Bookstand Animals
//##
//##########################################################################

//----------------------
var int Animals_1_permanent;
//----------------------
//----------------------
var int Animals_2_permanent;
//----------------------
//----------------------
var int Animals_3_permanent;
//----------------------

FUNC VOID Use_BookstandAnimals1_S1()		//Tierbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Jagd und Beute"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Jedes Tier und Wesen besitzt eigene Trophäen, die den Ruhm und Reichtum eines erfahrenen Jäger mehren."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ein erfahrener Jäger weiß um die Trophäen seiner Beute und kennt die verschiedenen Methoden sie auszunehmen.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Zähne reißen"						);
					Doc_PrintLines	( nDocID,  0, "Die Zähne, sind die Waffe von vielen Tieren und Wesen. Wer darum weiß, wie er sie seiner Beute fachkundig entreißt, findet bei Wölfen, Snappern, Schattenläufern, Sumpfhaien und Trollen seine Beute."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Felle abziehen"						);
					Doc_PrintLines	( nDocID,  1, "Ein Talent das der erfahrene Jäger oft zu nutzen weiß - gibt es doch viele Tiere, deren Körper von einem Fell geschützt ist. Schafe, Wölfe und Schattenläufer um nur einige zu benennen."						); 
					Doc_PrintLines	( nDocID,  1, "Ein Jäger, der dieses Talent beherrscht, kann auch die Häute von Sumphaien und Lurkern abziehen.  "						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Krallen brechen"						);
					Doc_PrintLines	( nDocID,  1, "Eine Kunst, die bei Waranen aller Art, Snappern, Lurkern und Schattenläufern eingesetzt werden kann.  "						);
					Doc_Show		( nDocID );
					
					if (Animals_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						Animals_1_permanent = TRUE;
					};	

	};
};

FUNC VOID Use_BookstandAnimals2_S1()		//Tierbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Jagd und Beute"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Jedes Tier und Wesen besitzt eigene Trophäen, die den Ruhm und Reichtum eines erfahrenen Jäger mehren."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Die Blutfliegen"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Um diese fliegenden Teufel auszunehmen, bedarf es zwei besonderer Künste."					); 
					Doc_PrintLines	( nDocID,  0, "Zum einen können ihnen die Flügel abgetrennt, zum anderen kann der Stachel entrissen werden." );
					Doc_PrintLines	( nDocID,  0, "Beide Künste sollte der erfahrene Jäger einsetzen, um sich die Trophäen anzueignen."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Feldräuber und Minecrawler greifen mit Zangen an. Vor allem die Zangen der Minecrawler"						);
					Doc_PrintLines	( nDocID,  1, "gelten als besonders wertvoll, weil sie ein Sekret enthalten, das magische Kräfte steigert."						);
					Doc_PrintLines	( nDocID,  1, "Allerdings sollte es mit Vorsicht genossen werden, da der menschliche Körper mit der Zeit nicht mehr darauf reagiert."						);   
					Doc_PrintLines	( nDocID,  1, "Ebenfalls sehr begehrt sind die Platten der Minecrawler. Aus ihnen lassen sich Rüstungen herstellen. "						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, " "						);
					Doc_Show		( nDocID );
					
					if (Animals_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						Animals_2_permanent = TRUE;
					};

	};
};

FUNC VOID Use_BookstandAnimals3_S1()		//Tierbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Jagd und Beute"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Jedes Tier und Wesen besitzt eigene Trophäen, die den Ruhm und Reichtum eines erfahrenen Jäger mehren."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Der Feuerwaran"						);
					Doc_PrintLines	( nDocID,  0, "Dieses besondere Wesen zählt zur Gattung der Warane, allerdings ist es in der Lage Feuer zu speien, das jeden der sich ihm auf ein paar Schritt nähert, unweigerlich tötet."						);
					Doc_PrintLines	( nDocID,  0, "Nur wer sich gegen Feuer zu schützen vermag, kann sich im Kampf mit diesen Wesen messen und ihm die kostbare Zunge entreissen."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Der Schattenläufer"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Der Schattenläufer ist ein uralter Einzelgänger der versteckt in Wäldern lebt."						); 
					Doc_PrintLines	( nDocID,  1, "Es gibt nur noch wenige Exemplare, so das er für den Menschen keine Gefahr mehr darstellt, solange er nicht seine Jagdrevier kreuzt."						);
					Doc_PrintLines	( nDocID,  1, "Der Kopf des Schattenläufers wird von einem Horn gekrönt, das als wertvolle Trophäe gilt. Ein Jäger muss die Kunst lernen, das Horn richtig zu brechen,"						);
					Doc_PrintLines	( nDocID,  1, "damit er diese Trophäe bekommt."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
							
					Doc_Show		( nDocID );
					
					if (Animals_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						Animals_3_permanent = TRUE;
					};

	};
};

