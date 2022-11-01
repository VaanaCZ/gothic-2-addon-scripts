
//*************************************
//	Buchständer im Banditenlager
//*************************************

FUNC VOID Use_Bookstand_Addon_BL_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "Důl"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Crimson: 79 zlatých nuggetů získáno a roztaveno"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Scatty: Získáno zboží za 250 zlatých"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Garaz: získáno 6 zlatých nuggetů"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Všechny stráže: získáno 9 zlatých nuggetů"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Tábor:"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Havranovy stráže: 25 zlaăáků"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Finn: 60 zlaăáků"					);
					Doc_PrintLines	( nDocID,  1, "Lennar: 40 zlaăáků"); 
					Doc_PrintLines	( nDocID,  1, "Emilio: 50 zlaăáků"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Ostatní: 20 zlaăáků"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Huno, Fisk, Snaf: každý podle zboží"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Lovci: Tohle je vęc velitele! Franco obdržel 7 zlaăáků.");
					Doc_Show		( nDocID );
	
	};
};

//##########################################################################
//##
//##	SteinPult 
//##
//##########################################################################

//----------------------
var int BookstandMayaHierchary_1_permanent;
var int BookstandMayaHierchary_2_permanent;
var int BookstandMayaHierchary_3_permanent;
var int BookstandMayaHierchary_4_permanent;
var int BookstandMayaHierchary_5_permanent;
var int BookstandMayaArt;
//----------------------
func int C_CanReadBookStand ()
{
	IF (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
		{
			return TRUE;
		};
};

func void Use_BookstandMaya () 
{
	if (BookstandMayaArt == 1)		//Joly:  überall objektieren!
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "...protože pouze STRÁŽCI SMRTI mohou vyvolávat pâedky.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Velmi nám tu chybí. Bez rady starších jsme vydáni na milost lidu.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "LÉČITELÉ męli uzavâít portál a zničit klíč. Jen Adanos ví, co se s nimi stalo a zda svůj úkol splnili.");         
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "VÁLEČNICKOU KASTU zničil Adanos svým hnęvem. Srdce prince starých válečníků je zlomeno."		);  
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Jen zbylí KNĘŽÍ si zachovali nadęji a stále hlásají, že naše męsto se znovu obrodí a bude krásné a slavné jako dâíve.");
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "UČENCI však znají trpkou pravdu. JHARKENDAR padl a âeka času ho brzy odplaví.");
			Doc_PrintLines	( StPl_nDocID,  1, "");        
	}
	else if (BookstandMayaArt == 2)     //Joly: objektieren egal wo, nur nicht Entrance.                     
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "RHADEMES byl navęky uvęznęn v ADANOVĘ chrámu, ale moc meče zlomena nebyla.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Jeho moc byla pâíliš velká. To vraždęní na ulicích hned tak neskončí.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Hnęv ADANŮV skoncoval se vším. Moâe se vzedmulo, zaplavilo JHARKENDAR a celé męsto se ocitlo pod vodou.");
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Nedotčené zůstaly jen chrámy a budovy na vyvýšených místech.");
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLines	( StPl_nDocID,  1, "Nękolik málo pâeživších už nemęlo sil znovu vystavęt męsto.");
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLines	( StPl_nDocID,  1, "A tak byl osud JHARKENDARU zpečetęn.");

			if ( SC_Knows_WeaponInAdanosTempel == FALSE)
			{				
				B_GivePlayerXP (XP_Ambient);
				SC_Knows_WeaponInAdanosTempel = TRUE;
			};
	}
	else if (BookstandMayaArt == 3)                  
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Vęk QUARHODRONOVI nedovoloval velet vojsku, a tak knęží trvali na tom, že ho dle svého práva povedou oni.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Nakázali mu, aby složil úâad a pâedal jim meč.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Rada pęti pak męla určit následníka. Válečnická kasta však jejich rozhodnutí nepâijala.");
	                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Válečníci se rozhodli, že se Radę pęti nepodâídí a zvolili si za vůdce jeho syna RHADEMESE.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON již natolik ztratil hrdost a víru ve vlastní krev, že se jim podvolil.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Pâedal meč synovi v nadęji, že jej bude tâímat rukou stejnę silnou, jako byla paže otcova.");
	} 
	else if (BookstandMayaArt == 4)  
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "RHADEMES byl slabý. Neodolal zlé vůli meče a nechal se od nęj zcela ovládnout.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Ani léčitelé už nedokáží zmírnit utrpení a ukrutná zvęrstva, která na náš lid svou zaslepeností pâivolal.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Meč si rychle uvędomil, že lidé jsou pâíliš slabí, než aby ohrozili jeho plány.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Ty může narušit pouze moc našich pâedků.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "A tak RHADEMES vyhnal nebo popravil všechny strážce smrti a zničil tak všechny nadęje, že se kdy tohoto zla zbavíme.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Nakonec už nezbyl ani jediný strážce mrtvých a nastal čas učinit hoâké a zoufalé rozhodnutí. Poslední čtyâi vůdcové ani nemęli na vybranou: museli se vzdát JHARKENDARU.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "V ulicích zuâila válka, když léčitelé navždy uzavâeli jediný vchod do údolí.");
	}
	else if (BookstandMayaArt == 5)
	{
			Doc_PrintLines	( StPl_nDocID,  0, "");  
			Doc_PrintLines	( StPl_nDocID,  0, "V tęchto síních jsme se s QUARHODRONEM a veleknęzem KHARDIMONEM snažili najít způsob, jak porazit RHADEMESE a zlomit moc meče.");
			Doc_PrintLines	( StPl_nDocID,  0, "");  
			Doc_PrintLines	( StPl_nDocID,  0, "QUARHODRON a KHARDIMON zastávali názor, že spojenými silami můžeme RHADEMESE v bitvę porazit. Já však znal moc meče pâíliš dobâe, než abych uvęâil, že by nęco takového bylo možné.");
			Doc_PrintLines	( StPl_nDocID,  0, "");	
			Doc_PrintLines	( StPl_nDocID,  0, "A tak jsem rozhodnutí svých spolubratâí vetoval a rozhodl, že bychom proti RHADAMESOVI męli použít spíše úskok.");			

			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLines	( StPl_nDocID,  1, ""		);  

			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON uposlechl rozhodnutí rady. Vstoupil do Adanova chrámu a poslal pro svého syna.");                   
			Doc_PrintLines	( StPl_nDocID,  1, "");  
			Doc_PrintLines	( StPl_nDocID,  1, "Jeho syn RHADAMES v sobę choval takovou nenávist, že v touze zabít otce zuâivę vtrhl do chrámu.");                
			Doc_PrintLines	( StPl_nDocID,  1, "");  
			Doc_PrintLines	( StPl_nDocID,  1, "Až pâíliš pozdę si uvędomil, že nám padl do léčky.");
			Doc_PrintLines	( StPl_nDocID,  1, ""); 
			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON za ním uzavâel posvátné chrámové sínę a RHADEMES tak byl na vęky vęků uvęznęn."); 
			
			Doc_PrintLines	( StPl_nDocID,  1, "");  
			Doc_PrintLines	( StPl_nDocID,  1, "");
	};
};

