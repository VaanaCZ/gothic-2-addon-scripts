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
				
					
					Doc_PrintLines	( nDocID,  0, "Nejlepší obrana je útok - alespoà proti všem nelidským stvùrám. Odvracet útoky zvíâat nebo oblud totiž vùbec nemá cenu."						);
					Doc_PrintLines	( nDocID,  0, "Takového protivníka si je lepší nêkolika dobâe míâenými ranami držet od têla a pak ho pâekvapit náhlým výpadem."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Samozâejmê že zkušení bojovníci mohou tyto pohyby libovolnê spojovat. Pokud jsi mistrem bojových umêní, mùžeš takových kombinací používat i více."						); 
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
					Doc_PrintLines	( nDocID,  0, "Pâístavní mêsto Khorinis leží na ostrovê u pobâeží království Myrtana."						);
					Doc_PrintLines	( nDocID,  0, "Tento ostrov je proslulý zejména tím, že se na nêm nachází slavné Hornické údolí. Jeho povêst je pochybná, neboã je po mnoho let obklopovala neprostupná magická bariéra, a proto sloužilo jako vêznice pro trestance z celé âíše."						);
					Doc_PrintLines	( nDocID,  0, "Ti zde dolovali magickou rudu, jejíž ložiska se ukrývala hluboko pod povrchem zemê."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Pùda za hranicemi Khorinidu je velmi úrodná, proto tu najdete mnoho selských usedlostí, kde se pêstují zejména tuâíny a chovají ovce."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Již po celé generace patâí nejvêtší statek velkostatkáâi, který pak okolní pùdu pronajímá ostatním sedlákùm."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Uprostâed ostrova stojí starobylý Innosùv klášter, který vedou mágové ohnê, již zde provádêjí své magické a alchymistické výzkumy a také lisují víno."						);
					
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
					
				
					
					Doc_PrintLines	( nDocID,  0, "Všude, kde žije více lidí pohromadê, je nutné dodržovat urèitá pravidla pokojného soužití - jak v klášteâe, tak ve mêstê èi na statku."						);
					Doc_PrintLines	( nDocID,  0, "Všechny zloèiny proti komunitê budou potrestány."						);
					Doc_PrintLines	( nDocID,  0, "Je zakázáno provokovat souboje nebo se zapojovat do rvaèek."						);
					Doc_PrintLines	( nDocID,  0, "Každá krádež je také zloèinem a pachatel ponese patâièné následky. I ovce jsou chránêny zákonem."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Pokud nêkdo zabije druhého, musí být za svùj èin souzen a odsouzen."						);
					Doc_PrintLines	( nDocID,  1, "Jestli se chce vyhnout vêzení, musí zaplatit tuènou pokutu."						);
					Doc_PrintLines	( nDocID,  1, "Na velkých místech dbají o poâádek muži zákona. Doslechnou se o každém zloèinu i pâestupku a jejich povinností je potrestat viníka a uèinit tak spravedlnosti zadost."						); 
					Doc_PrintLines	( nDocID,  1, "Každý, kdo se stane obêtí èi svêdkem zloèinu, nebude mít samozâejmê o pachateli dobré mínêní."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Samozâejmê že existují tací, kteâí si se zákonem pâíliš hlavu nelámou - napâíklad bandité èi žoldnéâi."						);
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

