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

					Doc_PrintLine	( nDocID,  0, "La via della battaglia"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
				
					
					Doc_PrintLines	( nDocID,  0, "La migliore difesa � un buon attacco, perlomeno contro qualsiasi creatura non umana. � inutile cercare di parare gli attacchi degli animali o dei mostri."						);
					Doc_PrintLines	( nDocID,  0, "� meglio tenere il nemico a bada con alcuni colpi ben piazzati e poi lanciarsi in una combinazione d'attacco a sorpresa."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Naturalmente solamente i combattenti pi� esperti potranno combinare i propri attacchi. Se diventerai un maestro nell'arte della battaglia potrai utilizzare diverse combinazioni."						); 
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

					Doc_PrintLine	( nDocID,  0, "L'isola"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "La citt� portuale di Khorinis sorge su un'isola della costa del Regno di Myrtana."						);
					Doc_PrintLines	( nDocID,  0, "L'isola deve la sua fama alla Valle delle Miniere. La sua reputazione � dubbia, poich� per molti anni una barriera magica ha attraversato l'intera valle, imprigionando tutti i carcerati del Regno."						);
					Doc_PrintLines	( nDocID,  0, "Pertanto la valle divenne la prigione dove i carcerati estraevano il metallo magico dalle profondit� della terra."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Fuori da Khorinis si trova una serie di fattorie che utilizzano il fertile terreno per piantare grano e rape e per allevare le pecore."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Per generazioni la fattoria pi� grande � appartenuta al proprietario terriero, il quale affittava le terre circostanti agli altri contadini."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Al centro dell'isola di trova un antico monastero di Innos, gestito dai Maghi del Fuoco. In questo luogo essi conducono ricerche sulla magia e l'alchimia, oltre a produrre il vino."						);
					
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

					Doc_PrintLine	( nDocID,  0, "Le leggi dell'isola"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					
				
					
					Doc_PrintLines	( nDocID,  0, "Dovunque gli uomini si riuniscano - che sia il monastero, la citt� o la fattoria del proprietario terriero - devono essere trovate delle regole per mantenere la pace."						);
					Doc_PrintLines	( nDocID,  0, "Ogni crimine contro la comunit� verr� punito."						);
					Doc_PrintLines	( nDocID,  0, "La comunit� vieta ogni tipo di rissa."						);
					Doc_PrintLines	( nDocID,  0, "Il furto � un crimine punibile dalla legge. Anche le pecore sono protette dalla legge."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Se un uomo colpisce un altro uomo o lo assassina, egli dovr� essere giudicato sul posto."						);
					Doc_PrintLines	( nDocID,  1, "Per evitare questo destino egli dovr� pagare una pesante penale."						);
					Doc_PrintLines	( nDocID,  1, "In tutti i luoghi principali gli uomini della giustizia mantengono la pace. Essi verranno a conoscenza di qualsiasi crimine ed � loro compito punire il colpevole e ripristinare l'ordine."						); 
					Doc_PrintLines	( nDocID,  1, "Chiunque subisca un crimine o ne sia testimone non avr� pi� stima del colpevole."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Naturamente ci sono anche persone che disprezzano le leggi, in particolare i briganti e i mercenari."						);
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

