 //**********************************************************************************
//	ItWr_XardasLetterToOpenBook_MIS  an den SC um die HALLEN von Irdorath zu �ffnen!
//----------------------------------------------------------------------------------

INSTANCE ItWr_XardasLetterToOpenBook_MIS		(C_Item)
{
	name 				=	"Lettre de Xarda";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_XardasLetterToOpenBook;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_XardasLetterToOpenBook ()
{   
 
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "J'ai cru que l'un des dragons de la Vall�e des mines �tait la source du Mal."					);
					Doc_PrintLines	( nDocID,  0, "J'avais tort."					);
					Doc_PrintLines	( nDocID,  0, "Si tout s'est d�roul� comme pr�vu,"					);
					Doc_PrintLines	( nDocID,  0, "vous devriez �tre en qu�te des Halls d'Irdorath."					);
					Doc_PrintLines	( nDocID,  0, "Le livre remis � Pyrokar contient tous les indices requis."					);
					Doc_PrintLines	( nDocID,  0, "J'aurais d� savoir pourquoi les Traqueurs"					);
					Doc_PrintLines	( nDocID,  0, "le voulaient tant."					);
					Doc_PrintLines	( nDocID,  0, "R�cup�rez-le !"					);
					Doc_PrintLines	( nDocID,  0, "Les mots 'XARAK BENDARDO' l'ouvrent. N'en parlez � personne !"					);
					Doc_PrintLines	( nDocID,  0, "Je vais m'occuper de choses plus importantes."					);
					Doc_PrintLines	( nDocID,  0, "Je ne peux vous aider pour cette t�che. Vous seul pouvez vaincre le Mal."					);
					Doc_PrintLines	( nDocID,  0, "Nous nous reverrons."					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                             Xardas."					);
					Doc_Show		( nDocID );

	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Dans cette lettre, Xardas m'indique quels mots prononcer pour ouvrir le livre LES HALLS D'IRDORATH."); 
	};

	MIS_Xardas_SCCanOpenIrdorathBook  = TRUE;	//Joly:  Spieler kann nun das Buch im Kloster lesen und findet so die geheime Bibliothek!
};


//**********************************************************************************
//	ItKe_MonastarySecretLibrary_Mis 		Schl�ssel zur geheimen Bibliothek
//**********************************************************************************

INSTANCE ItKe_MonastarySecretLibrary_Mis (C_Item)
{
	name 				=	"Clef" ;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_02;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[0]				= 	"du livre, 'Les Halls d'Irdorath'";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//**********************************************************************************
//	ItWr_HallsofIrdorath_Mis
//**********************************************************************************

INSTANCE ItWr_HallsofIrdorath_Mis (C_ITEM) 
{	
	name 					=	"Les Halls d'Irdorath";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_02_05.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAPSEALED";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_HallsofIrdorath;
};

FUNC VOID Use_HallsofIrdorath ()
{   
		if (MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
		{
			B_Say (self, self, "$SCOPENSIRDORATHBOOK");
		
  			Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  hero, hero, 0, 0, 0, FALSE );
			Snd_Play ("SFX_HealObsession" );

			CreateInvItems (hero,ItWr_HallsofIrdorath_Open_Mis ,1);
			CreateInvItems (hero,ItKe_MonastarySecretLibrary_Mis ,1);
			CreateInvItems (hero,ItWr_UseLampIdiot_Mis ,1);
			
			Print	(PRINT_IrdorathBookHiddenKey);
			B_GivePlayerXP (XP_HallsofIrdorathIsOpen);
			ItWr_HallsofIrdorathIsOpen = TRUE;
			
			B_LogEntry (TOPIC_BuchHallenVonIrdorath,"J'ai r�ussi � ouvrir le livre de Xardas. Il contient un message secret et une �trange clef. Qui sait ce que je pourrais trouver d'autre dans la cave du monast�re."); 
		}
		else
		{
			CreateInvItems (hero,ItWr_HallsofIrdorath_Mis ,1);	//Joly: wegen MAPSEALED!!!!!

			Print (PRINT_IrdorathBookDoesntOpen);
			Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
			Snd_Play 	("MFX_FEAR_CAST" );
		};	
};

//**********************************************************************************
//	ItWr_HallsofIrdorath_Open_Mis
//**********************************************************************************

INSTANCE ItWr_HallsofIrdorath_Open_Mis (C_ITEM) 
{	
	name 					=	"Les Halls d'Irdorath";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_02_05.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_HallsofIrdorath_Open;
};

FUNC VOID Use_HallsofIrdorath_Open ()
{   	 
	if (ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry (TOPIC_BuchHallenVonIrdorath,"J'ai lu le livre de Xardas. Il �voque une biblioth�que secr�te. Elle doit se trouver quelque part dans la cave du monast�re."); 
	};
	
	ItWr_SCReadsHallsofIrdorath = TRUE;
		
	var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "BOOK_MAGE_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "BOOK_MAGE_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages 
 					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "...et j'ai cach� l'entr�e de la biblioth�que derri�re une porte pour prot�ger mes archives sur les temples de B�liar.");
					Doc_PrintLines	( nDocID,  0, "Si mes fr�res en avaient appris l'existence, ces idiots les auraient d�truites.");		
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);										
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Tout ce qu'ils savent c�est que ces temples ont exist�."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "J'ai fait jurer � des serviteurs de prot�ger la biblioth�que.");
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "La clef ouvre la derni�re porte.");
					
					Doc_Show		( nDocID );

	
};
//**********************************************************************************
//	ItWr_XardasSeamapBook_Mis
//**********************************************************************************