func void InitUse_BookstandMaya ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if  (C_CanReadBookStand () == FALSE)
		{
				StPl_nDocID = 	
				Doc_Create		()			  ;							// DocManager
				Doc_SetPages	( StPl_nDocID,  2 );                         
				Doc_SetPage 	( StPl_nDocID,  0, "Book_MayaGlyph_L.tga", 	0 	);  
				Doc_SetPage 	( StPl_nDocID,  1, "Book_MayaGlyph_R.tga",	0	);
				Doc_SetFont 	( StPl_nDocID, -1, FONT_Book	   				); 	
				Doc_SetMargins	( StPl_nDocID,  0,  275, 20, 30, 20, 1   	);  	
	
	/*
				Doc_PrintLines	( StPl_nDocID,  0, "");
				Doc_PrintLines	( StPl_nDocID,  0, "Oksefd nodnf Kwe");	
				Doc_PrintLines	( StPl_nDocID,  0, "");	
				Doc_PrintLines	( StPl_nDocID,  0, "");
				Doc_PrintLines	( StPl_nDocID,  0, "Sebnejbuwd Weinafiwjf Ihweqpjrann");	
				Doc_PrintLines	( StPl_nDocID,  0, "Erfjkemvefj Hwoqmnyhan ckh" );
				Doc_PrintLines	( StPl_nDocID,  0, "");	
				Doc_PrintLines	( StPl_nDocID,  0, "Revfnbrebuiwe ewohjfribwe wefa");
				Doc_PrintLines	( StPl_nDocID,  0, "");	
				Doc_PrintLines	( StPl_nDocID,  0, "Ejkhfshduhweb isdh Thjdkad");	
				Doc_PrintLines	( StPl_nDocID,  0, "asdkejhnead Gakjesdhad Uhand");	
				Doc_PrintLines	( StPl_nDocID,  0, "");	
				Doc_PrintLines	( StPl_nDocID,  0, "Ihdah Zanshen");	
				Doc_PrintLines	( StPl_nDocID,  0, "");	
				Doc_PrintLines	( StPl_nDocID,  0, "");	
				Doc_PrintLines	( StPl_nDocID,  0, "Fjewheege Egadegsmkd Ygec slaje ");	
				Doc_PrintLines	( StPl_nDocID,  0, "");
				Doc_PrintLines	( StPl_nDocID,  0, "Esfj ewzbfujbwe Iuhdfb");				                                                                                          
					                                                                                          
					                                                                                          
				Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
				Doc_PrintLines	( StPl_nDocID,  1, "");
				Doc_PrintLines	( StPl_nDocID,  1, "Siehdkhnfv Ghlorka");	
				Doc_PrintLines	( StPl_nDocID,  1, "");
				Doc_PrintLines	( StPl_nDocID,  1, "");
				Doc_PrintLines	( StPl_nDocID,  1, "Jomaghe Ohramja");	
				Doc_PrintLines	( StPl_nDocID,  1, "");
				Doc_PrintLines	( StPl_nDocID,  1, "Bam klod Heknaud");	
				Doc_PrintLines	( StPl_nDocID,  1, "Wokan fadudeksJuh" );
				Doc_PrintLines	( StPl_nDocID,  1, "");	
				Doc_PrintLines	( StPl_nDocID,  1, "");	
				Doc_PrintLines	( StPl_nDocID,  1, "Jhdy funikha ");
				Doc_PrintLines	( StPl_nDocID,  1, "");	
				Doc_PrintLines	( StPl_nDocID,  1, "Ehnep Fhika Oiritan");	
				Doc_PrintLines	( StPl_nDocID,  1, "Oiritan Gkoropjia Onham");	
				Doc_PrintLines	( StPl_nDocID,  1, "");	
				Doc_PrintLines	( StPl_nDocID,  1, "");	
				Doc_PrintLines	( StPl_nDocID,  1, "Filiothak Juhama Penn");	
				Doc_PrintLines	( StPl_nDocID,  1, "Vorsiehal Kiman Sik");	
				Doc_PrintLines	( StPl_nDocID,  1, "");	
				Doc_PrintLines	( StPl_nDocID,  1, "Fjewheege Egdgsmkd Ygc slje ");	
				Doc_PrintLines	( StPl_nDocID,  1, "");	
				Doc_PrintLines	( StPl_nDocID,  1, "");
				Doc_PrintLines	( StPl_nDocID,  1, "Oznishdz gdo sek ie");
		*/
				Doc_Show		( StPl_nDocID );
				B_Say (self, self, "$CANTREADTHIS");	
		}
		else
		{			
			if (C_CanReadBookStand ())
			{
					StPl_nDocID = 
					Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( StPl_nDocID,  2 );                         
					Doc_SetPage 	( StPl_nDocID,  0, "Book_MayaRead_L.tga", 	0 	); 
					Doc_SetPage 	( StPl_nDocID,  1, "Book_MayaRead_R.tga",	0	);
					Doc_SetFont 	( StPl_nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( StPl_nDocID,  0,  275, 20, 30, 20, 1   	);  	
					Use_BookstandMaya ();
					Doc_Show		( StPl_nDocID );
			};
		};
	};
		BookstandMayaArt 	= 0;
};


