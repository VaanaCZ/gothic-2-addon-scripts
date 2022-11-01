//-------------------------------------------------------------------------------------
//				Milten_03 //oben
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Milten_03_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Es tarde."					);
					Doc_PrintLines	( nDocID,  0, "El colapso de la vieja mina provocó la caída de la moral de los barones del mineral."	);
					Doc_PrintLines	( nDocID,  0, "Gómez es como un barril de pólvora a punto de explotar."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Corristo");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Cree que se debería acusar al nuevo del derrumbamiento de la mina. Mira que es raro ese hombre. Será mejor que no vuelva a aparecer por aquí.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Corristo");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "El carácter de Gómez es más visceral que nunca y creo que puedo imaginarme lo que está planeando. Debemos avisar a los magos de agua antes de que sea demasiado tarde."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Corristo"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Quizá podamos evitar el desastre. Miedo me da pensar en lo que pasaría si la mina libre..."					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Milten_02 //unten
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Milten_02_S1()		
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
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Me he tomado la libertad de ponerme más cómodo. ¿Quién habría pensado que algún día sería el único mago del campamento?"					);
					Doc_PrintLines	( nDocID,  0, "Bueno, tampoco puedo decir que me alegre de volver. De hecho, debería plantearme irme de aquí."	);
					Doc_PrintLines	( nDocID,  0, "Esta expedición no está siendo precisamente un éxito."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Los raspadores se fueron ayer. Se llevaron a Diego, y no me sorprendería que huyera."					);
					Doc_PrintLines	( nDocID,  1, "De todas maneras no parece que vaya a coger una piqueta."					);
					Doc_PrintLines	( nDocID,  1, "Bueno, aprovecharé para aprender algo del arte de la alquimia."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Milten"					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Milten_01 //unten
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Milten_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		//	if (Npc_IsPlayer(self))
		//	{
		//		B_SetPlayerMap(ItWr_Map_OldWorld);
		//	};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_OldWorld.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);

	};
};
//-------------------------------------------------------------------------------------
//				Engor //unten
//-------------------------------------------------------------------------------------
FUNC VOID Bookstand_Engor_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Reservas");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Hemos encontrado algunas cosas, pero nada demasiado útil. El balance es el siguiente:"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "3 cajones de harapos"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "8 cajones de hierro oxidado"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "4 cajones de armaduras rotas");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "5 cajones de cuero y pellejo (apestosos)");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "2 cajones de piquetas"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "3 cajones de herramientas"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "16 cajones de rocas (prácticamente sin mineral)"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "1 cajón de cuchillas de afeitar oxidadas"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "4 cajones de vajillas rotas"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "56 barriles de agua"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "1 cajón de algo viscoso (fuera lo que fuera, está estropeado)"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Engor"					);
					Doc_Show		( nDocID );

	};
};

 
