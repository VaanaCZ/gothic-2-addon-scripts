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

					Doc_PrintLine	( nDocID,  0, "Chasse et proies"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Chaque bête ou créature possède certains trophées contribuant à la fortune ou la santé des chasseurs expérimentés."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Un chasseur expérimenté connaît ces trophées et sait comment les récupérer.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Oter crocs"						);
					Doc_PrintLines	( nDocID,  0, "Les crocs sont les armes des bêtes. Si on sait les ôter, celles des loups, des saurinides, des bêtes des ombres, des requins des marais et des trolls sont les plus précieuses."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Ecorchage"						);
					Doc_PrintLines	( nDocID,  1, "Un chasseur expérimenté apprécie particulièrement les peaux de mouton, de loup ou de bête des ombres."						); 
					Doc_PrintLines	( nDocID,  1, "Un chasseur avec cette aptitude peut aussi écorcher les requins des marais et les guetteurs."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Oter griffes"						);
					Doc_PrintLines	( nDocID,  1, "Cette pratique fonctionne sur lézards, saurinides, guetteurs et bêtes des ombres."						);
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

					Doc_PrintLine	( nDocID,  0, "Chasse et proies"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Chaque bête ou créature possède certains trophées contribuant à la fortune ou la santé des chasseurs expérimentés."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mouches sanguines"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Il faut deux compétences pour tirer profit de ces diables."					); 
					Doc_PrintLines	( nDocID,  0, "On peut retirer leurs ailes et leur dard." );
					Doc_PrintLines	( nDocID,  0, "Dans les deux cas, il faut être expérimenté pour réussir."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Fléaux des champs et foreurs attaquent avec des mandibules. Celles des foreurs"						);
					Doc_PrintLines	( nDocID,  1, "ont de la valeur car elles contiennent une sécrétion qui augmente la magie."						);
					Doc_PrintLines	( nDocID,  1, "Il faut s'en servir avec parcimonie car ses effets sur l'homme diminuent avec le temps."						);   
					Doc_PrintLines	( nDocID,  1, "La carapace des foreurs est réputée. On peut en faire des armures."						);
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

					Doc_PrintLine	( nDocID,  0, "Chasse et proies"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Chaque bête ou créature possède certains trophées contribuant à la fortune ou la santé des chasseurs expérimentés."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Lézard de feu"						);
					Doc_PrintLines	( nDocID,  0, "Cette bête est un lézard qui peut cracher un feu mortel à quelques pas."						);
					Doc_PrintLines	( nDocID,  0, "Seuls ceux dotés d'une protection contre le feu peuvent le combattre et prendre leur précieuse langue."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Bête des ombres"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Une bête des ombres est solitaire et vit dans les bois."						); 
					Doc_PrintLines	( nDocID,  1, "Il ne reste que très peu de ces créatures et elles ne sont pas un danger sauf si on se trouve sur leur terrain de chasse."						);
					Doc_PrintLines	( nDocID,  1, "La corne d'une bête des ombres est un précieux trophée qu'il faut apprendre à récupérer correctement pour"						);
					Doc_PrintLines	( nDocID,  1, "qu'il conserve sa valeur."						);
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

