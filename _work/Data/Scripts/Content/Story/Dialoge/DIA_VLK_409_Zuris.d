///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Zuris_EXIT   (C_INFO)
{
	npc         = VLK_409_Zuris;
	nr          = 999;
	condition   = DIA_Zuris_EXIT_Condition;
	information = DIA_Zuris_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Zuris_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Zuris_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Zuris_PICKPOCKET (C_INFO)
{
	npc			= VLK_409_Zuris;
	nr			= 900;
	condition	= DIA_Zuris_PICKPOCKET_Condition;
	information	= DIA_Zuris_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie¿ tej mikstury bêdzie ³atwa)";
};                       

FUNC INT DIA_Zuris_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Zuris_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Zuris_PICKPOCKET);
	Info_AddChoice		(DIA_Zuris_PICKPOCKET, DIALOG_BACK 		,DIA_Zuris_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Zuris_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Zuris_PICKPOCKET_DoIt);
};

func void DIA_Zuris_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		CreateInvItems (self,ITPO_Health_03,1);
		B_GiveInvItems (self, other, ITPO_Health_03, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Zuris_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Zuris_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Zuris_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_Sperre		(C_INFO)
{
	npc			 = 	VLK_409_Zuris;
	nr			 = 	2;
	condition	 = 	DIA_Zuris_Sperre_Condition;
	information	 = 	DIA_Zuris_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Zuris_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Zuris_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Zuris_Sperre_14_00"); //Jesteœ skazañcem z kolonii górniczej! Wynocha!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_GREET		(C_INFO)
{
	npc			 = 	VLK_409_Zuris;
	nr			 = 	2;
	condition	 = 	DIA_Zuris_GREET_Condition;
	information	 = 	DIA_Zuris_GREET_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Zuris_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Zuris_GREET_Info ()
{
	AI_Output (self, other, "DIA_Zuris_GREET_14_00"); //Jestem Zuris, Mistrz Mikstur.
	AI_Output (self, other, "DIA_Zuris_GREET_14_01"); //Mo¿e potrzebujesz esencji leczniczej lub magicznego eliksiru? Jeœli tak, to trafi³eœ w odpowiednie miejsce.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Zuris sprzedaje na targowisku mikstury.");
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Zuris_einmal;

instance DIA_Zuris_WAREZ		(C_INFO)
{
	npc			 = 	VLK_409_Zuris;
	nr			 = 	2;
	condition	 = 	DIA_Zuris_WAREZ_Condition;
	information	 = 	DIA_Zuris_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Poka¿ mi swoje towary.";
};

func int DIA_Zuris_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Zuris_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Zuris_WAREZ_15_00"); //Poka¿ mi swoje towary.
	
	if (Zuris_einmal == FALSE)
	&& (!Npc_KnowsInfo (other, DIA_Zuris_Potions))
	{
		AI_Output (self, other, "DIA_Zuris_GREET_14_02"); //W³aœnie otrzyma³em now¹ dostawê mikstur. Mistrz Daron, Mag Ognia, przywióz³ je ze sob¹ z klasztoru.
		Zuris_einmal = TRUE;
	};
};
///////////////////////////////////////////////////////////////////////
//	Info POTIONS
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_POTIONS		(C_INFO)
{
	npc			= 	VLK_409_Zuris;
	nr		 	= 	2;
	condition	= 	DIA_Zuris_POTIONS_Condition;
	information	= 	DIA_Zuris_POTIONS_Info;
	permanent	= FALSE;
	description	= 	"Czy sam przygotowujesz swoje mikstury?";
};

func int DIA_Zuris_POTIONS_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Zuris_GREET)
	{
		return TRUE;
	};
};
func void DIA_Zuris_POTIONS_Info ()
{
	AI_Output (other, self, "DIA_Zuris_POTIONS_15_00"); //Czy sam przygotowujesz swoje mikstury?
	AI_Output (self, other, "DIA_Zuris_POTIONS_14_01"); //Nie, na ogó³ kupujê je w klasztorze lub dostajê od alchemika Constantina.
	
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Zuris_POTIONS_14_02"); //Jeœli interesuje ciê proces przygotowania mikstur, mo¿esz z nim porozmawiaæ. Z tego co wiem, potrzebuje asystenta.
		AI_Output (self, other, "DIA_Zuris_POTIONS_14_03"); //Jest jednak zbyt dumny, by spróbowaæ go znaleŸæ. G³upiec - bardziej uparty ni¿ osio³.
	};
	
	AI_Output (self, other, "DIA_Zuris_Add_14_00"); //Przechodzi têdy, gdy wychodzi wschodni¹ bram¹, by nazbieraæ zió³ na swoje mikstury.
};

// **************************************************
//				Wo sammelt Constantino?
// **************************************************

instance DIA_Zuris_Kraut (C_INFO)
{
	npc			= VLK_409_Zuris;
	nr		 	= 2;
	condition	= DIA_Zuris_Kraut_Condition;
	information	= DIA_Zuris_Kraut_Info;
	permanent	= FALSE;
	description	= "Gdzie dok³adnie Constantino zbiera zio³a?";
};

