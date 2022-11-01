//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Pardos_EXIT   (C_INFO)
{
	npc         = STRF_1122_Addon_Pardos;
	nr          = 999;
	condition   = DIA_Addon_Pardos_EXIT_Condition;
	information = DIA_Addon_Pardos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Pardos_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Pardos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Pardos_Hi   (C_INFO)
{
	npc         = STRF_1122_Addon_Pardos;
	nr          = 2;
	condition   = DIA_Addon_Pardos_Hi_Condition;
	information = DIA_Addon_Pardos_Hi_Info;
	permanent   = FALSE;
	description = "Co z tobą?";
};
FUNC INT DIA_Addon_Pardos_Hi_Condition()
{	
	if (Sklaven_Flucht == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Pardos_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Pardos_Hi_03_00");//Co z tobą?
	AI_Output (self, other, "DIA_Addon_Pardos_Hi_03_01");//Powoli nadchodzi koniec... Mój koniec... Czy to piękny letni poranek, czy też gorąca noc, podczas której gwiazdy migocą na kryształowo czystym niebie?
	AI_Output (self, other, "DIA_Addon_Pardos_Hi_03_02");//Nie wiem... Gdzie jest majowy deszcz, gdzie jest jesienny wiatr... Nie czuję ich...
	AI_Output (self, other, "DIA_Addon_Pardos_Hi_03_03");//Wzrok odchodzi jako pierwszy...
};
//---------------------------------------------------------------------
//	Info save
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Pardos_save   (C_INFO)
{
	npc         = STRF_1122_Addon_Pardos;
	nr          = 2;
	condition   = DIA_Addon_Pardos_save_Condition;
	information = DIA_Addon_Pardos_save_Info;
	permanent   = FALSE;
	description = "Trzymaj się. Pomoc już nadchodzi.";
};
FUNC INT DIA_Addon_Pardos_save_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Pardos_Hi)
	&& (Sklaven_Flucht == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Pardos_save_Info()
{
	AI_Output (other, self, "DIA_Addon_Pardos_save_15_00");//Trzymaj się. Pomoc już nadchodzi.
	AI_Output (self, other, "DIA_Addon_Pardos_save_03_01");//Dziękuję... Dziękuję za te kojące słowa.
	//Falsche Stimm Nummer M.F.//AI_Output (self, other, "DIA_Addon_Pardos_save_03_02");//Hey, du wirst doch jetzt nicht schlappmachen, oder? Gib jetzt nicht auf - klar?!
};
//---------------------------------------------------------------------
var int Pardos_Geheilt;
//---------------------------------------------------------------------
//	Info trank
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Pardos_trank   (C_INFO)
{
	npc         = STRF_1122_Addon_Pardos;
	nr          = 2;
	condition   = DIA_Addon_Pardos_trank_Condition;
	information = DIA_Addon_Pardos_trank_Info;
	permanent   = FALSE;
	description = "Wypij to. (Daj napój)";
};
FUNC INT DIA_Addon_Pardos_trank_Condition()
{	
	if (Pardos_Geheilt == FALSE)
	&& Npc_KnowsInfo (other, DIA_Addon_Pardos_save)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Pardos_trank_Info()
{
	AI_Output (other, self, "DIA_Addon_Pardos_trank_15_00");//Wypij to.
	AI_StandUpQuick	(self);	
	
	Info_ClearChoices (DIA_Addon_Pardos_trank);
	
	Info_AddChoice (DIA_Addon_Pardos_trank,DIALOG_BACK,DIA_Addon_Pardos_trank_BACK);
	
	if Npc_HasItems (other, ItPo_Health_01)
	{
		Info_AddChoice (DIA_Addon_Pardos_trank,"Daj esencję leczniczą",DIA_Addon_Pardos_trank_01);
	};
	if Npc_HasItems (other, ItPo_Health_02)
	{
		Info_AddChoice (DIA_Addon_Pardos_trank,"Daj ekstrakt leczniczy",DIA_Addon_Pardos_trank_02);
	};
	if Npc_HasItems (other, ItPo_Health_03)
	{
		Info_AddChoice (DIA_Addon_Pardos_trank,"Daj eliksir leczniczy",DIA_Addon_Pardos_trank_03);
	};
	if Npc_HasItems (other, ItFo_Addon_Meatsoup)
	{
		Info_AddChoice (DIA_Addon_Pardos_trank,"Daj gulasz",DIA_Addon_Pardos_trank_Soup);
	};
	
	
};
FUNC VOID B_SayPardosThanks()
{
	AI_Output (self, other, "DIA_Addon_Pardos_trank_03_00");//Dzięki. Czuję się jakby lepiej...
};
FUNC VOID DIA_Addon_Pardos_trank_BACK()
{
	Info_ClearChoices (DIA_Addon_Pardos_trank);
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Pardos_trank_01()
{
	if B_GiveInvItems (other, self, ItPo_Health_01,1)
	{
		B_UseItem (self,ItPo_Health_01);
	};
	
	Info_ClearChoices (DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP (XP_Ambient); 
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Pardos_trank_02()
{
	if B_GiveInvItems (other, self, ItPo_Health_02,1)
	{
		B_UseItem (self,ItPo_Health_02);
	};
	
	Info_ClearChoices (DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP (XP_Ambient*2);
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Pardos_trank_03()
{
	if B_GiveInvItems (other, self, ItPo_Health_01,3)
	{
		B_UseItem (self,ItPo_Health_03);
	};
	
	Info_ClearChoices (DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP (XP_Ambient*3);
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Pardos_trank_Soup()
{
	AI_Output (other, self, "DIA_Addon_Pardos_trank_soup_15_00");//Zjedz trochę gulaszu.
	
	if B_GiveInvItems (other, self, ItFo_Addon_Meatsoup,1)
	{
		B_UseItem 	(self,ItFo_Addon_Meatsoup);
	};	
	AI_Output (self, other, "DIA_Addon_Pardos_trank_03_01");//Dziękuję. Powinienem szybko odzyskać siły.
	B_GivePlayerXP (XP_Ambient *3);
};
//---------------------------------------------------------------------
//	Info perm
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Pardos_perm   (C_INFO)
{
	npc         = STRF_1122_Addon_Pardos;
	nr          = 99;
	condition   = DIA_Addon_Pardos_perm_Condition;
	information = DIA_Addon_Pardos_perm_Info;
	permanent   = TRUE;
	description = "Jak się trzymasz?";
};
FUNC INT DIA_Addon_Pardos_perm_Condition()
{	
	if (Pardos_Geheilt == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Pardos_perm_Info()
{
	AI_Output (other, self, "DIA_Addon_Pardos_perm_15_00");//Jak się trzymasz?
	AI_Output (self, other, "DIA_Addon_Pardos_perm_03_01");//Dzięki twoim staraniom czuję się znacznie lepiej. Wraca mi dawna siła.
};






