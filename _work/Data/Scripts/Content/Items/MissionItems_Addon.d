//****************************************************************************
//				Cavalorn's Brief an Vatras von Saturas
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_SaturasFirstMessage_Addon_Sealed	(C_Item)
{
	name 				=	"Zapiecz�towana wiadomo��";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_SaturasFirstMessage_Sealed;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "Ta wiadomo�� zosta�a dok�adnie zapiecz�towana.";

};
var int Use_SaturasFirstMessage_OneTime;
func void Use_SaturasFirstMessage ()
{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  1 );                         
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 	); 
					Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   	);  
					Doc_PrintLine	( nDocID,  0, "Szanowny Vatrasie,"					);
					Doc_PrintLines	( nDocID,  0, "Dotarli�my do portalu. Mia�e� racj�."					);
					Doc_PrintLines	( nDocID,  0, "S� znaki wskazuj�ce na to, �e naprawd� czcili Adanosa. Sprawd�, prosz�, moje notatki i potwierd� nasze ustalenia."					);
					Doc_PrintLines	( nDocID,  0, "Od kilku dni nie widzieli�my tych dziwnych kamiennych istot."					);
					Doc_PrintLines	( nDocID,  0, "Ziemia wci�� trz�sie si� z niewiadomych powod�w."					);
					Doc_PrintLines	( nDocID,  0, "S�dz�, �e nasze badania wkr�tce wska�� nam, co mo�e by� tego przyczyn�."					);
					Doc_PrintLines	( nDocID,  0, "Znaleziony przez nas ornament ma wi�ksze znaczenie, ni� wcze�niej s�dzili�my. Wydaje nam si�, �e jest to jaki� klucz-artefakt. Niestety, nie jest kompletny. Musimy go dok�adniej zbada�."					);
					Doc_PrintLines	( nDocID,  0, "Wy�lij jednego z cz�onk�w Wodnego Kr�gu, by nam go dostarczy�. Je�li to mo�liwe, nie przysy�aj Cavalorna."					);
					Doc_PrintLines	( nDocID,  0, "Poprosi�em go ju� o dostarczenie Ci tego listu. Wydaje mi si�, �e ju� wystarczaj�co nam pom�g�."					);
					Doc_PrintLines	( nDocID,  0, "Mam nadziej�, �e post�pujemy w�a�ciwie."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Saturas"					);
					Doc_Show		( nDocID );
		
		if (Use_SaturasFirstMessage_OneTime == FALSE)
		&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
		{
			Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_KDW,"Zabra�em bandycie wiadomo��, kt�r� Cavalorn mia� dostarczy� Vatrasowi, Magowi Wody. To teraz moje zadanie."); 
			Use_SaturasFirstMessage_OneTime = TRUE;
		};

		if (SC_KnowsRanger == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
			Log_AddEntry (TOPIC_Addon_RingOfWater,"Istnieje stowarzyszenie zw�ce si� Wodnym Kr�giem. Wygl�da na to, �e rz�dz� nim Magowie Wody."); 
		};

		if (SC_IsRanger == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
			Log_AddEntry (TOPIC_Addon_RingOfWater,"Cavalorn nale�y do Wodnego Kr�gu."); 
		};
	
		SC_KnowsRanger = TRUE;
}; 
func void Use_SaturasFirstMessage_Sealed ()
{   
	CreateInvItems (self, ItWr_SaturasFirstMessage_Addon,1);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage ();
}; 

//****************************************************************************
//				Cavalorn's Brief an Vatras von Saturas
//				Das Siegel wurde ge�ffnet		
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_SaturasFirstMessage_Addon	(C_Item)
{
	name 				=	"Otwarta wiadomo��";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_SaturasFirstMessage;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[2]				=   "List Saturasa do Vatrasa";
};


//****************************************************************************
//				Portalschl�sselbruchst�ck
//			---------------------------------------------
//****************************************************************************

INSTANCE  ItMi_Ornament_Addon (C_ITEM)
{
	name 				=	"Ornament";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_PortalRing_05.3DS"; 
	material 			=	MAT_METAL;

	description			= 	name;

	TEXT	[0]			=	"Fragment du�ego, ozdobnego pier�cienia";

	INV_ZBIAS			= 	INVCAM_ENTF_MISC5_STANDARD;
};

INSTANCE  ItMi_Ornament_Addon_Vatras (C_ITEM) //Joly:  gibt Vatras dem SC um ihn zu Lares zu bringen. Nur hiermit wird Saturas zufrieden gestellt -> erst dann Nefarius Auftrag!!!!!!!!!
{
	name 				=	"Ornament";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_PortalRing_05.3DS"; 
	material 			=	MAT_METAL;

	description			= 	name;

	TEXT	[0]			=	"Fragment du�ego, ozdobnego pier�cienia";

	INV_ZBIAS			= 	INVCAM_ENTF_MISC5_STANDARD;
};

//****************************************************************************
//				ItWr_Map_NewWorld_Ornaments_Addon
//			---------------------------------------------
//****************************************************************************


instance ItWr_Map_NewWorld_Ornaments_Addon (C_Item)
{
	name 		= "Mapa Nefariusa";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 250;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_NewWorld_Ornaments;

	description	= name;
	TEXT[0]		= "Na mapie zaznaczono miejsca,";
	TEXT[1]		= "gdzie wed�ug Nefariusa znajduj� si� brakuj�ce ornamenty.";
	TEXT[2]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Map_NewWorld_Ornaments()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_NewWorld_Ornaments_Addon);
		};

		SC_SAW_ORNAMENT_MAP = TRUE;

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_NewWorld_Ornaments.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "NewWorld\NewWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};

