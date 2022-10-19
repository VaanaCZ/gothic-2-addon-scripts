
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
					Doc_PrintLines	( nDocID,  0, "Crimson : 79 pépites d'or reçues et fondues"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Scatty : marchandises reçues à hauteur de 250 pièces d'or"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Garaz : 6 pépites d'or reçues"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Tous les gardes : 9 pépites d'or reçues"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "Camp :"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Gardes de Raven : 25 pièces d'or"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Finn : 60 pièces d'or"					);
					Doc_PrintLines	( nDocID,  1, "Lennar : 40 pièces d'or"); 
					Doc_PrintLines	( nDocID,  1, "Emilio : 50 pièces d'or"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Autres : 20 pièces d'or"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Huno, Fisk, Snaf : selon les marchandises"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Chasseurs : que le chef s'occupe d'eux ! Franco a reçu 7 pièces d'or");
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
			Doc_PrintLines	( StPl_nDocID,  0, "...car seuls les VEILLEURS DES MORTS peuvent invoquer les anciens.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Leur absence nous fait cruellement défaut. Sans le conseil des anciens, nous sommes à la merci des nôtres.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Les SOIGNEURS avaient pour mission de sceller le portail et d'en détruire la clef. Adanos seul sait ce qui a pu advenir d'eux, ou même s'ils ont atteint leur objectif.");         
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "La CASTE DES GUERRIERS a été anéantie par la furie d'Adanos. Le cœur du vieux prince guerrier est brisé."		);  
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Seuls les PRETRES restants gardent espoir et prêchent inlassablement la renaissance de notre ville autrefois magnifique.");
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Toutefois, nous, les ERUDITS, connaissons l'effroyable vérité. JHARKENDAR est tombé, et sera inéluctablement emporté par les flots du temps.");
			Doc_PrintLines	( StPl_nDocID,  1, "");        
	}
	else if (BookstandMayaArt == 2)     //Joly: objektieren egal wo, nur nicht Entrance.                     
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "RHADEMES a été emprisonné à tout jamais dans le temple d'ADANOS, mais la puissance de l'épée n'a pas été anéantie.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Son influence était devenue trop immense. Les rues étaient sans cesse le théâtre de massacres.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "La furie d'ADANOS pénétrait toute chose. La mer, elle-même, se dressa au-dessus de JHARKENDAR, inondant la ville toute entière.");
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Seuls les temples et édifices érigés sur les hauteurs furent presque épargnés.");
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLines	( StPl_nDocID,  1, "Les rares citoyens ayant survécu à ce cataclysme ne trouvèrent pas la force de reconstruire la ville.");
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLines	( StPl_nDocID,  1, "Ainsi fut scellé le destin de JHARKENDAR.");

			if ( SC_Knows_WeaponInAdanosTempel == FALSE)
			{				
				B_GivePlayerXP (XP_Ambient);
				SC_Knows_WeaponInAdanosTempel = TRUE;
			};
	}
	else if (BookstandMayaArt == 3)                  
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "L'âge de QUARHODRON ne lui permettait plus de diriger notre armée. C'est pourquoi les prêtres firent valoir à son encontre leur droit de prééminence.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Ils lui ordonnèrent de démissionner et de leur remettre l'épée.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Le Conseil des Cinq devait élire son successeur. Toutefois, la caste des guerriers refusa au Conseil le droit de voter.");
	                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Les guerriers refusaient de se soumettre plus longtemps à l'autorité du Conseil des Cinq, et élirent RHADEMES, fils de QUARHODRON, à la tête de leur caste.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Par orgueil, trompé par la confiance qu'il accordait à sa chair et son sang, QUARHODRON céda à leur requête.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Il remit l'épée à son fils, dans l'espoir qu'il la manierait d'une main aussi forte et juste que la sienne.");
	} 
	else if (BookstandMayaArt == 4)  
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Mais RHADEMES était faible. La volonté de l'épée le vainquit, et fit de lui son instrument.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Même les soigneurs ne parvinrent pas à soulager la souffrance et l'infamie qu'il fit déferler sur notre peuple dans son aveuglement.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "L'épée comprit rapidement que ce peuple était trop faible pour s'opposer à ses desseins.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Seule la puissance de nos anciens pouvait s'élever contre elle.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Elle ordonna donc à RHADEMES de bannir ou d'exécuter tous les veilleurs des morts, anéantissant ainsi tout espoir de nous délivrer de ce mal.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Ainsi, il ne restait plus un seul veilleur des morts lorsque les quatre chefs de notre peuple, destitués de leur pouvoir, prirent l'amère décision d'abandonner JHARKENDAR.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "La guerre faisait rage dans les rues... C'est alors que les soigneurs partirent sceller à tout jamais l'unique entrée de notre vallée.");
	}
	else if (BookstandMayaArt == 5)
	{
			Doc_PrintLines	( StPl_nDocID,  0, "");  
			Doc_PrintLines	( StPl_nDocID,  0, "En ces lieux, QUARHODRON, le grand prêtre KHARDIMON et moi-même élaborâmes d'un plan pour vaincre RHADEMES et l'épée.");
			Doc_PrintLines	( StPl_nDocID,  0, "");  
			Doc_PrintLines	( StPl_nDocID,  0, "QUARHODRON et KHARDIMON estimaient tous deux qu'en unissant nos forces, nous pouvions vaincre RHADEMES au cours d'un combat. Mais je connaissais trop bien la puissance de l'épée pour croire à cette hypothèse.");
			Doc_PrintLines	( StPl_nDocID,  0, "");	
			Doc_PrintLines	( StPl_nDocID,  0, "Je me dressai donc contre la décision des autres, estimant que seule une ruse nous permettrait de venir à bout de RHADEMES.");			

			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLines	( StPl_nDocID,  1, ""		);  

			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON se soumit à la décision du Conseil. Il se rendit au temple d'Adanos, et fit mander son fils.");                   
			Doc_PrintLines	( StPl_nDocID,  1, "");  
			Doc_PrintLines	( StPl_nDocID,  1, "La haine qui dévorait son fils avait pris une telle ampleur que RHADEMES s'engouffra dans le temple ivre de rage, déterminé à exécuter son père.");                
			Doc_PrintLines	( StPl_nDocID,  1, "");  
			Doc_PrintLines	( StPl_nDocID,  1, "Il ne découvrit que trop tard quelles étaient nos intentions.");
			Doc_PrintLines	( StPl_nDocID,  1, ""); 
			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON scella les salles sacrées du temple derrière lui, et RHADEMES fut emprisonné dans le temple pour l'éternité."); 
			
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
