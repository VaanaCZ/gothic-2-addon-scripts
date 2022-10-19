
//*************************************
//	Buchst�nder im Banditenlager
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

					Doc_PrintLine	( nDocID,  0, "D�l"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Crimson: 79 zlat�ch nugget� z�sk�no a roztaveno"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Scatty: Z�sk�no zbo�� za 250 zlat�ch"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Garaz: z�sk�no 6 zlat�ch nugget�"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "V�echny str�e: z�sk�no 9 zlat�ch nugget�"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "T�bor:"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Havranovy str�e: 25 zla��k�"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Finn: 60 zla��k�"					);
					Doc_PrintLines	( nDocID,  1, "Lennar: 40 zla��k�"); 
					Doc_PrintLines	( nDocID,  1, "Emilio: 50 zla��k�"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Ostatn�: 20 zla��k�"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Huno, Fisk, Snaf: ka�d� podle zbo��"					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Lovci: Tohle je v�c velitele! Franco obdr�el 7 zla��k�.");
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
	if (BookstandMayaArt == 1)		//Joly:  �berall objektieren!
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "...proto�e pouze STR��CI SMRTI mohou vyvol�vat p�edky.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Velmi n�m tu chyb�. Bez rady star��ch jsme vyd�ni na milost lidu.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "L��ITEL� m�li uzav��t port�l a zni�it kl��. Jen Adanos v�, co se s nimi stalo a zda sv�j �kol splnili.");         
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "V�LE�NICKOU KASTU zni�il Adanos sv�m hn�vem. Srdce prince star�ch v�le�n�k� je zlomeno."		);  
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Jen zbyl� KN̎� si zachovali nad�ji a st�le hl�saj�, �e na�e m�sto se znovu obrod� a bude kr�sn� a slavn� jako d��ve.");
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "U�ENCI v�ak znaj� trpkou pravdu. JHARKENDAR padl a �eka �asu ho brzy odplav�.");
			Doc_PrintLines	( StPl_nDocID,  1, "");        
	}
	else if (BookstandMayaArt == 2)     //Joly: objektieren egal wo, nur nicht Entrance.                     
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "RHADEMES byl nav�ky uv�zn�n v ADANOV� chr�mu, ale moc me�e zlomena nebyla.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Jeho moc byla p��li� velk�. To vra�d�n� na ulic�ch hned tak neskon��.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Hn�v ADAN�V skoncoval se v��m. Mo�e se vzedmulo, zaplavilo JHARKENDAR a cel� m�sto se ocitlo pod vodou.");
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Nedot�en� z�staly jen chr�my a budovy na vyv��en�ch m�stech.");
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLines	( StPl_nDocID,  1, "N�kolik m�lo p�e�iv��ch u� nem�lo sil znovu vystav�t m�sto.");
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLine	( StPl_nDocID,  1, ""		);                                    
			Doc_PrintLines	( StPl_nDocID,  1, "A tak byl osud JHARKENDARU zpe�et�n.");

			if ( SC_Knows_WeaponInAdanosTempel == FALSE)
			{				
				B_GivePlayerXP (XP_Ambient);
				SC_Knows_WeaponInAdanosTempel = TRUE;
			};
	}
	else if (BookstandMayaArt == 3)                  
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "V�k QUARHODRONOVI nedovoloval velet vojsku, a tak kn�� trvali na tom, �e ho dle sv�ho pr�va povedou oni.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Nak�zali mu, aby slo�il ��ad a p�edal jim me�.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Rada p�ti pak m�la ur�it n�sledn�ka. V�le�nick� kasta v�ak jejich rozhodnut� nep�ijala.");
	                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "V�le�n�ci se rozhodli, �e se Rad� p�ti nepod��d� a zvolili si za v�dce jeho syna RHADEMESE.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON ji� natolik ztratil hrdost a v�ru ve vlastn� krev, �e se jim podvolil.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "P�edal me� synovi v nad�ji, �e jej bude t��mat rukou stejn� silnou, jako byla pa�e otcova.");
	} 
	else if (BookstandMayaArt == 4)  
	{
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "RHADEMES byl slab�. Neodolal zl� v�li me�e a nechal se od n�j zcela ovl�dnout.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Ani l��itel� u� nedok�� zm�rnit utrpen� a ukrutn� zv�rstva, kter� na n� lid svou zaslepenost� p�ivolal.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Me� si rychle uv�domil, �e lid� jsou p��li� slab�, ne� aby ohrozili jeho pl�ny.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			Doc_PrintLines	( StPl_nDocID,  0, "Ty m��e naru�it pouze moc na�ich p�edk�.");
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                    
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "A tak RHADEMES vyhnal nebo popravil v�echny str�ce smrti a zni�il tak v�echny nad�je, �e se kdy tohoto zla zbav�me.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "Nakonec u� nezbyl ani jedin� str�ce mrtv�ch a nastal �as u�init ho�k� a zoufal� rozhodnut�. Posledn� �ty�i v�dcov� ani nem�li na vybranou: museli se vzd�t JHARKENDARU.");
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  1, "V ulic�ch zu�ila v�lka, kdy� l��itel� nav�dy uzav�eli jedin� vchod do �dol�.");
	}
	else if (BookstandMayaArt == 5)
	{
			Doc_PrintLines	( StPl_nDocID,  0, "");  
			Doc_PrintLines	( StPl_nDocID,  0, "V t�chto s�n�ch jsme se s QUARHODRONEM a velekn�zem KHARDIMONEM sna�ili naj�t zp�sob, jak porazit RHADEMESE a zlomit moc me�e.");
			Doc_PrintLines	( StPl_nDocID,  0, "");  
			Doc_PrintLines	( StPl_nDocID,  0, "QUARHODRON a KHARDIMON zast�vali n�zor, �e spojen�mi silami m��eme RHADEMESE v bitv� porazit. J� v�ak znal moc me�e p��li� dob�e, ne� abych uv��il, �e by n�co takov�ho bylo mo�n�.");
			Doc_PrintLines	( StPl_nDocID,  0, "");	
			Doc_PrintLines	( StPl_nDocID,  0, "A tak jsem rozhodnut� sv�ch spolubrat�� vetoval a rozhodl, �e bychom proti RHADAMESOVI m�li pou��t sp�e �skok.");			

			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLines	( StPl_nDocID,  1, ""		);  

			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON uposlechl rozhodnut� rady. Vstoupil do Adanova chr�mu a poslal pro sv�ho syna.");                   
			Doc_PrintLines	( StPl_nDocID,  1, "");  
			Doc_PrintLines	( StPl_nDocID,  1, "Jeho syn RHADAMES v sob� choval takovou nen�vist, �e v touze zab�t otce zu�iv� vtrhl do chr�mu.");                
			Doc_PrintLines	( StPl_nDocID,  1, "");  
			Doc_PrintLines	( StPl_nDocID,  1, "A� p��li� pozd� si uv�domil, �e n�m padl do l��ky.");
			Doc_PrintLines	( StPl_nDocID,  1, ""); 
			Doc_PrintLines	( StPl_nDocID,  1, "QUARHODRON za n�m uzav�el posv�tn� chr�mov� s�n� a RHADEMES tak byl na v�ky v�k� uv�zn�n."); 
			
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
