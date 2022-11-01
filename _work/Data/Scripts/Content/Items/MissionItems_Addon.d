//****************************************************************************
//				Cavalorn's Brief an Vatras von Saturas
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_SaturasFirstMessage_Addon_Sealed	(C_Item)
{
	name 				=	"Sealed Message";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_SaturasFirstMessage_Sealed;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "This message was carefully sealed.";

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
					Doc_PrintLine	( nDocID,  0, "Dear Vatras,"					);
					Doc_PrintLines	( nDocID,  0, "We have adanced to the portal. You were correct."					);
					Doc_PrintLines	( nDocID,  0, "It indeed appears that they were believers in Adanos. I ask you to verify this once again with the help of my notes."					);
					Doc_PrintLines	( nDocID,  0, "We have not spotted any of those curious stone beings for days."					);
					Doc_PrintLines	( nDocID,  0, "Nevertheless, the earth continues to quake for no apparent reason."					);
					Doc_PrintLines	( nDocID,  0, "I suspect that our studies will soon bring us more enlightenment."					);
					Doc_PrintLines	( nDocID,  0, "The ornament which we found has a far more important significance than we first thought. It seems to be a crucial key artifact. Alas, it is not complete. We must study it further."					);
					Doc_PrintLines	( nDocID,  0, "Dispatch one of our children from the 'Ring of Water' to bring it back to us. If possible, do not send Cavalorn."					);
					Doc_PrintLines	( nDocID,  0, "I have assigned him to deliver this letter to you. I think that is enough for him to do. "					);
					Doc_PrintLines	( nDocID,  0, "I hope we are doing the right thing."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Saturas"					);
					Doc_Show		( nDocID );
		
		if (Use_SaturasFirstMessage_OneTime == FALSE)
		&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
		{
			Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_KDW,"I took a message that Cavalorn was supposed to deliver to the Water Mage Vatras from a bandit. Now it is my task."); 
			Use_SaturasFirstMessage_OneTime = TRUE;
		};

		if (SC_KnowsRanger == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
			Log_AddEntry (TOPIC_Addon_RingOfWater,"There is a community that calls itself the 'Ring of Water'. The Water Mages seem to be the commanders of this community."); 
		};

		if (SC_IsRanger == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
			Log_AddEntry (TOPIC_Addon_RingOfWater,"Cavalorn belongs to the 'Ring of Water'."); 
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
//				Das Siegel wurde geöffnet		
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_SaturasFirstMessage_Addon	(C_Item)
{
	name 				=	"Opened message";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_SaturasFirstMessage;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[2]				=   "Saturas' letter to Vatras";
};


//****************************************************************************
//				Portalschlüsselbruchstück
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

	TEXT	[0]			=	"Fragment of a large ornamental ring";

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

	TEXT	[0]			=	"Fragment of a large ornamental ring";

	INV_ZBIAS			= 	INVCAM_ENTF_MISC5_STANDARD;
};

//****************************************************************************
//				ItWr_Map_NewWorld_Ornaments_Addon
//			---------------------------------------------
//****************************************************************************


instance ItWr_Map_NewWorld_Ornaments_Addon (C_Item)
{
	name 		= "Nefarius' map";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 250;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_NewWorld_Ornaments;

	description	= name;
	TEXT[0]		= "The places where Nefarius assumes the missing";
	TEXT[1]		= "ornaments can be found are marked on this map";
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
	name 		= "Land Map of Khorinis";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 210;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_NewWorld_Dexter;

	description	= name;
	TEXT[0]		= "Skip has marked the place";
	TEXT[1]		= "where I can find the bandit chief";
	TEXT[2]		= "Dexter.";
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
	name 					=	"Aquamarine ring";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING|ITEM_MISSION; //Joly:kein Multiitem. Die ringe sind individuell

	value 					=	Value_Ri_HpMana;

	visual 					=	"ItRi_Hp_Mana_01.3ds"; 

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Ranger_Addon;
	on_unequip				=	UnEquip_ItRi_Ranger_Addon;

	description				= "Recognition sign of the 'Ring of Water'";
	
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
	TEXT[1]					= "This ring belongs to Lares";
};

//PCs Ring
INSTANCE ItRi_Ranger_Addon (Rangerring_Prototype)
{
	TEXT[1]					= "This ring belongs to me";
};
//Lance Ring
INSTANCE ItRi_LanceRing (Rangerring_Prototype)
{
	TEXT[1]					= "This ring belongs to Lance";
};



//****************************************************************************
//				ItMi_PortalRing_Addon
//			---------------------------------------------
//****************************************************************************

INSTANCE ItMi_PortalRing_Addon (C_Item)
{
	name 				=	"Ornamental ring";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_PortalRing_01.3DS"; 
	material 			=	MAT_STONE;

	description			= 	"This ring opens the portal";
	INV_ZBIAS			= 	INVCAM_ENTF_MISC3_STANDARD;
};

//**********************************************************************************
//	Empfehlungsschreiben für Andre, Miliz zu werden (von Martin)
//----------------------------------------------------------------------------------

INSTANCE ItWr_Martin_MilizEmpfehlung_Addon		(C_Item)
{
	name 				=	"Martin's letter of recommendation";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_MartinMilizEmpfehlung_Addon;
	scemeName			=	"MAP";
	description			=  	"Letter of recommendation for Lord Andre";
	
	TEXT[2]				= 	"This letter should help me be";
	TEXT[3]				= 	"accepted in the militia";

	
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
					Doc_PrintLines	(nDocID,  0, "Honored Lord Andre"								);
					Doc_PrintLines	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "With this letter I send a new recruit for our militia to you.");
					Doc_PrintLines	(nDocID,  0, "He has already been of service to me in some difficult and important matters.");
					Doc_PrintLines	(nDocID,  0, "I am sure that he is very well suited to protect the King and the welfare of the citizens of this city.");
					Doc_PrintLine	(nDocID,  0, "Innos bless the King."							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "     Provisions Master Martin"						);
					Doc_Show		(nDocID);
		
};


