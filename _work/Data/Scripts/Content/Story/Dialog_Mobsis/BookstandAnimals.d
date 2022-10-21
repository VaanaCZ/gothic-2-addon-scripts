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

FUNC VOID Use_BookstandAnimals1_S1()		//Tierb�cher
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
					Doc_PrintLines	( nDocID,  0, "Chaque b�te ou cr�ature poss�de certains troph�es contribuant � la fortune ou la sant� des chasseurs exp�riment�s."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Un chasseur exp�riment� conna�t ces troph�es et sait comment les r�cup�rer.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Oter crocs"						);
					Doc_PrintLines	( nDocID,  0, "Les crocs sont les armes des b�tes. Si on sait les �ter, celles des loups, des saurinides, des b�tes des ombres, des requins des marais et des trolls sont les plus pr�cieuses."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Ecorchage"						);
					Doc_PrintLines	( nDocID,  1, "Un chasseur exp�riment� appr�cie particuli�rement les peaux de mouton, de loup ou de b�te des ombres."						); 
					Doc_PrintLines	( nDocID,  1, "Un chasseur avec cette aptitude peut aussi �corcher les requins des marais et les guetteurs."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Oter griffes"						);
					Doc_PrintLines	( nDocID,  1, "Cette pratique fonctionne sur l�zards, saurinides, guetteurs et b�tes des ombres."						);
					Doc_Show		( nDocID );
					
					if (Animals_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						Animals_1_permanent = TRUE;
					};	

	};
};

FUNC VOID Use_BookstandAnimals2_S1()		//Tierb�cher
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
					Doc_PrintLines	( nDocID,  0, "Chaque b�te ou cr�ature poss�de certains troph�es contribuant � la fortune ou la sant� des chasseurs exp�riment�s."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mouches sanguines"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Il faut deux comp�tences pour tirer profit de ces diables."					); 
					Doc_PrintLines	( nDocID,  0, "On peut retirer leurs ailes et leur dard." );
					Doc_PrintLines	( nDocID,  0, "Dans les deux cas, il faut �tre exp�riment� pour r�ussir."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Fl�aux des champs et foreurs attaquent avec des mandibules. Celles des foreurs"						);
					Doc_PrintLines	( nDocID,  1, "ont de la valeur car elles contiennent une s�cr�tion qui augmente la magie."						);
					Doc_PrintLines	( nDocID,  1, "Il faut s'en servir avec parcimonie car ses effets sur l'homme diminuent avec le temps."						);   
					Doc_PrintLines	( nDocID,  1, "La carapace des foreurs est r�put�e. On peut en faire des armures."						);
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

FUNC VOID Use_BookstandAnimals3_S1()		//Tierb�cher
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
					Doc_PrintLines	( nDocID,  0, "Chaque b�te ou cr�ature poss�de certains troph�es contribuant � la fortune ou la sant� des chasseurs exp�riment�s."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "L�zard de feu"						);
					Doc_PrintLines	( nDocID,  0, "Cette b�te est un l�zard qui peut cracher un feu mortel � quelques pas."						);
					Doc_PrintLines	( nDocID,  0, "Seuls ceux dot�s d'une protection contre le feu peuvent le combattre et prendre leur pr�cieuse langue."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "B�te des ombres"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Une b�te des ombres est solitaire et vit dans les bois."						); 
					Doc_PrintLines	( nDocID,  1, "Il ne reste que tr�s peu de ces cr�atures et elles ne sont pas un danger sauf si on se trouve sur leur terrain de chasse."						);
					Doc_PrintLines	( nDocID,  1, "La corne d'une b�te des ombres est un pr�cieux troph�e qu'il faut apprendre � r�cup�rer correctement pour"						);
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

