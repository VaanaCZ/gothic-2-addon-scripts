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
	description = "(Lektvar mu m��e� ukr�st velmi snadno.)";
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
	AI_Output (self, other, "DIA_Zuris_Sperre_14_00"); //Jsi b�val� trestanec z t�a�sk� kolonie. Odpal!
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
	AI_Output (self, other, "DIA_Zuris_GREET_14_00"); //Jsem Zuris, mistr lektvar�.
	AI_Output (self, other, "DIA_Zuris_GREET_14_01"); //Pot�ebuje� esenci hojiv� s�ly nebo n�jak� magick� elix�r? Pak jsi na spr�vn�m m�st�.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Zuris prod�v� na tr�i�ti lektvary.");
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
	description	 = 	"Uka� mi sv� zbo��.";
};

func int DIA_Zuris_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Zuris_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Zuris_WAREZ_15_00"); //Uka� mi sv� zbo��.
	
	if (Zuris_einmal == FALSE)
	&& (!Npc_KnowsInfo (other, DIA_Zuris_Potions))
	{
		AI_Output (self, other, "DIA_Zuris_GREET_14_02"); //Pr�v� jsem dostal n�jak� nov� lektvary. M�j host - ohniv� m�g, mistr Daron - mi je donesl p��mo z kl�tera.
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
	description	= 	"M�ch� si tak� n�jak� vlastn� elix�ry?";
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
	AI_Output (other, self, "DIA_Zuris_POTIONS_15_00"); //M�ch� si tak� n�jak� vlastn� elix�ry?
	AI_Output (self, other, "DIA_Zuris_POTIONS_14_01"); //Ne, bu� je dost�v�m z kl�tera, nebo si je kupuji u alchymisty Constantina.
	
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Zuris_POTIONS_14_02"); //Pokud t� zaj�m� m�ch�n� lektvar�, pak nev�hej a promluv si s n�m. N�jak�ho pomocn�ka jist� pot�ebuje.
		AI_Output (self, other, "DIA_Zuris_POTIONS_14_03"); //Ale je moc um�n�n�, ne� aby si n�koho najal s�m. Je pali�at� jak mezek.
	};
	
	AI_Output (self, other, "DIA_Zuris_Add_14_00"); //Kdy� jde trhat ty sv� rostliny, v�dycky proch�z� p��mo kolem m�.
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
	description	= "Kde p�esn� Constantino ty sv� byliny sb�r�?";
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
	AI_Output (other, self, "DIA_Zuris_Add_15_01"); //Kde p�esn� Constantino ty sv� byliny sb�r�?
	AI_Output (self, other, "DIA_Zuris_Add_14_02"); //Poka�d� projde tady v�chodn� branou a pak zmiz� v divo�in� nalevo.
	AI_Output (self, other, "DIA_Zuris_Add_14_03"); //Jednou mi vykl�dal, �e tu roste skoro v�echno krom� kr�lovsk�ho ��ov�ku.
	
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
//					 Kronst�ckel
// **************************************************

instance DIA_Zuris_Kronstoeckel (C_INFO)
{
	npc			= VLK_409_Zuris;
	nr		 	= 2;
	condition	= DIA_Zuris_Kronstoeckel_Condition;
	information	= DIA_Zuris_Kronstoeckel_Info;
	permanent	= FALSE;
	description	= "Zm�nil se Constantino n�kdy, kde hledat kr�lovsk� ��ov�k?";
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
	AI_Output (other, self, "DIA_Zuris_Add_15_04"); //Zm�nil se Constantino n�kdy, kde hledat kr�lovsk� ��ov�k?
	AI_Output (self, other, "DIA_Zuris_Add_14_05"); //Jednou jsem sly�el, jak ��k�, �e ten nejlep�� roste pobl� kamenn�ch kruh�.
	AI_Output (self, other, "DIA_Zuris_Add_14_06"); //U Lobartova statku - to je kousek od druh� br�ny - se jeden takov� kamenn� kruh nach�z�.
	AI_Output (self, other, "DIA_Zuris_Add_14_07"); //Mysl�m, �e le�� na kopci. D��v to b�valo n�jak� poh�ebi�t� nebo tak n�co.
	
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
	description	 = 	"Kde bych Constantina na�el?";
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
	AI_Output (other, self, "DIA_Zuris_WHERE_15_00"); //Kde bych Constantina na�el?
	AI_Output (self, other, "DIA_Zuris_WHERE_14_01"); //Jeho obydl� najde� v pr�chodu pobl� Haradovy kov�rny. Ur�it� ho nemine�.
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
	description  =  "Pov�z mi n�co o kl�te�e.";
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
	AI_Output (other, self, "DIA_Zuris_Kloster_14_00"); //Pov�z mi n�co o kl�te�e.
	AI_Output (self, other, "DIA_Zuris_Kloster_14_01"); //O tom by sis m�l rad�i pohovo�it p��mo s Daronem. Ten v� daleko v�c ne� j�.
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

	description = "Prod�v� d�ln� akcie?";
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
	AI_Output (other, self, "DIA_Zuris_Minenanteil_15_00"); //Ty prod�v� d�ln� akcie?
	AI_Output (self, other, "DIA_Zuris_Minenanteil_14_01"); //Ano, n�kter� �ly ale rapidn� dol�. To je naposled, co jsem se pustil do n��eho takhle podez�el�ho!
	
	B_GivePlayerXP (XP_Ambient);
};	










