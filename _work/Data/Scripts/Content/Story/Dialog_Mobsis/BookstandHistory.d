//##########################################################################
//##
//##	Bookstand History
//##
//##########################################################################

//----------------------
var int History_1_permanent;
//----------------------
//----------------------
var int History_2_permanent;
//----------------------
//----------------------
var int History_3_permanent;
//----------------------

FUNC VOID Use_BookstandHistory1_S1()		//Geschichtsbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_RED_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_RED_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "La senda del combate"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
				
					
					Doc_PrintLines	( nDocID,  0, "La mejor defensa es un buen ataque, al menos contra lo que no sea humano. No tiene sentido parar los ataques de animales y monstruos."						);
					Doc_PrintLines	( nDocID,  0, "Lo mejor es mantener a raya al enemigo con golpes bien dirigidos y lanzar, por sorpresa, una combinación de ataques."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Solo los guerreros expertos saben combinar movimientos. Al convertirse en maestro del combate, se pueden usar varias combinaciones."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_Show		( nDocID );
					
					if (History_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_1_permanent = TRUE;
					};

	};
	
};

FUNC VOID Use_BookstandHistory2_S1()		//Geschichtsbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_RED_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_RED_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "La isla"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "La ciudad portuaria de Khorinis está en una isla de la costa del reino de Myrtana."						);
					Doc_PrintLines	( nDocID,  0, "La isla debe mucho de su fama al Valle de las Minas. Tiene mala fama, ya que durante muchos años hubo una barrera mágica que rodeaba todo el valle y servía de prisión para todos los reos del Reino."						);
					Doc_PrintLines	( nDocID,  0, "El valle se convirtió en una colonia prisión en la que los presos extraían el mineral mágico en las entrañas de la tierra."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Fuera de Khorinis hay una serie de granjas que aprovechan la riqueza del suelo para plantar trigo, nabos y criar ovejas."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Durante generaciones, la granja más grande ha pertenecido a un terrateniente que arrienda las tierras circundantes a otros granjeros."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "En medio de la isla hay un viejo monasterio de Innos, de los magos de fuego. Allí realizan investigaciones mágicas y alquímicas y fabrican vino."						);
					
					Doc_Show		( nDocID );
					
					if (History_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_2_permanent = TRUE;
					};

	};
};


FUNC VOID Use_BookstandHistory3_S1()		//Geschichtsbücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_RED_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_RED_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, "La ley de la isla"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					
				
					
					Doc_PrintLines	( nDocID,  0, "Dondequiera que los hombres se junten, se debe encontrar la forma de mantener la paz, ya sea en un monasterio, en una ciudad o en la granja del terrateniente."						);
					Doc_PrintLines	( nDocID,  0, "Cualquier crimen contra la comunidad supone un castigo."						);
					Doc_PrintLines	( nDocID,  0, "La comunidad prohíbe empezar peleas o unirse a altercados."						);
					Doc_PrintLines	( nDocID,  0, "El robo es un crimen que tiene consecuencias. Las ovejas también están protegidas por la ley."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Si un hombre mata o asesina a otro, será juzgado de inmediato."						);
					Doc_PrintLines	( nDocID,  1, "Para evitar esta suerte deberá pagar una multa importante."						);
					Doc_PrintLines	( nDocID,  1, "En los lugares grandes, los hombres de ley mantienen la paz. Se enterarán de los crímenes y su misión será castigar y restablecer el orden."						); 
					Doc_PrintLines	( nDocID,  1, "Los que sufran o sean testigos de un crimen no tendrán en alta estima al delincuente."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Por supuesto, siempre hay quienes no se preocupan por las leyes, sobre todo los bandidos y los mercenarios."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, ""						);
					Doc_Show		( nDocID );
					
					if (History_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_2_permanent = TRUE;
					};

	};
};