//****************************************************************************
//				ItWr_Map_NewWorld_Dexter
//			---------------------------------------------
//****************************************************************************

instance ItWr_Map_NewWorld_Dexter (C_Item)
{
	name 		= "Mapa teren�w Khorinis";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 210;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_NewWorld_Dexter;

	description	= name;
	TEXT[0]		= "Skip zaznaczy� miejsce,";
	TEXT[1]		= "gdzie mog� znale�� szefa bandyt�w,";
	TEXT[2]		= "Dextera.";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Map_NewWorld_Dexter ()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_NewWorld_Dexter);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_NewWorld_Dexter.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "NewWorld\NewWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};


//****************************************************************************
//				ItRi_Ranger_Addon
//			---------------------------------------------
//****************************************************************************

PROTOTYPE Rangerring_Prototype (C_ITEM)
{
	name 					=	"Pier�cie� z akwamarynem";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING|ITEM_MISSION; //Joly:kein Multiitem. Die ringe sind individuell

	value 					=	Value_Ri_HpMana;

	visual 					=	"ItRi_Hp_Mana_01.3ds"; 

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Ranger_Addon;
	on_unequip				=	UnEquip_ItRi_Ranger_Addon;

	description				= "Symbol przynale�no�ci do Wodnego Kr�gu";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItRi_Ranger_Addon()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
		{
			if (ENTERED_ADDONWORLD == FALSE) //Joly:wegen Lance' Ring
			{
				if (Npc_HasItems (hero,ItRi_Ranger_Addon) == FALSE)
				{
					RangerRingIsLaresRing = TRUE;
				};
			};
			
			SCIsWearingRangerRing = TRUE;
			Print	(PRINT_Addon_SCIsWearingRangerRing);
		};
};

FUNC VOID UnEquip_ItRi_Ranger_Addon ()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
		{
			if (SC_IsRanger == FALSE)
			{
				SCIsWearingRangerRing = FALSE;
			};
			RangerRingIsLaresRing = FALSE;
		};
};

//Lares Ring
INSTANCE ItRi_Ranger_Lares_Addon (Rangerring_Prototype)
{
	TEXT[1]					= "Ten pier�cie� nale�y do Laresa.";
};

//PCs Ring
INSTANCE ItRi_Ranger_Addon (Rangerring_Prototype)
{
	TEXT[1]					= "To m�j pier�cie�.";
};
//Lance Ring
INSTANCE ItRi_LanceRing (Rangerring_Prototype)
{
	TEXT[1]					= "Ten pier�cie� nale�y do Lance'a.";
};



//****************************************************************************
//				ItMi_PortalRing_Addon
//			---------------------------------------------
//****************************************************************************

INSTANCE ItMi_PortalRing_Addon (C_Item)
{
	name 				=	"Ozdobny pier�cie�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_PortalRing_01.3DS"; 
	material 			=	MAT_STONE;

	description			= 	"Ten pier�cie� otwiera portal";
	INV_ZBIAS			= 	INVCAM_ENTF_MISC3_STANDARD;
};

//**********************************************************************************
//	Empfehlungsschreiben f�r Andre, Miliz zu werden (von Martin)
//----------------------------------------------------------------------------------

INSTANCE ItWr_Martin_MilizEmpfehlung_Addon		(C_Item)
{
	name 				=	"List polecaj�cy od Martina";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_MartinMilizEmpfehlung_Addon;
	scemeName			=	"MAP";
	description			=  	"List polecaj�cy dla Lorda Andre";
	
	TEXT[2]				= 	"powinien mi umo�liwi�";
	TEXT[3]				= 	"wst�pienie w szeregi stra�y.";

	
};
func void Use_MartinMilizEmpfehlung_Addon ()
{   
 
	var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_Book);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "Drogi Lordzie Andre,"								);
					Doc_PrintLines	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "Wraz z tym listem przysy�am Ci nowego rekruta do naszej stra�y.");
					Doc_PrintLines	(nDocID,  0, "Udowodni� swoj� przydatno��, wykonuj�c trudne i odpowiedzialne zadania.");
					Doc_PrintLines	(nDocID,  0, "Jestem pewien, �e b�dzie si� dobrze spisywa�, broni�c kr�la oraz mieszka�c�w tego miasta.");
					Doc_PrintLine	(nDocID,  0, "Innosie, chro� kr�la."							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "     Kwatermistrz Martin"						);
					Doc_Show		(nDocID);
		
};


//**********************************************************************************
//	Ravens Befehle an Dexter
//----------------------------------------------------------------------------------

