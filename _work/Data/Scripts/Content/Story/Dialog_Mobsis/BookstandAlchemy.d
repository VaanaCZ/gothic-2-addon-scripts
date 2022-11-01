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
					Doc_PrintLine	( nDocID,  0, "Magické lektvary");
					Doc_PrintLine	( nDocID,  0, "a pâísady"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Esence many"						);
					Doc_PrintLine	( nDocID,  0, "2 ohnivé kopâivy"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Extrakt many"						);
					Doc_PrintLine	( nDocID,  0, "2 ohnivé býlí"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixír many"						);
					Doc_PrintLine	( nDocID,  0, "2 ohnivé koâeny"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Alchymista ke své práci vždy potâebuje laboratorní lahvičku, do které pak nalije hotový lektvar."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "K namíchání léčivého lektvaru nebo elixíru posilujícího magickou moc potâebuješ zvláštní pâísadu a rostlinu:"			);
					Doc_PrintLine	( nDocID,  1, "Luční pohanka"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "K namíchání lektvarů trvale męnících nękterou z duševních či tęlesných vlastností potâebuješ určitou rostlinu:"						);
					Doc_PrintLines	( nDocID,  1, "Královský šăovík"		);
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
					Doc_PrintLine	( nDocID,  0, "Léčivé lektvary");
					Doc_PrintLine	( nDocID,  0, "a pâísady"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Esence hojivé síly"						);
					Doc_PrintLine	( nDocID,  0, "2 léčivé rostliny"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Extrakt hojivé síly"						);
					Doc_PrintLine	( nDocID,  0, "2 léčivé byliny"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixír hojivé síly"						);
					Doc_PrintLine	( nDocID,  0, "2 léčivé koâeny"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Alchymista ke své práci vždy potâebuje laboratorní lahvičku, do které pak nalije hotový lektvar."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "K namíchání léčivého lektvaru nebo elixíru posilujícího magickou moc potâebuješ zvláštní pâísadu a rostlinu:"			);
					Doc_PrintLine	( nDocID,  1, "Luční pohanka"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "K namíchání lektvarů trvale męnících nękterou z duševních či tęlesných vlastností potâebuješ určitou rostlinu:"						);
					Doc_PrintLines	( nDocID,  1, "Královský šăovík"		);
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
					Doc_PrintLines	( nDocID,  0, "Lektvary pro trvalé zmęny");
					Doc_PrintLine	( nDocID,  0, "a pâísady"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					Doc_PrintLine	( nDocID,  0, "Elixír obratnosti"						);
					Doc_PrintLine	( nDocID,  0, "1 gobliní bobule"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Lektvar rychlosti"						);
					Doc_PrintLines	( nDocID,  0, "1 chŕapavčí býlí - k výrobę tohoto lektvaru nepotâebuješ královský šăovík, nýbrž luční pohanku."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixír síly"						);
					Doc_PrintLine	( nDocID,  0, "1 dračí koâen"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elixír života"						);
					Doc_PrintLine	( nDocID,  0, "1 léčivý koâen"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elixír ducha"						);
					Doc_PrintLine	( nDocID,  0, "1 ohnivý koâen"						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Tyto lektvary může namíchat jen skutečný mistr alchymie. Jednou z pâísad do tęchto vzácných elixírů bývá obvykle královský šăovík."); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Lektvar rychlosti namícháš mnohem snáze, zvláštę proto, že k jeho vytvoâení nepotâebuješ královský šăovík."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					
					
					Doc_Show		( nDocID );
					
					if (ALchemy_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_3_permanent = TRUE;
					};	

	};
};