func int DIA_Zuris_Kraut_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Zuris_POTIONS))
	{
		return TRUE;
	};
};
func void DIA_Zuris_Kraut_Info ()
{
	AI_Output (other, self, "DIA_Zuris_Add_15_01"); //Gdzie dok³adnie Constantino zbiera zio³a?
	AI_Output (self, other, "DIA_Zuris_Add_14_02"); //Przechodzi przez wschodni¹ bramê i znika gdzieœ w gêstwinie na lewo.
	AI_Output (self, other, "DIA_Zuris_Add_14_03"); //Powiedzia³ mi raz, ¿e rosn¹ tam wszystkie sk³adniki prócz królewskiego szczawiu.
	
	Wld_InsertItem (ItPl_Mana_Herb_01,"FP_ITEM_HERB_01");
	Wld_InsertItem (ItPl_Mana_Herb_02,"FP_ITEM_HERB_02");
	Wld_InsertItem (ItPl_Mana_Herb_03,"FP_ITEM_HERB_03");
	Wld_InsertItem (ItPl_Health_Herb_01,"FP_ITEM_HERB_04");
	Wld_InsertItem (ItPl_Health_Herb_02,"FP_ITEM_HERB_05");
	Wld_InsertItem (ItPl_Health_Herb_03,"FP_ITEM_HERB_06");
	Wld_InsertItem (ItPl_Speed_Herb_01,"FP_ITEM_HERB_07");
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_HERB_08");
	Wld_InsertItem (ItPl_Strength_Herb_01,"FP_ITEM_HERB_09");
	Wld_InsertItem (ItPl_Dex_Herb_01,"FP_ITEM_HERB_10");
	
};

// **************************************************
//					 Kronstöckel
// **************************************************

instance DIA_Zuris_Kronstoeckel (C_INFO)
{
	npc			= VLK_409_Zuris;
	nr		 	= 2;
	condition	= DIA_Zuris_Kronstoeckel_Condition;
	information	= DIA_Zuris_Kronstoeckel_Info;
	permanent	= FALSE;
	description	= "Czy Constantino powiedzia³ ci kiedyœ, gdzie szukaæ królewskiego szczawiu?";
};

func int DIA_Zuris_Kronstoeckel_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Zuris_Kraut)
	{
		return TRUE;
	};
};
func void DIA_Zuris_Kronstoeckel_Info ()
{
	AI_Output (other, self, "DIA_Zuris_Add_15_04"); //Czy Constantino powiedzia³ ci kiedyœ, gdzie szukaæ szczawiu?
	AI_Output (self, other, "DIA_Zuris_Add_14_05"); //Raz s³ysza³em, jak mówi³, ¿e ow¹ roœlinê mo¿na znaleŸæ jedynie w pobli¿u kamiennych krêgów.
	AI_Output (self, other, "DIA_Zuris_Add_14_06"); //Niedaleko farmy Lobarta, to ta przy bramie. Tam w³aœnie znajdziesz jeden z kamiennych krêgów.
	AI_Output (self, other, "DIA_Zuris_Add_14_07"); //Z tego co wiem, znajduje siê na wzgórzu. Kiedyœ by³ tam chyba grobowiec.
	
	Wld_InsertItem (ItPl_Perm_Herb,"FP_ITEM_HERB_11");
};


///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_WHERE		(C_INFO)
{
	npc			 = 	VLK_409_Zuris;
	condition	 = 	DIA_Zuris_WHERE_Condition;
	information	 = 	DIA_Zuris_WHERE_Info;
	permanent	 = 	FALSE;
	description	 = 	"Gdzie mogê znaleŸæ Constantina?";
};

func int DIA_Zuris_WHERE_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Zuris_POTIONS))
	&& (Constantino.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Zuris_WHERE_Info ()
{
	AI_Output (other, self, "DIA_Zuris_WHERE_15_00"); //Gdzie mogê znaleŸæ Constantina?
	AI_Output (self, other, "DIA_Zuris_WHERE_14_01"); //Jego komnaty znajduj¹ siê w tunelu, niedaleko kuŸni Harada. £atwo je znaleŸæ.
};


///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_Kloster		(C_INFO)
{
	npc			 = 	VLK_409_Zuris;
	nr			 = 	2;
	condition	 = 	DIA_Zuris_Kloster_Condition;
	information	 = 	DIA_Zuris_Kloster_Info;
	description  =  "Powiedz proszê coœ wiêcej o klasztorze.";
};

func int DIA_Zuris_Kloster_Condition ()
{	
	if (Zuris_einmal == TRUE)
	{
		return FALSE;
	};
};
func void DIA_Zuris_Kloster_Info ()
{
	AI_Output (other, self, "DIA_Zuris_Kloster_14_00"); //Powiedz proszê coœ wiêcej o klasztorze.
	AI_Output (self, other, "DIA_Zuris_Kloster_14_01"); //Najlepiej bêdzie, jeœli osobiœcie porozmawiasz z Mistrzem Daronem. On wie na ten temat wiêcej ni¿ ja.
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Zuris_Minenanteil (C_INFO)
{
	npc			= VLK_409_Zuris;
	nr			= 3;
	condition	= DIA_Zuris_Minenanteil_Condition;
	information	= DIA_Zuris_Minenanteil_Info;

	description = "To ty sprzedajesz udzia³y w kopalni?";
};   
                    
FUNC INT DIA_Zuris_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Zuris_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Zuris_Minenanteil_15_00"); //To ty sprzedajesz udzia³y w kopalni?
	AI_Output (self, other, "DIA_Zuris_Minenanteil_14_01"); //Tak, choæ sam nie wiem dlaczego. Ostatni raz da³em siê wpl¹taæ w interes tak w¹tpliwej natury.
	
	B_GivePlayerXP (XP_Ambient);
};	










