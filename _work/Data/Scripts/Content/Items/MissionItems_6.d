// *****************************************************************
// //Joly: Auge Innos nicht dabei? Kein Problem. Xardas hilft auch dir Idiot!!!!!!!!!!!!
// Vorsicht: Nur fьr D.A.U.s
// *****************************************************************

INSTANCE ItSe_XardasNotfallBeutel_MIS	(C_Item)
{
	name 				=	"Очень странный кожаный кошелек";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_XardasNotfallBeutel;
	
	description			= 	name;
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"В этом мешочке, похоже,";
	TEXT[2]				= 	"содержится твердый объект";
	TEXT[3]				= 	"и документ.";
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
	name 				=	"Письмо с предупреждениями Ксардаса";

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
					Doc_PrintLines	( nDocID,  0, "Мой юный протеже, ты очень разочаровал меня. Как ты мог отплыть на корабле и не взять Глаз Инноса?"					);
					Doc_PrintLines	( nDocID,  0, "Мне остается только надеяться, что твоей халатности есть пределы. В противном случае, тебе никогда не удастся избавить мир от Зла  и мне придется лично казнить тебя за твою тупость."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                      Ксардас"					);
					
					Doc_Show		( nDocID );
};

//**********************************************************************************
//	Brief in der Krypta
//----------------------------------------------------------------------------------

INSTANCE ItWr_Krypta_Garon		(C_Item)
{
	name 				=	"Старое письмо";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Krypta_Garon;
	scemeName			=	"MAP";
	description			= 	name;

	TEXT[3]				= 	"написанное трясущейся рукой.";
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
					Doc_PrintLines	( nDocID,  0, "Все пошло прахом. Я тщетно пытался удержать Инубиса на пути добра."					);
					Doc_PrintLines	( nDocID,  0, "Сначала, мне показалось, что я уже мертв. Но кое-какая сила все еще осталась в старых костях Ивана."					);
					Doc_PrintLines	( nDocID,  0, "Инубис восстал из мертвых. Изгнанный древним орденом паладинов, теперь он ищет отмщения за свое проклятие."					);
					Doc_PrintLines	( nDocID,  0, "Вместе с ним многие из его последователей. Я не могу понять, как такой предводитель как Инубис мог стать таким злом."					);
					Doc_PrintLines	( nDocID,  0, "Я нашел его могилу в этом склепе. Но я не уверен, удастся ли мне сообщить о своей находке. Поэтому, я пишу эти строки и надеюсь, что кто-нибудь найдет их."					);
					Doc_PrintLines	( nDocID,  0, "Знайте. Грозный враг пытается дотянуться до праведных душ. Инубис будет не последним."					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Да спасет Иннос ваши души."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                                 Иван");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Rдnder des TGAs aus
				
					Doc_Show		( nDocID );

}; 

//****************************************************************************
//				DragonIsle_Undead_Schlьssel
//			---------------------------------------------
//****************************************************************************

//**********************************************************************************
//	Knasttьrschlьssel fьr Pedros Zelle auf DI
//**********************************************************************************

INSTANCE ItKe_OrkKnastDI_MIS(C_Item)
{
	name 				=	"Ключ полковника орков";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItKe_EVT_UNDEAD_01(C_Item)	//Schlьssel fьr erste Tьr
{
	name 				=	"Ключ Архола";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	name;
	
};

//**********************************************************************************
//	Schlьssel zum Labyrinth der Untoten auf DI
//**********************************************************************************

INSTANCE ItKe_EVT_UNDEAD_02	(C_Item)
{
	name 				=	"Ключ ключника";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};


//**********************************************************************************
//	Kammerschlьssel fьrґs Tor zum Saal des Untoten Drachen.
//**********************************************************************************
	
INSTANCE ItKe_LastDoorToUndeadDrgDI_MIS	(C_Item)
{
	name 				=	"Ключ от комнаты черного мага";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Schriftrolle fьrґs Tor zum Saal des Untoten Drachen.
//**********************************************************************************
	
INSTANCE ItWr_LastDoorToUndeadDrgDI_MIS	(C_Item)
{
	name 				=	"Свиток черного мага";

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
					Doc_PrintLines	( nDocID,  0, "КАДОШ "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "ЭМЕМ КАДАР"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Глаз Силы освещает твой путь.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Rдnder des TGAs aus
				
					Doc_Show		( nDocID );
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Свиток черного мага содержит слова КАДОШ ЭМЕМ КАДАР. Это похоже на какую-то магическую формулу, но для чего она используется - и что такое Глаз Силы?"); 
};
//**********************************************************************************
//	Schlьssel zur Truhe in der Kammer des OberDementors.
//**********************************************************************************
INSTANCE ItKe_ChestMasterDementor_MIS	(C_Item)
{
	name 				=	"Ключ от сундука черного мага";

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
	name 				=	"Рецепт";

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
					Doc_PrintLines	( nDocID,  0, "Я вернул к жизни древнее искусство. Боюсь, правда, Феодарон не оценит мои достижения."					);
					Doc_PrintLines	( nDocID,  0, "Это означает, попросту говоря, что я должен превратить весь его выводок в зелье. Если бы только он не сидел на своих яйцах все время как курица, я бы попытался."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Эмбарла фиргасто:"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "11 драконьих яиц, одна истертая в порошок черная жемчужина и щепотка серы."					);
					Doc_PrintLines	( nDocID,  0, "Эту смесь нужно довести до кипения, постоянно помешивая, и пропустить через дистиллятор."					);
					Doc_PrintLines	( nDocID,  0, "Получившийся эликсир нужно использовать с осторожностью. Он обладает сильными побочными эффектами и может отрицательно повлиять на ману."					);
					
					Doc_Show		( nDocID );
		
		PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};

//**********************************************************************************
//	Tagebuch des SchwarzmagierNovizen
//**********************************************************************************

INSTANCE ItWr_Diary_BlackNovice_MIS (C_ITEM)
{	
	name 					=	"Дневник";

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
					Doc_PrintLines	( nDocID,  0, "Я жду посвящения вот уже 36 дней. Я начинаю сомневаться, что меня вообще посвятят. Но я сделал все, что они просили. Я прислуживал им как мальчик на побегушках."					);
					//Absatz
					Doc_PrintLines	( nDocID,  0, "Ключник приказал мне закрыть решетку. Я еще не сделал этого. Если все и дальше будет идти в том же духе, любой сможет запросто пройти через ворота.");
					Doc_PrintLines	( nDocID,  0, "Как жаль, что я не помню комбинацию.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Rдnder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Я проник в большой зал уже давным-давно. Я не могу дождаться, когда увижу Мастера. Интересно, позволят ли мне видеть его, когда я стану одним из них."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "Вчера я попытал счастья. Но потерпел неудачу в двух камерах с рычагами еще до того, как смог нажать три переключателя в западном крыле в правильном порядке. Этот пес закрыл камеры! Завтра я попытаюсь стащить у него ключ ...");
					Doc_Show		( nDocID );

	B_LogEntry (TOPIC_HallenVonIrdorath,"В дневнике черного мага-послушника упоминаются камеры с рычагами, ключник, комбинации переключателей и много чего еще. Я должен запомнить это, никогда не знаешь заранее, что пригодится, а что нет."); 
};

//**********************************************************************************
//	ItWr_ZugBruecke_MIS
//**********************************************************************************

INSTANCE ItWr_ZugBruecke_MIS	(C_Item)
{
	name 				=	"Старое письмо";

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
					Doc_PrintLine	( nDocID,  0, "   Последнее предупреждение!"					);
					Doc_SetMargins	( nDocID, -1, 50, 50, 70, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Меня не интересует, сможете вы пересечь мост с другой стороны или нет. Если вам интересно мое мнение - вы все заслуживаете гореть в аду."					);
					Doc_PrintLines	( nDocID,  0, "Я собираюсь оставить мост поднятым до тех пор, пока я нахожусь здесь. И если я замечу, что кто-то пытается нажать переключатели при помощи лука и стрелы, я лично вздерну этого идиота на ближайшем дереве!"	);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                      Архол"					);
					
					Doc_Show		( nDocID );
};


//**********************************************************************************
//	ItMi_PowerEye zum цffnen der letzten Tьr
//**********************************************************************************

INSTANCE ItMi_PowerEye (C_Item)
{
	name 				=	"Глаз Силы";

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

