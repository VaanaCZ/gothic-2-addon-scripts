// *****************************************************************
// //Joly: Auge Innos nicht dabei? Kein Problem. Xardas hilft auch dir Idiot!!!!!!!!!!!!
// Vorsicht: Nur f�r D.A.U.s
// *****************************************************************

INSTANCE ItSe_XardasNotfallBeutel_MIS	(C_Item)
{
	name 				=	"����� �������� ������� �������";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_XardasNotfallBeutel;
	
	description			= 	name;
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"� ���� �������, ������,";
	TEXT[2]				= 	"���������� ������� ������";
	TEXT[3]				= 	"� ��������.";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_XardasNotfallBeutel ()
{
	CreateInvItems (hero, ItWr_XardasErmahnungFuerIdioten_MIS ,1);
	CreateInvItems (hero, ItMi_InnosEye_Discharged_Mis ,1);

	var string concatText;
		
	concatText = ConcatStrings( "2" , PRINT_ItemsErhalten);		
	Print (concatText);
}; 

//**********************************************************************************
//	ItWr_XardasErmahnungFuerIdioten_MIS
//**********************************************************************************

INSTANCE ItWr_XardasErmahnungFuerIdioten_MIS	(C_Item)
{
	name 				=	"������ � ���������������� ��������";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_XardasErmahnungFuerIdioten;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_XardasErmahnungFuerIdioten ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "��� ���� �������, �� ����� ����������� ����. ��� �� ��� ������� �� ������� � �� ����� ���� ������?"					);
					Doc_PrintLines	( nDocID,  0, "��� �������� ������ ���������, ��� ����� ���������� ���� �������. � ��������� ������, ���� ������� �� ������� �������� ��� �� ���  � ��� �������� ����� ������� ���� �� ���� �������."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                      �������"					);
					
					Doc_Show		( nDocID );
};

//**********************************************************************************
//	Brief in der Krypta
//----------------------------------------------------------------------------------

INSTANCE ItWr_Krypta_Garon		(C_Item)
{
	name 				=	"������ ������";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Krypta_Garon;
	scemeName			=	"MAP";
	description			= 	name;

	TEXT[3]				= 	"���������� ���������� �����.";
};
func void Use_Krypta_Garon ()
{   
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "��� ����� ������. � ������ ������� �������� ������� �� ���� �����."					);
					Doc_PrintLines	( nDocID,  0, "�������, ��� ����������, ��� � ��� �����. �� ���-����� ���� ��� ��� �������� � ������ ������ �����."					);
					Doc_PrintLines	( nDocID,  0, "������ ������� �� �������. ��������� ������� ������� ���������, ������ �� ���� �������� �� ���� ���������."					);
					Doc_PrintLines	( nDocID,  0, "������ � ��� ������ �� ��� ��������������. � �� ���� ������, ��� ����� ������������ ��� ������ ��� ����� ����� ����."					);
					Doc_PrintLines	( nDocID,  0, "� ����� ��� ������ � ���� ������. �� � �� ������, ������� �� ��� �������� � ����� �������. �������, � ���� ��� ������ � �������, ��� ���-������ ������ ��."					);
					Doc_PrintLines	( nDocID,  0, "������. ������� ���� �������� ���������� �� ��������� ���. ������ ����� �� ���������."					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "�� ������ ����� ���� ����."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                                 ����");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );

}; 

//****************************************************************************
//				DragonIsle_Undead_Schl�ssel
//			---------------------------------------------
//****************************************************************************

//**********************************************************************************
//	Knastt�rschl�ssel f�r Pedros Zelle auf DI
//**********************************************************************************

INSTANCE ItKe_OrkKnastDI_MIS(C_Item)
{
	name 				=	"���� ���������� �����";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItKe_EVT_UNDEAD_01(C_Item)	//Schl�ssel f�r erste T�r
{
	name 				=	"���� ������";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	name;
	
};

//**********************************************************************************
//	Schl�ssel zum Labyrinth der Untoten auf DI
//**********************************************************************************

INSTANCE ItKe_EVT_UNDEAD_02	(C_Item)
{
	name 				=	"���� ��������";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};


//**********************************************************************************
//	Kammerschl�ssel f�r�s Tor zum Saal des Untoten Drachen.
//**********************************************************************************
	
INSTANCE ItKe_LastDoorToUndeadDrgDI_MIS	(C_Item)
{
	name 				=	"���� �� ������� ������� ����";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Schriftrolle f�r�s Tor zum Saal des Untoten Drachen.
//**********************************************************************************
	
INSTANCE ItWr_LastDoorToUndeadDrgDI_MIS	(C_Item)
{
	name 				=	"������ ������� ����";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;

	on_state[0]			=   Use_ItWr_LastDoorToUndeadDrgDI_MIS;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_ItWr_LastDoorToUndeadDrgDI_MIS ()
{   
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "����� "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "���� �����"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "���� ���� �������� ���� ����.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"������ ������� ���� �������� ����� ����� ���� �����. ��� ������ �� �����-�� ���������� �������, �� ��� ���� ��� ������������ - � ��� ����� ���� ����?"); 
};
//**********************************************************************************
//	Schl�ssel zur Truhe in der Kammer des OberDementors.
//**********************************************************************************
INSTANCE ItKe_ChestMasterDementor_MIS	(C_Item)
{
	name 				=	"���� �� ������� ������� ����";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]	= value;
};

//**********************************************************************************
//	Der Schwarzmagiernovize
//**********************************************************************************

//**********************************************************************************
//	ItWr_Rezept_MegaDrink_MIS
//**********************************************************************************

INSTANCE ItWr_Rezept_MegaDrink_MIS	(C_Item)
{
	name 				=	"������";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_RezeptFuerMegaTrank;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_RezeptFuerMegaTrank ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "� ������ � ����� ������� ���������. �����, ������, �������� �� ������ ��� ����������."					);
					Doc_PrintLines	( nDocID,  0, "��� ��������, �������� ������, ��� � ������ ���������� ���� ��� ������� � �����. ���� �� ������ �� �� ����� �� ����� ����� ��� ����� ��� ������, � �� ���������."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "������� ��������:"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "11 ��������� ���, ���� �������� � ������� ������ ��������� � ������� ����."					);
					Doc_PrintLines	( nDocID,  0, "��� ����� ����� ������� �� �������, ��������� ���������, � ���������� ����� �����������."					);
					Doc_PrintLines	( nDocID,  0, "������������ ������� ����� ������������ � �������������. �� �������� �������� ��������� ��������� � ����� ������������ �������� �� ����."					);
					
					Doc_Show		( nDocID );
		
		PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};

//**********************************************************************************
//	Tagebuch des SchwarzmagierNovizen
//**********************************************************************************

INSTANCE ItWr_Diary_BlackNovice_MIS (C_ITEM)
{	
	name 					=	"�������";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Diary_BlackNovice;
};

	FUNC VOID Use_Diary_BlackNovice()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "BOOK_RED_L.tga"  , 0 	); 		// VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "BOOK_RED_R.tga" 	, 0		); 		// VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages 
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "� ��� ���������� ��� ��� 36 ����. � ������� �����������, ��� ���� ������ ��������. �� � ������ ���, ��� ��� �������. � ����������� �� ��� ������� �� ����������."					);
					//Absatz
					Doc_PrintLines	( nDocID,  0, "������� �������� ��� ������� �������. � ��� �� ������ �����. ���� ��� � ������ ����� ���� � ��� �� ����, ����� ������ �������� ������ ����� ������.");
					Doc_PrintLines	( nDocID,  0, "��� ����, ��� � �� ����� ����������.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "� ������ � ������� ��� ��� ������-�����. � �� ���� ���������, ����� ����� �������. ���������, �������� �� ��� ������ ���, ����� � ����� ����� �� ���."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "����� � ������� �������. �� �������� ������� � ���� ������� � �������� ��� �� ����, ��� ���� ������ ��� ������������� � �������� ����� � ���������� �������. ���� ��� ������ ������! ������ � ��������� ������� � ���� ���� ...");
					Doc_Show		( nDocID );

	B_LogEntry (TOPIC_HallenVonIrdorath,"� �������� ������� ����-���������� ����������� ������ � ��������, �������, ���������� �������������� � ����� ���� ���. � ������ ��������� ���, ������� �� ������ �������, ��� ����������, � ��� ���."); 
};

//**********************************************************************************
//	ItWr_ZugBruecke_MIS
//**********************************************************************************

INSTANCE ItWr_ZugBruecke_MIS	(C_Item)
{
	name 				=	"������ ������";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_ZugBruecke;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_ZugBruecke ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "   ��������� ��������������!"					);
					Doc_SetMargins	( nDocID, -1, 50, 50, 70, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "���� �� ����������, ������� �� �������� ���� � ������ ������� ��� ���. ���� ��� ��������� ��� ������ - �� ��� ������������ ������ � ���."					);
					Doc_PrintLines	( nDocID,  0, "� ��������� �������� ���� �������� �� ��� ���, ���� � �������� �����. � ���� � ������, ��� ���-�� �������� ������ ������������� ��� ������ ���� � ������, � ����� ������� ����� ������ �� ��������� ������!"	);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                      �����"					);
					
					Doc_Show		( nDocID );
};


//**********************************************************************************
//	ItMi_PowerEye zum �ffnen der letzten T�r
//**********************************************************************************

INSTANCE ItMi_PowerEye (C_Item)
{
	name 				=	"���� ����";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_METAL;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};

