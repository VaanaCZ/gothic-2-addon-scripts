//Missionitems 2. Kapitel

//********************************************
//	Xardas´ Stein des Wissens   liegt im alten Demonenbeschwörerturm auf dem Tisch in seinem alten Studierzimmer!
//********************************************

INSTANCE ItMi_StoneOfKnowlegde_MIS (C_Item)
{
	name 				=	"Kámen vędęní";

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
					Doc_PrintLines	( nDocID,  0, "Expedice do Hornického údolí selhala. Utrpęli jsme tęžké ztráty a ti, kteâí pâežili, jsou nyní uvęznęni na hradę a obklíčeni skâety.");
					Doc_PrintLines	( nDocID,  0, "Také na nás mnohokrát zaútočili draci. Zničili a spálili veškerou zem v okolí hradu. S Innosovou pomocí snad vytrváme, dokud nedorazí posily. Stejnę nám nic jiného nezbývá, neboă žádný výpad podniknout nemůžeme.");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Nechă nás Innos ochraŕuje.");
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
	description			= 	"Miltenova zpráva pro Gorna";
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
					Doc_PrintLines	( nDocID,  0, "Garond souhlasil, že tę propustí - za 1000 zlaăáků.");
					Doc_PrintLines	( nDocID,  0, "Takže jestli máš nękde ulitý nęjaký zlato, bylo by načase se s ním vytasit.");
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
	name 				=	"Klíč od sklepení";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Klíč od hradního";
	TEXT[3]				= 	"sklepení.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//********************************************
//	Schlüssel Erzlager der Burg im Minental
//********************************************
INSTANCE ItKe_OC_Store(C_Item)
{
	name 				=	"Klíč od skladištę";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Klíč od hradního";
	TEXT[3]				= 	"sklepení.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Erzbaron Flur der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronFlur(C_Item)
{
	name 				=	"Klíč ode dveâí";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"K prvním dveâím";
	
	TEXT[2]				= 	"Na povrchu je vyryto toto jméno:";
	TEXT[3]				= 	"Gomez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Erzbaron Raum der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronRaum(C_Item)
{
	name 				=	"Klíč ode dveâí";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Ke druhým dveâím.";
	
	TEXT[2]				= 	"Na povrchu je vyryto toto jméno:";
	TEXT[3]				= 	"Gomez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Der Schatz von Gorn
//********************************************

INSTANCE ItMi_GornsTreasure_MIS(C_Item)
{
	name 				=	"Męšec";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	250;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseGornsTreasure;
	
	description			= 	"Gornův męšec.";
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
	name 				=	"Zpráva";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseItwr_Silvestro;
	scemeName			=	"MAP";
	description			= 	"Zpráva od Silvestra";
};
func void UseItwr_Silvestro ()
{   
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;							// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
				Doc_PrintLine	( nDocID,  0, "Od královského paladina Silvestra");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Tak nás čeká další den plný kutání. Dnes se chceme probourat skrze zeë a prodolovat se hloubęji do kamene.");
				Doc_PrintLines	( nDocID,  0, "Trápí mę ale jakési neblahé tušení, takže radši všechnu rudu nękam schovám.");
				Doc_PrintLines	( nDocID,  0, "Diego to tady jako jediný z nás zná. Musím mu vęâit. Určitę ty bedny ukryje nękam do bezpečí - ale nedovolím, aby to udęlal sám.");	
				Doc_PrintLines	( nDocID,  0, "Rudu musíme ochránit za každou cenu, a tak s ním posílám ještę dva rytíâe.");	
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "Aă žije král!");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "Silvestro");
				Doc_Show		( nDocID );
				
};
//**********************************************************************************
//	Krallen des Rudelführers
//----------------------------------------------------------------------------------
INSTANCE ItAt_ClawLeader (C_Item)
{
	name 				=	"Chŕapavčí drápy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	100;

	visual 				=	"ItAt_Claw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Drápy vůdce stáda";
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
	name 				=	"Męšec";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseOlav;
	
	description			= 	"Olavův męšec";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"V męšci cinká nękolik mincí.";
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
	name 				=	"Zlatý talíâ";

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
	name 				=	"Klíč od průsmyku";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Malý klíček";
	TEXT[1]				= 	"otvírá bránu v průsmyku.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Bromor
//********************************************
INSTANCE ItKe_Bromor(C_Item)
{
	name 				=	"Bromorův klíč";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Klíč od pokoje";
	TEXT[1]				= 	"v nevęstinci.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Runenstein
//********************************************
INSTANCE ITKE_RUNE_MIS(C_Item)
{
	name 				=	"Klíč";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Malý klíček od truhlice.";
	
	TEXT[1]				= 	"Tento klíč patâí ke truhlici";
	TEXT[2]				= 	"pod mostem.";
	TEXT[3]				= 	"Obsahuje runový kámen.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Bloodfly Stachel ausschlürfen lernen
//----------------------------------------------------------------------------------
INSTANCE ItWr_Bloody_MIS		(C_Item)
{
	name 				=	"Zpráva";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBloodMIS;
	scemeName			=	"MAP";
	description			= 	"Jed krvavé mouchy";
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
					Doc_PrintLines	( nDocID,  0, "Žihadlo krvavé mouchy obsahuje prudký jed, a proto se ho nikdo, kdo má všech pęt pohromadę, nedotýká."					);
					Doc_PrintLines	( nDocID,  0, "Pokud tedy nezná tajemství, jak je spolehlivę vyjmout.");
					Doc_PrintLines	( nDocID,  0, "Žihadlo lze čistę otevâít, pokud je ostrým nožem po délce opatrnę naâíznete");					
					Doc_PrintLines	( nDocID,  0, "a sloupnete tak svrchní kůži. Pak už jen stačí odstranit tkáŕ kolem jedových žláz."					);
					Doc_PrintLines	( nDocID,  0, "Zvláštní tekutina z této tkánę má léčivé účinky,");
					Doc_PrintLines	( nDocID,  0, "ale lidské tęlo se vůči nim bohužel časem stává imunní."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Damarok");
					Doc_Show		( nDocID );
					
		if (Knows_Bloodfly == FALSE)
		{
			Knows_Bloodfly = TRUE;
			Log_CreateTopic (Topic_Bonus,LOG_NOTE);
			B_LogEntry (Topic_Bonus, "Nyní vím, jak ze žihadel krvavých much získat léčivou tekutinu.");
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
					Doc_PrintLine	( nDocID,  0, "Pâi platbę nevyrovnaných dluhů lze"					);
					Doc_PrintLine	( nDocID,  0, "pâijmout do zástavy i nęjakou vęc, pokud"					);
					Doc_PrintLine	( nDocID,  0, "její hodnota daný závazek vyrovná."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "V zástavę: zdobený zlatý kalich"					);
					Doc_PrintLines	( nDocID,  0, "ze sbírky krvavých kalichů.");
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "podepsán");
					Doc_PrintLine	( nDocID,  0, "Lutero, kupec"					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Lehmar, majitel zastavárny"					);
					Doc_Show		( nDocID );
		
};

instance ItWr_Map_OldWorld_Oremines_MIS (C_Item)
{
	name 		= "Garondova mapa dolů";

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
	description			=   "Texty písní.";
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
					Doc_PrintLines	( nDocID,  0, "Dominiquovo volání");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Sklidíme Jeho slávu.");
					Doc_PrintLines	( nDocID,  0, "Innos stojí pâi mnę i pâi mých bratrech.");					
					Doc_PrintLines	( nDocID,  0, "Každého, kdo se mę pokusí zastavit, podâíznu jak ovci,"					);
					Doc_PrintLines	( nDocID,  0, "neboă On mi v srdci zažehl oheŕ."					);
					Doc_PrintLines	( nDocID,  0, "Můj meč slouží jen Jemu samotnému."					);
					Doc_PrintLines	( nDocID,  0, "A dnes se bude Jeho jméno všude rozléhat."					);
					Doc_PrintLines	( nDocID,  0, "Každého, kdo se mi postaví,"					);
					Doc_PrintLines	( nDocID,  0, "vlastnoručnę skolím,");
					Doc_PrintLines	( nDocID,  0, "neboă já jsem Innosovým válečníkem."					);
					
					Doc_Show		( nDocID );
		
};

//**********************************************************************************
//	BRIEF der Wassermagier
//----------------------------------------------------------------------------------

INSTANCE ItWr_KDWLetter		(C_Item)
{
	name 				=	"Zpráva";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseKDWLetter;
	scemeName			=	"MAP";
	description			=  "Zpráva";
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
					Doc_PrintLines	( nDocID,  0, "Opustili jsme tábor. Teë, když bariéra padla, hledáme místo, kde celá ta zkáza začala. Snad tam najdeme odpovędi, po kterých se pídíme už po dlouhá léta. Jen Adanos ví, kam nás cesta zavede."					);
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Adanos nás provázej."					);
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
	name 				=	"Zpráva";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseGilbertLetter;
	scemeName			=	"MAP";
	description			=  "Zpráva";
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
					Doc_PrintLines	( nDocID,  0, "Začíná mę to pęknę štvát. Už jsem se tu schovával dost dlouho a jestli jsem dobâe slyšel, bariéra konečnę padla."					);
					Doc_PrintLines	( nDocID,  0, "Teë už mę nikdo nebude hledat. Mám plné zuby téhle hnusné jeskynę i toho zatraceného údolí. Je načase vrátit se domů.");
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
