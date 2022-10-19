//****************************************************************************
//			Schlüssel für Xardas Truhe
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Xardas(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave di un forziere";
	TEXT[3]				=   "appartenente a Xardas.";
	
};
//**********************************************************************************
//	Canthars Kompromittierender Brief für Sarah die Händlerin
//----------------------------------------------------------------------------------

INSTANCE ItWr_Canthars_KomproBrief_MIS		(C_Item)
{
	name 				=	"Lettera";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Canthars_KomproBrief;
	scemeName			=	"MAP";
	description			= 	"La lettera di Canthar alla mercante Sarah.";
};
func void Use_Canthars_KomproBrief ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_Book);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "     Ultimo avvertimento"								);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "        Ti ho già ricordato diverse volte"				);
					Doc_PrintLine	(nDocID,  0, "        nella maniera più amichevole"				);
					Doc_PrintLine	(nDocID,  0, "        i termini per i quali necessito delle"				);
					Doc_PrintLine	(nDocID,  0, "        armi che ho ordinato una settimana"			);
					Doc_PrintLine	(nDocID,  0, "        fa."										);
					Doc_PrintLine	(nDocID,  0, "        Se non avrò presto tue notizie,"		);
					Doc_PrintLine	(nDocID,  0, "        Sarah, sarò costretto a cambiare il mio"			);
					Doc_PrintLine	(nDocID,  0, "       atteggiamento verso di te. Spero che ci"			);
					Doc_PrintLine	(nDocID,  0, "        capiamo!!!!!!!!!!!!"					);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "            Onar"										);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
					
	
}; 
//****************************************************************************
//			Rods Schwert
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMw_2h_Rod (C_Item)
{	
	name 				=	"Spada a due mani di Rod";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hSchwert;

	damageTotal  		= 	Damage_Rod;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Rod;
	visual 				=	"ItMw_035_2h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//***************
//Coragons Silber
//***************
INSTANCE ItMi_CoragonsSilber (C_Item)
{
	name 				=	"Argento di Coragon";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverCup;

	visual 				=	"ItMi_SilverCup.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[3]				= 	"";	
	TEXT[4]				= 	"";	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//*******************************
//Päckchen für Thekla von Sagitta
//*******************************
INSTANCE ItMi_TheklasPaket (C_Item)
{
	name 				=	"Pacchetto di Thekla";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_TheklasPacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_TheklasPacket ()
{
	CreateInvItems (hero,ItPl_Mana_Herb_01 ,3);
	CreateInvItems (hero,ItPl_Health_Herb_02 ,1);
	CreateInvItems (hero,ItPl_Speed_Herb_01 ,1);
	CreateInvItems (hero,ItPl_Blueplant ,2);

	Print (PRINT_GotPlants);
};

//*******************************
//Marias Goldener Teller
//*******************************
instance ItMi_MariasGoldPlate (C_Item)
{
	name 				=	"Targa d'oro pesante";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldPlate;

	visual 				=	"ItMi_GoldPlate.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Su questa targa sono incisi"; 
	TEXT[3]				= 	"i nomi di Onar e Maria.";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//*******************************
//Valentinos Ring
//*******************************

INSTANCE ItRi_ValentinosRing(C_Item) //bei Cassia als Belohnung
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtEdge;

	visual 					=	"ItRi_Prot_Edge_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ValentinosRing;
	on_unequip				=	UnEquip_ValentinosRing;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Anello di Valentino.";

	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= Ri_ProtEdge;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ValentinosRing()
	{
		self.protection [PROT_EDGE] 		+=  Ri_ProtEdge;
		self.protection [PROT_BLUNT]		+=  Ri_ProtEdge;
	};

	FUNC VOID UnEquip_ValentinosRing()
	{
		self.protection [PROT_EDGE] 		-=  Ri_ProtEdge;
		self.protection [PROT_BLUNT]		-=  Ri_ProtEdge;
	};

//****************************************************************************
//			Schlüssel für Dexter Truhe
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Dexter(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave di un forziere";
	TEXT[3]				=   "appartenente a Xardas.";
	
};
//**********************************************************************************
//	Constantinos Kräuterliste
//----------------------------------------------------------------------------------

INSTANCE ItWr_Kraeuterliste (C_Item)
{
	name 				=	"Elenco";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Kraeuterliste;
	scemeName			=	"MAP";
	description			= 	"Elenco delle erbe di Costantino.";
};
func void Use_Kraeuterliste ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Erbe alchemiche"	);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Pianta curativa"	);
					Doc_PrintLine	( nDocID,  0, "Erba curativa"	);
					Doc_PrintLine	( nDocID,  0, "Radice curativa"    );
					Doc_PrintLine	( nDocID,  0, "Ortica del fuoco"  );
					Doc_PrintLine	( nDocID,  0, "Erba del fuoco"  );
					Doc_PrintLine	( nDocID,  0, "Radice del fuoco"  );
					Doc_PrintLine	( nDocID,  0, "Bacca del goblin"     );
					Doc_PrintLine	( nDocID,  0, "Radice del drago");
					Doc_PrintLine	( nDocID,  0, "Erba dello squartatore"   );
					Doc_PrintLine	( nDocID,  0, "Groviglio della prateria"      	);
					Doc_PrintLine	( nDocID,  0, "Acetosella del re"       );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Nota: lascia a un potenziale apprendista la possibilità di prendere le piante per te. Così capirai se è in gamba."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Con rispetto, Zuris."						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
}; 
//**********************************************************************************
//Neoras Mana Rezept
//----------------------------------------------------------------------------------

INSTANCE ItWr_ManaRezept (C_Item)
{
	name 				=	"Ricetta";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	20;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_ManaRezept;
	scemeName			=	"MAP";
	description			= 	"Ricetta di essenza magica.";
};
func void Use_ManaRezept ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Pozioni magiche."	);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Per preparare pozioni magiche, un alchimista esperto necessita di:");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ortica del fuoco");
					Doc_PrintLine	( nDocID,  0, "Erba del fuoco");
					Doc_PrintLine	( nDocID,  0, "Radice del fuoco");
					Doc_PrintLines	( nDocID,  0, "Inoltre necessita di una pianta di"						);
					Doc_PrintLine	( nDocID,  0, "Groviglio della prateria"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Maestro Neoras"						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
}; 


// **************************************************************************************

INSTANCE ItWr_Passierschein	(C_Item)
{
	name 				=	"Lasciapassare";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	50;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePassierschein;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"Queste carte mi permettono";
	TEXT[4]				=   "di superare le guardie della città.";
};
func void UsePassierschein ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1 );
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_BookHeadline);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "Lasciapassare"								);
					Doc_PrintLine	(nDocID,  0, "            Khorinis    "								);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "        Questo documento dà la facoltà al suo"					);
					Doc_PrintLine	(nDocID,  0, "        portatore di muoversi liberamente per le zone"		);
					Doc_PrintLine	(nDocID,  0, "        inferiori di Khorinisi per un periodo illimitato."		);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "            Larius"										);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "            il governatore del Re"						);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
};

