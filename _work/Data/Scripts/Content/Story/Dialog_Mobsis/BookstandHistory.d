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

FUNC VOID Use_BookstandHistory1_S1()		//Geschichtsbücher
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
				
					
					Doc_PrintLines	( nDocID,  0, "Nejlepší obrana je útok - alespoò proti všem nelidskım stvùrám. Odvracet útoky zvíøat nebo oblud toti vùbec nemá cenu."						);
					Doc_PrintLines	( nDocID,  0, "Takového protivníka si je lepší nìkolika dobøe míøenımi ranami dret od tìla a pak ho pøekvapit náhlım vıpadem."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Samozøejmì e zkušení bojovníci mohou tyto pohyby libovolnì spojovat. Pokud jsi mistrem bojovıch umìní, mùeš takovıch kombinací pouívat i více."						); 
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

FUNC VOID Use_BookstandHistory2_S1()		//Geschichtsbücher
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
					Doc_PrintLines	( nDocID,  0, "Pøístavní mìsto Khorinis leí na ostrovì u pobøeí království Myrtana."						);
					Doc_PrintLines	( nDocID,  0, "Tento ostrov je proslulı zejména tím, e se na nìm nachází slavné Hornické údolí. Jeho povìst je pochybná, nebo je po mnoho let obklopovala neprostupná magická bariéra, a proto slouilo jako vìznice pro trestance z celé øíše."						);
					Doc_PrintLines	( nDocID,  0, "Ti zde dolovali magickou rudu, její loiska se ukrıvala hluboko pod povrchem zemì."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Pùda za hranicemi Khorinidu je velmi úrodná, proto tu najdete mnoho selskıch usedlostí, kde se pìstují zejména tuøíny a chovají ovce."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Ji po celé generace patøí nejvìtší statek velkostatkáøi, kterı pak okolní pùdu pronajímá ostatním sedlákùm."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Uprostøed ostrova stojí starobylı Innosùv klášter, kterı vedou mágové ohnì, ji zde provádìjí své magické a alchymistické vızkumy a také lisují víno."						);
					
					Doc_Show		( nDocID );
					
					if (History_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						History_2_permanent = TRUE;
					};

	};
};


FUNC VOID Use_BookstandHistory3_S1()		//Geschichtsbücher
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

					Doc_PrintLine	( nDocID,  0, "Zákony ostrova"					);
					Doc_PrintLine	( nDocID,  0, ""						);
					
				
					
					Doc_PrintLines	( nDocID,  0, "Všude, kde ije více lidí pohromadì, je nutné dodrovat urèitá pravidla pokojného souití - jak v klášteøe, tak ve mìstì èi na statku."						);
					Doc_PrintLines	( nDocID,  0, "Všechny zloèiny proti komunitì budou potrestány."						);
					Doc_PrintLines	( nDocID,  0, "Je zakázáno provokovat souboje nebo se zapojovat do rvaèek."						);
					Doc_PrintLines	( nDocID,  0, "Kadá kráde je také zloèinem a pachatel ponese patøièné následky. I ovce jsou chránìny zákonem."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Pokud nìkdo zabije druhého, musí bıt za svùj èin souzen a odsouzen."						);
					Doc_PrintLines	( nDocID,  1, "Jestli se chce vyhnout vìzení, musí zaplatit tuènou pokutu."						);
					Doc_PrintLines	( nDocID,  1, "Na velkıch místech dbají o poøádek mui zákona. Doslechnou se o kadém zloèinu i pøestupku a jejich povinností je potrestat viníka a uèinit tak spravedlnosti zadost."						); 
					Doc_PrintLines	( nDocID,  1, "Kadı, kdo se stane obìtí èi svìdkem zloèinu, nebude mít samozøejmì o pachateli dobré mínìní."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Samozøejmì e existují tací, kteøí si se zákonem pøíliš hlavu nelámou - napøíklad bandité èi oldnéøi."						);
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