INSTANCE ItWr_XardasSeamapBook_Mis (C_ITEM) 
{	
	name 					=	"Livre poussi�reux.";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_02_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_XardasSeamapBook_Mis;
};

FUNC VOID Use_XardasSeamapBook_Mis ()
{   	 

	var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "BOOK_BROWN_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "BOOK_BROWN_R.tga" , 0		); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages 
 					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "... Je suis d�sormais certain que le b�timent est en fait les Halls d'Irdorath. Ils sont situ�s sur une �le proche du port de Khorinis. L'int�r�t de B�liar pour les mines est �vident...");
					Doc_PrintLines	( nDocID,  0, "");		
	
					if (hero.guild == GIL_PAL)
					{
						Doc_PrintLines	( nDocID,  0, "... Plus ils sont forts, plus ils semblent avoir de valeur � ses yeux en tant que serviteurs morts-vivants. Il est tr�s dur de vaincre ces paladins d�chus. J�ai mis la main sur l'un d'eux. J'esp�re que personne ne remarquera sa pr�sence...");		
						
						//2.Seite
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
						Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
						Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
						Doc_PrintLine	( nDocID,  1, ""					);
						Doc_PrintLines	( nDocID,  1, "...le paladin d�chu ne semble plus r�agir � aucun stimulus. Je conserve son armure et ses autres possessions dans l'arri�re-salle, dont la porte ne peut �tre ouverte que de l'int�rieur. J'ai cr�� une rune de t�l�portation permettant d'acc�der � cette pi�ce. Les instructions de celle-ci se trouvent dans l'almanach, afin que l'Elu puisse les trouver..."	);
					};
					
					if (hero.guild == GIL_KDF)
					{
						Doc_PrintLines	( nDocID,  0, "... Les signes sont �vidents ! Quand l'Elu arrivera, il aura besoin de toute notre aide. B�liar est d�j� trop puissant. J'ai r�ussi � obtenir quelques artefacts que je conserverai ici, au cas o�. Je pense que l'Elu �mergera de nos rangs,");
						
						//2.Seite
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
						Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
						Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
						Doc_PrintLines	( nDocID,  1, "j'ai donc laiss� des instructions � son intention dans l'almanach."					);
						Doc_PrintLine	( nDocID,  1, ""					);
						Doc_PrintLines	( nDocID,  1, "�J'en suis maintenant certain. Nous ne pouvons �chapper au destin. D�s que B�liar se sentira assez puissant, il cherchera � dominer le monde. Je dois trouver l'Elu, sinon nous sommes perdus."); 
					};
					
					if (hero.guild == GIL_DJG)
					{
						Doc_PrintLines	( nDocID,  0, "... Il y aura la guerre, une guerre pour l'avenir du monde. Il semble que je sois le seul � pouvoir interpr�ter les signes. Les autres semblent les ignorer. L'Elu viendra et sa venue annoncera le d�but de la guerre. C'est une guerre aussi vieille que le temps mais la fin semble proche.");
						
						//2.Seite
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
						Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
						Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
						Doc_PrintLines	( nDocID,  1, "Je ne resterai pas sans rien faire en laissant les autres d�cider du destin du monde."					);
						Doc_PrintLine	( nDocID,  1, ""					);
						Doc_PrintLines	( nDocID,  1, "... J'ai �tudi� les anciens �crits et j'ai d�couvert comment fabriquer les armes l�gendaires des seigneurs des dragons. Mais j'ignore comment obtenir les ingr�dients n�cessaires. J'ai mis la recette dans l�almanach au cas o�. Qui sait quelles terreurs nous r�serve l'avenir ? Peut-�tre des dragons..."); 
					};					
					
					Doc_Show		( nDocID );
};


