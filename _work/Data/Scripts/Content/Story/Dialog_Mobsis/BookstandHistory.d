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

					Doc_PrintLine	( nDocID,  0, "Jak bojovat"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
				
					
					Doc_PrintLines	( nDocID,  0, "Nejlep�� obrana je �tok - alespo� proti v�em nelidsk�m stv�r�m. Odvracet �toky zv��at nebo oblud toti� v�bec nem� cenu."						);
					Doc_PrintLines	( nDocID,  0, "Takov�ho protivn�ka si je lep�� n�kolika dob�e m��en�mi ranami dr�et od t�la a pak ho p�ekvapit n�hl�m v�padem."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Samoz�ejm� �e zku�en� bojovn�ci mohou tyto pohyby libovoln� spojovat. Pokud jsi mistrem bojov�ch um�n�, m��e� takov�ch kombinac� pou��vat i v�ce."						); 
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

					Doc_PrintLine	( nDocID,  0, "Ostrov"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "P��stavn� m�sto Khorinis le�� na ostrov� u pob�e�� kr�lovstv� Myrtana."						);
					Doc_PrintLines	( nDocID,  0, "Tento ostrov je proslul� zejm�na t�m, �e se na n�m nach�z� slavn� Hornick� �dol�. Jeho pov�st je pochybn�, nebo� je po mnoho let obklopovala neprostupn� magick� bari�ra, a proto slou�ilo jako v�znice pro trestance z cel� ��e."						);
					Doc_PrintLines	( nDocID,  0, "Ti zde dolovali magickou rudu, jej� lo�iska se ukr�vala hluboko pod povrchem zem�."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "P�da za hranicemi Khorinidu je velmi �rodn�, proto tu najdete mnoho selsk�ch usedlost�, kde se p�stuj� zejm�na tu��ny a chovaj� ovce."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Ji� po cel� generace pat�� nejv�t�� statek velkostatk��i, kter� pak okoln� p�du pronaj�m� ostatn�m sedl�k�m."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Uprost�ed ostrova stoj� starobyl� Innos�v kl�ter, kter� vedou m�gov� ohn�, ji� zde prov�d�j� sv� magick� a alchymistick� v�zkumy a tak� lisuj� v�no."						);
					
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

					Doc_PrintLine	( nDocID,  0, "Z�kony ostrova"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					
				
					
					Doc_PrintLines	( nDocID,  0, "V�ude, kde �ije v�ce lid� pohromad�, je nutn� dodr�ovat ur�it� pravidla pokojn�ho sou�it� - jak v kl�te�e, tak ve m�st� �i na statku."						);
					Doc_PrintLines	( nDocID,  0, "V�echny zlo�iny proti komunit� budou potrest�ny."						);
					Doc_PrintLines	( nDocID,  0, "Je zak�z�no provokovat souboje nebo se zapojovat do rva�ek."						);
					Doc_PrintLines	( nDocID,  0, "Ka�d� kr�de� je tak� zlo�inem a pachatel ponese pat�i�n� n�sledky. I ovce jsou chr�n�ny z�konem."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Pokud n�kdo zabije druh�ho, mus� b�t za sv�j �in souzen a odsouzen."						);
					Doc_PrintLines	( nDocID,  1, "Jestli se chce vyhnout v�zen�, mus� zaplatit tu�nou pokutu."						);
					Doc_PrintLines	( nDocID,  1, "Na velk�ch m�stech dbaj� o po��dek mu�i z�kona. Doslechnou se o ka�d�m zlo�inu i p�estupku a jejich povinnost� je potrestat vin�ka a u�init tak spravedlnosti zadost."						); 
					Doc_PrintLines	( nDocID,  1, "Ka�d�, kdo se stane ob�t� �i sv�dkem zlo�inu, nebude m�t samoz�ejm� o pachateli dobr� m�n�n�."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Samoz�ejm� �e existuj� tac�, kte�� si se z�konem p��li� hlavu nel�mou - nap��klad bandit� �i �oldn��i."						);
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

