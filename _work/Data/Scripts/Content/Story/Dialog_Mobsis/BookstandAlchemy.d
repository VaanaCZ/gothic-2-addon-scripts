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

FUNC VOID Use_BookstandALCHEMY1_S1()		//Alchemieb�cher
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
					Doc_PrintLine	( nDocID,  0, "Tr�nke magischer Kraft");
					Doc_PrintLine	( nDocID,  0, "und ihre Zutaten"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mana Essenz"						);
					Doc_PrintLine	( nDocID,  0, "2 Feuernesseln"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mana Extrakt"						);
					Doc_PrintLine	( nDocID,  0, "2 Feuerkr�uter"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mana Elixier"						);
					Doc_PrintLine	( nDocID,  0, "2 Feuerwurzeln"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Jegliche Arbeit am Alchemietisch  erfordert eine Laborwasserflasche, die w�hrend des Prozesses verbraucht wird."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "F�r das Brauen von Tr�nken der Heilung oder der St�rkung der magischen Kraft, ben�tigt der Anwender neben der speziellen Zutat immer eine Pflanze:"			);
					Doc_PrintLine	( nDocID,  1, "Feldkn�terich"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "F�r das Brauen von Tr�nken die permanente Ver�nderungen des K�rpers oder Geistes bewirken, ben�tigt der Anwender immer eine Pflanze: "						);
					Doc_PrintLines	( nDocID,  1, "Kronst�ckl"		);
					Doc_Show		( nDocID );
					
					if (ALchemy_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_1_permanent = TRUE;
					};	  

	};
};

FUNC VOID Use_BookstandALCHEMY2_S1()		//Alchemieb�cher
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
					Doc_PrintLine	( nDocID,  0, "Tr�nke heilender Kraft");
					Doc_PrintLine	( nDocID,  0, "und ihre Zutaten"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Essenz der Heilung"						);
					Doc_PrintLine	( nDocID,  0, "2 Heilpflanzen"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Extrakt der Heilung"						);
					Doc_PrintLine	( nDocID,  0, "2 Heilkr�uter"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixier der Heilung"						);
					Doc_PrintLine	( nDocID,  0, "2 Heilwurzeln"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Jegliche Arbeit am Alchemietisch  erfordert eine Laborwasserflasche, die w�hrend des Prozesses verbraucht wird."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "F�r das Brauen von Tr�nken der Heilung oder der St�rkung der magischen Kraft, ben�tigt der Anwender neben der speziellen Zutat immer eine Pflanze:"			);
					Doc_PrintLine	( nDocID,  1, "Feldkn�terich"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "F�r das Brauen von Tr�nken die permanente Ver�nderungen des K�rpers oder Geistes bewirken, ben�tigt der Anwender immer eine Pflanze: "						);
					Doc_PrintLines	( nDocID,  1, "Kronst�ckl"		);
					Doc_Show		( nDocID );
					
					if (ALchemy_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_2_permanent = TRUE;
					};	

	};
};

FUNC VOID Use_BookstandALCHEMY3_S1()		//Alchemieb�cher
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
					Doc_PrintLines	( nDocID,  0, "Tr�nke permanenter Ver�nderungen");
					Doc_PrintLine	( nDocID,  0, "und ihre Zutaten"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					Doc_PrintLine	( nDocID,  0, "Elixier der Geschicklichkeit"						);
					Doc_PrintLine	( nDocID,  0, "1 Goblin Beere"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Trank der Geschwindigkeit"						);
					Doc_PrintLines	( nDocID,  0, "1 Snapperkraut - dieser Trank ben�tigt keinen Kronst�ckl, sondern Feldkn�terich"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixier der St�rke"						);
					Doc_PrintLine	( nDocID,  0, "1 Drachenwurzel"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elixier des Lebens"						);
					Doc_PrintLine	( nDocID,  0, "1 Heilwurzel"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elixier des Geistes"						);
					Doc_PrintLine	( nDocID,  0, "1 Feuerwurzel"						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Das Brauen dieser Rezepturen ist die hohe Kunst der Alchemie. Ihnen allen ist zu eigen, dass sie einen Kronst�ckl als Zutat verlangen."); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Der Trank der Geschwindigkeit ist viel einfacher herzustellen, was auch daran liegt, das man keinen Kronst�ckl ben�tigt. "						);
					Doc_PrintLine	( nDocID,  1, ""						);
					
					
					Doc_Show		( nDocID );
					
					if (ALchemy_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_3_permanent = TRUE;
					};	

	};
};
