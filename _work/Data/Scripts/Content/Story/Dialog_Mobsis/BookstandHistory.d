//##########################################################################
//##
//##	Bookstand History
//##
//##########################################################################

//----------------------
var int History_1_permanent;
//----------------------
//----------------------
var int History_2_permanent;
//----------------------
//----------------------
var int History_3_permanent;
//----------------------

FUNC VOID Use_BookstandHistory1_S1()		//Geschichtsbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_RED_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_RED_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Sztuka walki"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
				
					
					Doc_PrintLines	( nDocID,  0, "Najlepsz¹ obron¹ jest atak - w ka¿dym razie przeciwko zwierzêtom i bestiom. W ich przypadku parowanie ciosów nie ma sensu."						);
					Doc_PrintLines	( nDocID,  0, "Lepiej szachowaæ przeciwnika celnymi ciosami i przygotowaæ zaskakuj¹c¹ kombinacjê, której nie zdo³a odeprzeæ."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Pamiêtaj jednak, ¿e ³¹czenie ciosów w p³ynne sekwencje to domena doœwiadczonych wojowników, a ³¹czenie poszczególnych sekwencji jest jeszcze trudniejsze."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_Show		( nDocID );
					
					if (History_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_1_permanent = TRUE;
					};

	};
	
};

FUNC VOID Use_BookstandHistory2_S1()		//Geschichtsbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_RED_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_RED_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Wyspa"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Khorinis to portowe miasto le¿¹ce na wyspie w pobli¿u wybrze¿y Królestwa Myrtany."						);
					Doc_PrintLines	( nDocID,  0, "Wiêkszoœæ swej w¹tpliwej s³awy wyspa zawdziêcza Górniczej Dolinie, gdzie znajdowa³a siê kolonia karna, otoczona przez wiele lat magiczn¹ barier¹. To tutaj wszyscy skazañcy kraju"						);
					Doc_PrintLines	( nDocID,  0, "zajmowali siê wydobywaniem z najg³êbszych pok³adów skorupy ziemskiej magicznej rudy."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Oprócz miasta znajduj¹ siê tam liczne farmy, a na ¿yznych ziemiach uprawia siê pszenicê, rzepê i hoduje owce."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Od pokoleñ najwiêksza z farm nale¿a³a do wielmo¿y, który przekazywa³ swoje ziemie innym pod uprawê."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "W centrum wyspy znajduje siê pradawny Klasztor Innosa zarz¹dzany przez Magów Ognia, którzy zajmuj¹ siê badaniem natury magii, alchemi¹ i wytwarzaniem win."						);
					
					Doc_Show		( nDocID );
					
					if (History_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_2_permanent = TRUE;
					};

	};
};


FUNC VOID Use_BookstandHistory3_S1()		//Geschichtsbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_RED_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_RED_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "Prawo wyspy"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					
				
					
					Doc_PrintLines	( nDocID,  0, "Ka¿de zebranie grupy ludzi musi siê odbywaæ w absolutnym spokoju - i to niezale¿nie od miejsca, w którym siê odbywa."						);
					Doc_PrintLines	( nDocID,  0, "Ka¿da zbrodnia przeciwko ogó³owi bêdzie karana."						);
					Doc_PrintLines	( nDocID,  0, "Ogó³ zabrania wszczynania bójek oraz brania w nich udzia³u."						);
					Doc_PrintLines	( nDocID,  0, "Zbrodni¹ jest równie¿ kradzie¿, a prawo chroni tak¿e owce."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Atak na cz³owieka lub jego zabicie oznacza dla sprawcy bezzw³oczne os¹dzenie. "						);
					Doc_PrintLines	( nDocID,  1, "W najlepszym razie winny musi zap³aciæ wysok¹ grzywnê."						);
					Doc_PrintLines	( nDocID,  1, "Wszystkie wiêksze skupiska ludzkie s¹ chronione przez odpowiednie s³u¿by. Ich funkcjonariusze karz¹ przestêpców i dbaj¹ o ³ad i porz¹dek."						); 
					Doc_PrintLines	( nDocID,  1, "Praworz¹dna wiêkszoœæ poinformuje w³adze o przestêpstwie, sprawcy nie s¹ tu mile widziani,"						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "choæ zdarzaj¹ siê jednostki o ¿adne prawa nie dbaj¹ce - to m.in wszelacy bandyci i najemnicy."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_Show		( nDocID );
					
					if (History_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_2_permanent = TRUE;
					};

	};
};

