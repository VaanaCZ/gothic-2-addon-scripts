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
					Doc_PrintLines	( nDocID,  0, "Z každého zvíâete či nestvůry může schopný lovec získat nęjakou trofej."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ten, kdo je v tomto umęní zbęhlý, by męl tyto trofeje nejen znát, ale męl by je i umęt získat.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Vyjmutí zubů"						);
					Doc_PrintLines	( nDocID,  0, "Spousta šelem i ostatních tvorů používá jako zbraŕ zuby. Týká se to pâedevším vlků, chŕapavců, stínových šelem, močálových žraloků a trolů - ode všech dokáže zdatný lovec získat zuby."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Stahování kůží"						);
					Doc_PrintLines	( nDocID,  1, "Zkušení lovci si také velmi cení kůží a kožešin spousty zvíâat, napâíklad ovcí, vlků a stínových šelem."						); 
					Doc_PrintLines	( nDocID,  1, "Ten, kdo se v tęchto vęcech vyzná, dokáže stáhnout kůži i z močálových žraloků a číhavců."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Vyjmutí drápů"						);
					Doc_PrintLines	( nDocID,  1, "Toto umęní lze uplatnit na určitých ještęrech, chŕapavcích, číhavcích a stínových šelmách."						);
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
					Doc_PrintLines	( nDocID,  0, "Z každého zvíâete či nestvůry může schopný lovec získat nęjakou trofej."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Krvavé mouchy"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "K vyvržení tęchto létajících ëáblů je zapotâebí hned dvou dovedností -"					); 
					Doc_PrintLines	( nDocID,  0, "vyjmutí kâídel a extrakce žihadla." );
					Doc_PrintLines	( nDocID,  0, "Obę tyto dovednosti by męli používat pouze zkušení lovci."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Polní škůdci a důlní červi útočí svými mocnými kusadly. Zvláštę kusadla důlních"						);
					Doc_PrintLines	( nDocID,  1, "červů jsou cenná, neboă obsahují výmęšek zvyšující magickou moc. Lze jej však"						);
					Doc_PrintLines	( nDocID,  1, "používat pouze v omezeném množství, neboă lidské tęlo si na nęj po čase zvykne a pâestane jeho účinky pâijímat."						);   
					Doc_PrintLines	( nDocID,  1, "Velké oblibę se tęší i krunýâe důlních červů, ze kterých se vyrábí kvalitní zbroj."						);
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
					Doc_PrintLines	( nDocID,  0, "Z každé šelmy nebo nestvůry mohou zkušení lovci získat určitou trofej, která jim pâinese peníze i slávu."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ohnivý ještęr"						);
					Doc_PrintLines	( nDocID,  0, "Tato šelma sice patâí k ještęrům, ale dokáže každého, kdo se jí pâiplete do cesty, sežehnout palčivým ohnęm."						);
					Doc_PrintLines	( nDocID,  0, "Proto s tęmito zrůdami mohou bojovat pouze ti, kteâí se chrání pâed ohnęm - a pak jim mohou vyâíznout jazyky, které jsou velmi cenné."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Stínová šelma"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Stínová šelma je samotáâský tvor ze starých časů, který se skrývá v lesích."						); 
					Doc_PrintLines	( nDocID,  1, "Už jich na svętę moc nezůstalo, proto pro lidi nepâedstavují žádnou vętší hrozbu, pokud se nevetâou pâímo do jejich teritoria."						);
					Doc_PrintLines	( nDocID,  1, "Roh stínové šelmy pâedstavuje velmi cennou trofej. Lovec však musí vędęt, jak jej správnę vyjmout, aby ho nepoškodil"						);
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

