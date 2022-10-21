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

					Doc_PrintLine	( nDocID,  0, "£owy i zwierzyna"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ka¿de stworzenie mo¿e pozostawiæ po sobie trofeum, które zwiêkszy maj¹tek i s³awê doœwiadczonego myœliwego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Myœliwy taki bêdzie te¿ wiedzia³, jak preparowaæ swe zdobycze i pozyskiwaæ trofea.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Pozyskiwanie k³ów"						);
					Doc_PrintLines	( nDocID,  0, "K³y to dla wielu zwierz¹t broñ, a najcenniejsze s¹ te, które mo¿na pozyskaæ z truche³ wilków, zêbaczy, cieniostworów, wê¿y b³otnych i trolli."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Obdzieranie ze skóry"						);
					Doc_PrintLines	( nDocID,  1, "Umiejêtnoœæ ceniona wœród doœwiadczonych myœliwych, gdy¿ pozwala na pozyskiwanie wartoœciowych skór owiec, wilków, cieniostworów,"						); 
					Doc_PrintLines	( nDocID,  1, "wê¿y b³otnych i topielców."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Pozyskiwanie szponów"						);
					Doc_PrintLines	( nDocID,  1, "Mo¿na je praktykowaæ na jaszczurach, zêbaczach, topielcach i cieniostworach."						);
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

					Doc_PrintLine	( nDocID,  0, "£owy i zwierzyna"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ka¿de stworzenie mo¿e pozostawiæ po sobie trofeum, które zwiêkszy maj¹tek i s³awê doœwiadczonego myœliwego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Krwiopijcy"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Wypatroszenie tych lataj¹cych potworów nie jest proste, mo¿na im jednak"					); 
					Doc_PrintLines	( nDocID,  0, "usun¹æ skrzyd³a i wyj¹æ ¿¹d³a." );
					Doc_PrintLines	( nDocID,  0, "I jedne, i drugie stanowi¹ cenne trofea myœliwskie."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Polne bestie i pe³zacze atakuj¹ za pomoc¹ ¿uwaczek. Szczególnie cenne s¹ narz¹dy"						);
					Doc_PrintLines	( nDocID,  1, "tych drugich, zawieraj¹ce wydzielinê, której wypicie zwiêksza moc magiczn¹."						);
					Doc_PrintLines	( nDocID,  1, "Nie nale¿y nadu¿ywaæ tego cudownego œrodka, gdy¿ z czasem organizm ludzki przestaje nañ reagowaæ."						);   
					Doc_PrintLines	( nDocID,  1, "Podobnie popularne s¹ p³yty pancerza pe³zacza, z których mo¿na tworzyæ bardzo dobre zbroje."						);
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

					Doc_PrintLine	( nDocID,  0, "£owy i zwierzyna"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ka¿de stworzenie mo¿e pozostawiæ po sobie trofeum, które zwiêkszy maj¹tek i s³awê doœwiadczonego myœliwego."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ognisty jaszczur"						);
					Doc_PrintLines	( nDocID,  0, "Ta jaszczuropodobna, ziej¹ca ogniem istota jest wyj¹tkowo groŸna dla ka¿dego przebywaj¹cego w pobli¿u."						);
					Doc_PrintLines	( nDocID,  0, "Jej cenny jêzyk mo¿e spróbowaæ zdobyæ tylko ktoœ dysponuj¹cy jak¹œ ochron¹ przed ogniem."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Cieniostwór"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Wiêkszoœæ z tych stworzeñ to zaszyci g³êboko w lasach samotnicy."						); 
					Doc_PrintLines	( nDocID,  1, "Pozosta³o ich na œwiecie bardzo niewiele, nie stanowi¹ wiêc zagro¿enia dla ludzi - chyba ¿e wkroczy siê na ich tereny ³owieckie."						);
					Doc_PrintLines	( nDocID,  1, "Dobrze wiedzieæ, gdzie znajduj¹ siê te tereny - róg cieniostwora to cenne trofeum myœliwskie, które jednak trzeba"						);
					Doc_PrintLines	( nDocID,  1, "umieæ odpowiednio preparowaæ."						);
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

