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
	description = "(Sería sencillo robar su poción)";
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
	AI_Output (self, other, "DIA_Zuris_Sperre_14_00"); //Eres un convicto de la colonia de mineros. ¡Desaparece!
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
	AI_Output (self, other, "DIA_Zuris_GREET_14_00"); //Soy Zuris, maestro de pociones.
	AI_Output (self, other, "DIA_Zuris_GREET_14_01"); //¿Necesitas una esencia curativa o un elixir mágico? Has venido a lugar adecuado.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Zuris vende pociones en el mercado.");
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
	description	 = 	"Enséñame tu mercancía.";
};

func int DIA_Zuris_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Zuris_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Zuris_WAREZ_15_00"); //Enséñame tu mercancía.
	
	if (Zuris_einmal == FALSE)
	&& (!Npc_KnowsInfo (other, DIA_Zuris_Potions))
	{
		AI_Output (self, other, "DIA_Zuris_GREET_14_02"); //Acabo de recibir algunas pociones nuevas. Mi invitado, el maestro Daron, el mago de fuego, las trajo del monasterio.
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
	description	= 	"¿Haces tus propias pociones?";
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
	AI_Output (other, self, "DIA_Zuris_POTIONS_15_00"); //¿Haces tus propias pociones?
	AI_Output (self, other, "DIA_Zuris_POTIONS_14_01"); //No, las consigo del monasterio o se las compro a Constantino, el alquimista.
	
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Zuris_POTIONS_14_02"); //Si estás interesado en destilar pociones, ve a hablar con él. Necesita un asistente.
		AI_Output (self, other, "DIA_Zuris_POTIONS_14_03"); //Pero es demasiado cabezota para contratar a alguien por sí mismo. Es más terco que una mula.
	};
	
	AI_Output (self, other, "DIA_Zuris_Add_14_00"); //Siempre pasa por aquí cuando sale por la puerta este a recolectar plantas para sus pociones.
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
	description	= "¿Dónde recoge Constantino sus hierbas, exactamente?";
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
	AI_Output (other, self, "DIA_Zuris_Add_15_01"); //¿Dónde recoge Constantino sus hierbas, exactamente?
	AI_Output (self, other, "DIA_Zuris_Add_14_02"); //Siempre sale por la puerta este de la ciudad y luego desaparece por la zona salvaje de la izquierda.
	AI_Output (self, other, "DIA_Zuris_Add_14_03"); //Una vez me dijo que por allí crece de casi todo, excepto acedera.
	
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
	description	= "¿Te ha dicho Constantino alguna vez dónde encontrar acedera?";
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
	AI_Output (other, self, "DIA_Zuris_Add_15_04"); //¿Te ha dicho Constantino alguna vez dónde encontrar acedera?
	AI_Output (self, other, "DIA_Zuris_Add_14_05"); //Una vez le oí decir que suele crecer cerca de los círculos de piedras.
	AI_Output (self, other, "DIA_Zuris_Add_14_06"); //Cerca de la granja de Lobart, la que está junto a la otra puerta, hay uno de esos círculos de piedras.
	AI_Output (self, other, "DIA_Zuris_Add_14_07"); //Creo que está en una colina. Solía ser una tumba o algo así.
	
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
	description	 = 	"¿Dónde puedo encontrar a Constantino?";
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
	AI_Output (other, self, "DIA_Zuris_WHERE_15_00"); //¿Dónde puedo encontrar a Constantino?
	AI_Output (self, other, "DIA_Zuris_WHERE_14_01"); //Sus estancias están en el túnel junto a la herrería de Harad. No debería ser difícil de encontrar.
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
	description  =  "Háblame del monasterio.";
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
	AI_Output (other, self, "DIA_Zuris_Kloster_14_00"); //Háblame del monasterio.
	AI_Output (self, other, "DIA_Zuris_Kloster_14_01"); //Será mejor que hables directamente con el maestro Daron. Él sabe más acerca de ese tema que yo.
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

	description = "¿Vendes participaciones de las minas?";
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
	AI_Output (other, self, "DIA_Zuris_Minenanteil_15_00"); //¿Vendes participaciones de la mina?
	AI_Output (self, other, "DIA_Zuris_Minenanteil_14_01"); //Sí. Menudo timo. ¡Es la última vez que me involucro en un asunto turbio como ése!
	
	B_GivePlayerXP (XP_Ambient);
};	










