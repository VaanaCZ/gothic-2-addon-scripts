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

					Doc_PrintLine	( nDocID,  0, "Lov a koâist"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Z každého zvíâete èi nestvùry mùže schopný lovec získat nêjakou trofej."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ten, kdo je v tomto umêní zbêhlý, by mêl tyto trofeje nejen znát, ale mêl by je i umêt získat.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Vyjmutí zubù"						);
					Doc_PrintLines	( nDocID,  0, "Spousta šelem i ostatních tvorù používá jako zbraà zuby. Týká se to pâedevším vlkù, chàapavcù, stínových šelem, moèálových žralokù a trolù - ode všech dokáže zdatný lovec získat zuby."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Stahování kùží"						);
					Doc_PrintLines	( nDocID,  1, "Zkušení lovci si také velmi cení kùží a kožešin spousty zvíâat, napâíklad ovcí, vlkù a stínových šelem."						); 
					Doc_PrintLines	( nDocID,  1, "Ten, kdo se v têchto vêcech vyzná, dokáže stáhnout kùži i z moèálových žralokù a èíhavcù."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Vyjmutí drápù"						);
					Doc_PrintLines	( nDocID,  1, "Toto umêní lze uplatnit na urèitých ještêrech, chàapavcích, èíhavcích a stínových šelmách."						);
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

					Doc_PrintLine	( nDocID,  0, "Lov a koâist"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Z každého zvíâete èi nestvùry mùže schopný lovec získat nêjakou trofej."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Krvavé mouchy"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "K vyvržení têchto létajících ëáblù je zapotâebí hned dvou dovedností -"					); 
					Doc_PrintLines	( nDocID,  0, "vyjmutí kâídel a extrakce žihadla." );
					Doc_PrintLines	( nDocID,  0, "Obê tyto dovednosti by mêli používat pouze zkušení lovci."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Polní škùdci a dùlní èervi útoèí svými mocnými kusadly. Zvláštê kusadla dùlních"						);
					Doc_PrintLines	( nDocID,  1, "èervù jsou cenná, neboã obsahují výmêšek zvyšující magickou moc. Lze jej však"						);
					Doc_PrintLines	( nDocID,  1, "používat pouze v omezeném množství, neboã lidské têlo si na nêj po èase zvykne a pâestane jeho úèinky pâijímat."						);   
					Doc_PrintLines	( nDocID,  1, "Velké oblibê se têší i krunýâe dùlních èervù, ze kterých se vyrábí kvalitní zbroj."						);
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

					Doc_PrintLine	( nDocID,  0, "Lov a koâist"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Z každé šelmy nebo nestvùry mohou zkušení lovci získat urèitou trofej, která jim pâinese peníze i slávu."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ohnivý ještêr"						);
					Doc_PrintLines	( nDocID,  0, "Tato šelma sice patâí k ještêrùm, ale dokáže každého, kdo se jí pâiplete do cesty, sežehnout palèivým ohnêm."						);
					Doc_PrintLines	( nDocID,  0, "Proto s têmito zrùdami mohou bojovat pouze ti, kteâí se chrání pâed ohnêm - a pak jim mohou vyâíznout jazyky, které jsou velmi cenné."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Stínová šelma"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Stínová šelma je samotáâský tvor ze starých èasù, který se skrývá v lesích."						); 
					Doc_PrintLines	( nDocID,  1, "Už jich na svêtê moc nezùstalo, proto pro lidi nepâedstavují žádnou vêtší hrozbu, pokud se nevetâou pâímo do jejich teritoria."						);
					Doc_PrintLines	( nDocID,  1, "Roh stínové šelmy pâedstavuje velmi cennou trofej. Lovec však musí vêdêt, jak jej správnê vyjmout, aby ho nepoškodil"						);
					Doc_PrintLines	( nDocID,  1, "a nesnížil jeho cenu."						);
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

