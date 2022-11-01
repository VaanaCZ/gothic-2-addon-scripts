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

					Doc_PrintLine	( nDocID,  0, "Los Círculos de Agua"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "Las runas de agua e ingredientes necesarios para su creación.");
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "Torbellino");
					Doc_PrintLine	( nDocID,  0, "Alas de mosca de sangre");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Lanza de hielo");
					Doc_PrintLine	( nDocID,  0, "Cuarzo glacial");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Géiser");
					Doc_PrintLine	( nDocID,  0, "Aguamarina");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Tormenta");
					Doc_PrintLine	( nDocID,  0, "Cuarzo glacial");
					Doc_PrintLine	( nDocID,  0, "Alas de mosca de sangre");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "Puño de agua");
					Doc_PrintLine	( nDocID,  0, "Aguamarina");
					Doc_PrintLine	( nDocID,  0, "Cristal de roca");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "Para crear una runa siempre hará falta UNO de los ingredientes listados."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "El usuario debe conocer la fórmula del conjuro y tener una piedra rúnica virgen, así como un pergamino de conjuro para el conjuro deseado."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Solo cuando se cumplen los requisitos se puede empezar a trabajar en la mesa rúnica."					);
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