//****************************************************************************
//				Kraut Paket für MIS_ANDRE_WAREHOUSE 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_HerbPaket(C_Item)
{
	name 				=	"Pacchetto di erbacce";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Un pacchetto appiccicoso e pesante";
	TEXT[3]				=	"che puzza di erba di palude.";
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	200;
	
};
//****************************************************************************
//				Lagerhaus Schlüssel für MIS_ANDRE_WAREHOUSE 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Storage(C_Item)
{
	name 				=	"Chiave del magazzino.";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave del magazzino del";
	TEXT[3]				=   "porto.";
	
};
const int HP_Hering = 20;
//****************************************************************************
//				Alternativer Fish - danke Levelbereich !
//			---------------------------------------------
//****************************************************************************
INSTANCE ItFo_SmellyFish (C_Item)
{	
	name 				=	"Aringa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	0;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_SmellyFish;

	description			= 	"Aringa";
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Hering;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_Fish;
};

	FUNC VOID Use_SmellyFish()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Hering);
	};
//****************************************************************************
//				Komischer Fisch von den Banditen mit Nachricht an Halvor 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItFo_HalvorFish_MIS (C_Item)
{	
	name 				=	"Uno strano pesce.";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	0;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_HalvorFish;

	description			= 	"Un pesce dall'aspetto bizzarro.";
	TEXT[2]				= 	"C'è qualcosa che non va in questo pesce.";		
	TEXT[3]				= 	"Sembra che sia stato cucito…";
};

	FUNC VOID Use_HalvorFish()
	{
		CreateInvItems (hero,ItWr_HalvorMessage ,1);
		Print	(PRINT_FishLetter);
	};
