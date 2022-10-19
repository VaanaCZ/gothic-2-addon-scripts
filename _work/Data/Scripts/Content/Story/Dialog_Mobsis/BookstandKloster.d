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

					Doc_PrintLine	( nDocID,  0, "Strana 1"					);
					Doc_PrintLine	( nDocID,  0, "Runové kameny"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Strana 2"					);
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

					Doc_PrintLine	( nDocID,  0, "Strana 1"					);
					Doc_PrintLine	( nDocID,  0, "Runy a jejich ingredience"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Strana 2"					);
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

					Doc_PrintLine	( nDocID,  0, "Strana 1"					);
					Doc_PrintLine	( nDocID,  0, "Innosovo uèení"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Strana 2"					);
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

					Doc_PrintLine	( nDocID,  0, "Strana 1"					);
					Doc_PrintLine	( nDocID,  0, "Innosova pâikázání"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Strana 2"					);
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

					Doc_PrintLine	( nDocID,  0, "PRVNÍ KRUH"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Runy prvního kruhu a pâísady, které jsou zapotâebí k jeho vytvoâení.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Svêtlo");
					Doc_PrintLine	( nDocID,  0, "Zlatá mince");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Ohnivý šíp");
					Doc_PrintLine	( nDocID,  0, "Síra");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Slabý blesk");
					Doc_PrintLine	( nDocID,  0, "Kamenný krystal");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Gobliní kostlivec");
					Doc_PrintLine	( nDocID,  0, "Gobliní kost");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Léèba lehkých zranêní");
					Doc_PrintLine	( nDocID,  0, "Léèivá rostlina");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "K vytvoâení runy vždy potâebuješ JEDNU z uvedených pâísad."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Uživatel musí znát patâièné zaklínadlo a musí mít u sebe èistý runový kámen spolu se svitkem zvoleného kouzla."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Teprve po dokonèení têchto pâíprav mùže pâistoupit k práci s runovou tabulkou."					);
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

					Doc_PrintLine	( nDocID,  0, "DRUHÝ KRUH"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Runy 2. kruhu a pâísady potâebné k jejich vytvoâení.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Ohnivá koule");
					Doc_PrintLine	( nDocID,  0, "Pryskyâice");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "Ledový šíp");
					Doc_PrintLine	( nDocID,  0, "Kâemen");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "Vyvolání vlka");
					Doc_PrintLine	( nDocID,  0, "Vlèí kùže");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Vêtrná pêst");
					Doc_PrintLine	( nDocID,  0, "Uhlík");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Spánek");
					Doc_PrintLine	( nDocID,  0, "Tráva z bažin");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "K vytvoâení runy vždy potâebuješ JEDNU z uvedených pâísad."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Uživatel musí znát patâièné zaklínadlo a musí mít u sebe èistý runový kámen spolu se svitkem zvoleného kouzla."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Teprve po dokonèení têchto pâíprav mùže pâistoupit k práci s runovou tabulkou."					);
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

					Doc_PrintLine	( nDocID,  0, "TÂETÍ KRUH"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "Runy 3. kruhu a pâísady");
					Doc_PrintLine	( nDocID,  0, ""	);
					
					
					Doc_PrintLine	( nDocID,  0, "Léèba stâ. têžkých zranêní");
					Doc_PrintLine	( nDocID,  0, "Léèivá bylina");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "Malá ohnivá bouâe");
					Doc_PrintLine	( nDocID,  0, "Pryskyâice");
					Doc_PrintLine	( nDocID,  0, "Síra");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Vyvolání kostlivce");
					Doc_PrintLine	( nDocID,  0, "Kost z kostlivce");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Strach");
					Doc_PrintLine	( nDocID,  0, "Èerná perla");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Ledový blok");
					Doc_PrintLine	( nDocID,  0, "Kâemen");
					Doc_PrintLine	( nDocID,  0, "Akvamarín");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Kulový blesk");
					Doc_PrintLine	( nDocID,  0, "Kamenný krystal");
					Doc_PrintLine	( nDocID,  0, "Síra");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  0, "Ohnivá koule");
					Doc_PrintLine	( nDocID,  0, "Pryskyâice");
					Doc_PrintLine	( nDocID,  0, "Síra");
					Doc_PrintLine	( nDocID,  0, "");
			
					Doc_PrintLines	( nDocID,  1, "K vytvoâení runy vždy potâebuješ JEDNU z uvedených pâísad."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Uživatel musí znát patâièné zaklínadlo a musí mít u sebe èistý runový kámen spolu se svitkem zvoleného kouzla."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Teprve po dokonèení têchto pâíprav mùže pâistoupit k práci s runovou tabulkou."					);
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

					Doc_PrintLine	( nDocID,  0, "ÈTVRTÝ KRUH"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "Runy 4. kruhu a pâísady potâebné k jejich vytvoâení.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Velká ohnivá koule");
					Doc_PrintLine	( nDocID,  0, "Síra");
					Doc_PrintLine	( nDocID,  0, "Pryskyâice");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Blesk");
					Doc_PrintLine	( nDocID,  0, "Kamenný krystal");
					Doc_PrintLine	( nDocID,  0, "Kâemen");
					Doc_PrintLine	( nDocID,  0, "");				
					
					Doc_PrintLine	( nDocID,  0, "Probuzení golema");
					Doc_PrintLine	( nDocID,  0, "Srdce kamenného golema");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Znièení nemrtvého");
					Doc_PrintLine	( nDocID,  0, "Svêcená voda");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					
					
					
			
					Doc_PrintLines	( nDocID,  1, "K vytvoâení runy vždy potâebuješ JEDNU z uvedených pâísad."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Uživatel musí znát patâièné zaklínadlo a musí mít u sebe èistý runový kámen spolu se svitkem zvoleného kouzla."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Teprve po dokonèení têchto pâíprav mùže pâistoupit k práci s runovou tabulkou."					);
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

					Doc_PrintLine	( nDocID,  0, "PÁTÝ KRUH"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "Runy 5. kruhu a pâísady potâebné k jejich vytvoâení.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Ledová vlna");
					Doc_PrintLine	( nDocID,  0, "Kâemen");
					Doc_PrintLine	( nDocID,  0, "Akvamarín");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "Velká ohnivá bouâe");
					Doc_PrintLine	( nDocID,  0, "Síra");
					Doc_PrintLine	( nDocID,  0, "Ohnivý jazyk");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Vyvolání démona");
					Doc_PrintLine	( nDocID,  0, "Démonovo srdce");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Léèba têžkých zranêní");
					Doc_PrintLine	( nDocID,  0, "Léèivý koâen");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "K vytvoâení runy vždy potâebuješ JEDNU z uvedených pâísad."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Uživatel musí znát patâièné zaklínadlo a musí mít u sebe èistý runový kámen spolu se svitkem zvoleného kouzla."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Teprve po dokonèení têchto pâíprav mùže pâistoupit k práci s runovou tabulkou."					);
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

					Doc_PrintLine	( nDocID,  0, "ŠESTÝ KRUH"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "Runy 6. kruhu a pâísady potâebné k jejich vytvoâení.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Ohnivý déšã");
					Doc_PrintLine	( nDocID,  0, "Pryskyâice");
					Doc_PrintLine	( nDocID,  0, "Síra");
					Doc_PrintLine	( nDocID,  0, "Ohnivý jazyk");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Dech smrti");
					Doc_PrintLine	( nDocID,  0, "Uhlík");
					Doc_PrintLine	( nDocID,  0, "Èerná perla");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Vlna smrti");
					Doc_PrintLine	( nDocID,  0, "Kost z kostlivce");
					Doc_PrintLine	( nDocID,  0, "Èerná perla");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Armáda temnot");
					Doc_PrintLine	( nDocID,  0, "Kost z kostlivce");
					Doc_PrintLine	( nDocID,  0, "Èerná perla");
					Doc_PrintLine	( nDocID,  0, "Srdce kamenného golema");
					Doc_PrintLine	( nDocID,  0,  "Démonovo srdce");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLine	( nDocID,  1, "Zmenšení nestvùry");
					Doc_PrintLine	( nDocID,  1, "Gobliní kost");
					Doc_PrintLine	( nDocID,  1, "Trolí tesák");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
			
					Doc_PrintLines	( nDocID,  1, "K vytvoâení runy vždy potâebuješ JEDNU z uvedených pâísad."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Uživatel musí znát patâièné zaklínadlo a musí mít u sebe èistý runový kámen spolu se svitkem zvoleného kouzla."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Teprve po dokonèení têchto pâíprav mùže pâistoupit k práci s runovou tabulkou."					);
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

					Doc_PrintLine	( nDocID,  0, "Strana 1"					);
					Doc_PrintLine	( nDocID,  0, "Pravidla"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Strana 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};




