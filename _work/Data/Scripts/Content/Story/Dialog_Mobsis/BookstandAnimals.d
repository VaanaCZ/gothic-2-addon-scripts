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

					Doc_PrintLine	( nDocID,  0, "Łowy i zwierzyna"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Każde stworzenie może pozostawić po sobie trofeum, które zwiększy majątek i sławę doświadczonego myśliwego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Myśliwy taki będzie też wiedział, jak preparować swe zdobycze i pozyskiwać trofea.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Pozyskiwanie kłów"						);
					Doc_PrintLines	( nDocID,  0, "Kły to dla wielu zwierząt broń, a najcenniejsze są te, które można pozyskać z trucheł wilków, zębaczy, cieniostworów, węży błotnych i trolli."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Obdzieranie ze skóry"						);
					Doc_PrintLines	( nDocID,  1, "Umiejętność ceniona wśród doświadczonych myśliwych, gdyż pozwala na pozyskiwanie wartościowych skór owiec, wilków, cieniostworów,"						); 
					Doc_PrintLines	( nDocID,  1, "węży błotnych i topielców."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Pozyskiwanie szponów"						);
					Doc_PrintLines	( nDocID,  1, "Można je praktykować na jaszczurach, zębaczach, topielcach i cieniostworach."						);
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

					Doc_PrintLine	( nDocID,  0, "Łowy i zwierzyna"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Każde stworzenie może pozostawić po sobie trofeum, które zwiększy majątek i sławę doświadczonego myśliwego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Krwiopijcy"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Wypatroszenie tych latających potworów nie jest proste, można im jednak"					); 
					Doc_PrintLines	( nDocID,  0, "usunąć skrzydła i wyjąć żądła." );
					Doc_PrintLines	( nDocID,  0, "I jedne, i drugie stanowią cenne trofea myśliwskie."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Polne bestie i pełzacze atakują za pomocą żuwaczek. Szczególnie cenne są narządy"						);
					Doc_PrintLines	( nDocID,  1, "tych drugich, zawierające wydzielinę, której wypicie zwiększa moc magiczną."						);
					Doc_PrintLines	( nDocID,  1, "Nie należy nadużywać tego cudownego środka, gdyż z czasem organizm ludzki przestaje nań reagować."						);   
					Doc_PrintLines	( nDocID,  1, "Podobnie popularne są płyty pancerza pełzacza, z których można tworzyć bardzo dobre zbroje."						);
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

					Doc_PrintLine	( nDocID,  0, "Łowy i zwierzyna"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Każde stworzenie może pozostawić po sobie trofeum, które zwiększy majątek i sławę doświadczonego myśliwego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ognisty jaszczur"						);
					Doc_PrintLines	( nDocID,  0, "Ta jaszczuropodobna, ziejąca ogniem istota jest wyjątkowo groźna dla każdego przebywającego w pobliżu."						);
					Doc_PrintLines	( nDocID,  0, "Jej cenny język może spróbować zdobyć tylko ktoś dysponujący jakąś ochroną przed ogniem."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Cieniostwór"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Większość z tych stworzeń to zaszyci głęboko w lasach samotnicy."						); 
					Doc_PrintLines	( nDocID,  1, "Pozostało ich na świecie bardzo niewiele, nie stanowią więc zagrożenia dla ludzi - chyba że wkroczy się na ich tereny łowieckie."						);
					Doc_PrintLines	( nDocID,  1, "Dobrze wiedzieć, gdzie znajdują się te tereny - róg cieniostwora to cenne trofeum myśliwskie, które jednak trzeba"						);
					Doc_PrintLines	( nDocID,  1, "umieć odpowiednio preparować."						);
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

