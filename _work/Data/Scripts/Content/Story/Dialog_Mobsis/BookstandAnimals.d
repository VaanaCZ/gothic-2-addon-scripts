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

FUNC VOID Use_BookstandAnimals1_S1()		//Tierb�cher
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

					Doc_PrintLine	( nDocID,  0, "�owy i zwierzyna"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ka�de stworzenie mo�e pozostawi� po sobie trofeum, kt�re zwi�kszy maj�tek i s�aw� do�wiadczonego my�liwego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "My�liwy taki b�dzie te� wiedzia�, jak preparowa� swe zdobycze i pozyskiwa� trofea.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Pozyskiwanie k��w"						);
					Doc_PrintLines	( nDocID,  0, "K�y to dla wielu zwierz�t bro�, a najcenniejsze s� te, kt�re mo�na pozyska� z truche� wilk�w, z�baczy, cieniostwor�w, w�y b�otnych i trolli."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Obdzieranie ze sk�ry"						);
					Doc_PrintLines	( nDocID,  1, "Umiej�tno�� ceniona w�r�d do�wiadczonych my�liwych, gdy� pozwala na pozyskiwanie warto�ciowych sk�r owiec, wilk�w, cieniostwor�w,"						); 
					Doc_PrintLines	( nDocID,  1, "w�y b�otnych i topielc�w."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Pozyskiwanie szpon�w"						);
					Doc_PrintLines	( nDocID,  1, "Mo�na je praktykowa� na jaszczurach, z�baczach, topielcach i cieniostworach."						);
					Doc_Show		( nDocID );
					
					if (Animals_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						Animals_1_permanent = TRUE;
					};	

	};
};

FUNC VOID Use_BookstandAnimals2_S1()		//Tierb�cher
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

					Doc_PrintLine	( nDocID,  0, "�owy i zwierzyna"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ka�de stworzenie mo�e pozostawi� po sobie trofeum, kt�re zwi�kszy maj�tek i s�aw� do�wiadczonego my�liwego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Krwiopijcy"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Wypatroszenie tych lataj�cych potwor�w nie jest proste, mo�na im jednak"					); 
					Doc_PrintLines	( nDocID,  0, "usun�� skrzyd�a i wyj�� ��d�a." );
					Doc_PrintLines	( nDocID,  0, "I jedne, i drugie stanowi� cenne trofea my�liwskie."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Polne bestie i pe�zacze atakuj� za pomoc� �uwaczek. Szczeg�lnie cenne s� narz�dy"						);
					Doc_PrintLines	( nDocID,  1, "tych drugich, zawieraj�ce wydzielin�, kt�rej wypicie zwi�ksza moc magiczn�."						);
					Doc_PrintLines	( nDocID,  1, "Nie nale�y nadu�ywa� tego cudownego �rodka, gdy� z czasem organizm ludzki przestaje na� reagowa�."						);   
					Doc_PrintLines	( nDocID,  1, "Podobnie popularne s� p�yty pancerza pe�zacza, z kt�rych mo�na tworzy� bardzo dobre zbroje."						);
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

FUNC VOID Use_BookstandAnimals3_S1()		//Tierb�cher
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

					Doc_PrintLine	( nDocID,  0, "�owy i zwierzyna"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ka�de stworzenie mo�e pozostawi� po sobie trofeum, kt�re zwi�kszy maj�tek i s�aw� do�wiadczonego my�liwego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ognisty jaszczur"						);
					Doc_PrintLines	( nDocID,  0, "Ta jaszczuropodobna, ziej�ca ogniem istota jest wyj�tkowo gro�na dla ka�dego przebywaj�cego w pobli�u."						);
					Doc_PrintLines	( nDocID,  0, "Jej cenny j�zyk mo�e spr�bowa� zdoby� tylko kto� dysponuj�cy jak�� ochron� przed ogniem."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Cieniostw�r"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Wi�kszo�� z tych stworze� to zaszyci g��boko w lasach samotnicy."						); 
					Doc_PrintLines	( nDocID,  1, "Pozosta�o ich na �wiecie bardzo niewiele, nie stanowi� wi�c zagro�enia dla ludzi - chyba �e wkroczy si� na ich tereny �owieckie."						);
					Doc_PrintLines	( nDocID,  1, "Dobrze wiedzie�, gdzie znajduj� si� te tereny - r�g cieniostwora to cenne trofeum my�liwskie, kt�re jednak trzeba"						);
					Doc_PrintLines	( nDocID,  1, "umie� odpowiednio preparowa�."						);
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

