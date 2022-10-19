//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10026_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10026_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10026_Wache_EXIT_Condition;
	information = DIA_Addon_10026_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10026_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10026_Wache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10026_Wache_Hi   (C_INFO)
{
	npc         = BDT_10026_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10026_Wache_Hi_Condition;
	information = DIA_Addon_10026_Wache_Hi_Info;
	permanent   = TRUE;
	description = "Co s³ychaæ?";
};
FUNC INT DIA_Addon_10026_Wache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10026_Wache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10026_Wache_Hi_15_00");//Co s³ychaæ?
	
	if (Sklaven_Flucht == FALSE)
	{	
		CreateInvItems (self, ItFo_Bacon,1);
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_01");//Szkoda, ¿e zosta³o tak ma³o niewolników. Wkrótce bêdziemy musieli zorganizowaæ nowych.
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_02");//Ci kolesie s¹ kompletnie wyczerpani. Pewnie z g³odu.
		B_UseItem (self, ItFo_Bacon);
		
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_03");//Wolê jednak wys³aæ do pracy kilku kopaczy, ni¿ karmiæ tych g³upców miêsem.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_04");//Nie ma ju¿ niewolników - no jaka szkoda. Wygl¹da na to, ¿e musimy znowu pogoniæ kopaczy.
	};
	AI_StopProcessInfos (self);
};

//----------------------------------------------------------------------
//	Info Gruft
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10026_Wache_Gruft   (C_INFO)
{
	npc         = BDT_10026_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10026_Wache_Gruft_Condition;
	information = DIA_Addon_10026_Wache_Gruft_Info;
	permanent   = TRUE;
	description = "Co wiesz o krypcie?";
};
FUNC INT DIA_Addon_10026_Wache_Gruft_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10026_Wache_Gruft_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10026_Wache_Gruft_15_00");//Co wiesz o krypcie?
	AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Gruft_13_01");//No... znajduje siê na koñcu tej œcie¿ki.
	AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Gruft_13_02");//IdŸ po trupach, a znajdziesz j¹.
};



