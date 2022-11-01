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

					Doc_PrintLine	( nDocID,  0, "Caza y presa"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Toda bestia o criatura posee algún trofeo que constituye la riqueza y la fama de los cazadores experimentados."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Un cazador con experiencia lo sabe todo acerca de los trofeos de sus presas y, también, cómo obtenerlos de los cadáveres.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Quitar dientes"						);
					Doc_PrintLines	( nDocID,  0, "Los dientes son las armas de muchas bestias y criaturas. Si sabes cómo extraerlos, los lobos, chasqueadores, bestias de la sombra, tiburones de la ciénaga y trolls son los mejores objetivos."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Despellejar"						);
					Doc_PrintLines	( nDocID,  1, "Un talento que los cazadores con experiencia tienen en gran estima, ya que muchos animales tienen pieles. Por ejemplo, ovejas, lobos y bestias de la sombra."						); 
					Doc_PrintLines	( nDocID,  1, "Un cazador con esta habilidad también puede despellejar a tiburones de la ciénaga y acechadores."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Quitar garras"						);
					Doc_PrintLines	( nDocID,  1, "Un arte que se utilizada con todo tipo de lagartos, chasqueadores, acechadores y bestias de la sombra."						);
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

					Doc_PrintLine	( nDocID,  0, "Caza y presa"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Toda bestia o criatura posee algún trofeo que constituye la riqueza y la fama de los cazadores experimentados."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Moscas de Sangre"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Dos habilidades especiales que son necesarias para destripar a estos diablos voladores."					); 
					Doc_PrintLines	( nDocID,  0, "Sus alas se pueden quitar y sus aguijones se pueden extraer." );
					Doc_PrintLines	( nDocID,  0, "Los dos son artes que deberían usar cazadores experimentados para así reclamar sus trofeos."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Los incursores de campo y los reptadores de la mina atacan usando las mandíbulas. Las de los reptadores"						);
					Doc_PrintLines	( nDocID,  1, "son especialmente valiosas, ya que contienen una secreción que aumenta los poderes mágicos."						);
					Doc_PrintLines	( nDocID,  1, "Sin embargo, deben usarse con moderación, ya que, con el tiempo, el cuerpo humano deja de reaccionar ante ellas."						);   
					Doc_PrintLines	( nDocID,  1, "Las placas de reptador también son productos populares. Se pueden usar para fabricar armaduras."						);
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

					Doc_PrintLine	( nDocID,  0, "Caza y presa"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Toda bestia o criatura posee algún trofeo que aumenta la riqueza y la fama de los cazadores experimentados."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Lagarto de fuego"						);
					Doc_PrintLines	( nDocID,  0, "Esta bestia es un lagarto, pero puede escupir fuego que mata a cualquiera que se acerque demasiado."						);
					Doc_PrintLines	( nDocID,  0, "Solo los que disponen de protección contra el fuego pueden enfrentarse a estas bestias y hacerse con sus valiosas lenguas."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "La bestia de sombra"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "La bestia de sombra es una criatura ancestral y solitaria que vive escondida en los bosques."						); 
					Doc_PrintLines	( nDocID,  1, "Quedan muy pocas, por lo que no significan ningún peligro para los humanos, a menos que éstos se aventuren en sus cotos de caza."						);
					Doc_PrintLines	( nDocID,  1, "El cuerno de la bestia de sombra se considera un valioso trofeo de caza. Para reclamarlo, un cazador tiene"						);
					Doc_PrintLines	( nDocID,  1, "que aprender a quitarlo."						);
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

