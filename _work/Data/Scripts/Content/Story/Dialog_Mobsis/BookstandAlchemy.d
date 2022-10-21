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
					Doc_PrintLine	( nDocID,  0, "Magick� lektvary");
					Doc_PrintLine	( nDocID,  0, "a p��sady"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Esence many"						);
					Doc_PrintLine	( nDocID,  0, "2 ohniv� kop�ivy"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Extrakt many"						);
					Doc_PrintLine	( nDocID,  0, "2 ohniv� b�l�"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elix�r many"						);
					Doc_PrintLine	( nDocID,  0, "2 ohniv� ko�eny"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Alchymista ke sv� pr�ci v�dy pot�ebuje laboratorn� lahvi�ku, do kter� pak nalije hotov� lektvar."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "K nam�ch�n� l��iv�ho lektvaru nebo elix�ru posiluj�c�ho magickou moc pot�ebuje� zvl�tn� p��sadu a rostlinu:"			);
					Doc_PrintLine	( nDocID,  1, "Lu�n� pohanka"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "K nam�ch�n� lektvar� trvale m�n�c�ch n�kterou z du�evn�ch �i t�lesn�ch vlastnost� pot�ebuje� ur�itou rostlinu:"						);
					Doc_PrintLines	( nDocID,  1, "Kr�lovsk� ��ov�k"		);
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
					Doc_PrintLine	( nDocID,  0, "L��iv� lektvary");
					Doc_PrintLine	( nDocID,  0, "a p��sady"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Esence hojiv� s�ly"						);
					Doc_PrintLine	( nDocID,  0, "2 l��iv� rostliny"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Extrakt hojiv� s�ly"						);
					Doc_PrintLine	( nDocID,  0, "2 l��iv� byliny"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elix�r hojiv� s�ly"						);
					Doc_PrintLine	( nDocID,  0, "2 l��iv� ko�eny"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Alchymista ke sv� pr�ci v�dy pot�ebuje laboratorn� lahvi�ku, do kter� pak nalije hotov� lektvar."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "K nam�ch�n� l��iv�ho lektvaru nebo elix�ru posiluj�c�ho magickou moc pot�ebuje� zvl�tn� p��sadu a rostlinu:"			);
					Doc_PrintLine	( nDocID,  1, "Lu�n� pohanka"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "K nam�ch�n� lektvar� trvale m�n�c�ch n�kterou z du�evn�ch �i t�lesn�ch vlastnost� pot�ebuje� ur�itou rostlinu:"						);
					Doc_PrintLines	( nDocID,  1, "Kr�lovsk� ��ov�k"		);
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
					Doc_PrintLines	( nDocID,  0, "Lektvary pro trval� zm�ny");
					Doc_PrintLine	( nDocID,  0, "a p��sady"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					Doc_PrintLine	( nDocID,  0, "Elix�r obratnosti"						);
					Doc_PrintLine	( nDocID,  0, "1 goblin� bobule"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Lektvar rychlosti"						);
					Doc_PrintLines	( nDocID,  0, "1 ch�apav�� b�l� - k v�rob� tohoto lektvaru nepot�ebuje� kr�lovsk� ��ov�k, n�br� lu�n� pohanku."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elix�r s�ly"						);
					Doc_PrintLine	( nDocID,  0, "1 dra�� ko�en"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elix�r �ivota"						);
					Doc_PrintLine	( nDocID,  0, "1 l��iv� ko�en"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elix�r ducha"						);
					Doc_PrintLine	( nDocID,  0, "1 ohniv� ko�en"						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Tyto lektvary m��e nam�chat jen skute�n� mistr alchymie. Jednou z p��sad do t�chto vz�cn�ch elix�r� b�v� obvykle kr�lovsk� ��ov�k."); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Lektvar rychlosti nam�ch� mnohem sn�ze, zvl�t� proto, �e k jeho vytvo�en� nepot�ebuje� kr�lovsk� ��ov�k."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					
					
					Doc_Show		( nDocID );
					
					if (ALchemy_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_3_permanent = TRUE;
					};	

	};
};
