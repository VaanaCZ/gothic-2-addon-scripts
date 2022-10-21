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

					Doc_PrintLine	( nDocID,  0, "Caccia e prede"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Bestie e creature hanno trofei che accrescono la ricchezza e la gloria dei cacciatori più esperti."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Un cacciatore competente conosce i vari trofei delle prede e sa come estrarli.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Estrarre denti"						);
					Doc_PrintLines	( nDocID,  0, "I denti sono le armi di molte bestie e creature. Se sai come estrarli dalla tua preda, lupi, squartatori, bestie d'ombra, squali di palude e troll saranno i bersagli migliori."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Rimuovere pelle"						);
					Doc_PrintLines	( nDocID,  1, "Un cacciatore abile è molto stimato, poiché molti animali possiedono pelliccie. Pecore, lupi e bestie d'ombra, per esempio."						); 
					Doc_PrintLines	( nDocID,  1, "Un cacciatore con questa abilità potrà anche spellare squali di palude e predatori."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Estrarre artigli"						);
					Doc_PrintLines	( nDocID,  1, "Un'arte da utilizzare su tutti i tipi di lucertola, squartatore, predatore e bestia d'ombra."						);
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

					Doc_PrintLine	( nDocID,  0, "Caccia e prede"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Bestie e creature hanno trofei che accrescono la ricchezza e la gloria dei cacciatori più esperti."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Sanguimosche"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Due abilità speciali sono richieste per sfruttare questi diavoletti volanti."					); 
					Doc_PrintLines	( nDocID,  0, "Le loro ali possono essere rimosse e i loro pungiglioni estratti." );
					Doc_PrintLines	( nDocID,  0, "Entrambe le arti potranno essere utilizzate dai cacciatori esperti per reclamare i loro trofei."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "I razziatori dei campi e gli scavaragno utilizzano le mandibole per attaccare. Le mandibole di scavaragno sono"						);
					Doc_PrintLines	( nDocID,  1, "particolarmente pregiate, poiché contengono un liquido che aumenta i poteri magici."						);
					Doc_PrintLines	( nDocID,  1, "Tuttavia, esso dovrà essere usato con parsimonia, poiché il corpo umano tende ad assuefarcisi col tempo."						);   
					Doc_PrintLines	( nDocID,  1, "Le scaglie degli scavaragno sono inoltre popolari per produrre delle armature."						);
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

					Doc_PrintLine	( nDocID,  0, "Caccia e prede"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Bestie e creature hanno trofei che accrescono la ricchezza e la gloria dei cacciatori più esperti."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Lucertola di fuoco"						);
					Doc_PrintLines	( nDocID,  0, "Questa bestia è una lucertola che può sputare un fuoco in grado di uccidere chiunque le si avvicini troppo."						);
					Doc_PrintLines	( nDocID,  0, "Solamente quelli dotati di qualche protezione dal fuoco potranno combattere queste bestie e prendere le loro preziose lingue."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Bestia d'ombra"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "La bestia d'ombra è un antico solitario che vive nascosto nei boschi."						); 
					Doc_PrintLines	( nDocID,  1, "Rimangono ormai solo pochissime di queste creature, per cui non sono un pericolo per gli umani, a meno che essi non si avventurino nei loro territori di caccia."						);
					Doc_PrintLines	( nDocID,  1, "Il corno di una bestia d'ombra è un trofeo di caccia molto pregiato. Un cacciatore deve imparare come rimuoverlo correttamente"						);
					Doc_PrintLines	( nDocID,  1, "per poter reclamare questo ambito premio."						);
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