//**********************************************************************************
//	Ravens Befehle an Dexter
//----------------------------------------------------------------------------------

INSTANCE ItWr_RavensKidnapperMission_Addon		(C_Item)
{
	name 				=	"Orders";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_RavensKidnapperMission_Addon;
	scemeName			=	"MAP";
	description			=  	name;
	
	TEXT[2]				= 	"I took this letter from";
	TEXT[3]				= 	"the bandit Dexter";

	
};
var int Use_RavensKidnapperMission_Addon_OneTime;
func void Use_RavensKidnapperMission_Addon ()
{   
 	if (Use_RavensKidnapperMission_Addon_OneTime == FALSE)
 	&& (MIS_Addon_Vatras_WhereAreMissingPeople != 0)
 	{
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Now I have it in writing. Raven, the former ore baron, is behind the kidnapping of the citizens of Khorinis. Raven's hideout is somewhere behind the mountains in the northeast of Khorinis. Vatras should see this document."); 
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};

 	SCKnowsMissingPeopleAreInAddonWorld = TRUE;

	var int nDocID;
		
	nDocID = 	Doc_Create		();
				Doc_SetPages	(nDocID,  1);
				Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
				Doc_SetFont		(nDocID, -1, FONT_Book);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID,  0, "Dexter, you bastard!");
				Doc_PrintLine	(nDocID,  0, ""														);
				Doc_PrintLines	(nDocID,  0, "You weren't so unreliable when I was still an ore baron.");
				Doc_PrintLines	(nDocID,  0, "If you can't manage to kidnap more citizens from the city and send them to me, then we will soon have a serious problem with the boys in our hideout.");
				Doc_PrintLines	(nDocID,  0, "I need more slaves here or the boys will start a revolt. And I don't have to tell you what that means, do I?");
				Doc_PrintLines	(nDocID,  0, "I am about to get inside the temple. With that, I can't afford disturbances of this sort.");
				Doc_PrintLines	(nDocID,  0, "And one more problem:"								);
				Doc_PrintLines	(nDocID,  0, "Sooner or later we have to find a way over the high mountains in the northeast of Khorinis. The pirates won't handle the transport much longer if we don't pay them any more.");
				Doc_PrintLine	(nDocID,  0, ""														);
				Doc_PrintLine	(nDocID,  0, "     Raven"											);
				Doc_Show		(nDocID);
		
};

//**********************************************************************************
//	Empfehlungsschreiben für Pedro, ins Kloster eingelassen zu werden.
//----------------------------------------------------------------------------------

