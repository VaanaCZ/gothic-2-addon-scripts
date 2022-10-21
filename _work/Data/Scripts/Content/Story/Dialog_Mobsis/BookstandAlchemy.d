//##########################################################################
//##
//##	Bookstand Alchemie
//##
//##########################################################################

//----------------------
var int ALchemy_1_permanent;
//----------------------
//----------------------
var int ALchemy_2_permanent;
//----------------------
//----------------------
var int ALchemy_3_permanent;
//----------------------

FUNC VOID Use_BookstandALCHEMY1_S1()		//Alchemieb�cher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mikstury o mocy magicznej");
					Doc_PrintLine	( nDocID,  0, "i ich sk�adniki"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Esencja many"						);
					Doc_PrintLine	( nDocID,  0, "2 ogniste pokrzywy"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ekstrakt many"						);
					Doc_PrintLine	( nDocID,  0, "2 ogniste ziela"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Eliksir many"						);
					Doc_PrintLine	( nDocID,  0, "2 ogniste korzenie"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Ka�da praca wykonywana przy stole alchemicznym wymaga zu�ycia menzurki."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Warzenie ka�dej mikstury leczniczej czy przywracaj�cej moc magiczn� wymaga u�ycia specjalnego sk�adnika oraz ro�liny, jak� jest w tym wypadku:"			);
					Doc_PrintLine	( nDocID,  1, "Rdest polny"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Warzenie ka�dej mikstury maj�cej sta�y i okre�lony wp�yw na cia�o lub umys� wymaga u�ycia ro�liny, jak� jest w tym wypadku:"						);
					Doc_PrintLines	( nDocID,  1, "Szczaw kr�lewski"		);
					Doc_Show		( nDocID );
					
					if (ALchemy_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_1_permanent = TRUE;
					};	  

	};
};

FUNC VOID Use_BookstandALCHEMY2_S1()		//Alchemieb�cher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mikstury lecznicze");
					Doc_PrintLine	( nDocID,  0, "i ich sk�adniki"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Esencja lecznicza"						);
					Doc_PrintLine	( nDocID,  0, "2 ro�liny lecznicze"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ekstrakt leczniczy"						);
					Doc_PrintLine	( nDocID,  0, "2 zio�a lecznicze"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Eliksir leczniczy"						);
					Doc_PrintLine	( nDocID,  0, "2 korzenie lecznicze"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Ka�da praca wykonywana przy stole alchemicznym wymaga zu�ycia menzurki."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Warzenie ka�dej mikstury leczniczej czy przywracaj�cej moc magiczn� wymaga u�ycia specjalnego sk�adnika oraz ro�liny, jak� jest w tym wypadku:"			);
					Doc_PrintLine	( nDocID,  1, "Rdest polny"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Warzenie ka�dej mikstury maj�cej sta�y i okre�lony wp�yw na cia�o lub umys� wymaga u�ycia ro�liny, jak� jest w tym wypadku:"						);
					Doc_PrintLines	( nDocID,  1, "Szczaw kr�lewski"		);
					Doc_Show		( nDocID );
					
					if (ALchemy_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_2_permanent = TRUE;
					};	

	};
};

FUNC VOID Use_BookstandALCHEMY3_S1()		//Alchemieb�cher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Mikstury powoduj�ce sta�e zmiany");
					Doc_PrintLine	( nDocID,  0, "i ich sk�adniki"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					Doc_PrintLine	( nDocID,  0, "Eliksir zr�czno�ci"						);
					Doc_PrintLine	( nDocID,  0, "1 goblinie jagody"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mikstura szybko�ci"						);
					Doc_PrintLines	( nDocID,  0, "1 z�bate ziele - ta mikstura zamiast szczawiu kr�lewskiego wymaga rdestu polnego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Eliksir si�y"						);
					Doc_PrintLine	( nDocID,  0, "1 smoczy korze�"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Eliksir �ycia"						);
					Doc_PrintLine	( nDocID,  0, "1 korze� leczniczy"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Eliksir ducha"						);
					Doc_PrintLine	( nDocID,  0, "1 ognisty korze�"						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Uwarzenie tych mikstur to najwy�szy stopie� alchemicznego wtajemniczenia. Ka�da z tych mikstur wymaga u�ycia szczawiu kr�lewskiego."); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Mikstura szybko�ci ma mniej skomplikowan� receptur� (nie wymaga u�ycia szczawiu kr�lewskiego)."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					
					
					Doc_Show		( nDocID );
					
					if (ALchemy_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_3_permanent = TRUE;
					};	

	};
};