FUNC VOID Use_BookstandMayaHierchary_01_S1()		
{
	BookstandMayaArt 	= 1;
	InitUse_BookstandMaya ();
	if (BookstandMayaHierchary_1_permanent == FALSE)
	&& (C_CanReadBookStand ())
		{
			B_GivePlayerXP (XP_Ambient);
			BookstandMayaHierchary_1_permanent = TRUE;
		};	  
};

FUNC VOID Use_BookstandMayaHierchary_02_S1()		
{
	BookstandMayaArt 	= 2;
	InitUse_BookstandMaya ();
				
	if (BookstandMayaHierchary_2_permanent == FALSE)
	&& (C_CanReadBookStand ())
	{
		B_GivePlayerXP (XP_Ambient);
		BookstandMayaHierchary_2_permanent = TRUE;
	};	
};

FUNC VOID Use_BookstandMayaHierchary_03_S1()		
{
	BookstandMayaArt 	= 3;
	InitUse_BookstandMaya ();

	if (BookstandMayaHierchary_3_permanent == FALSE)
	&& (C_CanReadBookStand ())
	{
		B_GivePlayerXP (XP_Ambient);
		BookstandMayaHierchary_3_permanent = TRUE;
	};	
};

FUNC VOID Use_BookstandMayaHierchary_04_S1()		
{
	BookstandMayaArt 	= 4;
	InitUse_BookstandMaya ();
					
	if (BookstandMayaHierchary_4_permanent== FALSE)
	&& (C_CanReadBookStand ())
	{
		B_GivePlayerXP (XP_Ambient);
		BookstandMayaHierchary_4_permanent = TRUE;
	};
};

FUNC VOID Use_BookstandMayaHierchary_05_S1()	
{
	BookstandMayaArt 	= 5;
	InitUse_BookstandMaya ();

	if (BookstandMayaHierchary_5_permanent == FALSE)
	&& (C_CanReadBookStand ())
	{
		B_GivePlayerXP (XP_Ambient);
		BookstandMayaHierchary_5_permanent = TRUE;
	};
};