//**********************************************************************
//	geheime Nachricht geheimer Schalter Lampe
//**********************************************************************


INSTANCE ItWr_UseLampIdiot_Mis	(C_Item)
{
	name 				=	"Lettre chiffonn�e";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	50;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseItWr_UseLampIdiot_Mis;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=	"du livre, 'Les Halls d'Irdorath'";
};
func void UseItWr_UseLampIdiot_Mis ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_BookHeadline);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "              La lampe porte la lumi�re"						);
					Doc_PrintLine	(nDocID,  0, "          dans les terres inf�rieures"						);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
		
}; 



//**********************************************************************************
//	ItWr_Seamap_Irdorath
//**********************************************************************************

INSTANCE ItWr_Seamap_Irdorath (C_Item)
{	
	name 					=	"Carte pour l��le d'Irdorath";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Seamap_Irdorath;

	description				= name;
	TEXT[0]					= "";
	TEXT[1]					= "";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};


FUNC VOID Use_Seamap_Irdorath ()
{
	var int nDocID;
	
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
				Doc_SetPages	( nDocID, 1 );                         
				Doc_SetPage 	( nDocID, 0, "Map_NewWorld_Seamap.tga", 	1	);  //  1 -> DO NOT SCALE 
				Doc_Show		( nDocID 	);
	
	if  (MIS_ShipIsFree == FALSE)
		&& (Kapitel < 6)
	 	{
			B_Say (self, self, "$IRDORATHTHEREYOUARE");
		};
	
	if (MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic (TOPIC_SHIP, LOG_MISSION);                                                                   
	    Log_SetTopicStatus(TOPIC_SHIP, LOG_RUNNING);                                                                 
	    B_LogEntry (TOPIC_SHIP,"Il semble que je doive me rendre sur l'�trange �le de l'ennemi. Mais il me faut un bateau, un �quipage et un capitaine.");
		B_GivePlayerXP (XP_SCKnowsWayToIrdorath);
	};

	MIS_SCKnowsWayToIrdorath  = TRUE;
};

//**********************************************************************
//	Gef�lschter Brief von Lee zum benutzen des Schiffes
//**********************************************************************


INSTANCE ITWr_ForgedShipLetter_MIS	(C_Item)
{
	name 				=	"Papier du navire";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	50;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseITWr_ForgedShipLetter_MIS;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"Lettre d'autorisation";
	TEXT[4]				=   "pour le navire des paladins.";
};
func void UseITWr_ForgedShipLetter_MIS ()
{   
		var int nDocID;
		
//Joly:VORSICHT : Dieser Brief ist ein ERM�CHTIGUNGSSCHREIBEN f�r das Schiff und kann von LEE oder dem Richter stammen. NICHT zwangsl�ufig von Lord Hagen oder gef�lscht!!!!!!!!!

		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_BookHeadline);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "Lettre d'autorisation"							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "        Le porteur de ce document"					);
					Doc_PrintLine	(nDocID,  0, "       est  libre de circuler sur la gal�re"		);
					Doc_PrintLine	(nDocID,  0, "       du seigneur Hagen et d'en prendre le"		);
					Doc_PrintLine	(nDocID,  0, "       commandement � volont�."			);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "           Sceau royal"							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
		
}; 