INSTANCE ItWr_RavensKidnapperMission_Addon		(C_Item)
{
	name 				=	"Rozkazy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_RavensKidnapperMission_Addon;
	scemeName			=	"MAP";
	description			=  	name;
	
	TEXT[2]				= 	"Zabra�em ten list";
	TEXT[3]				= 	"bandycie Dexterowi.";

	
};
var int Use_RavensKidnapperMission_Addon_OneTime;
func void Use_RavensKidnapperMission_Addon ()
{   
 	if (Use_RavensKidnapperMission_Addon_OneTime == FALSE)
 	&& (MIS_Addon_Vatras_WhereAreMissingPeople != 0)
 	{
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Teraz mam to na pi�mie. Kruk, dawny magnat, stoi za porwaniami mieszka�c�w Khorinis. Jego kryj�wka znajduje si� gdzie� za g�rami, w p�nocno-wschodniej cz�ci Khorinis. Vatras powinien zobaczy� ten dokument."); 
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};

 	SCKnowsMissingPeopleAreInAddonWorld = TRUE;

	var int nDocID;
		
	nDocID = 	Doc_Create		();
				Doc_SetPages	(nDocID,  1);
				Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
				Doc_SetFont		(nDocID, -1, FONT_Book);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID,  0, "Dexter, ty draniu!");
				Doc_PrintLine	(nDocID,  0, ""														);
				Doc_PrintLines	(nDocID,  0, "Kiedy jeszcze by�em magnatem, mo�na by�o bardziej na tobie polega�.");
				Doc_PrintLines	(nDocID,  0, "Je�li nie zdo�asz porwa� wi�cej ludzi z miasta i przys�a� ich do mnie, to b�dziemy mieli niez�y problem z ch�opakami w naszej kryj�wce.");
				Doc_PrintLines	(nDocID,  0, "Potrzebuj� tu wi�cej niewolnik�w albo ch�opaki zaczn� si� buntowa�. Chyba nie musz� ci m�wi�, co to znaczy, prawda?");
				Doc_PrintLines	(nDocID,  0, "Jestem bardzo bliski dostania si� do �wi�tyni. Nie mog� sobie pozwoli� na �adne, absolutnie �adne k�opoty.");
				Doc_PrintLines	(nDocID,  0, "A, jest jeszcze jeden problem:"								);
				Doc_PrintLines	(nDocID,  0, "Pr�dzej czy p�niej b�dziemy musieli znale�� drog� przez wysokie g�ry w p�nocno-wschodnim Khorinis. Piraci nie zapewni� nam transportu, kiedy przestaniemy im p�aci�.");
				Doc_PrintLine	(nDocID,  0, ""														);
				Doc_PrintLine	(nDocID,  0, "     Kruk"											);
				Doc_Show		(nDocID);
		
};

//**********************************************************************************
//	Empfehlungsschreiben f�r Pedro, ins Kloster eingelassen zu werden.
//----------------------------------------------------------------------------------

INSTANCE ItWr_Vatras_KDFEmpfehlung_Addon		(C_Item)
{
	name 				=	"List polecaj�cy od Vatrasa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_VatrasKDFEmpfehlung_Addon;
	scemeName			=	"MAP";
	description			=  	"List polecaj�cy od Vatrasa";
	
	TEXT[2]				= 	"powinien pom�c mi";
	TEXT[3]				= 	"wej�� do klasztoru Mag�w Ognia";
	TEXT[4]				= 	"bez zap�aty.";

	
};
func void Use_VatrasKDFEmpfehlung_Addon ()
{   
 
	var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Bracia Ognia");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLines	( nDocID,  0, "W�a�nie poinformowano mnie, �e aby do��czy� do waszego stowarzyszenia, trzeba wnie�� op�at�.");
					Doc_PrintLines	( nDocID,  0, "List ten dostarczy oddany cz�owiek, kt�ry chcia�by zosta� nowicjuszem w waszych szeregach."					);
					//Doc_PrintLine	( nDocID,  0, "Ich hoffe, dass ich nicht pers�nlich erscheinen muss ihm den Einlass ");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "     Vatras");
					Doc_Show		( nDocID );				
		
};

/******************************************************************************************/
INSTANCE ItMi_LostInnosStatue_Daron (C_Item)
{
	name 				=	"Cenny pos��ek Innosa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_InnosStatue;

	visual 				=	"ItMi_InnosStatue.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


//**********************************************************************************
//	Abschiedsbrief von Lucia an Elvrich
//----------------------------------------------------------------------------------

INSTANCE ItWr_LuciasLoveLetter_Addon		(C_Item)
{
	name 				=	"List po�egnalny Lucii";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_LuciasLoveLetter_Addon;
	scemeName			=	"MAP";
	description			=  	name;
	
};
func void Use_LuciasLoveLetter_Addon ()
{   
 
	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Lucia napisa�a list po�egnalny dla Elvricha. Z pewno�ci� b�dzie chcia� go przeczyta�."); 
	MIS_LuciasLetter = LOG_RUNNING;
	var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Najdro�szy Elvrichu,");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLines	( nDocID,  0, "�adne s�owa nie oddadz� tego, jak mi przykro.");
					Doc_PrintLines	( nDocID,  0, "Wiem, �e ci�ko b�dzie ci to zrozumie�. Dosz�am jednak do wniosku, �e lepiej b�dzie dla nas obojga, je�li znajdziesz sobie porz�dniejsz� dziewczyn�."					);
					Doc_PrintLines	( nDocID,  0, "Udaj� si� w miejsce, z kt�rego ju� nie wr�c�. Zapomnij o mnie. Nieprzyzwoita dziewczyna jak ja nie zas�uguje na takiego dobrego ch�opaka. �egnaj.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "     Lucia");
					Doc_Show		( nDocID );				
};

//****************************************************************************
//				Effectitems
//			---------------------------------------------
//****************************************************************************

PROTOTYPE  EffectItemPrototype_Addon (C_Item)	
{
	name 				=	"Kamie�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Coal;

	visual 				=	"ItMi_Coal.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS			= INVCAM_ENTF_MISC_STANDARD;
	
};

INSTANCE ItMi_AmbossEffekt_Addon (EffectItemPrototype_Addon)
{
};
INSTANCE ItMi_OrnamentEffekt_FARM_Addon (EffectItemPrototype_Addon)
{
};
INSTANCE ItMi_OrnamentEffekt_FOREST_Addon (EffectItemPrototype_Addon)
{
};
INSTANCE ItMi_OrnamentEffekt_BIGFARM_Addon (EffectItemPrototype_Addon)
{
};
/******************************************************************************************/
// Hacke 
INSTANCE ItMi_Rake (C_Item)
{
	name 				=	"Grabie";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Rake;

	visual 				=	"ItMi_Rake.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"RAKE";
	on_state[1]			= 	Use_Rake;
	description			= 	name;
	
	//TEXT[3]				=   "(L�sst sich bei ge�ffnetem Inventar benutzen)";
	//TEXT[4]				=   "('Aktionstaste' + 'Pfeil- Vorne' gedr�ckt halten)";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	//inv_rotx		= 180;
};
func void Use_Rake()
{
	//B_SCUsesRake (self); //Schatz ausgraben ist jetzt Mobsi mit itmw_2h_Axe_L_01
};

/******************************************************************************************/
INSTANCE ItRi_Addon_BanditTrader(C_Item)	//H�ndlergildenring
{
	name 					=	"Pier�cie� gildii";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	5 ;

	visual 					=	"ItRi_Prot_Point_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				= 	"Rze�biony pier�cie�";
	
	TEXT[2]					= 	"zamorskiej gildii Araxos";
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
};

//**********************************************************************************
//	ItWr_Addon_BanditTrader
//----------------------------------------------------------------------------------

INSTANCE ItWr_Addon_BanditTrader		(C_Item)
{
	name 				=	"Dostawa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_ItWr_Addon_BanditTrader;
	scemeName			=	"MAP";
	description			=  	name;
	
	TEXT[2]				= 	"Zabra�em ten list bandytom";
	TEXT[3]				= 	"za farm� Sekoba.";

	
};
var int Use_ItWr_Addon_BanditTrader_OneTime;
func void Use_ItWr_Addon_BanditTrader ()
{   
 	BanditTrader_Lieferung_Gelesen = TRUE;
 	var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "15 kr�tkich mieczy");
					Doc_PrintLines	( nDocID,  0, "20 pa�aszy"					);
					Doc_PrintLines	( nDocID,  0, "25 bochenk�w chleba");
					Doc_PrintLines	( nDocID,  0, "15 butelek wina"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "To ju� ostatni raz."					);
					Doc_PrintLines	( nDocID,  0, "Zaczyna robi� si� za gor�co."					);
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "     Fernando");
					Doc_Show		( nDocID );				
	
	if (MIS_Vatras_FindTheBanditTrader != 0)
	&& (Use_ItWr_Addon_BanditTrader_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_Addon_BanditTrader,"Znalaz�em dokument potwierdzaj�cy, �e Fernando jest handlarzem broni�, kt�rego szukam."); 
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};