//****************************************************************************
//				Nachricht von Halvor an die Banditen, im Fisch versteckt
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_HalvorMessage	(C_Item)
{
	name 				=	"Foglio puzzolente";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseHalvorMessage;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[2]				=   "Questo foglio era nascosto dentro un pesce.";
};
func void UseHalvorMessage ()
{   
		Knows_Halvor = TRUE;
	
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_Book);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "    Tenete giù la testa, ragazzi! "				);
					Doc_PrintLine	(nDocID,  0, "    I militari si stanno insospettendo."				);
					Doc_PrintLine	(nDocID,  0, "    Non fate nulla prima di avere nuovamente mie notizie!");
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "                                                   Halvor");
					Doc_Show		(nDocID);
}; 
//****************************************************************************
//				Komischer Fisch von Halvor als Schweigegeld
//			---------------------------------------------
//****************************************************************************
/*
INSTANCE ItFo_HalvorFish (C_Item)
{	
	name 				=	"Seltsamer Fisch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	0;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_HalvorFish;

	description			= 	"Seltsam aussehender Fisch";
	TEXT[2]				= 	"Irgendwas ist in diesem Fisch versteckt";		
	
};

	FUNC VOID Use_HalvorFish()
	{
		CreateInvItems (hero,ItMi_Nugget ,1);
		PrintScreen		(PRINT_FoundOreNugget, -1, YPOS_LEVELUP, FONT_ScreenSmall, 2);
	};
*/
//****************************************
//	Alriks Schwert
//****************************************

