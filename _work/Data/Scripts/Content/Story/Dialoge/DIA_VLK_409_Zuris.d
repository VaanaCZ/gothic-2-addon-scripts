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
	description = "(Lektvar mu můžeš ukrást velmi snadno.)";
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
	AI_Output (self, other, "DIA_Zuris_Sperre_14_00"); //Jsi bývalý trestanec z tęžaâské kolonie. Odpal!
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
	AI_Output (self, other, "DIA_Zuris_GREET_14_00"); //Jsem Zuris, mistr lektvarů.
	AI_Output (self, other, "DIA_Zuris_GREET_14_01"); //Potâebuješ esenci hojivé síly nebo nęjaký magický elixír? Pak jsi na správném místę.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Zuris prodává na tržišti lektvary.");
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
	description	 = 	"Ukaž mi své zboží.";
};

func int DIA_Zuris_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Zuris_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Zuris_WAREZ_15_00"); //Ukaž mi své zboží.
	
	if (Zuris_einmal == FALSE)
	&& (!Npc_KnowsInfo (other, DIA_Zuris_Potions))
	{
		AI_Output (self, other, "DIA_Zuris_GREET_14_02"); //Právę jsem dostal nęjaké nové lektvary. Můj host - ohnivý mág, mistr Daron - mi je donesl pâímo z kláštera.
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
	description	= 	"Mícháš si také nęjaké vlastní elixíry?";
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
	AI_Output (other, self, "DIA_Zuris_POTIONS_15_00"); //Mícháš si také nęjaké vlastní elixíry?
	AI_Output (self, other, "DIA_Zuris_POTIONS_14_01"); //Ne, buë je dostávám z kláštera, nebo si je kupuji u alchymisty Constantina.
	
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Zuris_POTIONS_14_02"); //Pokud tę zajímá míchání lektvarů, pak neváhej a promluv si s ním. Nęjakého pomocníka jistę potâebuje.
		AI_Output (self, other, "DIA_Zuris_POTIONS_14_03"); //Ale je moc umínęný, než aby si nękoho najal sám. Je paličatý jak mezek.
	};
	
	AI_Output (self, other, "DIA_Zuris_Add_14_00"); //Když jde trhat ty své rostliny, vždycky prochází pâímo kolem mę.
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
	description	= "Kde pâesnę Constantino ty své byliny sbírá?";
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
	AI_Output (other, self, "DIA_Zuris_Add_15_01"); //Kde pâesnę Constantino ty své byliny sbírá?
	AI_Output (self, other, "DIA_Zuris_Add_14_02"); //Pokaždé projde tady východní branou a pak zmizí v divočinę nalevo.
	AI_Output (self, other, "DIA_Zuris_Add_14_03"); //Jednou mi vykládal, že tu roste skoro všechno kromę královského šăovíku.
	
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
	description	= "Zmínil se Constantino nękdy, kde hledat královský šăovík?";
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
	AI_Output (other, self, "DIA_Zuris_Add_15_04"); //Zmínil se Constantino nękdy, kde hledat královský šăovík?
	AI_Output (self, other, "DIA_Zuris_Add_14_05"); //Jednou jsem slyšel, jak âíká, že ten nejlepší roste poblíž kamenných kruhů.
	AI_Output (self, other, "DIA_Zuris_Add_14_06"); //U Lobartova statku - to je kousek od druhé brány - se jeden takový kamenný kruh nachází.
	AI_Output (self, other, "DIA_Zuris_Add_14_07"); //Myslím, že leží na kopci. Dâív to bývalo nęjaké pohâebištę nebo tak nęco.
	
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
	description	 = 	"Kde bych Constantina našel?";
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
	AI_Output (other, self, "DIA_Zuris_WHERE_15_00"); //Kde bych Constantina našel?
	AI_Output (self, other, "DIA_Zuris_WHERE_14_01"); //Jeho obydlí najdeš v průchodu poblíž Haradovy kovárny. Určitę ho nemineš.
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
	description  =  "Povęz mi nęco o klášteâe.";
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
	AI_Output (other, self, "DIA_Zuris_Kloster_14_00"); //Povęz mi nęco o klášteâe.
	AI_Output (self, other, "DIA_Zuris_Kloster_14_01"); //O tom by sis męl radši pohovoâit pâímo s Daronem. Ten ví daleko víc než já.
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

	description = "Prodáváš důlní akcie?";
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
	AI_Output (other, self, "DIA_Zuris_Minenanteil_15_00"); //Ty prodáváš důlní akcie?
	AI_Output (self, other, "DIA_Zuris_Minenanteil_14_01"); //Ano, nękteré šly ale rapidnę dolů. To je naposled, co jsem se pustil do nęčeho takhle podezâelého!
	
	B_GivePlayerXP (XP_Ambient);
};	










