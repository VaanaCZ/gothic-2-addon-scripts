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

					Doc_PrintLine	( nDocID,  0, "Die Kreise des Wassers"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Die Runen des Wassers und die zu deren Herstellung benötigten Ingredenzien ");
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Wirbelwind");
					Doc_PrintLine	( nDocID,  0, "Flügel einer Blutfliege");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Eislanze");
					Doc_PrintLine	( nDocID,  0, "Gletscherquartz");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Geysir");
					Doc_PrintLine	( nDocID,  0, "Aquamarin");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Unwetter");
					Doc_PrintLine	( nDocID,  0, "Gletscherquartz");
					Doc_PrintLine	( nDocID,  0, "Flügel einer Blufliege");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Wasserfaust");
					Doc_PrintLine	( nDocID,  0, "Aquamarin");
					Doc_PrintLine	( nDocID,  0, "Bergkristall");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "Für die Herstellung einer Rune ist jeweils EINE der aufgeführten Ingredenzien erforderlich."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Dem Anwender muss die Formel für den Zauber bekannt sein und er muss einen blanken Runenstein, sowie eine Spruchrolle des jeweiligen Zaubers besitzen."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Erst wenn diese Vorraussetzungen erfüllt sind, kann er am Runentisch zu Werke gehen."					);
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

