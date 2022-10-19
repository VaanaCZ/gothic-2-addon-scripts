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

					Doc_PrintLine	( nDocID,  0, "Lov a ko�ist"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Z ka�d�ho zv��ete �i nestv�ry m��e schopn� lovec z�skat n�jakou trofej."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ten, kdo je v tomto um�n� zb�hl�, by m�l tyto trofeje nejen zn�t, ale m�l by je i um�t z�skat.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Vyjmut� zub�"						);
					Doc_PrintLines	( nDocID,  0, "Spousta �elem i ostatn�ch tvor� pou��v� jako zbra� zuby. T�k� se to p�edev��m vlk�, ch�apavc�, st�nov�ch �elem, mo��lov�ch �ralok� a trol� - ode v�ech dok�e zdatn� lovec z�skat zuby."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Stahov�n� k���"						);
					Doc_PrintLines	( nDocID,  1, "Zku�en� lovci si tak� velmi cen� k��� a ko�e�in spousty zv��at, nap��klad ovc�, vlk� a st�nov�ch �elem."						); 
					Doc_PrintLines	( nDocID,  1, "Ten, kdo se v t�chto v�cech vyzn�, dok�e st�hnout k��i i z mo��lov�ch �ralok� a ��havc�."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Vyjmut� dr�p�"						);
					Doc_PrintLines	( nDocID,  1, "Toto um�n� lze uplatnit na ur�it�ch je�t�rech, ch�apavc�ch, ��havc�ch a st�nov�ch �elm�ch."						);
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

					Doc_PrintLine	( nDocID,  0, "Lov a ko�ist"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Z ka�d�ho zv��ete �i nestv�ry m��e schopn� lovec z�skat n�jakou trofej."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Krvav� mouchy"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "K vyvr�en� t�chto l�taj�c�ch ��bl� je zapot�eb� hned dvou dovednost� -"					); 
					Doc_PrintLines	( nDocID,  0, "vyjmut� k��del a extrakce �ihadla." );
					Doc_PrintLines	( nDocID,  0, "Ob� tyto dovednosti by m�li pou��vat pouze zku�en� lovci."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Poln� �k�dci a d�ln� �ervi �to�� sv�mi mocn�mi kusadly. Zvl�t� kusadla d�ln�ch"						);
					Doc_PrintLines	( nDocID,  1, "�erv� jsou cenn�, nebo� obsahuj� v�m�ek zvy�uj�c� magickou moc. Lze jej v�ak"						);
					Doc_PrintLines	( nDocID,  1, "pou��vat pouze v omezen�m mno�stv�, nebo� lidsk� t�lo si na n�j po �ase zvykne a p�estane jeho ��inky p�ij�mat."						);   
					Doc_PrintLines	( nDocID,  1, "Velk� oblib� se t�� i krun��e d�ln�ch �erv�, ze kter�ch se vyr�b� kvalitn� zbroj."						);
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

					Doc_PrintLine	( nDocID,  0, "Lov a ko�ist"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Z ka�d� �elmy nebo nestv�ry mohou zku�en� lovci z�skat ur�itou trofej, kter� jim p�inese pen�ze i sl�vu."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ohniv� je�t�r"						);
					Doc_PrintLines	( nDocID,  0, "Tato �elma sice pat�� k je�t�r�m, ale dok�e ka�d�ho, kdo se j� p�iplete do cesty, se�ehnout pal�iv�m ohn�m."						);
					Doc_PrintLines	( nDocID,  0, "Proto s t�mito zr�dami mohou bojovat pouze ti, kte�� se chr�n� p�ed ohn�m - a pak jim mohou vy��znout jazyky, kter� jsou velmi cenn�."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "St�nov� �elma"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "St�nov� �elma je samot��sk� tvor ze star�ch �as�, kter� se skr�v� v les�ch."						); 
					Doc_PrintLines	( nDocID,  1, "U� jich na sv�t� moc nez�stalo, proto pro lidi nep�edstavuj� ��dnou v�t�� hrozbu, pokud se nevet�ou p��mo do jejich teritoria."						);
					Doc_PrintLines	( nDocID,  1, "Roh st�nov� �elmy p�edstavuje velmi cennou trofej. Lovec v�ak mus� v�d�t, jak jej spr�vn� vyjmout, aby ho nepo�kodil"						);
					Doc_PrintLines	( nDocID,  1, "a nesn�il jeho cenu."						);
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

