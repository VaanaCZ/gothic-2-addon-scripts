 //**********************************************************************************
//	ItWr_XardasLetterToOpenBook_MIS  an den SC um die HALLEN von Irdorath zu �ffnen!
//----------------------------------------------------------------------------------

INSTANCE ItWr_XardasLetterToOpenBook_MIS		(C_Item)
{
	name 				=	"Carta de Xardas";

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
					Doc_PrintLines	( nDocID,  0, "Cre�a que uno de los dragones del Valle de las Minas era la fuente del mal."					);
					Doc_PrintLines	( nDocID,  0, "Estaba equivocado."					);
					Doc_PrintLines	( nDocID,  0, "Si todo ha sucedido como espero,"					);
					Doc_PrintLines	( nDocID,  0, "ahora deber�as estar buscando los salones de Irdorath."					);
					Doc_PrintLines	( nDocID,  0, "El libro que diste a Pyrokar contiene todas las pistas que necesitas."					);
					Doc_PrintLines	( nDocID,  0, "Deber�a haber sabido por qu� lo quer�an los buscadores"					);
					Doc_PrintLines	( nDocID,  0, "tan desesperadamente."					);
					Doc_PrintLines	( nDocID,  0, "�Tienes que recuperarlo!"					);
					Doc_PrintLines	( nDocID,  0, "Se abre diciendo ''XARAK BENDARDO''. �No se lo digas a nadie!"					);
					Doc_PrintLines	( nDocID,  0, "Ahora atender� asuntos m�s importantes."					);
					Doc_PrintLines	( nDocID,  0, "No puedo ayudarte con tu �ltima tarea. Solo t� puedes derrotar a la fuente del mal."					);
					Doc_PrintLines	( nDocID,  0, "�Ya nos veremos!"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                             Xardas."					);
					Doc_Show		( nDocID );

	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry (TOPIC_BuchHallenVonIrdorath,"En esta carta, Xardas me informa de las palabras que hay que decir para abrir el libro LOS SALONES DE IRDORATH."); 
	};

	MIS_Xardas_SCCanOpenIrdorathBook  = TRUE;	//Joly:  Spieler kann nun das Buch im Kloster lesen und findet so die geheime Bibliothek!
};


//**********************************************************************************
//	ItKe_MonastarySecretLibrary_Mis 		Schl�ssel zur geheimen Bibliothek
//**********************************************************************************

INSTANCE ItKe_MonastarySecretLibrary_Mis (C_Item)
{
	name 				=	"Llave" ;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_02;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[0]				= 	"Del libro ''Los salones de Irdorath''.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//**********************************************************************************
//	ItWr_HallsofIrdorath_Mis
//**********************************************************************************

INSTANCE ItWr_HallsofIrdorath_Mis (C_ITEM) 
{	
	name 					=	"Los salones de Irdorath";

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
			
			B_LogEntry (TOPIC_BuchHallenVonIrdorath,"He podido abrir el libro de Xardas. Contiene un mensaje secreto y una extra�a llave. Qui�n sabe qu� m�s podr� encontrar en el s�tano del monasterio."); 
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
	name 					=	"Los salones de Irdorath";

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
		B_LogEntry (TOPIC_BuchHallenVonIrdorath,"He le�do el libro de Xardas. Menciona una biblioteca secreta. Deber�a estar en alg�n lugar del s�tano del monasterio."); 
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
					Doc_PrintLines	( nDocID,  0, "... Y as� escond� la entrada de la biblioteca tras una puerta secreta, para proteger mis documentos de los templos de Beliar.");
					Doc_PrintLines	( nDocID,  0, "Si mis hermanos hubieran conocido esos documentos, probablemente los habr�an destruido.");		
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);										
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Por ahora todo lo que saben es que esos templos exist�an en el pasado."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "Solo para asegurarme, he tomado juramento a algunos servidores para que protejan la biblioteca.");
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "La llave abre la �ltima puerta.");
					
					Doc_Show		( nDocID );

	
};
//**********************************************************************************
//	ItWr_XardasSeamapBook_Mis
//**********************************************************************************

