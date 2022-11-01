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
				
					
					Doc_PrintLines	( nDocID,  0, "Najlepszą obroną jest atak - w każdym razie przeciwko zwierzętom i bestiom. W ich przypadku parowanie ciosów nie ma sensu."						);
					Doc_PrintLines	( nDocID,  0, "Lepiej szachować przeciwnika celnymi ciosami i przygotować zaskakującą kombinację, której nie zdoła odeprzeć."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Pamiętaj jednak, że łączenie ciosów w płynne sekwencje to domena doświadczonych wojowników, a łączenie poszczególnych sekwencji jest jeszcze trudniejsze."						); 
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
					Doc_PrintLines	( nDocID,  0, "Khorinis to portowe miasto leżące na wyspie w pobliżu wybrzeży Królestwa Myrtany."						);
					Doc_PrintLines	( nDocID,  0, "Większość swej wątpliwej sławy wyspa zawdzięcza Górniczej Dolinie, gdzie znajdowała się kolonia karna, otoczona przez wiele lat magiczną barierą. To tutaj wszyscy skazańcy kraju"						);
					Doc_PrintLines	( nDocID,  0, "zajmowali się wydobywaniem z najgłębszych pokładów skorupy ziemskiej magicznej rudy."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Oprócz miasta znajdują się tam liczne farmy, a na żyznych ziemiach uprawia się pszenicę, rzepę i hoduje owce."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Od pokoleń największa z farm należała do wielmoży, który przekazywał swoje ziemie innym pod uprawę."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "W centrum wyspy znajduje się pradawny Klasztor Innosa zarządzany przez Magów Ognia, którzy zajmują się badaniem natury magii, alchemią i wytwarzaniem win."						);
					
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
					
				
					
					Doc_PrintLines	( nDocID,  0, "Każde zebranie grupy ludzi musi się odbywać w absolutnym spokoju - i to niezależnie od miejsca, w którym się odbywa."						);
					Doc_PrintLines	( nDocID,  0, "Każda zbrodnia przeciwko ogółowi będzie karana."						);
					Doc_PrintLines	( nDocID,  0, "Ogół zabrania wszczynania bójek oraz brania w nich udziału."						);
					Doc_PrintLines	( nDocID,  0, "Zbrodnią jest również kradzież, a prawo chroni także owce."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Atak na człowieka lub jego zabicie oznacza dla sprawcy bezzwłoczne osądzenie. "						);
					Doc_PrintLines	( nDocID,  1, "W najlepszym razie winny musi zapłacić wysoką grzywnę."						);
					Doc_PrintLines	( nDocID,  1, "Wszystkie większe skupiska ludzkie są chronione przez odpowiednie służby. Ich funkcjonariusze karzą przestępców i dbają o ład i porządek."						); 
					Doc_PrintLines	( nDocID,  1, "Praworządna większość poinformuje władze o przestępstwie, sprawcy nie są tu mile widziani,"						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "choć zdarzają się jednostki o żadne prawa nie dbające - to m.in wszelacy bandyci i najemnicy."						);
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