INSTANCE ItWr_Vatras_KDFEmpfehlung_Addon		(C_Item)
{
	name 				=	"Vatras' letter of recommendation";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_VatrasKDFEmpfehlung_Addon;
	scemeName			=	"MAP";
	description			=  	"Vatras' letter of recommendation";
	
	TEXT[2]				= 	"This letter should help me get into";
	TEXT[3]				= 	"the Fire Magicians' monastery";
	TEXT[4]				= 	"without tribute.";

	
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
					Doc_PrintLines	( nDocID,  0, "Brothers of the Fire");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLines	( nDocID,  0, "It has just been reported to me that you require a tribute for admission into your realm.");
					Doc_PrintLines	( nDocID,  0, "I send along with this letter a devout man who wishes to become a novice in your ranks."					);
					//Doc_PrintLine	( nDocID,  0, "Ich hoffe, dass ich nicht persönlich erscheinen muss ihm den Einlass ");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Vatras");
					Doc_Show		( nDocID );				
		
};

/******************************************************************************************/
INSTANCE ItMi_LostInnosStatue_Daron (C_Item)
{
	name 				=	"Valuable statue of Innos";

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
	name 				=	"Lucia's farewell letter";

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
	B_LogEntry (TOPIC_Addon_Lucia,"Lucia wrote a farewell letter to Elvrich. That should interest him."); 
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
					Doc_PrintLines	( nDocID,  0, "Dearest Elvrich");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLines	( nDocID,  0, "I cannot find the words to describe how sorry I am.");
					Doc_PrintLines	( nDocID,  0, "I know that you will not understand but I have come to the conclusion that it is better for both of us if you find a more respectable girl than I am."					);
					Doc_PrintLines	( nDocID,  0, "I won't be coming back from where I am going now. Forget me. A wench like me isn't right for an upright fellow like you. Farewell.");
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
	name 				=	"Stone";

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
	name 				=	"Pick";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Rake;

	visual 				=	"ItMi_Rake.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"RAKE";
	on_state[1]			= 	Use_Rake;
	description			= 	name;
	
	//TEXT[3]				=   "(Lässt sich bei geöffnetem Inventar benutzen)";
	//TEXT[4]				=   "('Aktionstaste' + 'Pfeil- Vorne' gedrückt halten)";
	
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
INSTANCE ItRi_Addon_BanditTrader(C_Item)	//Händlergildenring
{
	name 					=	"Guild ring";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	5 ;

	visual 					=	"ItRi_Prot_Point_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				= 	"Engraved ring";
	
	TEXT[2]					= 	"overseas-trader guild Araxos";
	
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
	name 				=	"Delivery";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_ItWr_Addon_BanditTrader;
	scemeName			=	"MAP";
	description			=  	name;
	
	TEXT[2]				= 	"I found this letter with the";
	TEXT[3]				= 	"bandits behind Sekob's farm";

	
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
					Doc_PrintLines	( nDocID,  0, "15 short swords");
					Doc_PrintLines	( nDocID,  0, "20 rapiers"					);
					Doc_PrintLines	( nDocID,  0, "25 loaves of bread");
					Doc_PrintLines	( nDocID,  0, "15 bottles of wine"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "That was the last time."					);
					Doc_PrintLines	( nDocID,  0, "This thing is getting too hot"					);
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "FERNANDO");
					Doc_Show		( nDocID );				
	
	if (MIS_Vatras_FindTheBanditTrader != 0)
	&& (Use_ItWr_Addon_BanditTrader_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_Addon_BanditTrader,"I found a document that can prove that Fernando is the weapons dealer I am looking for."); 
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};

//****************************************************************************
//				Vatras schickt SC zu Saturas
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_Vatras2Saturas_FindRaven	(C_Item)
{
	name 				=	"Message";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "Vatras' letter for Saturas";

};
func void Use_Vatras2Saturas_FindRaven ()
{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  1 );                         
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 	); 
					Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   	);  
					Doc_PrintLine	( nDocID,  0, "Dear Saturas"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "I hope that you will soon reach your goal. Our situation here in the city appears to have relaxed somewhat at the moment. But I fear that the quiet is deceptive. You should hurry. I need you here."					);
					Doc_PrintLines	( nDocID,  0, "I have studied your records and can confirm your suspicion. The writing does indeed point to an Adanos-worshipping culture. Be careful and do not allow yourselves to be blinded by false prophets."					);
					Doc_PrintLines	( nDocID,  0, "The missing citizens of Khorinis were dragged by the former ore baron Raven to the region where the portal obviously leads."					);
					Doc_PrintLines	( nDocID,  0, "One more thing: I have sent you help. The bearer of this message is somebody very special. He has such a remarkable gleam in his eyes. I am not certain, but it could be HE, even if we had imagined him differently."					);
					Doc_PrintLines	( nDocID,  0, "Test him. I think I am right."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Vatras"					);
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
	name 				=	"Opened message";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Vatras2Saturas_FindRaven;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[2]				=   "Vatras' letter for Saturas";
};