//****************************************************************************
//				Vatras schickt SC zu Saturas
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_Vatras2Saturas_FindRaven	(C_Item)
{
	name 				=	"Przesy�ka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "Wiadomo�� Vatrasa dla Saturasa";

};
func void Use_Vatras2Saturas_FindRaven ()
{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  1 );                         
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 	); 
					Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   	);  
					Doc_PrintLine	( nDocID,  0, "Szanowny Saturasie,"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Mam nadziej�, �e zbli�asz si� do ko�ca. Sytuacja w mie�cie ostatnio si� uspokoi�a. Jednak obawiam si�, �e to cisza przed burz�. Pospiesz si�, prosz�. Potrzebuj� ci� tutaj."					);
					Doc_PrintLines	( nDocID,  0, "Przestudiowa�em zapiski i potwierdzam twoje podejrzenia. Symbole rzeczywi�cie wskazuj� na kultur�, kt�ra czci�a Adanosa. Dlatego musimy pozosta� czujni i nie da� si� za�lepi� s�owom fa�szywych prorok�w."					);
					Doc_PrintLines	( nDocID,  0, "Zaginieni mieszka�cy zostali porwani przez Kruka, by�ego magnata. S� w rejonie, do kt�rego z pewno�ci� zaprowadzi nas portal."					);
					Doc_PrintLines	( nDocID,  0, "Jeszcze jedno � przysy�am Ci pomocnika. Osoba, kt�ra przyniesie ten list, jest do�� wyj�tkowa. Za ka�dym razem, gdy na ciebie spogl�da, ma w oku ten charakterystyczny b�ysk. Nie jestem jeszcze tego ca�kiem pewien, ale mo�liwe, �e to ON, nawet je�li inaczej go sobie wyobra�ali�my."					);
					Doc_PrintLines	( nDocID,  0, "Sprawd� go. Wierz�, �e mam racj�."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "     Vatras"					);
					Doc_Show		( nDocID );
		
}; 

func void Use_Vatras2Saturas_FindRaven_Sealed ()
{   
	CreateInvItems (self, ItWr_Vatras2Saturas_FindRaven_opened,1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven ();
}; 
INSTANCE ItWr_Vatras2Saturas_FindRaven_opened	(C_Item)
{
	name 				=	"Otwarta przesy�ka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Vatras2Saturas_FindRaven;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[2]				=   "Wiadomo�� Vatrasa dla Saturasa";
};

//------------------------------------------------------------------------------------------
// Amulett des suchenden Irrlichts
//------------------------------------------------------------------------------------------
	INSTANCE  ItAm_Addon_WispDetector (C_Item)  
{
	name 			=	"Amulet z rudy";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_DexStrg;

	visual 			=	"ItAm_Mana_01.3ds";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_WEAKGLIMMER_BLUE"; 

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_WispDetector;
	on_unequip		=	UnEquip_WispDetector;

	description		=  "Amulet szukaj�cego ognika";

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	
};
	var int Equip_WispDetector_OneTime;

	FUNC VOID Equip_WispDetector()
	{
			if (Equip_WispDetector_OneTime == FALSE)
			{
				PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE; //das erste Talent gibt's gratis
				WispSearching = WispSearch_NF;
				Equip_WispDetector_OneTime = TRUE;
			};
			
			var C_NPC DetWsp;
			DetWsp = Hlp_GetNpc (Wisp_Detector);
			AI_Teleport (DetWsp, "TOT");
			Wld_SpawnNpcRange	(self,	Wisp_Detector,	1,	500);
 			Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  Wisp_Detector, Wisp_Detector, 0, 0, 0, FALSE );
			Snd_Play ("MFX_Transform_Cast");
			//Wld_PlayEffect("spellFX_SummonCreature_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
	};


	FUNC VOID UnEquip_WispDetector()
	{
			
			var C_NPC DetWsp;
			DetWsp = Hlp_GetNpc (Wisp_Detector);

			if (Npc_IsDead(DetWsp) == FALSE)
			{
				Snd_Play ("WSP_Dead_A1");
			};

			AI_Teleport (DetWsp, "TOT");
			B_RemoveNpc (DetWsp);
			AI_Teleport (DetWsp, "TOT");
	};