INSTANCE ItMw_AlriksSword_Mis (C_Item)
{	
	name 				=	"Spada di Alrik";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_MISSION|ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	value_Alrik;

	damageTotal  		= 	damage_Alrik;
	damagetype 			=	DAM_EDGE;
	range    			=  	range_Alrik;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Alrik;
	visual 				=	"ItMw_025_1h_Sld_Sword_01.3DS";
	
	on_equip			=	Equip_AlriksSword;
	on_unequip			=	UnEquip_AlriksSword;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
	
	func void Equip_AlriksSword()
	{
		B_AddFightSkill (self, NPC_TALENT_1H, 10);
	};
	
	func void UnEquip_AlriksSword()
	{
		B_AddFightSkill (self, NPC_TALENT_1H, -10);
	};

//****************************************************************************
//				Botschaft von Vatras an die Magier des Feuers
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_VatrasMessage	(C_Item)
{
	name 				=	"Messaggio sigillato";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseVatrasMessage;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "Un messaggio da Vatras";
	TEXT[3]				=   "ai maghi del fuoco.";
};
func void UseVatrasMessage ()
{   
		
		CreateInvItems (self, ItWr_VatrasMessage_Open,1);
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  1 );                         
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 	); 
					Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   	);  
					Doc_PrintLine	( nDocID,  0, "Caro Isgaroth, "					);
					Doc_PrintLines	( nDocID,  0, "Percepisco la crescita costante di un'altra forza."					);
					Doc_PrintLines	( nDocID,  0, "È una forza a noi sconosciuta. Può essere che i vassalli di Beliar siano vicini?"					);
					Doc_PrintLines	( nDocID,  0, "Potrei sbagliarmi, ma credo che padre Pyrokar farebbe meglio a occuparsene di persona."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Che le nostre preghiere possano essere esaudite."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Vatras"					);
					Doc_Show		( nDocID );
}; 
//****************************************************************************
//				Botschaft von Vatras an die Magier des Feuers
//				Das Siegel wurde geöffnet		
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_VatrasMessage_Open	(C_Item)
{
	name 				=	"Messaggio";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseVatrasMessageOpen;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[2]				=   "Un messaggio da Vatras";
	TEXT[3]				=   "ai maghi del fuoco.";
	TEXT[4]				=   "Il sigillo è stato rotto.";
};
func void UseVatrasMessageOpen ()
{   
	var int nDocID;
		
		
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  1 );                         
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 	); 
					Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   	);  
					Doc_PrintLine	( nDocID,  0, "Caro Isgaroth, "					);
					Doc_PrintLines	( nDocID,  0, "Percepisco la crescita costante di un'altra forza."					);
					Doc_PrintLines	( nDocID,  0, "È una forza a noi sconosciuta. Può essere che i vassalli di Beliar siano vicini?"					);
					Doc_PrintLines	( nDocID,  0, "Potrei sbagliarmi, ma credo che padre Pyrokar farebbe meglio a occuparsene di persona."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Che le nostre preghiere possano essere esaudite."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Vatras"					);
					Doc_Show		( nDocID );
}; 
//****************************************************
//		Hotelschlüssel
//****************************************************
INSTANCE ItKe_Hotel(C_Item)
{
	name 				=	"Chiave della camera.";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave alla camera";
	TEXT[3]				=   "d'albergo.";
	
};
//****************************************************
//		Schlüssel zur Diebesgilde
//****************************************************
INSTANCE ItKe_ThiefGuildKey_MIS (C_Item)
{
	name 				=	"Chiave arrugginita";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Questa chiave è stata danneggiata dall'acqua salata del mare.";
	
};
//****************************************************
//		Schlüssel zur Diebesgilde vom Hotel
//****************************************************
INSTANCE ItKe_ThiefGuildKey_Hotel_MIS (C_Item)
{
	name 				=	"Chiave arrugginita";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave alla cantina dell'albergo.";
	
};
//****************************************************
//		Pfortenschlüssel Tempel von Innos
//****************************************************
INSTANCE ItKe_Innos_MIS(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave del portale del";
	TEXT[3]				=   "monastero di Innos.";
	
};
//****************************************************************************
//			Schlüssel Vorratskammer Kloster
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_KlosterSchatz(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave della tesoreria";
	TEXT[3]				=   "del monastero.";
	
};
//****************************************************************************
//			Schlüssel Vorratskammer Kloster
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_KlosterStore(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave della tesoreria";
	TEXT[3]				=   "del monastero.";
	
};
//****************************************************************************
//			Schlüssel Schlafgemach Player
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_KDFPlayer(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave della camera";
	TEXT[3]				=   "del monastero.";
	
};
//****************************************************************************
//			Schlüssel Bibliothek Kloster
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_KlosterBibliothek(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave della tesoreria";
	TEXT[3]				=   "del monastero.";
	
};
//****************************************************************************
//			Extra Wurst Gorax Mission
//			---------------------------------------------
//****************************************************************************
INSTANCE ItFo_Schafswurst (C_Item)
{	
	name 				=	"Salsiccia di pecora";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Sausage;
	
	visual 				=	"ItFo_Sausage.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Schafswurst;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Sausage;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_Sausage;

};

	FUNC VOID Use_Schafswurst()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Sausage);
	};
/******************************************************************************************/
INSTANCE ItPo_Perm_LittleMana(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	150;	

	visual 			=	"ItPo_Perm_Mana.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_LittleMana;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION"; 

	description		= 	"Essenza di Spirito";
	TEXT[1]			= 	NAME_Bonus_ManaMax;			
	COUNT[1]		= 	3;
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value;
};

	FUNC VOID UseItPo_LittleMana()
	{
		B_RaiseAttribute	(self, ATR_MANA_MAX,	3);
		Npc_ChangeAttribute	(self, ATR_MANA,	3);
	};
