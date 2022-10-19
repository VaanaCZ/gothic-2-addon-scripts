//Missionitems 2. Kapitel

//********************************************
//	Xardas´ Stein des Wissens   liegt im alten Demonenbeschwörerturm auf dem Tisch in seinem alten Studierzimmer!
//********************************************

INSTANCE ItMi_StoneOfKnowlegde_MIS (C_Item)
{
	name 				=	"Stein des Wissens";

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
	name 				=	"Brief";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePaladinLetter;
	scemeName			=	"MAP";
	description			= "Brief an Lord Hagen";
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
					Doc_PrintLine	( nDocID,  0, "Lord Hagen!");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Die Expedition in's Minental ist gescheitert. Viele Verluste zeichnen unseren Weg. Wir Überlebenden sitzen in der Burg fest, umgeben von Orks. ");
					Doc_PrintLines	( nDocID,  0, "Drachen habe uns mehrmals angegriffen und den konmpletten Landstrich um die Burg zerstört. Mit Innos Hilfe werden wir ausharren bis die Verstärkung eintrifft. Ein Ausfall ist unmöglich. ");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Innos schütze uns alle");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Garond");
					Doc_Show		( nDocID );
		
};
//**********************************************************************************
//	Schmuggelbrief von Milten an Gorn
//----------------------------------------------------------------------------------