INSTANCE ITKE_OC_MAINGATE_MIS(C_Item)
{
	name 				=	"Clef de la tour de garde";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ITKE_SHIP_LEVELCHANGE_MIS(C_Item)	//Joly: f�hrt zum Levelchange Kapitel 6!!!!!!!!!!!!!!!!!!!!!!
{
	name 				=	"Clef cabine du capitaine";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	10;	

	visual 			=	"ItMi_Flask.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_PotionOfDeath;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Les Larmes d'Innos";
	
	TEXT[1]			= 	"???";				
	COUNT[1]		= 	Mana_Essenz;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

	FUNC VOID UseItPo_PotionOfDeath()
	{
		IF (hero.guild == GIL_KDF)
		{
 			Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",  hero, hero, 0, 0, 0, FALSE );
			Snd_Play ("SFX_HealObsession" );
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];		 
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
			
			Npc_ChangeAttribute (self,	ATR_STRENGTH  	,5);
			self.aivar[REAL_STRENGTH] = self.aivar[REAL_STRENGTH] + 5;
			Npc_ChangeAttribute (self,	ATR_DEXTERITY  	,5);
			self.aivar[REAL_DEXTERITY] = self.aivar[REAL_DEXTERITY] + 5;
			
			PrintScreen	(PRINT_LearnSTR5, -1, 45, FONT_SCREEN, 2);
			PrintScreen	(PRINT_LearnDex5, -1, 55, FONT_SCREEN, 2);
			PrintScreen (PRINT_FullyHealed, - 1, 65, FONT_Screen, 2); 
			Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Speed);
		}
		else
		{
			
												
			AI_Wait (hero,3);
			AI_PlayAni (self, "S_FIRE_VICTIM"); 
			Wld_PlayEffect("VOB_MAGICBURN",  hero, hero, 0, 0, 0, FALSE );
			B_Say (self,self, "$Dead");
			AI_StopFX	(self, "VOB_MAGICBURN");
			Npc_ChangeAttribute	(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);	
			NPC_StopAni (self,"S_FIRE_VICTIM");
			
			
		};
	};
	

	
INSTANCE ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	10;	

	visual 			=	"ItMi_Flask.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_PotionOfDeath;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Les Larmes d'Innos";
	TEXT[1]			= 	"La potion octroie aux mages des pouvoirs sp�ciaux.";
	Text[2]			=   "Tout autre utilisateur en mourra.";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

//************************************************
//	Amulett des Todes
//************************************************

INSTANCE  ItAm_AmulettOfDeath_Mis(C_Item)
{
	name 			=	"Aura divine d'Innos";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"ItAm_Prot_Fire_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip		=	UnEquip_ItAm_AmulettOfDeath_Mis;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "L'aura divine d'Innos.";
	
	TEXT[2]			= "Cette amulette prot�ge son porteur";
	TEXT[3]			= "de toute forme de d�g�ts.";
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_AmulettOfDeath_Mis()
	{
	 	self.protection [PROT_EDGE]   += 30;
		self.protection [PROT_BLUNT]  += 30;
		self.protection [PROT_POINT]  += 30;
		self.protection [PROT_FIRE]   += 30;
		self.protection [PROT_MAGIC]  += 30;
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",  self, self, 0, 0, 0, FALSE );
		AI_PlayAni (self,"T_MAGRUN_2_HEASHOOT");	
		AI_StandUp (self);
		Snd_Play ("MFX_FIRERAIN_INVEST"); 
	};

	FUNC VOID UnEquip_ItAm_AmulettOfDeath_Mis()
	{
		self.protection [PROT_EDGE]   -= 30;
		self.protection [PROT_BLUNT]  -= 30;
		self.protection [PROT_POINT]  -= 30;
		self.protection [PROT_FIRE]   -= 30;
		self.protection [PROT_MAGIC]  -= 30;
	};
	
/******************************************************************************************/
//	Heiltrank f�r Randolph																	//
/******************************************************************************************/
INSTANCE ItPo_HealRandolph_MIS(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI|ITEM_MISSION;

	value 			=	Value_HpEssenz;	

	visual 			=	"ItMi_Flask.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	Use_HealRandolph;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Baume de d�pendance";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Essenz;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpEssenz;
};

	FUNC VOID Use_HealRandolph()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Essenz);
	};	
