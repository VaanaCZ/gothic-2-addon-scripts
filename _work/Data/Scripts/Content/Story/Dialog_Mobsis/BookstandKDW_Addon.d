//-------------------------------------------------------------------------------------
//				Runensteine Wassermagie
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//				Runen des ersten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Runemaking_KDW_CIRC1_S1()		
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

					Doc_PrintLine	( nDocID,  0, "Kruhy vody"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Runy vody a pâísady, které potâebuješ k jejich vytvoâení.");
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Vętrná smršă");
					Doc_PrintLine	( nDocID,  0, "Kâídla krvavé mouchy");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Ledový oštęp");
					Doc_PrintLine	( nDocID,  0, "Kâemen z ledovce");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Gejzír");
					Doc_PrintLine	( nDocID,  0, "Akvamarín");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Bouâe");
					Doc_PrintLine	( nDocID,  0, "Kâemen z ledovce");
					Doc_PrintLine	( nDocID,  0, "Kâídla krvavé mouchy");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Vodní pęst");
					Doc_PrintLine	( nDocID,  0, "Akvamarín");
					Doc_PrintLine	( nDocID,  0, "Kamenný krystal");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "K vytvoâení runy vždy potâebuješ JEDNU z uvedených pâísad."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Uživatel musí znát patâičné zaklínadlo a musí mít u sebe čistý runový kámen spolu se svitkem zvoleného kouzla."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Teprve po dokončení tęchto pâíprav může pâistoupit k práci s runovou tabulkou."					);
					Doc_Show		( nDocID );
	};
};

FUNC VOID Use_Runemaking_KDW_CIRC2_S1()		
{
	Use_Runemaking_KDW_CIRC1_S1();
};
FUNC VOID Use_Runemaking_KDW_CIRC3_S1()		
{
	Use_Runemaking_KDW_CIRC1_S1();
};
FUNC VOID Use_Runemaking_KDW_CIRC4_S1()		
{
	Use_Runemaking_KDW_CIRC1_S1();
};
FUNC VOID Use_Runemaking_KDW_CIRC5_S1()		
{
	Use_Runemaking_KDW_CIRC1_S1();
};
FUNC VOID Use_Runemaking_KDW_CIRC6_S1()		
{
	Use_Runemaking_KDW_CIRC1_S1();
};

