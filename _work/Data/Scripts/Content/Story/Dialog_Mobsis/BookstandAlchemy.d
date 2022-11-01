//##########################################################################
//##
//##	Bookstand Alchemie
//##
//##########################################################################

//----------------------
var int ALchemy_1_permanent;
//----------------------
//----------------------
var int ALchemy_2_permanent;
//----------------------
//----------------------
var int ALchemy_3_permanent;
//----------------------

FUNC VOID Use_BookstandALCHEMY1_S1()		//Alchemiebücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Pociones mágicas");
					Doc_PrintLine	( nDocID,  0, "e ingredientes"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Esencia de maná"						);
					Doc_PrintLine	( nDocID,  0, "2 ortigas de fuego"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Extracto de maná"						);
					Doc_PrintLine	( nDocID,  0, "2 hierbas del fuego"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixir de maná"						);
					Doc_PrintLine	( nDocID,  0, "2 raíces de fuego"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "En todo trabajo en la mesa de trabajo del alquimista hace falta un matraz de laboratorio que se consume en el proceso."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Para destilar cualquier poción de curación o pociones que refuercen el poder mágico, se necesita un ingrediente especial y una planta:"			);
					Doc_PrintLine	( nDocID,  1, "Maleza de llanura"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Para destilar pociones con efecto permanente sobre el cuerpo o el espíritu, se necesitan determinadas plantas:"						);
					Doc_PrintLines	( nDocID,  1, "Acedera"		);
					Doc_Show		( nDocID );
					
					if (ALchemy_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_1_permanent = TRUE;
					};	  

	};
};

FUNC VOID Use_BookstandALCHEMY2_S1()		//Alchemiebücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Pociones de curación");
					Doc_PrintLine	( nDocID,  0, "e ingredientes"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Esencia de curación"						);
					Doc_PrintLine	( nDocID,  0, "2 plantas curativas"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Extracto de curación"						);
					Doc_PrintLine	( nDocID,  0, "2 hierbas curativas"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixir de curación"						);
					Doc_PrintLine	( nDocID,  0, "3 raíces de curación"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "En todo trabajo en la mesa de trabajo del alquimista hace falta un matraz de laboratorio que se consume en el proceso."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Para destilar cualquier poción de curación o pociones que refuercen el poder mágico, se necesita un ingrediente especial y una planta:"			);
					Doc_PrintLine	( nDocID,  1, "Maleza de llanura"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Para destilar pociones con efecto permanente sobre el cuerpo o el espíritu, se necesitan determinadas plantas:"						);
					Doc_PrintLines	( nDocID,  1, "Acedera"		);
					Doc_Show		( nDocID );
					
					if (ALchemy_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_2_permanent = TRUE;
					};	

	};
};

FUNC VOID Use_BookstandALCHEMY3_S1()		//Alchemiebücher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Pociones para cambios permanentes");
					Doc_PrintLine	( nDocID,  0, "e ingredientes"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					Doc_PrintLine	( nDocID,  0, "Elixir de destreza"						);
					Doc_PrintLine	( nDocID,  0, "1 baya de trasgo"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Poción de velocidad"						);
					Doc_PrintLines	( nDocID,  0, "1 hierba de chasqueador: esta poción no necesita acedera, sino maleza de llanura."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixir de fuerza"						);
					Doc_PrintLine	( nDocID,  0, "1 raíz de dragón"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elixir de vida"						);
					Doc_PrintLine	( nDocID,  0, "1 raíz curativa"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elixir de espíritu"						);
					Doc_PrintLine	( nDocID,  0, "1 raíz de fuego"						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Preparar estas fórmulas constituye el mayor arte de la alquimia. Todas requieres acedera como ingrediente común."); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "La poción de velocidad tiene una preparación más sencilla, precisamente porque no lleva acedera."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					
					
					Doc_Show		( nDocID );
					
					if (ALchemy_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_3_permanent = TRUE;
					};	

	};
};
