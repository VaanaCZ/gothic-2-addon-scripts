
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

					Doc_PrintLine	( nDocID,  0, "Mine"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Crimson: 79 Goldbrocken erhalten und eingeschmolzen"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Scatty: Waren für 250 Gold erhalten"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Garaz: 6 Goldbrocken erhalten"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Alle Wachen: 9 Goldbrocken erhalten"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Lager:  "					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Raven's Garde: 25 Goldstücke"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Finn: 60 Goldstücke"					);
					Doc_PrintLines	( nDocID,  1, "Lennar: 40 Goldstücke"); 
					Doc_PrintLines	( nDocID,  1, "Emilio: 50 Goldstücke"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Andere: 20 Goldstücke"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Huno, Fisk, Snaf: je nach Waren"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Jäger: Soll sich der Anführer drum kümmern! Franco 7 Goldbrocken erhalten");
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
			Doc_PrintLines	( StPl_nDocID,  0, "...denn nur den TOTENWÄCHTERN war es möglich die Ahnen zu rufen. ");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Ihre Abwesenheit schmerzt tief. Ohne den Rat der Ahnen sind wir der Willkür unseres Volkes ausgeliefert.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Die HEILER wurden entsandt, das Portal zu versiegeln und den Schlüssel zu vernichten. Nur Adanos weiß, was mit ihnen geschah und ob sie ihr Ziel jemals erreichten.");         
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Die KRIEGERKASTE ist vernichtet durch den Zorn Adanos. Das Herz des alten Kriegerfürsten ist gebrochen. "		);  
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Nur die verbliebenen PRIESTER schüren noch die Hoffnung und predigen unablässig von der Wiederauferstehung unserer einst so prächtigen Stadt. ");
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Doch wir, die GELEHRTEN, kennen die bittere Wahrheit. JHARKENDAR ist gefallen und wird im Strom der Zeit vergehen.");
			Doc_PrintLines	( StPl_nDocID,  1, "");        
	}
	else if (BookstandMayaArt == 2)     //Joly: objektieren egal wo, nur nicht Entrance.                     
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "RHADEMES war auf immer eingeschlossen im Tempel ADANOS, doch die Macht des Schwertes war nicht gebrochen.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Sein Einfluss war schon zu groß geworden. Das Morden in den Strassen wollte nicht enden.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "ADANOS Zorn war es, der alles beendete. Das Meer erhob sich über JHARKENDAR und überflutete die ganze Stadt.");
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Nur noch die höher gelegenen Tempel und Bauwerke waren nahezu unangetastet geblieben.");
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLines	( StPl_nDocID,  1, "Die wenigen, die diese Katastrophe überlebten, hatten nunmehr nicht mehr die Kraft, die Stadt wieder aufzubauen.");
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLines	( StPl_nDocID,  1, "Und so war das Schicksal von JHARKENDAR besiegelt.");

			if ( SC_Knows_WeaponInAdanosTempel == FALSE)
			{				
				B_GivePlayerXP (XP_Ambient);
				SC_Knows_WeaponInAdanosTempel = TRUE;
			};
	}
	else if (BookstandMayaArt == 3)                  
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "QUARHODRONs Alter machte es ihm unmöglich, unser Heer zu führen. Und so bestanden die Priester auf ihrem Recht der Befehlsgewalt über ihn.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Sie wiesen ihn an, sein Amt niederzulegen und das Schwert weiterzugeben.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Der Rat der Fünf sollte seine Nachfolge bestimmen. Doch die Kaste der Krieger verweigerte dem Rat die Wahl.");
	                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Die Krieger wollten sich nicht länger dem Rat der Fünf fügen und erwählten seinen Sohn RHADEMES zu ihrem neuen Anführer. ");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Aus Stolz und Vertrauen in sein eigen Fleisch und Blut erschied QUARHODRON sich dazu, ihnen nachzugeben.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Er überreichte das Schwert seinem Sohn in der Hoffnung, dass er es mit der gleichen starken Hand führen möge, wie er selbst es einst tat.");
	} 
	else if (BookstandMayaArt == 4)  
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "RHADEMES war schwach. Der Wille des Schwertes übermannte ihn und machte ihn zu seinem Werkzeug.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Das Leid und die Grausamkeiten, die er in seiner Verblendung über unser Volk brachte, vermochten nicht einmal mehr die Heiler zu lindern. ");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Das Schwert erkannte schnell, das das Volk zu schwach war um seine Pläne zu durchkreuzen.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Allein die Macht unserer Ahnen konnte ihm noch gefährlich werden. ");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Und so ließ es RHADEMES alle Totenwächter verbannen oder hinrichten, und machte so jede Hoffnung auf Erlösung von diesem Übel zunichte.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "So war kein einziger der Totenwächter mehr zugegen, als die verbliebenen vier entmachteten Anführer unseres Volkes den bitteren Entschluss fassten, JHARKENDAR aufzugeben.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Der Krieg tobte in den Strassen, als die Heiler aufbrachen, um den einzigen Zugang zu unserem Tal für immer zu verschliessen.");
	}
	else if (BookstandMayaArt == 5)
	{
			Doc_PrintLines	( StPl_nDocID,  0, "");  
			Doc_PrintLines	( StPl_nDocID,  0, "QUARHODRON, der Hohepriester KHARDIMON und ich selbst berieten in diesen Hallen über einen Weg, RHADEMES und das Schwert zu bezwingen.");
			Doc_PrintLines	( StPl_nDocID,  0, "");  
			Doc_PrintLines	( StPl_nDocID,  0, "QUARHODRON und KHARDIMON waren der Meinung, RHADEMES mit vereinten Kräften im Kampf besiegen zu können. Doch ich kannte die Macht des Schwertes zu gut, um daran glauben zu können.");
			Doc_PrintLines	( StPl_nDocID,  0, "");	
			Doc_PrintLines	( StPl_nDocID,  0, "So machte ich von meinem Recht Gebrauch, die Entscheidung der beiden anderen zu überstimmen. Ich beschloß stattdessen, RHADEMES mit einer List zu überwinden.");			

			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLines	( StPl_nDocID,  1, ""		);  

			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON folgte der Entscheidung des Rates. Er begab sich in den Tempel Adanos und schickte nach seinem Sohn.");                   
			Doc_PrintLines	( StPl_nDocID,  1, "");  
			Doc_PrintLines	( StPl_nDocID,  1, "Der Hass seines Sohnes hatte schon solche Gestalt angenommen, daß RHADEMES in wilder Raserei in den Tempel stürmte, um seinen Vater zu richten.");                
			Doc_PrintLines	( StPl_nDocID,  1, "");  
			Doc_PrintLines	( StPl_nDocID,  1, "Er erkannte unsere Pläne erst, als es für ihn zu spät war.");
			Doc_PrintLines	( StPl_nDocID,  1, ""); 
			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON verschloss die heiligen Kammern des Tempels hinter sich, und RHADEMES war für alle Zeiten im Tempel gefangen."); 
			
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