INSTANCE ItWr_LetterForGorn_MIS		(C_Item)
{
	name 				=	"Brief";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLetterForGorn;
	scemeName			=	"MAP";
	description			= 	"Milten's Notiz für Gorn";
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
					Doc_PrintLine	( nDocID,  0, "Gorn!"					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLines	( nDocID,  0, "Garond hat zugestimmt dich freizulassen - für 1000 Goldstücke. ");
					Doc_PrintLines	( nDocID,  0, "Also, falls du noch irgendwo Gold versteckt hast - jetzt ist die Zeit, damit rauszurücken. ");
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Milten "					);
					Doc_Show		( nDocID );
		
};

//********************************************
//	Kerkerschlüssel der Burg im Minental
//********************************************


INSTANCE ItKe_PrisonKey_MIS(C_Item)
{
	name 				=	"Kerkerschlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Der Schlüssel zum Kerker";
	TEXT[3]				= 	"in der Burg";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//********************************************
//	Schlüssel Erzlager der Burg im Minental
//********************************************
INSTANCE ItKe_OC_Store(C_Item)
{
	name 				=	"Lagerschlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Der Schlüssel zum Lagerraum";
	TEXT[3]				= 	"in der Burg";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Erzbaron Flur der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronFlur(C_Item)
{
	name 				=	"Tür - Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Für die erste Tür";
	
	TEXT[2]				= 	"Eine Name ist eingraviert";
	TEXT[3]				= 	"Gomez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Erzbaron Raum der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronRaum(C_Item)
{
	name 				=	"Tür - Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Für die zweite Tür";
	
	TEXT[2]				= 	"Eine Name ist eingraviert";
	TEXT[3]				= 	"Gomez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Der Schatz von Gorn
//********************************************

INSTANCE ItMi_GornsTreasure_MIS(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	250;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseGornsTreasure;
	
	description			= 	"Gorn's Lederbeutel";
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
	name 				=	"Notiz";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseItwr_Silvestro;
	scemeName			=	"MAP";
	description			= 	"Silvestro's Notiz ";
};
func void UseItwr_Silvestro ()
{   
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;							// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
				Doc_PrintLine	( nDocID,  0, "von Silvestro, Paladin des Königs ");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Ein weiterer Tag Schürferei liegt vor uns. Heute wollen wir die Wand durchbrechen und uns tiefer in den Fels hineingraben.");
				Doc_PrintLines	( nDocID,  0, "Ich habe ein ungutes Gefühl - deshalb werde ich das Erz in ein Versteck bringen lassen.");
				Doc_PrintLines	( nDocID,  0, "Diego ist der einzige von uns, der sich hier auskennt - ich muss ihm vertrauen. Er wird die Kisten in Sicherheit bringen - aber ich werde ihn nicht alleine losschicken.");	
				Doc_PrintLines	( nDocID,  0, "Das Erz muss unter allen Umständen geschützt werden, deshalb lasse ich Diego von zwei Rittern begleiten.");	
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "Lang lebe der König");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "Silvestro");
				Doc_Show		( nDocID );
				
};
//**********************************************************************************
//	Krallen des Rudelführers
//----------------------------------------------------------------------------------
INSTANCE ItAt_ClawLeader (C_Item)
{
	name 				=	"Snapper Krallen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	100;

	visual 				=	"ItAt_Claw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Die Krallen des Rudelführers";
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
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseOlav;
	
	description			= 	"Olav's Beutel";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Ein paar Münzen klimpern darin";
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
	name 				=	"Goldener Teller";

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
//	Schlüssel Erzlager der Burg im Minental
//********************************************
INSTANCE ItKe_Pass_MIS(C_Item)
{
	name 				=	"Schlüssel zum Pass";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Ein kleiner Schlüssel";
	TEXT[1]				= 	"Öffnet das Tor am Pass";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Bromor
//********************************************
INSTANCE ItKe_Bromor(C_Item)
{
	name 				=	"Bromor's Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Der Zimmerschlüssel";
	TEXT[1]				= 	"vom Bordellbesitzer";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Runenstein
//********************************************
INSTANCE ITKE_RUNE_MIS(C_Item)
{
	name 				=	"Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Ein kleiner Truhenschlüssel";
	
	TEXT[1]				= 	"Die Truhe zu dem Schlüssel";
	TEXT[2]				= 	"steht unter einer Brücke";
	TEXT[3]				= 	"und enthält einen Runenstein";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Bloodfly Stachel ausschlürfen lernen
//----------------------------------------------------------------------------------
INSTANCE ItWr_Bloody_MIS		(C_Item)
{
	name 				=	"Notiz";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBloodMIS;
	scemeName			=	"MAP";
	description			= 	"Gift der Blutfliegen";
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
					Doc_PrintLines	( nDocID,  0, "Der Stachel der Blutfliegen enthält ein tödliches Gift, das niemand, der klaren Verstandes ist, zu sich nehmen wird."					);
					Doc_PrintLines	( nDocID,  0, "Es sei denn er beherrscht die Kunst den Stachel zu entnehmen und kennt die folgende Regel. ");
					Doc_PrintLines	( nDocID,  0, "Der Stachel wird mit scharfer Klinge von der Spitze zum Schaft säuberlich aufgeschnitten.");					
					Doc_PrintLines	( nDocID,  0, "Die obere Hautschicht wird entfernt. Das freigewordene Gewebe wird um die Drüsen herum aufgeschnitten. "					);
					Doc_PrintLines	( nDocID,  0, "Der besondere Saft des Gewebes ist mehr als genießbar, er hat heilende Kräfte. ");
					Doc_PrintLines	( nDocID,  0, "Allerdings entwickelt der menschliche Körper im Laufe der Zeit eine Immunität gegen diesen heilenden Trunk."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Damarok");
					Doc_Show		( nDocID );
					
		if (Knows_Bloodfly == FALSE)
		{
			Knows_Bloodfly = TRUE;
			Log_CreateTopic (Topic_Bonus,LOG_NOTE);
			B_LogEntry (Topic_Bonus, "Ich weiß jetzt was ich tun muss, um heilenden Saft aus den abgetrennten Stacheln von Blutfliegen trinken zu können. ");
			B_GivePlayerXP (XP_Ambient);
		};		
};
//**********************************************************************************
//	Brief von Lutero
//----------------------------------------------------------------------------------

INSTANCE ItWr_Pfandbrief_MIS		(C_Item)
{
	name 				=	"Pfandbrief";

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
					Doc_PrintLine	( nDocID,  0, "Zur Tilgung der ausstehenden Schulden  "					);
					Doc_PrintLine	( nDocID,  0, "wird ein Pfand ausgesetzt, der mit seinem Reinwert"					);
					Doc_PrintLine	( nDocID,  0, "der Höhe der Schulden entspricht."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Pfand: Verzierter Kelch aus Gold "					);
					Doc_PrintLines	( nDocID,  0, "aus der Sammlung der Blutkelche");
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "gez.");
					Doc_PrintLine	( nDocID,  0, "Lutero, Händler  "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Lehmar, Pfandleiher"					);
					Doc_Show		( nDocID );
		
};

instance ItWr_Map_OldWorld_Oremines_MIS (C_Item)
{
	name 		= "Garond´s Minenkarte";

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
	description			=   "Ein Liedtext";
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
					Doc_PrintLines	( nDocID,  0, "Dominique's Ruf");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Wir werden seinen Ruhm ernten ");
					Doc_PrintLines	( nDocID,  0, "Innos steht bei mir und meinen Brüdern");					
					Doc_PrintLines	( nDocID,  0, "Ich werde alle auf meinem Weg wie Schafe schlachten"					);
					Doc_PrintLines	( nDocID,  0, "denn er ist das Feuer in meinem Herz"					);
					Doc_PrintLines	( nDocID,  0, "Meine Klinge ist nur ihm geweiht  "					);
					Doc_PrintLines	( nDocID,  0, "an diesem Tag wird sein Name erklingen"					);
					Doc_PrintLines	( nDocID,  0, "Jeder der sich in meinen Weg stellt"					);
					Doc_PrintLines	( nDocID,  0, "wird durch meine Hand sterben");
					Doc_PrintLines	( nDocID,  0, "denn ich bin ein Krieger Innos"					);
					
					Doc_Show		( nDocID );
		
};

//**********************************************************************************
//	BRIEF der Wassermagier
//----------------------------------------------------------------------------------

INSTANCE ItWr_KDWLetter		(C_Item)
{
	name 				=	"Nachricht";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseKDWLetter;
	scemeName			=	"MAP";
	description			=  "Eine Nachricht";
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
					Doc_PrintLines	( nDocID,  0, "Wir haben das Lager verlassen. Jetzt da die Barriere endlich gefallen ist, werden wir das Zentrum der Zerstörung aufsuchen. Vielleicht finden wir dort die Antworten, die wir soviele Jahre gesucht haben. Wohin unsere Reise danach geht, weiß nur Adanos."					);
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Adanos ist bei uns"					);
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
	name 				=	"Notiz";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseGilbertLetter;
	scemeName			=	"MAP";
	description			=  "Eine Nachricht";
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
					Doc_PrintLines	( nDocID,  0, "Mir reicht's. Ich habe mich hier lange genug versteckt. Und wenn ich das richtig mitgekriegt habe, ist die Barriere nun endlich gefallen.  "					);
					Doc_PrintLines	( nDocID,  0, "Es wird wohl kaum noch jemand nach mir suchen. Ich hab die Schnauze voll von dieser Höhle und dem ganzen Tal. Wird Zeit das ich nach Hause komme.");
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
