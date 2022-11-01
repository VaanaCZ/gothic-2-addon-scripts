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
				
					
					Doc_PrintLines	( nDocID,  0, "Nejlepší obrana je útok - alespoŕ proti všem nelidským stvůrám. Odvracet útoky zvíâat nebo oblud totiž vůbec nemá cenu."						);
					Doc_PrintLines	( nDocID,  0, "Takového protivníka si je lepší nękolika dobâe míâenými ranami držet od tęla a pak ho pâekvapit náhlým výpadem."						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Samozâejmę že zkušení bojovníci mohou tyto pohyby libovolnę spojovat. Pokud jsi mistrem bojových umęní, můžeš takových kombinací používat i více."						); 
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
					Doc_PrintLines	( nDocID,  0, "Pâístavní męsto Khorinis leží na ostrovę u pobâeží království Myrtana."						);
					Doc_PrintLines	( nDocID,  0, "Tento ostrov je proslulý zejména tím, že se na nęm nachází slavné Hornické údolí. Jeho povęst je pochybná, neboă je po mnoho let obklopovala neprostupná magická bariéra, a proto sloužilo jako vęznice pro trestance z celé âíše."						);
					Doc_PrintLines	( nDocID,  0, "Ti zde dolovali magickou rudu, jejíž ložiska se ukrývala hluboko pod povrchem zemę."						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Půda za hranicemi Khorinidu je velmi úrodná, proto tu najdete mnoho selských usedlostí, kde se pęstují zejména tuâíny a chovají ovce."						); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Již po celé generace patâí nejvętší statek velkostatkáâi, který pak okolní půdu pronajímá ostatním sedlákům."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Uprostâed ostrova stojí starobylý Innosův klášter, který vedou mágové ohnę, již zde provádęjí své magické a alchymistické výzkumy a také lisují víno."						);
					
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
					
				
					
					Doc_PrintLines	( nDocID,  0, "Všude, kde žije více lidí pohromadę, je nutné dodržovat určitá pravidla pokojného soužití - jak v klášteâe, tak ve męstę či na statku."						);
					Doc_PrintLines	( nDocID,  0, "Všechny zločiny proti komunitę budou potrestány."						);
					Doc_PrintLines	( nDocID,  0, "Je zakázáno provokovat souboje nebo se zapojovat do rvaček."						);
					Doc_PrintLines	( nDocID,  0, "Každá krádež je také zločinem a pachatel ponese patâičné následky. I ovce jsou chránęny zákonem."						);
					Doc_PrintLines	( nDocID,  0, " "						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Pokud nękdo zabije druhého, musí být za svůj čin souzen a odsouzen."						);
					Doc_PrintLines	( nDocID,  1, "Jestli se chce vyhnout vęzení, musí zaplatit tučnou pokutu."						);
					Doc_PrintLines	( nDocID,  1, "Na velkých místech dbají o poâádek muži zákona. Doslechnou se o každém zločinu i pâestupku a jejich povinností je potrestat viníka a učinit tak spravedlnosti zadost."						); 
					Doc_PrintLines	( nDocID,  1, "Každý, kdo se stane obętí či svędkem zločinu, nebude mít samozâejmę o pachateli dobré mínęní."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Samozâejmę že existují tací, kteâí si se zákonem pâíliš hlavu nelámou - napâíklad bandité či žoldnéâi."						);
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

