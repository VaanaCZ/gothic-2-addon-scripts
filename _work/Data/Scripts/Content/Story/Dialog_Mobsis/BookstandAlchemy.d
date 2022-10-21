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

FUNC VOID Use_BookstandALCHEMY1_S1()		//Alchemiebücher
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
					Doc_PrintLine	( nDocID,  0, "i ich sk³adniki"						);
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
					Doc_PrintLines	( nDocID,  1, "Ka¿da praca wykonywana przy stole alchemicznym wymaga zu¿ycia menzurki."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Warzenie ka¿dej mikstury leczniczej czy przywracaj¹cej moc magiczn¹ wymaga u¿ycia specjalnego sk³adnika oraz roœliny, jak¹ jest w tym wypadku:"			);
					Doc_PrintLine	( nDocID,  1, "Rdest polny"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Warzenie ka¿dej mikstury maj¹cej sta³y i okreœlony wp³yw na cia³o lub umys³ wymaga u¿ycia roœliny, jak¹ jest w tym wypadku:"						);
					Doc_PrintLines	( nDocID,  1, "Szczaw królewski"		);
					Doc_Show		( nDocID );
					
					if (ALchemy_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_1_permanent = TRUE;
					};	  

	};
};

FUNC VOID Use_BookstandALCHEMY2_S1()		//Alchemiebücher
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
					Doc_PrintLine	( nDocID,  0, "i ich sk³adniki"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Esencja lecznicza"						);
					Doc_PrintLine	( nDocID,  0, "2 roœliny lecznicze"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ekstrakt leczniczy"						);
					Doc_PrintLine	( nDocID,  0, "2 zio³a lecznicze"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Eliksir leczniczy"						);
					Doc_PrintLine	( nDocID,  0, "2 korzenie lecznicze"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Ka¿da praca wykonywana przy stole alchemicznym wymaga zu¿ycia menzurki."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Warzenie ka¿dej mikstury leczniczej czy przywracaj¹cej moc magiczn¹ wymaga u¿ycia specjalnego sk³adnika oraz roœliny, jak¹ jest w tym wypadku:"			);
					Doc_PrintLine	( nDocID,  1, "Rdest polny"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Warzenie ka¿dej mikstury maj¹cej sta³y i okreœlony wp³yw na cia³o lub umys³ wymaga u¿ycia roœliny, jak¹ jest w tym wypadku:"						);
					Doc_PrintLines	( nDocID,  1, "Szczaw królewski"		);
					Doc_Show		( nDocID );
					
					if (ALchemy_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_2_permanent = TRUE;
					};	

	};
};

FUNC VOID Use_BookstandALCHEMY3_S1()		//Alchemiebücher
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
					Doc_PrintLines	( nDocID,  0, "Mikstury powoduj¹ce sta³e zmiany");
					Doc_PrintLine	( nDocID,  0, "i ich sk³adniki"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					Doc_PrintLine	( nDocID,  0, "Eliksir zrêcznoœci"						);
					Doc_PrintLine	( nDocID,  0, "1 goblinie jagody"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mikstura szybkoœci"						);
					Doc_PrintLines	( nDocID,  0, "1 zêbate ziele - ta mikstura zamiast szczawiu królewskiego wymaga rdestu polnego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Eliksir si³y"						);
					Doc_PrintLine	( nDocID,  0, "1 smoczy korzeñ"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Eliksir ¿ycia"						);
					Doc_PrintLine	( nDocID,  0, "1 korzeñ leczniczy"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Eliksir ducha"						);
					Doc_PrintLine	( nDocID,  0, "1 ognisty korzeñ"						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Uwarzenie tych mikstur to najwy¿szy stopieñ alchemicznego wtajemniczenia. Ka¿da z tych mikstur wymaga u¿ycia szczawiu królewskiego."); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Mikstura szybkoœci ma mniej skomplikowan¹ recepturê (nie wymaga u¿ycia szczawiu królewskiego)."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					
					
					Doc_Show		( nDocID );
					
					if (ALchemy_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_3_permanent = TRUE;
					};	

	};
};
