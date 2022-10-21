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

					Doc_PrintLine	( nDocID,  0, "Lov a koøist"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Z kadého zvíøete èi nestvùry mùe schopnı lovec získat nìjakou trofej."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Ten, kdo je v tomto umìní zbìhlı, by mìl tyto trofeje nejen znát, ale mìl by je i umìt získat.");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Vyjmutí zubù"						);
					Doc_PrintLines	( nDocID,  0, "Spousta šelem i ostatních tvorù pouívá jako zbraò zuby. Tıká se to pøedevším vlkù, chòapavcù, stínovıch šelem, moèálovıch ralokù a trolù - ode všech dokáe zdatnı lovec získat zuby."						);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Stahování kùí"						);
					Doc_PrintLines	( nDocID,  1, "Zkušení lovci si také velmi cení kùí a koešin spousty zvíøat, napøíklad ovcí, vlkù a stínovıch šelem."						); 
					Doc_PrintLines	( nDocID,  1, "Ten, kdo se v tìchto vìcech vyzná, dokáe stáhnout kùi i z moèálovıch ralokù a èíhavcù."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Vyjmutí drápù"						);
					Doc_PrintLines	( nDocID,  1, "Toto umìní lze uplatnit na urèitıch ještìrech, chòapavcích, èíhavcích a stínovıch šelmách."						);
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

					Doc_PrintLine	( nDocID,  0, "Lov a koøist"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Z kadého zvíøete èi nestvùry mùe schopnı lovec získat nìjakou trofej."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Krvavé mouchy"			);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "K vyvrení tìchto létajících ïáblù je zapotøebí hned dvou dovedností -"					); 
					Doc_PrintLines	( nDocID,  0, "vyjmutí køídel a extrakce ihadla." );
					Doc_PrintLines	( nDocID,  0, "Obì tyto dovednosti by mìli pouívat pouze zkušení lovci."	);
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Polní škùdci a dùlní èervi útoèí svımi mocnımi kusadly. Zvláštì kusadla dùlních"						);
					Doc_PrintLines	( nDocID,  1, "èervù jsou cenná, nebo obsahují vımìšek zvyšující magickou moc. Lze jej však"						);
					Doc_PrintLines	( nDocID,  1, "pouívat pouze v omezeném mnoství, nebo lidské tìlo si na nìj po èase zvykne a pøestane jeho úèinky pøijímat."						);   
					Doc_PrintLines	( nDocID,  1, "Velké oblibì se tìší i krunıøe dùlních èervù, ze kterıch se vyrábí kvalitní zbroj."						);
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

					Doc_PrintLine	( nDocID,  0, "Lov a koøist"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Z kadé šelmy nebo nestvùry mohou zkušení lovci získat urèitou trofej, která jim pøinese peníze i slávu."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ohnivı ještìr"						);
					Doc_PrintLines	( nDocID,  0, "Tato šelma sice patøí k ještìrùm, ale dokáe kadého, kdo se jí pøiplete do cesty, seehnout palèivım ohnìm."						);
					Doc_PrintLines	( nDocID,  0, "Proto s tìmito zrùdami mohou bojovat pouze ti, kteøí se chrání pøed ohnìm - a pak jim mohou vyøíznout jazyky, které jsou velmi cenné."	);		
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, "Stínová šelma"		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Stínová šelma je samotáøskı tvor ze starıch èasù, kterı se skrıvá v lesích."						); 
					Doc_PrintLines	( nDocID,  1, "U jich na svìtì moc nezùstalo, proto pro lidi nepøedstavují ádnou vìtší hrozbu, pokud se nevetøou pøímo do jejich teritoria."						);
					Doc_PrintLines	( nDocID,  1, "Roh stínové šelmy pøedstavuje velmi cennou trofej. Lovec však musí vìdìt, jak jej správnì vyjmout, aby ho nepoškodil"						);
					Doc_PrintLines	( nDocID,  1, "a nesníil jeho cenu."						);
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

