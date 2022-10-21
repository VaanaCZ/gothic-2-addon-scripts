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

FUNC VOID Use_BookstandHistory1_S1()		//Geschichtsb�cher
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
				
					
					Doc_PrintLines	( nDocID,  0, "Najlepsz� obron� jest atak - w ka�dym razie przeciwko zwierz�tom i bestiom. W ich przypadku parowanie cios�w nie ma sensu."						);
					Doc_PrintLines	( nDocID,  0, "Lepiej szachowa� przeciwnika celnymi ciosami i przygotowa� zaskakuj�c� kombinacj�, kt�rej nie zdo�a odeprze�."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Pami�taj jednak, �e ��czenie cios�w w p�ynne sekwencje to domena do�wiadczonych wojownik�w, a ��czenie poszczeg�lnych sekwencji jest jeszcze trudniejsze."						); 
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

FUNC VOID Use_BookstandHistory2_S1()		//Geschichtsb�cher
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
					Doc_PrintLines	( nDocID,  0, "Khorinis to portowe miasto le��ce na wyspie w pobli�u wybrze�y Kr�lestwa Myrtany."						);
					Doc_PrintLines	( nDocID,  0, "Wi�kszo�� swej w�tpliwej s�awy wyspa zawdzi�cza G�rniczej Dolinie, gdzie znajdowa�a si� kolonia karna, otoczona przez wiele lat magiczn� barier�. To tutaj wszyscy skaza�cy kraju"						);
					Doc_PrintLines	( nDocID,  0, "zajmowali si� wydobywaniem z najg��bszych pok�ad�w skorupy ziemskiej magicznej rudy."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Opr�cz miasta znajduj� si� tam liczne farmy, a na �yznych ziemiach uprawia si� pszenic�, rzep� i hoduje owce."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Od pokole� najwi�ksza z farm nale�a�a do wielmo�y, kt�ry przekazywa� swoje ziemie innym pod upraw�."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "W centrum wyspy znajduje si� pradawny Klasztor Innosa zarz�dzany przez Mag�w Ognia, kt�rzy zajmuj� si� badaniem natury magii, alchemi� i wytwarzaniem win."						);
					
					Doc_Show		( nDocID );
					
					if (History_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_2_permanent = TRUE;
					};

	};
};


FUNC VOID Use_BookstandHistory3_S1()		//Geschichtsb�cher
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
					
				
					
					Doc_PrintLines	( nDocID,  0, "Ka�de zebranie grupy ludzi musi si� odbywa� w absolutnym spokoju - i to niezale�nie od miejsca, w kt�rym si� odbywa."						);
					Doc_PrintLines	( nDocID,  0, "Ka�da zbrodnia przeciwko og�owi b�dzie karana."						);
					Doc_PrintLines	( nDocID,  0, "Og� zabrania wszczynania b�jek oraz brania w nich udzia�u."						);
					Doc_PrintLines	( nDocID,  0, "Zbrodni� jest r�wnie� kradzie�, a prawo chroni tak�e owce."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Atak na cz�owieka lub jego zabicie oznacza dla sprawcy bezzw�oczne os�dzenie. "						);
					Doc_PrintLines	( nDocID,  1, "W najlepszym razie winny musi zap�aci� wysok� grzywn�."						);
					Doc_PrintLines	( nDocID,  1, "Wszystkie wi�ksze skupiska ludzkie s� chronione przez odpowiednie s�u�by. Ich funkcjonariusze karz� przest�pc�w i dbaj� o �ad i porz�dek."						); 
					Doc_PrintLines	( nDocID,  1, "Praworz�dna wi�kszo�� poinformuje w�adze o przest�pstwie, sprawcy nie s� tu mile widziani,"						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "cho� zdarzaj� si� jednostki o �adne prawa nie dbaj�ce - to m.in wszelacy bandyci i najemnicy."						);
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