//Alligatorfleisch
	
INSTANCE ItFo_Addon_Krokofleisch_Mission (C_Item)
{	
	name 				=	"Mi�so bagiennego szczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;
	
	value 				=	Value_RawMeat;
	
	visual 				=	"ItFoMuttonRaw.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	
	description			= 	name;
	TEXT[1]				=	"Ma podejrzany zapach!";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	Value_RawMeat;

};

INSTANCE ItRi_Addon_MorgansRing_Mission (C_Item)
{	
	name 				=	"Pier�cie� Morgana";

	mainflag 			=	ITEM_KAT_MAGIC;
	flags 				=	ITEM_RING|ITEM_MISSION;
	
	value 				=	500;
	
	visual 				=	"ItRi_Prot_Total_02.3DS";
	material 			=	MAT_METAL;
	
	on_equip				=  	Equip_MorgansRing;
	on_unequip				= 	UnEquip_MorgansRing;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= name;
	
	
	TEXT[1]			= "Pier�cie� zdobiony jest mn�stwem pi�knych run.";
	TEXT[2]			= NAME_ADDON_BONUS_1H;
	COUNT[2]		= 10;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;

};

FUNC VOID Equip_MorgansRing()
{
	B_AddFightSkill (self, NPC_TALENT_1H, 10);
};

FUNC VOID UnEquip_MorgansRing()
{
	B_AddFightSkill (self, NPC_TALENT_1H, -10);
};


INSTANCE ItMi_Focus (C_Item)
{
	name 				=	"Kamie� ogniskuj�cy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Focus.3DS";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION"; 

	description			= 	name;

};
//---------------------------------------------------------------------------
//				Stahl Paket f�r Huno
//---------------------------------------------------------------------------
INSTANCE ItMi_Addon_Steel_Paket(C_Item)
{
	name 				=	"Pakiet stali";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	300;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Ta paczka jest NAPRAWD� ci�ka.";
	TEXT[3]				=	"Zawiera spor� bry�� stali.";
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	value;

};

//------------------------------------------------------------------------------------------
// 	ItWr_StonePlateCommon_Addon
//------------------------------------------------------------------------------------------
instance ItWr_StonePlateCommon_Addon (C_Item)
{
	name 				=	"Stara kamienna tablica";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	value_StonePlateCommon;

	visual 				=	"ItMi_StonePlate_Read_06.3ds"; 
	
	material 			=	 MAT_LEATHER;
	on_state[0]			=    Use_StonePlateCommon;
	scemeName			=	"MAP";
	
	inv_rotx			=  - 90;
	inv_roty			=   0;
	inv_rotz			=   0;
	
	description			= 	name;
	TEXT[2]				= 	"Szara kamienna tablica";
	TEXT[3]				=	"";
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	value_StonePlateCommon;
};
//---------------------------------------------------------------------------
func void Use_StonePlateCommon ()
{
	var int nDocID;
		
	
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		nDocID = 	Doc_Create();								//DocManager 
		Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
		Doc_SetPage 	( nDocID,  0, "Maya_Stoneplate_03.TGA"  , 0 	); 
		Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
		Doc_SetMargins	( nDocID, -1, 70, 50, 90, 50, 1   	);  //  0 -> margins are in pixels
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Kasta wojownik�w wywo�a�a gniew naszego boga.");	
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "RADEMES, nast�pca QUARHODRONA, zosta� wyp�dzony. Ale jego z�owroga moc dotar�a do nas nawet z jego miejsca wygnania.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Byli�my wobec niej bezsilni.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Na JARKENDAR spad� gniew ADANOSA!");	
	}
	else //Spieler beherrscht Sprache nicht
	{
		nDocID = 	Doc_Create();								//DocManager 
		Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
		Doc_SetPage 	( nDocID,  0, "Maya_Stoneplate_02.TGA"  , 0 	); 
		/*
		Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
		Doc_SetMargins	( nDocID, -1, 70, 50, 90, 50, 1   	);  //  0 -> margins are in pixels
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Oksefd nodnf Kwe. Erfjkemvfj Hwoqmnyhan ckh Sebnejbuwd Weinfiwjf Ihwqpjrnn.");	
		Doc_PrintLine	( nDocID,  0, "");	
		Doc_PrintLines	( nDocID,  0, "RHADEMES revfnbrebuiwe QUAHODRON ewohjfribwe wef Gkjsdhad smoelk. Ihdh Znshen Fjewheege Egdgsmkd Ygc slje smoelkor.");
		Doc_PrintLine	( nDocID,  0, "");	
		Doc_PrintLines	( nDocID,  0, "Esfjwedbwe ewzbfujbwe Iuhdfb");	
		Doc_PrintLine	( nDocID,  0, "");	
		Doc_PrintLines	( nDocID,  0, "ADANOS Ygc Egdgsmkd JHARKENDAR!");	
		*/
		B_Say (self, self, "$CANTREADTHIS");	
	};
		
	Doc_PrintLine	( nDocID,  0, "");
	Doc_Show		( nDocID );
};
//---------------------------------------------------------------------------
//				Die 5 Steintafeln  
//---------------------------------------------------------------------------

