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

FUNC VOID Use_BookstandHistory1_S1()		//Geschichtsb�cher
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

					Doc_PrintLine	( nDocID,  0, "L'art du combat"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
				
					
					Doc_PrintLines	( nDocID,  0, "La meilleure d�fense est l'attaque. Il est inutile de parer les attaques des monstres et des animaux."						);
					Doc_PrintLines	( nDocID,  0, "Tenir un ennemi au loin avec des attaques bien plac�es puis encha�ner avec une combinaison offensive."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Seuls les guerriers exp�riment�s peuvent combiner leurs mouvements. Si vous devenez ma�tre, vous pouvez m�me utiliser plusieurs combinaisons."						); 
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

FUNC VOID Use_BookstandHistory2_S1()		//Geschichtsb�cher
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

					Doc_PrintLine	( nDocID,  0, "L'�le"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "La cit� portuaire de Khorinis se trouve sur une �le au large du royaume de Myrtana."						);
					Doc_PrintLines	( nDocID,  0, "L'�le doit sa renomm�e � sa c�l�bre Vall�e des mines. C'est une r�putation surfaite puisque depuis de nombreuses ann�es, une barri�re magique entoure la vall�e qui sert d�sormais de prison. "						);
					Doc_PrintLines	( nDocID,  0, "Ainsi, la vall�e est devenue une colonie carc�rale o� les d�tenus extraient le minerai magique."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Autour de Khorinis, des fermes profitent d'un sol fertile pour cultiver du bl� et des navets."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Depuis des g�n�rations, les plus grandes fermes appartiennent � un gros propri�taire qui loue ses terres."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Au centre de l'�le il y a un ancien monast�re d'Innos dirig� par les Magiciens du feu qui se consacrent � des recherches et � la production de vin."						);
					
					Doc_Show		( nDocID );
					
					if (History_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_2_permanent = TRUE;
					};

	};
};


FUNC VOID Use_BookstandHistory3_S1()		//Geschichtsb�cher
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

					Doc_PrintLine	( nDocID,  0, "La loi de l'�le"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					
				
					
					Doc_PrintLines	( nDocID,  0, "Quand des gens se rassemblent, il faut pouvoir maintenir la paix, au monast�re, en ville ou dans les fermes du propri�taire."						);
					Doc_PrintLines	( nDocID,  0, "Tout crime contre la communaut� est puni."						);
					Doc_PrintLines	( nDocID,  0, "Il est interdit de participer � une bagarre."						);
					Doc_PrintLines	( nDocID,  0, "Le vol est �galement un crime. Les moutons sont prot�g�s par la loi."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Si un homme en assassine ou en attaque un autre, il doit s'attendre � �tre jug�."						);
					Doc_PrintLines	( nDocID,  1, "Pour �viter un jugement, il paie une amende."						);
					Doc_PrintLines	( nDocID,  1, "En agglom�ration, des gens de loi maintiennent la paix. Ils entendront parler de tout crime. Leur r�le est de punir et de ramener l'ordre."						); 
					Doc_PrintLines	( nDocID,  1, "Quiconque a �t� t�moin ou victime d'un crime n'aura pas une haute opinion du coupable."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Naturellement, certains se fichent des lois, surtout les bandits et les mercenaires."						);
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

