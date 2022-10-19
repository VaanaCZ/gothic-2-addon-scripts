//Missionitems 2. Kapitel

//********************************************
//	Xardas� Stein des Wissens   liegt im alten Demonenbeschw�rerturm auf dem Tisch in seinem alten Studierzimmer!
//********************************************

INSTANCE ItMi_StoneOfKnowlegde_MIS (C_Item)
{
	name 				=	"K�men v�d�n�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_StoneOfKnowlegde_MIS.3DS";
	material 			=	MAT_STONE;

	description			= 	name;

};

//**********************************************************************************
//	BRIEF von Garond an Lord Hagen
//----------------------------------------------------------------------------------

INSTANCE ItWr_PaladinLetter_MIS		(C_Item)
{
	name 				=	"Dopis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePaladinLetter;
	scemeName			=	"MAP";
	description			= "Dopis lordu Hagenovi";
};
func void UsePaladinLetter ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Lorde Hagene!");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Expedice do Hornick�ho �dol� selhala. Utrp�li jsme t�k� ztr�ty a ti, kte�� p�e�ili, jsou nyn� uv�zn�ni na hrad� a obkl��eni sk�ety.");
					Doc_PrintLines	( nDocID,  0, "Tak� na n�s mnohokr�t za�to�ili draci. Zni�ili a sp�lili ve�kerou zem v okol� hradu. S Innosovou pomoc� snad vytrv�me, dokud nedoraz� posily. Stejn� n�m nic jin�ho nezb�v�, nebo� ��dn� v�pad podniknout nem��eme.");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Nech� n�s Innos ochra�uje.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Garond");
					Doc_Show		( nDocID );
		
};
//**********************************************************************************
//	Schmuggelbrief von Milten an Gorn
//----------------------------------------------------------------------------------

INSTANCE ItWr_LetterForGorn_MIS		(C_Item)
{
	name 				=	"Dopis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLetterForGorn;
	scemeName			=	"MAP";
	description			= 	"Miltenova zpr�va pro Gorna";
};
func void UseLetterForGorn ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Gorne!"					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLines	( nDocID,  0, "Garond souhlasil, �e t� propust� - za 1000 zla��k�.");
					Doc_PrintLines	( nDocID,  0, "Tak�e jestli m� n�kde ulit� n�jak� zlato, bylo by na�ase se s n�m vytasit.");
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Milten "					);
					Doc_Show		( nDocID );
		
};

//********************************************
//	Kerkerschl�ssel der Burg im Minental
//********************************************