INSTANCE ItMi_Addon_Stone_01(C_Item) //Esteban und Thorus  //Joly:Die Banditen benutzen diese Steintafeln als Zahlungsmittel.
{
	name 				=	"Czerwona kamienna tablica";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_03.3ds"; 
	
	material 			=	 MAT_STONE;
	on_state[0]			=    Use_Addon_Stone_01;
	scemeName			=	"MAP";

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	
	inv_rotx			=  - 90;
	inv_roty			=   0;
	inv_rotz			=   0;
	
	
	description			= 	name;
	TEXT[2]				= 	"Czerwona kamienna tablica";
	TEXT[3]				=	"";
};
//---------------------------------------------------------------------------
FUNC VOID Use_Addon_Stone_01()
{
	var int nDocID;
		
	nDocID = 	Doc_Create();								//DocManager 
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "Adanos_Stoneplate_02.TGA"  , 0 	); 
	Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
	Doc_SetMargins	( nDocID, -1, 70, 50, 90, 50, 1   	);  //  0 -> margins are in pixels
	Doc_PrintLine	( nDocID,  0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines	( nDocID,  0, "My, trzej pozostali przyw�dcy Rady Pi�ciu, za�o�yli�my pu�apki w �wi�tyni i zapiecz�towali�my jej wej�cie. Oby miecz na zawsze ju� pozosta� w mroku.");
	}
	else
	{
		Doc_PrintLines	( nDocID,  0, "Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		B_Say (self, self, "$CANTREADTHIS");
	};
	Doc_PrintLine	( nDocID,  0, "");
	Doc_Show		( nDocID );
};
//---------------------------------------------------------------------------
//		Steintafel 5		
//---------------------------------------------------------------------------
INSTANCE ItMi_Addon_Stone_05(C_Item) //Valley - Totenw�chter
{
	name 				=	"��ta kamienna tablica"; 

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_04.3ds"; 
	
	material 			=	 MAT_STONE;
	on_state[0]			=    Use_Addon_Stone_05;
	scemeName			=	"MAP";

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	
	inv_rotx			=  - 90;
	inv_roty			=   0;
	inv_rotz			=   0;
	
	description			= 	name;
	TEXT[2]				= 	"��ta kamienna tablica";
	TEXT[3]				=	"";
};
//---------------------------------------------------------------------------
FUNC VOID Use_Addon_Stone_05()
{
	var int nDocID;
		
	nDocID = 	Doc_Create();								//DocManager 
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "Adanos_Stoneplate_01.TGA"  , 0 	); 
	Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
	Doc_SetMargins	( nDocID, -1, 70, 50, 90, 50, 1   	);  //  0 -> margins are in pixels
	Doc_PrintLine	( nDocID,  0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines	( nDocID,  0, "Ja, kt�ry sprzeciwi�em si� rozkazom tr�jki, zbudowa�em pierwsz� pu�apk�. I tylko ja znam w�a�ciwe wrota.");
	}
	else
	{
		Doc_PrintLines	( nDocID,  0, "Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		B_Say (self, self, "$CANTREADTHIS");
	};
	Doc_PrintLine	( nDocID,  0, "");
	Doc_Show		( nDocID );
};
//---------------------------------------------------------------------------
//		Steintafel 3		
//---------------------------------------------------------------------------
INSTANCE ItMi_Addon_Stone_03(C_Item) //Valley - Priester
{
	name 				=	"Niebieska kamienna tablica";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_05.3ds"; 
	
	material 			=	 MAT_STONE;
	on_state[0]			=    Use_Addon_Stone_03;
	scemeName			=	"MAP";
	
	inv_rotx			=  - 90;
	inv_roty			=   0;
	inv_rotz			=   0;
	
	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	
	description			= 	name;
	TEXT[2]				= 	"Niebieska kamienna tablica";
	TEXT[3]				=	"";
};
//---------------------------------------------------------------------------
FUNC VOID Use_Addon_Stone_03()
{
	var int nDocID;
		
	nDocID = 	Doc_Create();								//DocManager 
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "Adanos_Stoneplate_03.TGA"  , 0 	); 
	Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
	Doc_SetMargins	( nDocID, -1, 70, 50, 90, 50, 1   	);  //  0 -> margins are in pixels
	Doc_PrintLine	( nDocID,  0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines	( nDocID,  0, "KHARDIMON przygotowa� drug� pu�apk�. Tylko ten, kto nie zejdzie ze �cie�ki �wiat�a, dotrze do trzeciej komnaty.");
	}
	else
	{
		Doc_PrintLines	( nDocID,  0, "KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		B_Say (self, self, "$CANTREADTHIS");
	};
	Doc_PrintLine	( nDocID,  0, "");
	Doc_PrintLines	( nDocID,  0, "");
	Doc_PrintLine	( nDocID,  0, "");
	Doc_Show		( nDocID );
};
//---------------------------------------------------------------------------
//		Steintafel 4		
//---------------------------------------------------------------------------
INSTANCE ItMi_Addon_Stone_04(C_Item)  //DAS DING AUS DEM SENAT /SUMPF  //Joly: Haus der Heiler
{
	name 				=	"Zielona kamienna tablica"; 

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_01.3ds"; 
	
	material 			=	 MAT_STONE;
	on_state[0]			=    Use_Addon_Stone_04;
	scemeName			=	"MAP";
	
	inv_rotx			=  - 90;
	inv_roty			=   0;
	inv_rotz			=   0;
	
	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	
	description			= 	name;
	TEXT[2]				= 	"Zielona kamienna tablica";
	TEXT[3]				=	"";
};
//---------------------------------------------------------------------------
FUNC VOID Use_Addon_Stone_04()
{
	var int nDocID;
		
	nDocID = 	Doc_Create();								//DocManager 
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "Adanos_Stoneplate_04.TGA"  , 0 	); 
	Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
	Doc_SetMargins	( nDocID, -1, 70, 50, 90, 50, 1   	);  //  0 -> margins are in pixels
	Doc_PrintLine	( nDocID,  0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines	( nDocID,  0, "Trzecia pu�apka zosta�a zbudowana przez QUARHODRONA i jedynie on wie, jak otworzy� bram�.");
	}
	else
	{
		Doc_PrintLines	( nDocID,  0, "Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		B_Say (self, self, "$CANTREADTHIS");
	};
	Doc_PrintLine	( nDocID,  0, "");
	Doc_Show		( nDocID );
};
//---------------------------------------------------------------------------
//		Steintafel 5		
//---------------------------------------------------------------------------
INSTANCE ItMi_Addon_Stone_02(C_Item) //Bibliothek der Erbauer.
{
	name 				=	"Fioletowa kamienna tablica"; 

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_02.3ds"; 
	
	material 			=	 MAT_STONE;
	on_state[0]			=    Use_Addon_Stone_02;
	scemeName			=	"MAP";
	
	inv_rotx			=  - 90;
	inv_roty			=   0;
	inv_rotz			=   0;
	
	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	
	description			= 	name;
	TEXT[2]				= 	"Fioletowa kamienna tablica";
	TEXT[3]				=	"";
};
//---------------------------------------------------------------------------
FUNC VOID Use_Addon_Stone_02()
{
	var int nDocID;
		
	nDocID = 	Doc_Create();								//DocManager 
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "Adanos_Stoneplate_05.TGA"  , 0 	); 
	Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
	Doc_SetMargins	( nDocID, -1, 70, 50, 90, 50, 1   	);  //  0 -> margins are in pixels
	Doc_PrintLine	( nDocID,  0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines	( nDocID,  0, "QUARHODRON by� te� tym, kt�ry z pomoc� KHARDIMONA zapiecz�towa� zewn�trzn� bram� �wi�tyni. �aden z nich nie prze�y� tego rytua�u.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Jedynie ja pozosta�em, aby by� �wiadkiem tych wydarze�.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Oby RADEMES przez ca�� wieczno�� gni� wewn�trz �wi�tyni!");
	}
	else
	{
		Doc_PrintLines	( nDocID,  0, "QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Erfjkemvfj RADEMES Fjewheege Egdgsmkd!");
		B_Say (self, self, "$CANTREADTHIS");
	};
	Doc_PrintLine	( nDocID,  0, "");
	Doc_Show		( nDocID );
};