//****************************************************
//		Hammer Innos, für Golem Prüfung 
//****************************************************
INSTANCE Holy_Hammer_MIS (C_Item)
{	
	name 				=	"Martello consacrato";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_MISSION |ITEM_2HD_AXE ;	
	material 			=	MAT_METAL;

	value 				=	Value_HolyHammer;

	owner				=	Nov_608_Garwig;

	damageTotal  		= 	Damage_HolyHammer;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_HolyHammer;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_HolyHammer;
	visual 				=	"ItMw_030_2h_kdf_hammer_01.3DS";

	description			=  name;
	//FIXME_Noki: TAB
	TEXT[2]				=  "Danno:                 ??";
	TEXT[3] 			=  "Forza richiesta:        ??";
	TEXT[4] 			=  "Arma a due mani";
	TEXT[5]				=  "Valore:  impossibile da determinare";					
	/*
	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	
	
	Die Konstanten stehen in der Tuning_Melee_Weapons.d M.F.
	*/
};

//****************************************************************************
//			Schlüssel für die Truhe in der Magierhöhle
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_MagicChest(C_Item)
{
	name 				=	"Vecchia chiave";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Una vecchia chiave di ferro.";
	TEXT[3]				=   "Potrebbe aprire un";
	TEXT[4]				=	"lucchetto.";
};
//****************************************************************************
//			gefälschter Passierschein von Lee 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_Passage_MIS	(C_Item)
{
	name 				=	"Offerta di pace per i paladini";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePassage;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"Con questa nota dovrei essere in";
	TEXT[4]				=   "grado di vedere Lord Hagen.";
};
func void UsePassage ()
{   
		var int nDocID;
		
		

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

					Doc_PrintLine	( nDocID,  0, ""								);
					Doc_PrintLine	( nDocID,  0, "Onorevole Lord Hagen,"			);
					Doc_PrintLine	( nDocID,  0, ""								);
					Doc_PrintLines	( nDocID,  0, "Siamo entrambi consapevoli della situazione, perciò propongo il seguente accordo:" 	);
					Doc_PrintLines	( nDocID,  0, "Garantire a me e i miei uomini la totale assoluzione davanti a Innos e al Re."				);
					Doc_PrintLines	( nDocID,  0, "In cambio, offriamo di assistervi nella difesa della città e delle terre circostanti." );
					Doc_PrintLines	( nDocID,  0, "Inoltre, mi occuperò di evitare che i miei uomini stiano lontani dalle fattorie circostanti, eccetto, ovviamente, quella di Onar, dove continueremo a stazionare." );
					Doc_PrintLines	( nDocID,  0, "Sono al corrente del fatto che c'è abbastanza spazio per me e alcuni miei uomini sulla nave in partenza. Quando decidi di partire, voglio essere a bordo." );
					Doc_PrintLines	( nDocID,  0, "Ti supplico: prendi la tua decisione con tutta la saggezza che hai." );
					Doc_PrintLine	( nDocID,  0, ""								);
					Doc_PrintLine	( nDocID,  0, "Firmato Generale Lee"		);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   				);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
}; 
//****************************************************************************
//			Nachricht des Banditen -> Plot Wo ist die Armee?
//			---------------------------------------------
//****************************************************************************

