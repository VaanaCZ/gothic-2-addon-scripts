//-------------------------------------------------------------------------------------
//				Weitere Buchständer in der Magierbibliothek
//-------------------------------------------------------------------------------------
//				Runensteine 
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Rune_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Page 1"					);
					Doc_PrintLine	( nDocID,  0, "Pierres runiques"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Page 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Runen und Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Rune_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Page 1"					);
					Doc_PrintLine	( nDocID,  0, "Les runes et leurs ingrédients"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Page 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Die Lehren Innos
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Innos_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Page 1"					);
					Doc_PrintLine	( nDocID,  0, "Enseignements d'Innos"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Page 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Die Gebote Innos
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Innos_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Page 1"					);
					Doc_PrintLine	( nDocID,  0, "Commandements d'Innos"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Page 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Runen des ersten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "PREMIER CERCLE"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Les runes du 1er Cercle et les ingrédients requis pour les créer.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Lumière");
					Doc_PrintLine	( nDocID,  0, "Pièce d'or");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Flèche de feu");
					Doc_PrintLine	( nDocID,  0, "Souffre");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Eclair mineur");
					Doc_PrintLine	( nDocID,  0, "Cristal de roche");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Squelette gobelin");
					Doc_PrintLine	( nDocID,  0, "Os de gobelin");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Soins légers.");
					Doc_PrintLine	( nDocID,  0, "Plante médicinale");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "Pour créer une rune, il faut UN des ingrédients indiqués."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "L'utilisateur doit connaître la formule du sort et doit avoir une pierre runique vierge et le parchemin du sort désiré."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Quand ces éléments sont réunis il peut travailler à la table runique."					);
					Doc_Show		( nDocID );
	};
};
//-------------------------------------------------------------------------------------
//				Runen des zweiten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "SECOND CERCLE"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Les runes du 2ème Cercle et les ingrédients requis pour les créer.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Boule de feu");
					Doc_PrintLine	( nDocID,  0, "Eclat");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "Flèche de glace");
					Doc_PrintLine	( nDocID,  0, "Quartz");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "Convocation de loup");
					Doc_PrintLine	( nDocID,  0, "Peau de loup");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Poing du vent");
					Doc_PrintLine	( nDocID,  0, "Charbon");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Sommeil");
					Doc_PrintLine	( nDocID,  0, "Herbe des marais");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "Pour créer une rune, il faut UN des ingrédients indiqués."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "L'utilisateur doit connaître la formule du sort et doit avoir une pierre runique vierge et le parchemin du sort désiré."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Quand ces éléments sont réunis il peut travailler à la table runique."					);
					Doc_Show		( nDocID );
	
	};
};  
//-------------------------------------------------------------------------------------
//				Runen des dritten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_03_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "TROISIEME CERCLE"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "Les runes du 3ème Cercle et les ingrédients requis pour les créer.");
					Doc_PrintLine	( nDocID,  0, ""	);
					
					
					Doc_PrintLine	( nDocID,  0, "Soins importants.");
					Doc_PrintLine	( nDocID,  0, "Herbe médicinale");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "Tempête de feu mineure");
					Doc_PrintLine	( nDocID,  0, "Eclat, Soufre");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Création de squelette");
					Doc_PrintLine	( nDocID,  0, "Os de squelette");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Terreur");
					Doc_PrintLine	( nDocID,  0, "Perle noire");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Bloc de glace");
					Doc_PrintLine	( nDocID,  0, "Quartz");
					Doc_PrintLine	( nDocID,  0, "Aigue-marine");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Sphère d'éclairs");
					Doc_PrintLine	( nDocID,  0, "Cristal de roche");
					Doc_PrintLine	( nDocID,  0, "Souffre");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Boule de feu");
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  0, "Eclat, Souffre");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
			
					Doc_PrintLines	( nDocID,  1, "Pour créer une rune, il faut UN des ingrédients indiqués."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "L'utilisateur doit connaître la formule du sort et doit avoir une pierre runique vierge et le parchemin du sort désiré."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Quand ces éléments sont réunis il peut travailler à la table runique."					);
					Doc_Show		( nDocID );
		
	};
};  	
//-------------------------------------------------------------------------------------
//				Runen des vierten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_04_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "LE QUATRIEME CERCLE"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "Les runes du 4ème Cercle et les ingrédients requis pour les créer.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Boule de feu majeure");
					Doc_PrintLine	( nDocID,  0, "Souffre");
					Doc_PrintLine	( nDocID,  0, "Eclat");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Eclair");
					Doc_PrintLine	( nDocID,  0, "Cristal de roche");
					Doc_PrintLine	( nDocID,  0, "Quartz");
					Doc_PrintLine	( nDocID,  0, "");				
					
					Doc_PrintLine	( nDocID,  0, "Eveil du golem");
					Doc_PrintLine	( nDocID,  0, "Cœur d'un golem de pierre");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Destruction de morts-vivants");
					Doc_PrintLine	( nDocID,  0, "Eau bénite");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					
					
					
			
					Doc_PrintLines	( nDocID,  1, "Pour créer une rune, il faut UN des ingrédients indiqués."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "L'utilisateur doit connaître la formule du sort et doit avoir une pierre runique vierge et le parchemin du sort désiré."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Quand ces éléments sont réunis il peut travailler à la table runique."					);
					Doc_Show		( nDocID );
		
	};
};  					
//-------------------------------------------------------------------------------------
//				Runen des fünften Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_05_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "LE CINQUIEME CERCLE"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "Les runes du 5ème Cercle et les ingrédients requis pour les créer.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Déferlante de glace");
					Doc_PrintLine	( nDocID,  0, "Quartz");
					Doc_PrintLine	( nDocID,  0, "Aigue-marine");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "Tempête de feu");
					Doc_PrintLine	( nDocID,  0, "Souffre");
					Doc_PrintLine	( nDocID,  0, "Langue de feu");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Convocation de démon");
					Doc_PrintLine	( nDocID,  0, "Cœur d'un démon");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Soins critiques");
					Doc_PrintLine	( nDocID,  0, "Racine médicinale");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "Pour créer une rune, il faut UN des ingrédients indiqués."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "L'utilisateur doit connaître la formule du sort et doit avoir une pierre runique vierge et le parchemin du sort désiré."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Quand ces éléments sont réunis il peut travailler à la table runique."					);
					Doc_Show		( nDocID );
		
	};
};  			
//-------------------------------------------------------------------------------------
//				Runen des sechsten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_06_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "LE SIXIEME CERCLE"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "Les runes du 6ème Cercle et les ingrédients requis pour les créer.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Pluie de feu");
					Doc_PrintLine	( nDocID,  0, "Eclat");
					Doc_PrintLine	( nDocID,  0, "Souffre");
					Doc_PrintLine	( nDocID,  0, "Langue de feu");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Souffle de mort");
					Doc_PrintLine	( nDocID,  0, "Charbon");
					Doc_PrintLine	( nDocID,  0, "Perle noire");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Vague de mort");
					Doc_PrintLine	( nDocID,  0, "Os de squelette");
					Doc_PrintLine	( nDocID,  0, "Perle noire");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Armée des ténèbres");
					Doc_PrintLine	( nDocID,  0, "Os de squelette");
					Doc_PrintLine	( nDocID,  0, "Perle noire");
					Doc_PrintLine	( nDocID,  0, "Cœur d'un golem de pierre");
					Doc_PrintLine	( nDocID,  0,  "Cœur d'un démon");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLine	( nDocID,  1, "Réduction de monstre");
					Doc_PrintLine	( nDocID,  1, "Os de gobelin");
					Doc_PrintLine	( nDocID,  1, "Défense de troll");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
			
					Doc_PrintLines	( nDocID,  1, "Pour créer une rune, il faut UN des ingrédients indiqués."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "L'utilisateur doit connaître la formule du sort et doit avoir une pierre runique vierge et le parchemin du sort désiré."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Quand ces éléments sont réunis il peut travailler à la table runique."					);
					Doc_Show		( nDocID );
		
	};
};  					
//-------------------------------------------------------------------------------------
//				Die Regeln im Kloster
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Rules_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Page 1"					);
					Doc_PrintLine	( nDocID,  0, "Règles"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Page 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};




