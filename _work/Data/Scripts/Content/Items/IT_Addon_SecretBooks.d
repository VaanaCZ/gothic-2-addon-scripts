//---------------------------------------------------------------------------------------------------------------------------
CONST int BookLp2	 	= 2;
CONST int BookLp3		= 3;
CONST int BookLp5		= 5;
CONST int BookLp8		= 8;


CONST int BookXP250		= 250;
CONST int BookXP500		= 500;
CONST int BookXP1000	= 1000;

const int LPMultiplier	= 1000;
const int XPMultiplier	= 5;
//---------------------------------------------------------------------------------------------------------------------------
//		USEFUNC wird von allen LP Büchern benutzt 
//---------------------------------------------------------------------------------------------------------------------------
FUNC VOID UseLPBook(var int constanze)
	{
			var int Wert;
			Wert = constanze;
			
			if Npc_IsPlayer (self)
			{
				B_Say_Overlay 	(self,self,"$VERSTEHE");
				Snd_Play("Levelup");
				self.lp = self.lp + constanze; 
				
				var string ConcatText;
				ConcatText = ConcatStrings (PRINT_LearnLP,IntToString (constanze));
				
				Print  (ConcatText);
		};
	};
//---------------------------------------------------------------------------------------------------------------------------
//		USEFUNC wird von allen XP Büchern benutzt 
//---------------------------------------------------------------------------------------------------------------------------
FUNC VOID UseXPBook(var int constanze)
	{
			var int Wert;
			Wert = constanze;
			
			if Npc_IsPlayer (self)
			{
				B_Say_Overlay 	(self,self,"$VERSTEHE");
				Snd_Play("Levelup");
				self.exp = self.exp + constanze; 
				
				var string ConcatText;
				ConcatText = ConcatStrings (PRINT_XPGained,IntToString (constanze));
				
				Print (ConcatText);
		};
	};
	
/*
	Gesammelte Erfahrungen
	Erfahrung + 250/500/1000
	10 * Pkt. 
	
*/
//---------------------------------------------------------------------------------------------------------------------------
//				Xpunktbücher
//---------------------------------------------------------------------------------------------------------------------------
PROTOTYPE ItWr_Addon_XPBook (C_ITEM)
{
	name 					=	"Zebrane doœwiadczenie";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	

	visual 					=	"ItWr_Book_02_01.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAPSEALED";
	
	description				= 	name;
	TEXT[0]					=   PRINT_XPGained;
	
	TEXT[5]					= 	NAME_Value;

};	
//---------------------------------------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_BookXP250 (ItWr_Addon_XPBook)
{
	value 					=	(BookXP250 * XPMultiplier);
	COUNT[0]				=	BookXP250;
	on_state[0]				=	UseBookXP250;
	COUNT[5]				= 	value;
};
FUNC VOID UseBookXP250()
{
	UseXPBook(BookXP250);
};
//---------------------------------------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_BookXP500 (ItWr_Addon_XPBook)
{
	value 					=	(BookXP500 * XPMultiplier);
	COUNT[0]				=	BookXP500;
	on_state[0]				=	UseBookXP500;
	COUNT[5]				= 	value;
};
FUNC VOID UseBookXP500()
{
	UseXPBook(BookXP500);
};
//---------------------------------------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_BookXP1000 (ItWr_Addon_XPBook)
{
	value 					=	(BookXP1000 * XPMultiplier);
	COUNT[0]				=	BookXP1000;
	on_state[0]				=	UseBookXP1000;
	COUNT[5]				= 	value;
};
FUNC VOID UseBookXP1000()
{
	UseXPBook(BookXP1000);
};
//---------------------------------------------------------------------------------------------------------------------------
//				Lernpunktbücher
//---------------------------------------------------------------------------------------------------------------------------
PROTOTYPE ItWr_Addon_LPBook (C_ITEM)
{
	name 					=	"Ksiêga wiedzy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	

	visual 					=	"ItWr_Book_02_02.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAPSEALED";
	
	description				= 	name;
	TEXT[0]					=   PRINT_LearnLP;
	
	TEXT[5]					= 	NAME_Value;

};
//---------------------------------------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_BookLP2 (ItWr_Addon_LPBook)
{
	value 					=	(BookLp2 * LPMultiplier);
	COUNT[0]				=	BookLp2;
	on_state[0]				=	UseBookLp2;
	COUNT[5]				= 	value;
};
FUNC VOID UseBookLp2()
{
	UseLPBook(BookLp2);
};
//---------------------------------------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_BookLP3 (ItWr_Addon_LPBook)
{
	value 					=	(BookLp3 * LPMultiplier);
	COUNT[0]				=	BookLp3;
	on_state[0]				=	UseBookLp3;
	COUNT[5]				= 	value;
};
FUNC VOID UseBookLp3()
{
	UseLPBook(BookLp3);
};
//---------------------------------------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_BookLP5 (ItWr_Addon_LPBook)
{
	value 					=	(BookLp5 * LPMultiplier);
	COUNT[0]				=	BookLp5;
	on_state[0]				=	UseBookLp5;
	COUNT[5]				= 	value;
};
FUNC VOID UseBookLp5()
{
	UseLPBook(BookLp5);
};
//---------------------------------------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_BookLP8 (ItWr_Addon_LPBook)
{
	value 					=	(BookLp8 * LPMultiplier);
	COUNT[0]				=	BookLp8;
	on_state[0]				=	UseBookLp8;
	COUNT[5]				= 	value;
};
FUNC VOID UseBookLp8()
{
	UseLPBook(BookLp8);
};