INSTANCE ItWr_BanditLetter_MIS	(C_Item)
{
	name 				=	"Messaggio";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBanditLetter;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"";
	TEXT[4]				=   "";
};
func void UseBanditLetter ()
{   
		var int nDocID;
	
		/*
		if (Bdt13_Dexter_verraten == FALSE)
		{
			Bdt13_Dexter_verraten = TRUE;
		
			Log_CreateTopic (Topic_Bandits,LOG_MISSION);
			Log_SetTopicStatus (Topic_Bandits,LOG_RUNNING);
			B_LogEntry (Topic_Bandits,"Der Anführer der Banditen ist Dexter. Er versteckt sich bei einer Mine, beim Großbauer.");
			MIS_Steckbriefe = LOG_RUNNING;
		};
		*/
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0); 
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "Fermate tutti gli uomini che"							);
					Doc_PrintLine	(nDocID,  0, " arrivano dalle montagne."						);
					Doc_PrintLine	(nDocID,  0, "Se dovesse arrivare qualcuno al passo,"				);
					Doc_PrintLine	(nDocID,  0, " sarà probabilmente un vecchio."			);
					Doc_PrintLine	(nDocID,  0, "Non fatevi ingannare,"				);
					Doc_PrintLine	(nDocID,  0, "    è uno stregone pericoloso.   "				);
					Doc_PrintLine	(nDocID,  0, "Tenetelo d'occhio."						);
					Doc_PrintLine	(nDocID,  0, "     "											);
					Doc_PrintLine	(nDocID,  0, "È possibile che il tipo che cercate"		);
					Doc_PrintLine	(nDocID,  0, "    lo contatterà.    "						);
					Doc_PrintLine	(nDocID,  0, "Con questa lettera vi sto spedendo"				);
					Doc_PrintLine	(nDocID,  0, "    trenta pezzi d'oro."							);
					Doc_PrintLine	(nDocID,  0, "Ne darò altri trenta a chiunque"				);
					Doc_PrintLine	(nDocID,  0, "    ucciderà l'uomo."							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "Portate la sua testa alla vecchia miniera.");
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ".....D."											);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
}; 
//****************************************************************************
//			Steckbrief vom Spieler
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_Poster_MIS	(C_Item)
{
	name 				=	"Manifesto da ricercato";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MULTI|ITEM_MISSION ;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePoster;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"Il mio ritratto!";
	TEXT[4]				=   "";
};
FUNC VOID UsePoster()
{
	var int nDocID;
	nDocID 	= 	Doc_Create() ;		
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "Gesucht.TGA"  , 0 		); 	
	Doc_Show (nDocID);
};
//****************************************************************************
//				Banditen Truhen Schlüssel 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Bandit(C_Item)
{
	name 				=	"Chiave del forziere";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave appartiene";
	TEXT[3]				=   "a un brigante.";
	
};