//*******************************************
//		Der goldene Kompass
//*******************************************

INSTANCE ItMI_Addon_Kompass_Mis (C_Item)
{
	name 				=	"Z�oty kompas";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	500;

	visual 				=	"ItMi_Compass_01.3DS";
	material 			=	MAT_STONE;

	description			= 	name;

};

//*******************************************
//			Morgans Schatz
//*******************************************

INSTANCE ItSE_Addon_FrancisChest	(C_Item)
{
	name 				=	"Skrzynia ze skarbem";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_GoldChest.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   FrancisChest;
	
	description			= 	"Skrzynia ze skarbem";
	
	TEXT[0]				= 	"Skrzynia jest dosy� ci�ka.";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID FrancisChest ()
{
		
		CreateInvItems (hero,ItMi_GoldChest,1);
		CreateInvItems (hero,ItMw_FrancisDagger_Mis,1);
		CreateInvItems (hero,Itmi_Gold,153);
		CreateInvItems (hero,ItMi_GoldCup,1);
		CreateInvItems (hero,ItMi_SilverNecklace,1);
		CreateInvItems (hero,ITWR_Addon_FrancisAbrechnung_Mis,1);
		
		Snd_Play ("Geldbeutel");
		Print ("Zdoby�em stert� r�nych rzeczy.");
};

INSTANCE ITWR_Addon_FrancisAbrechnung_Mis (C_ITEM)
{
	name 					=	"Wynagrodzenie";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	NAME;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseFrancisAbrechnung_Mis;
};

	FUNC VOID UseFrancisAbrechnung_Mis()
	{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga

					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Statek kupiecki 'Syrena'"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Suma �up�w: 14560");
					Doc_PrintLine	( nDocID,  0, "-----------------------"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Za�oga       : 9840");
					Doc_PrintLine	( nDocID,  0, "Oficerowie   : 2500");
					Doc_PrintLine	( nDocID,  0, "Kapitan      : 1200");
					Doc_PrintLine	( nDocID,  0, "----------------------------"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "moja dzia�ka  : 2220");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Fregata 'Miriam'"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Suma �up�w: 4890");
					Doc_PrintLine	( nDocID,  0, "----------------------------"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Za�oga       : 2390");
					Doc_PrintLine	( nDocID,  0, "Oficerowie   : 500");
					Doc_PrintLine	( nDocID,  0, "Kapitan      : 500");
					Doc_PrintLine	( nDocID,  0, "----------------------------"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "moja dzia�ka  : 1000");
					Doc_PrintLine	( nDocID,  0, "");
	

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Statek handlowy 'Nico'"	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Suma �up�w: 9970");
					Doc_PrintLine	( nDocID,  1, "----------------------------"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Za�oga       : 5610");
					Doc_PrintLine	( nDocID,  1, "Oficerowie   : 1500");
					Doc_PrintLine	( nDocID,  1, "Kapitan      : 1000");
					Doc_PrintLine	( nDocID,  1, "----------------------------"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "moja dzia�ka  : 1860");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Statek kupiecki 'Maria'"	);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Suma �up�w: 7851");
					Doc_PrintLine	( nDocID,  1, "----------------------------"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Za�oga       : 4000");
					Doc_PrintLine	( nDocID,  1, "Oficerowie   : 750");
					Doc_PrintLine	( nDocID,  1, "Kapitan      : 1000");
					Doc_PrintLine	( nDocID,  1, "----------------------------"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "moja dzia�ka  : 1701");
					Doc_PrintLine	( nDocID,  1, "");
					
					Francis_HasProof = TRUE;
					
					Doc_Show		( nDocID );
					
					B_Say (self, self, "$ADDON_THISLITTLEBASTARD");	   

};

//-----------------------------------------------------------------------
//		Gregs Logbuch
//-----------------------------------------------------------------------

INSTANCE ITWR_Addon_GregsLogbuch_Mis (C_ITEM)
{
	name 					=	"Dziennik";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Dziennik Grega";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseGregsLogbuch;
};

	FUNC VOID UseGregsLogbuch()
	{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga

					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLines	( nDocID,  0, "Mam ju� do�� tej pla�y! Wok� tylko piasek. Nie mog� nawet spa�, bo mnie wsz�dzie sw�dzi. Czas, �eby Kruk w ko�cu sypn�� z�otem za wi�ni�w i �eby�my w ko�cu st�d odp�yn�li. Co� mi si� zdaje, �e musz� powa�nie pogada� z tym bufonem.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Co ten pacan sobie wyobra�a? Kaza� odprawi� mnie z kwitkiem swoim �mierdz�cym najemnikom. Wkr�tce si� dowie, z kim ma do czynienia. Na pocz�tek za�atwi� tego s�u�alca Bloodwyna."	);
					Doc_PrintLines	( nDocID,  0, "Je�li wkr�tce nie zap�aci, b�d� musia� zrobi� si� naprawd� niemi�y.");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLines	( nDocID,  1, "Bandyci si� rozzuchwalili. Wci�� nie zap�acili za ostatni transport. Po prostu za ma�o wiemy. Musz� wybada�, co planuje Kruk."	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Wezm� wi�kszo�� za�ogi na kontynent i zabezpieczymy rud�. Francis zostanie z paroma lud�mi i ufortyfikuje ob�z."	);
					Doc_PrintLines	( nDocID,  1, "Aby mie� pewno��, �e ka�dy ma zaj�cie, da�em Bonesowi zbroj�. Przekradnie si� w niej do obozu bandyt�w i dowie si�, co knuje Kruk.");
					
					Greg_GaveArmorToBones = TRUE;
					
					Doc_Show		( nDocID );
};
//-----------------------------------------------------------------------
//Bloodwyns Truhenschl�ssel - Schwere Garder�stung
//-----------------------------------------------------------------------
INSTANCE ITKE_Addon_Bloodwyn_01 (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Klucz Bloodwyna";
	
	TEXT[2]				=	"Pasuje do skrzyni";
	TEXT[3]				=   "";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-----------------------------------------------------------------------
//Heiler Truhenschl�ssel - 
//-----------------------------------------------------------------------
INSTANCE ITKE_Addon_Heiler (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Klucz kamiennego stra�nika";
	
	TEXT[2]				=	"Pasuje do skrzyni";
	TEXT[3]				=   "w dziwnym budynku na bagnie";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};




INSTANCE  ItMi_TempelTorKey (C_ITEM)
{	
	name 				=	"Kamienna tablica Quarhodrona";
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";	 
	material 			=	MAT_STONE;
	scemeName			=	"MAP";
	on_state[0]			=	Use_TempelTorKey;

	TEXT[2]		= "Klucz do �wi�tyni Adanosa";

};
func void Use_TempelTorKey ()
{	
	var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Maya_Stoneplate_03.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLines	( nDocID,  0, "  Eligam Shameris"					); 
				
					Doc_PrintLine	( nDocID,  0, "  Jhehedra Akhantar"					); 
 
 					Doc_Show		( nDocID ); 
};
//-----------------------------------------------------------------------
//	Bloodwyns Kopf
//-----------------------------------------------------------------------
INSTANCE ItMi_Addon_Bloodwyn_Kopf (C_Item)
{
	name 				=	"G�owa Bloodwyna";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Head_Bloodwyn_01.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[2]				=	"";
	TEXT[3]				=   "";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//------------------------------------------------------------------------

instance ItWR_Addon_TreasureMap (C_Item)
{
	name 		= "Mapa do skarbu"; 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 250;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_TreasureMap;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "Na mapie s� zaznaczone jakie� miejsca.";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_TreasureMap()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Addon_TreasureMap);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_AddonWorld_Treasures.tga", TRUE);  // TRUE = scale to fullscreen
				    Doc_SetLevel        (Document, "Addon\AddonWorld.zen");
   					Doc_SetLevelCoords  (Document, -47783, 36300, 43949, -32300);//Joly:gut so
   					Doc_Show			(Document);
	};


//------------------------------------------------------------------------

INSTANCE ItMi_Addon_GregsTreasureBottle_MIS	(C_Item)
{
	name 				=	"Wiadomo�� w butelce";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItFo_Water.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_GregsBottle;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "W �rodku jest kawa�ek papieru";

};
func void Use_GregsBottle ()
{
	B_PlayerFindItem (ItWR_Addon_TreasureMap,1);
};

/******************************************************************************************/
INSTANCE itmi_erolskelch (C_Item)
{
	name 				=	"P�kni�ta srebrna misa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	125;

	visual 				=	"ItMi_SilverChalice.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= 	value;
};