INSTANCE ItKe_PrisonKey_MIS(C_Item)
{
	name 				=	"Kl�� od sklepen�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Kl�� od hradn�ho";
	TEXT[3]				= 	"sklepen�.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//********************************************
//	Schl�ssel Erzlager der Burg im Minental
//********************************************
INSTANCE ItKe_OC_Store(C_Item)
{
	name 				=	"Kl�� od skladi�t�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Kl�� od hradn�ho";
	TEXT[3]				= 	"sklepen�.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schl�ssel Erzbaron Flur der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronFlur(C_Item)
{
	name 				=	"Kl�� ode dve��";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"K prvn�m dve��m";
	
	TEXT[2]				= 	"Na povrchu je vyryto toto jm�no:";
	TEXT[3]				= 	"Gomez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schl�ssel Erzbaron Raum der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronRaum(C_Item)
{
	name 				=	"Kl�� ode dve��";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Ke druh�m dve��m.";
	
	TEXT[2]				= 	"Na povrchu je vyryto toto jm�no:";
	TEXT[3]				= 	"Gomez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Der Schatz von Gorn
//********************************************

INSTANCE ItMi_GornsTreasure_MIS(C_Item)
{
	name 				=	"M�ec";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	250;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseGornsTreasure;
	
	description			= 	"Gorn�v m�ec.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseGornsTreasure ()
{
	B_PlayerFindItem (ItMi_Gold,250);   
	Gorns_Beutel = TRUE;
};
//**********************************************************************************
//	Schreiben von Silvestro
//----------------------------------------------------------------------------------

INSTANCE ItWr_Silvestro_MIS		(C_Item)
{
	name 				=	"Zpr�va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseItwr_Silvestro;
	scemeName			=	"MAP";
	description			= 	"Zpr�va od Silvestra";
};
func void UseItwr_Silvestro ()
{   
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;							// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
				Doc_PrintLine	( nDocID,  0, "Od kr�lovsk�ho paladina Silvestra");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Tak n�s �ek� dal�� den pln� kut�n�. Dnes se chceme probourat skrze ze� a prodolovat se hloub�ji do kamene.");
				Doc_PrintLines	( nDocID,  0, "Tr�p� m� ale jak�si neblah� tu�en�, tak�e rad�i v�echnu rudu n�kam schov�m.");
				Doc_PrintLines	( nDocID,  0, "Diego to tady jako jedin� z n�s zn�. Mus�m mu v��it. Ur�it� ty bedny ukryje n�kam do bezpe�� - ale nedovol�m, aby to ud�lal s�m.");	
				Doc_PrintLines	( nDocID,  0, "Rudu mus�me ochr�nit za ka�dou cenu, a tak s n�m pos�l�m je�t� dva ryt��e.");	
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "A� �ije kr�l!");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "Silvestro");
				Doc_Show		( nDocID );
				
};
//**********************************************************************************
//	Krallen des Rudelf�hrers
//----------------------------------------------------------------------------------
INSTANCE ItAt_ClawLeader (C_Item)
{
	name 				=	"Ch�apav�� dr�py";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	100;

	visual 				=	"ItAt_Claw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Dr�py v�dce st�da";
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Olavs Beutel 
//----------------------------------------------------------------------------------
INSTANCE ItSe_Olav	(C_Item)
{
	name 				=	"M�ec";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseOlav;
	
	description			= 	"Olav�v m�ec";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"V m�ci cink� n�kolik minc�.";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseOlav ()
{
		B_PlayerFindItem (ItMi_Gold,25);
};
/******************************************************************************************/
instance ItMi_GoldPlate_MIS (C_Item)
{
	name 				=	"Zlat� tal��";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldPlate;

	visual 				=	"ItMi_GoldPlate.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//********************************************
//	Schl�ssel Erzlager der Burg im Minental
//********************************************
INSTANCE ItKe_Pass_MIS(C_Item)
{
	name 				=	"Kl�� od pr�smyku";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Mal� kl��ek";
	TEXT[1]				= 	"otv�r� br�nu v pr�smyku.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schl�ssel Bromor
//********************************************
INSTANCE ItKe_Bromor(C_Item)
{
	name 				=	"Bromor�v kl��";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Kl�� od pokoje";
	TEXT[1]				= 	"v nev�stinci.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schl�ssel Runenstein
//********************************************
INSTANCE ITKE_RUNE_MIS(C_Item)
{
	name 				=	"Kl��";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Mal� kl��ek od truhlice.";
	
	TEXT[1]				= 	"Tento kl�� pat�� ke truhlici";
	TEXT[2]				= 	"pod mostem.";
	TEXT[3]				= 	"Obsahuje runov� k�men.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Bloodfly Stachel ausschl�rfen lernen
//----------------------------------------------------------------------------------
INSTANCE ItWr_Bloody_MIS		(C_Item)
{
	name 				=	"Zpr�va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBloodMIS;
	scemeName			=	"MAP";
	description			= 	"Jed krvav� mouchy";
};
func void UseBloodMIS ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "�ihadlo krvav� mouchy obsahuje prudk� jed, a proto se ho nikdo, kdo m� v�ech p�t pohromad�, nedot�k�."					);
					Doc_PrintLines	( nDocID,  0, "Pokud tedy nezn� tajemstv�, jak je spolehliv� vyjmout.");
					Doc_PrintLines	( nDocID,  0, "�ihadlo lze �ist� otev��t, pokud je ostr�m no�em po d�lce opatrn� na��znete");					
					Doc_PrintLines	( nDocID,  0, "a sloupnete tak svrchn� k��i. Pak u� jen sta�� odstranit tk�� kolem jedov�ch �l�z."					);
					Doc_PrintLines	( nDocID,  0, "Zvl�tn� tekutina z t�to tk�n� m� l��iv� ��inky,");
					Doc_PrintLines	( nDocID,  0, "ale lidsk� t�lo se v��i nim bohu�el �asem st�v� imunn�."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Damarok");
					Doc_Show		( nDocID );
					
		if (Knows_Bloodfly == FALSE)
		{
			Knows_Bloodfly = TRUE;
			Log_CreateTopic (Topic_Bonus,LOG_NOTE);
			B_LogEntry (Topic_Bonus, "Nyn� v�m, jak ze �ihadel krvav�ch much z�skat l��ivou tekutinu.");
			B_GivePlayerXP (XP_Ambient);
		};		
};
//**********************************************************************************
//	Brief von Lutero
//----------------------------------------------------------------------------------

INSTANCE ItWr_Pfandbrief_MIS		(C_Item)
{
	name 				=	"Vzkaz pro Debentura";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePfandbrief;
	scemeName			=	"MAP";
	description			= 	name;
};
func void UsePfandbrief ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "P�i platb� nevyrovnan�ch dluh� lze"					);
					Doc_PrintLine	( nDocID,  0, "p�ijmout do z�stavy i n�jakou v�c, pokud"					);
					Doc_PrintLine	( nDocID,  0, "jej� hodnota dan� z�vazek vyrovn�."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "V z�stav�: zdoben� zlat� kalich"					);
					Doc_PrintLines	( nDocID,  0, "ze sb�rky krvav�ch kalich�.");
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "podeps�n");
					Doc_PrintLine	( nDocID,  0, "Lutero, kupec"					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Lehmar, majitel zastav�rny"					);
					Doc_Show		( nDocID );
		
};

instance ItWr_Map_OldWorld_Oremines_MIS (C_Item)
{
	name 		= "Garondova mapa dol�";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 50;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_OldWorld_Oremines;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};
	func void Use_Map_OldWorld_Oremines ()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_OldWorld_Oremines_MIS);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_OldWorld_Oremines.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);
	};

//**********************************************************************************
//	Ruf des Dominique
//----------------------------------------------------------------------------------

INSTANCE ItWr_Manowar		(C_Item)
{
	name 				=	"Text";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseManowar;
	scemeName			=	"MAP";
	description			=   "Texty p�sn�.";
};
func void UseManowar ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Dominiquovo vol�n�");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Sklid�me Jeho sl�vu.");
					Doc_PrintLines	( nDocID,  0, "Innos stoj� p�i mn� i p�i m�ch bratrech.");					
					Doc_PrintLines	( nDocID,  0, "Ka�d�ho, kdo se m� pokus� zastavit, pod��znu jak ovci,"					);
					Doc_PrintLines	( nDocID,  0, "nebo� On mi v srdci za�ehl ohe�."					);
					Doc_PrintLines	( nDocID,  0, "M�j me� slou�� jen Jemu samotn�mu."					);
					Doc_PrintLines	( nDocID,  0, "A dnes se bude Jeho jm�no v�ude rozl�hat."					);
					Doc_PrintLines	( nDocID,  0, "Ka�d�ho, kdo se mi postav�,"					);
					Doc_PrintLines	( nDocID,  0, "vlastnoru�n� skol�m,");
					Doc_PrintLines	( nDocID,  0, "nebo� j� jsem Innosov�m v�le�n�kem."					);
					
					Doc_Show		( nDocID );
		
};

//**********************************************************************************
//	BRIEF der Wassermagier
//----------------------------------------------------------------------------------

INSTANCE ItWr_KDWLetter		(C_Item)
{
	name 				=	"Zpr�va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseKDWLetter;
	scemeName			=	"MAP";
	description			=  "Zpr�va";
};
func void UseKDWLetter ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Opustili jsme t�bor. Te�, kdy� bari�ra padla, hled�me m�sto, kde cel� ta zk�za za�ala. Snad tam najdeme odpov�di, po kter�ch se p�d�me u� po dlouh� l�ta. Jen Adanos v�, kam n�s cesta zavede."					);
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Adanos n�s prov�zej."					);
					Doc_PrintLine	( nDocID,  0, "Saturas");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_Show		( nDocID );
		
};
//**********************************************************************************
//	BRIEF von Gilbert
//----------------------------------------------------------------------------------

INSTANCE ItWr_GilbertLetter		(C_Item)
{
	name 				=	"Zpr�va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseGilbertLetter;
	scemeName			=	"MAP";
	description			=  "Zpr�va";
};
func void UseGilbertLetter ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Za��n� m� to p�kn� �tv�t. U� jsem se tu schov�val dost dlouho a jestli jsem dob�e sly�el, bari�ra kone�n� padla."					);
					Doc_PrintLines	( nDocID,  0, "Te� u� m� nikdo nebude hledat. M�m pln� zuby t�hle hnusn� jeskyn� i toho zatracen�ho �dol�. Je na�ase vr�tit se dom�.");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Gilbert");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_Show		( nDocID );
		
};

INSTANCE ItRi_Tengron(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Hp;

	visual 					=	"ItRi_Hp_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Tengron;
	on_unequip				=	UnEquip_ItRi_Tengron;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= NAME_ADDON_TengronsRing;
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= Ri_Hp;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Tengron()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
	};

	FUNC VOID UnEquip_ItRi_Tengron()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] -Ri_Hp;
		if self.attribute [ATR_HITPOINTS]> Ri_Hp+1
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};
	};