INSTANCE ItWr_XardasSeamapBook_Mis (C_ITEM) 
{	
	name 					=	"Libro polvoriento";

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
					Doc_PrintLines	( nDocID,  0, "... Ahora estoy seguro de que el edificio son los salones de Irdorath. Est�n en una isla, cerca del puerto de Khorinis. El inter�s de Beliar por la mina de mineral es evidente...");
					Doc_PrintLines	( nDocID,  0, "");		
	
					if (hero.guild == GIL_PAL)
					{
						Doc_PrintLines	( nDocID,  0, "... Cuanto m�s fuertes son, m�s valiosos parecen ser para �l, en forma de sirvientes muertos vivientes. Estos paladines transformados resultan dif�ciles de superar para cualquier guerrero. Uno de ellos ha ca�do en mis manos. Solo espero que los dem�s no descubran su presencia aqu� abajo...");		
						
						//2.Seite
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
						Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
						Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
						Doc_PrintLine	( nDocID,  1, ""					);
						Doc_PrintLines	( nDocID,  1, "�el palad�n transformado no parece reaccionar ya a ning�n est�mulo. He guardado su armadura y el resto de sus pertenencias en el cuarto trasero. La puerta s�lo se puede abrir desde dentro. He construido una runa de teletransporte para entra. He puesto las instrucciones en el almanaque para que el Elegido las encuentre..."	);
					};
					
					if (hero.guild == GIL_KDF)
					{
						Doc_PrintLines	( nDocID,  0, "... �Las se�ales son inequ�vocas! Cuando venga el Elegido, necesitar� toda la ayuda que podamos darle. Beliar ya es demasiado fuerte. He podido conseguir algunos valiosos artefactos que guardar� aqu�, por si acaso. Sospecho que el Elegido surgir� de entre los nuestros,");
						
						//2.Seite
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
						Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
						Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
						Doc_PrintLines	( nDocID,  1, "por eso le he escrito instrucciones en el alman�que."					);
						Doc_PrintLine	( nDocID,  1, ""					);
						Doc_PrintLines	( nDocID,  1, "... Ahora estoy seguro. No podemos evitar el destino. En cuanto Beliar se sienta lo bastante fuerte, se levantar� para intentar dominar el mundo. Tengo que encontrar al Elegido o todos estaremos condenados."); 
					};
					
					if (hero.guild == GIL_DJG)
					{
						Doc_PrintLines	( nDocID,  0, "... Habr� guerra, una guerra en la que se decidir� el destino del mundo. Parece que soy el �nico capaz de interpretar las se�ales. A mi alrededor todos me ignoran. El Elegido vendr� y su llegada ser� la se�al de la inminente guerra. Una guerra tan vieja como el mismo tiempo pero que parece que est� a punto de terminar.");
						
						//2.Seite
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
						Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
						Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
						Doc_PrintLines	( nDocID,  1, "No me quedar� ocioso viendo como otros asumen la responsabilidad del destino del mundo."					);
						Doc_PrintLine	( nDocID,  1, ""					);
						Doc_PrintLines	( nDocID,  1, "... He estudiado las antiguas escrituras y he descubierto c�mo crear las armas legendarias de los antiguos Se�ores de los Dragones. Sin embargo, no tengo ni idea de c�mo conseguir los materiales. Por si acaso, he puesto la f�rmula en el alman�que. Qui�n sabe qu� terrores nos depara el futuro. Puede que incluso dragones..."); 
					};					
					
					Doc_Show		( nDocID );
};


//**********************************************************************
//	geheime Nachricht geheimer Schalter Lampe
//**********************************************************************


INSTANCE ItWr_UseLampIdiot_Mis	(C_Item)
{
	name 				=	"Carta estrujada";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	50;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseItWr_UseLampIdiot_Mis;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=	"Del libro ''Los salones de Irdorath''.";
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
					Doc_PrintLine	(nDocID,  0, "               La l�mpara lleva la luz"						);
					Doc_PrintLine	(nDocID,  0, "               a las regiones inferiores."						);
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
	name 					=	"Carta de navegaci�n de la isla de Irdorath";
	
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
	    B_LogEntry (TOPIC_SHIP,"Parece que tendr� que llegar hasta la extra�a isla del enemigo. Pero para eso necesitar� un barco, una tripulaci�n y un capit�n.");
		B_GivePlayerXP (XP_SCKnowsWayToIrdorath);
	};

	MIS_SCKnowsWayToIrdorath  = TRUE;
};

//**********************************************************************
//	Gef�lschter Brief von Lee zum benutzen des Schiffes
//**********************************************************************


INSTANCE ITWr_ForgedShipLetter_MIS	(C_Item)
{
	name 				=	"Pasaje de barco";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	50;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseITWr_ForgedShipLetter_MIS;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"Carta de autorizaci�n";
	TEXT[4]				=   "para el barco de los paladines.";
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
					Doc_PrintLine	(nDocID,  0, "Carta de autorizaci�n"							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "        Este documento autoriza al portador a"					);
					Doc_PrintLine	(nDocID,  0, "        moverse con libertad en la galera de guerra"		);
					Doc_PrintLine	(nDocID,  0, "        real de lord Hagen y guiar la nave"		);
					Doc_PrintLine	(nDocID,  0, "        durante un periodo de tiempo indefinido."			);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "            Sello real"							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
		
}; 

INSTANCE ITKE_OC_MAINGATE_MIS(C_Item)
{
	name 				=	"Llave de la puerta principal de la torre de la guardia";

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
	name 				=	"Llave de los aposentos del capit�n";

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

	description		= 	"Las L�grimas de Innos";
	
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

	description		= 	"Las L�grimas de Innos";
	TEXT[1]			= 	"La poci�n otorga poderes especiales a los magos de fuego.";
	Text[2]			=   "Cualquier otro usuario encontrar� la muerte.";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

//************************************************
//	Amulett des Todes
//************************************************

INSTANCE  ItAm_AmulettOfDeath_Mis(C_Item)
{
	name 			=	"Aura divina de Innos";

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

	description		= "El aura divina de Innos.";
	
	TEXT[2]			= "Este amuleto protege al portador";
	TEXT[3]			= "de todas las formas de da�o.";
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

	description		= 	"Curaci�n de la adicci�n";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Essenz;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpEssenz;
};

	FUNC VOID Use_HealRandolph()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Essenz);
	};	