//------------------------------------------------------------------------------------------
// Amulett des suchenden Irrlichts
//------------------------------------------------------------------------------------------
	INSTANCE  ItAm_Addon_WispDetector (C_Item)  
{
	name 			=	"Ore amulet";

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

	description		=  "Ore amulet of the searching will-o'-the-wisp";

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
	name 				=	"Swamprat meat";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;
	
	value 				=	Value_RawMeat;
	
	visual 				=	"ItFoMuttonRaw.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	
	description			= 	name;
	TEXT[1]				=	"Smells fishy somehow!";
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	Value_RawMeat;

};

INSTANCE ItRi_Addon_MorgansRing_Mission (C_Item)
{	
	name 				=	"Morgan's ring";

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
	
	
	TEXT[1]			= "The ring is decorated with many fine runes.";
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
	name 				=	"Focus stone";

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
//				Stahl Paket für Huno
//---------------------------------------------------------------------------
INSTANCE ItMi_Addon_Steel_Paket(C_Item)
{
	name 				=	"Steel package";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	300;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"This package is REALLY heavy";
	TEXT[3]				=	"It contains a fat lump of steel";
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	value;

};

//------------------------------------------------------------------------------------------
// 	ItWr_StonePlateCommon_Addon
//------------------------------------------------------------------------------------------
instance ItWr_StonePlateCommon_Addon (C_Item)
{
	name 				=	"Old stone tablet";

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
	TEXT[2]				= 	"A gray stone tablet";
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
		Doc_PrintLines	( nDocID,  0, "The caste of the warriors called down the wrath of our god.");	
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "RHADEMES, the successor of Quarhodron, was banished. But his evil power reached us even from the place of his exile.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "We were powerless against it.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "ADANOS' wrath struck JHERENDAR!");	
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
	name 				=	"Red stone tablet";

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
	TEXT[2]				= 	"A red stone tablet";
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
		Doc_PrintLines	( nDocID,  0, "We, the last three leaders of the Council of Five, have provided the chambers of the temple with traps and hidden the entrance so that the sword will never again see the light of day.");
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
INSTANCE ItMi_Addon_Stone_05(C_Item) //Valley - Totenwächter
{
	name 				=	"Yellow stone tablet"; 

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
	TEXT[2]				= 	"A yellow stone tablet";
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
		Doc_PrintLines	( nDocID,  0, "I, who was against the decision of the Three, built the first trap. And only I know the correct doorway.");
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
	name 				=	"Blue stone tablet";

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
	TEXT[2]				= 	"A blue stone tablet";
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
		Doc_PrintLines	( nDocID,  0, "KHARDIMON devised the second trap. And only he who follows the way of Light to the end will reach the third chamber.");
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
	name 				=	"Green stone tablet"; 

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
	TEXT[2]				= 	"A green stone tablet";
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
		Doc_PrintLines	( nDocID,  0, "The third trap was built by QUARHODRON and only he knows how to open the portal.");
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
	name 				=	"Purple stone tablet"; 

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
	TEXT[2]				= 	"A purple stone tablet";
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
		Doc_PrintLines	( nDocID,  0, "It was also Quarhodron who sealed the outer gate of the temple with the help of KHARDIMON. Neither of them survived the ritual.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Only I remain to tell the tale.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "I hope that RHADEMES rots for eternity in the temple!");
	}
	else
	{
		Doc_PrintLines	( nDocID,  0, "QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0, "Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!");
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
	name 				=	"Golden Compass";

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
	name 				=	"Treasure Chest";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_GoldChest.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   FrancisChest;
	
	description			= 	"A treasure chest";
	
	TEXT[0]				= 	"The chest is very heavy.";
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
		Print ("Received a pile of stuff!");
};

INSTANCE ITWR_Addon_FrancisAbrechnung_Mis (C_ITEM)
{
	name 					=	"Paybook";

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
					Doc_PrintLine	( nDocID,  0, "Merchantman 'Mermaid'"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Total booty: 14560 gold");
					Doc_PrintLine	( nDocID,  0, "-----------------------"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Crew: 9840");
					Doc_PrintLine	( nDocID,  0, "Officers: 2500");
					Doc_PrintLine	( nDocID,  0, "Captain: 1000");
					Doc_PrintLine	( nDocID,  0, "-----------------------"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Personal share: 2220");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Merchant vessel 'Miriam'"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Total booty: 4890 gold");
					Doc_PrintLine	( nDocID,  0, "-----------------------"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Crew: 2390");
					Doc_PrintLine	( nDocID,  0, "Officers: 500");
					Doc_PrintLine	( nDocID,  0, "Captain: 500");
					Doc_PrintLine	( nDocID,  0, "----------------------"	);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Personal share: 1000");
					Doc_PrintLine	( nDocID,  0, "");
	

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Merchant ship 'Nico'"	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Total booty: 9970");
					Doc_PrintLine	( nDocID,  1, "----------------------"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Crew: 5610");
					Doc_PrintLine	( nDocID,  1, "Officers: 1500");
					Doc_PrintLine	( nDocID,  1, "Captain: 1000");
					Doc_PrintLine	( nDocID,  1, "----------------------"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Personal share: 1860");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Merchantman 'Maria'"	);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "Total booty: 7851 gold");
					Doc_PrintLine	( nDocID,  1, "----------------------"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Crew: 4400");
					Doc_PrintLine	( nDocID,  1, "Officers: 750");
					Doc_PrintLine	( nDocID,  1, "Captain: 1000");
					Doc_PrintLine	( nDocID,  1, "----------------------"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Personal share: 1701");
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
	name 					=	"Log book";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Greg's log book";
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
					Doc_PrintLines	( nDocID,  0, "I've seen more than enough of this beach. Sand everywhere. I can't even sleep right any more because everything itches. It's time that Raven forked over the gold for the prisoners and we put to sea again. I'll have to have a word with the puffed-up jerk.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "How dare that ass? He made his stinking henchmen at the gate send me away. He'll have me to reckon with! I'll turn his bootlicker Bloodwyn into fish food with my own hands."	);
					Doc_PrintLines	( nDocID,  0, "If he doesn't pay soon, I'll have to get tough.");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLines	( nDocID,  1, "The bandits are getting brazen. They still haven't paid for the last delivery. We just don't have enough information. I have to find out what Raven wants here."	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "I'll take the majority of the crew to the mainland and secure the ore. Francis will stay behind with a few people and fortify the camp."	);
					Doc_PrintLines	( nDocID,  1, "So the time doesn't go to waste, I gave Bones the armor. He'll sneak into the bandit camp for me and find out what Raven is planning there.");
					
					Greg_GaveArmorToBones = TRUE;
					
					Doc_Show		( nDocID );
};
//-----------------------------------------------------------------------
//Bloodwyns Truhenschlüssel - Schwere Garderüstung
//-----------------------------------------------------------------------
INSTANCE ITKE_Addon_Bloodwyn_01 (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Bloodwyn's key";
	
	TEXT[2]				=	"Fits a chest";
	TEXT[3]				=   "";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-----------------------------------------------------------------------
//Heiler Truhenschlüssel - 
//-----------------------------------------------------------------------
INSTANCE ITKE_Addon_Heiler (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"A stone sentinel's key";
	
	TEXT[2]				=	"Fits a chest";
	TEXT[3]				=   "In a strange old building in the swamp";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};




INSTANCE  ItMi_TempelTorKey (C_ITEM)
{	
	name 				=	"Stone tablet of Quarhodron";
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";	 
	material 			=	MAT_STONE;
	scemeName			=	"MAP";
	on_state[0]			=	Use_TempelTorKey;

	TEXT[2]		= "The key to the temple of Adanos";

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
	name 				=	"Bloodwyn's head";

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
	name 		= "Treasure map"; 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 250;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_TreasureMap;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "Some places are marked on the map.";
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
	name 				=	"Message in a bottle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItFo_Water.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_GregsBottle;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "There is a piece of paper in the bottle";

};
func void Use_GregsBottle ()
{
	B_PlayerFindItem (ItWR_Addon_TreasureMap,1);
};

/******************************************************************************************/
INSTANCE itmi_erolskelch (C_Item)
{
	name 				=	"Scratched silver bowl";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	125;

	visual 				=	"ItMi_SilverChalice.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= 	value;
};