//****************************************************************************
//				Bospers Jagdbogen
//			---------------------------------------------
//****************************************************************************
INSTANCE ItRw_Bow_L_03_MIS (C_Item)
{
	name 				=	"Arco da caccia";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MISSION;
	material 			=	MAT_WOOD;

	value 				=	Value_Jagdbogen;

	damageTotal			=	Damage_Jagdbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Jagdbogen;
	visual 				=	"ItRw_Bow_L_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= "L'arco da caccia di Bosper.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//****************************************************************************
//				Constantinos Schutzring
//			---------------------------------------------
//****************************************************************************
INSTANCE ItRi_Prot_Point_01_MIS(C_Item)
{
	name 					=	"L'anello di Costantino";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING|ITEM_MISSION;

	value 					=	Value_Ri_ProtPoint ;

	visual 					=	"ItRi_Prot_Point_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Point_01_MIS;
	on_unequip				=	UnEquip_ItRi_Prot_Point_01_MIS;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				=  "Protezione di legno";
	
	TEXT[2]					= NAME_Prot_Point;
	COUNT[2]				= Ri_ProtPoint;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
		
};

	FUNC VOID Equip_ItRi_Prot_Point_01_MIS()
	{
	self.protection [PROT_POINT] 		+=  Ri_ProtPoint;
	};

	FUNC VOID UnEquip_ItRi_Prot_Point_01_MIS()
	{
	self.protection [PROT_POINT] 		-=  Ri_ProtPoint;
	};

//****************************************************************************
//				Eddas Statue
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_EddasStatue (C_Item)
{
	name 				=	"Statua di Innos";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI| ITEM_MISSION ;

	value 				=	50;

	visual 				=	"ItMi_InnosStatue.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Innos, Signore della Giustizia,";
	TEXT[3]				= 	"benedicimi e proteggimi";
	TEXT[4]				= 	"da qualsiasi male.";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//****************************************************************************
//				Crypta-Schlüssel
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_EVT_CRYPT_01(C_Item)
{
	name 				=	"Vecchia chiave di ottone";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave presa dallo scheletro nella stanza 1";
	
};

INSTANCE ItKe_EVT_CRYPT_02(C_Item)
{
	name 				=	"Vecchia chiave di ottone";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave presa dallo scheletro nella stanza 2";
	
};

INSTANCE ItKe_EVT_CRYPT_03(C_Item)
{
	name 				=	"Vecchia chiave di ottone";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave presa dallo scheletro nella stanza 3";
	
};

const int VALUE_ITAR_PAL_SKEL	= 500;

INSTANCE ITAR_PAL_SKEL (C_Item)
{
	name 					=	"Armatura del vecchio cavaliere";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_PAL_SKEL;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_H.3ds";
	visual_change 			=	"Armor_Pal_Skeleton.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

//****************************************************************************
//				Schlüssel zu Valentinos Truhe
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Valentino(C_Item)
{
	name 				=	"Chiave del forziere";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave di un forziere";
	TEXT[3]				=   "appartenente a Costantino.";
	
};
//****************************************************************************
//				Schlüssel zur Truhe OV Noname Typen
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Buerger(C_Item)
{
	name 				=	"Chiave del forziere";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Giaceva ai piedi di un davanzale.";
	TEXT[3]				=   "";
	
};
//****************************************************************************
//				Schlüssel Richter Truhe
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Richter(C_Item)
{
	name 				=	"Chiave del forziere";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La chiave di un forziere";
	TEXT[3]				=   "appartenente al giudice.";
	
};
//****************************************************************************
//				Schlüssel Salandril
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Salandril(C_Item)
{
	name 				=	"Chiave del forziere";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"appartenente all'alchimista Salandril.";
	TEXT[3]				=   "";
	
};

//****************************************************************************
//				Schlüssel Truhe ...wo die Paladine schlafen
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_PaladinTruhe(C_Item)
{
	name 				=	"Chiave del forziere";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Una piccola chiave di ottone";
	TEXT[3]				=   "presa dalla casa dei paladini.";
	
};
//****************************************************************************
//				Diebsgilde Schatz (Insel)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_ThiefTreasure(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Una piccola chiave.";
};
//****************************************************************************
//				Diebsgilde Fingers Tür
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Fingers(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Una chiave arruginita";
	TEXT[3]				=   "presa dalle fogne.";
	
};
//**********************************************************************************
//	Lehmars Schuldenbuch
//**********************************************************************************

INSTANCE ItWr_Schuldenbuch (C_ITEM)
{	
	name 					=	"Libro dei debiti";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Il libro dei debiti di Lehmar.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseSchuldBuch;
};

	FUNC VOID UseSchuldBuch()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								
					Doc_SetPages	( nDocID,  2 );                         

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); 
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages 
 					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Affari e debiti"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Io, Thorben, locandiere di Khorinis, devo all'onorevole Lehmar la somma di 200 monete d'oro.");
					Doc_PrintLine	( nDocID,  0, ""					);		
					Doc_PrintLine	( nDocID,  0, "             Thorben");
					Doc_PrintLine	( nDocID,  0, ""					);	
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Io, Coragon, oste di Khorinis, devo all'onorevole Lehmar la somma di 150 monete d'oro.");
					Doc_PrintLine	( nDocID,  0, ""					);		
					Doc_PrintLine	( nDocID,  0, "             Coragon");										
					//Absatz
					Doc_PrintLine	( nDocID,  0, ""					);

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					//Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
					//Doc_PrintLine	( nDocID,  1, ""					);										
					//Doc_PrintLines( nDocID,  1, "StandardBuch Seite 2"	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Io, Hanna, albergatore di Khorinis, devo all'onorevole Lehmar la somma di 250 monete d'oro.");
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "               Hanna");
					//Absatz
					Doc_PrintLines	( nDocID,  1, "");
					Doc_Show		( nDocID );
};

//**********************************************************************************
//	Lehmars Schuldenbuch
//**********************************************************************************

INSTANCE ItPl_Sagitta_Herb_MIS (C_Item)
{	
	name 				=	"Aloe del sole";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Strength_Herb_01;

	visual 				=	"ItPl_Strength_Herb_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Strength_Herb_01;
};


//****************************************************************************
//			Schlüssel für die obernen Schlafzimmer in der Taverne (MITTE DER WELT!)
//			---------------------------------------------
//****************************************************************************
INSTANCE ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name 				=	"Chiave della camera.";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"della taverna 'L'arpia morta'.";
	TEXT[3]				=   "";
	
};

INSTANCE ItRw_DragomirsArmbrust_MIS (C_Item)
{
	name 				=	"Balestra di Dragomir";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_LeichteArmbrust;

	damageTotal			= 	Damage_LeichteArmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_LeichteArmbrust;
	visual 				=	"ItRw_Crossbow_L_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_STR_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
