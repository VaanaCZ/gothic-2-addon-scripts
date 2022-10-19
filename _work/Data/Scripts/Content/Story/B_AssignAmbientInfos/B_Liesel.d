// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Liesel_EXIT(C_INFO)
{
	npc			= Follow_Sheep;
	nr			= 999;
	condition	= DIA_Liesel_EXIT_Condition;
	information	= DIA_Liesel_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Liesel_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Liesel_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  			Hallo (Durchsuchen)
// ************************************************************
INSTANCE DIA_Liesel_Hallo (C_INFO)
{
	npc			= Follow_Sheep;
	nr			= 1;
	condition	= DIA_Liesel_Hallo_Condition;
	information	= DIA_Liesel_Hallo_Info;
	permanent	= FALSE;
	description = "Cze��..."; 
};                       
FUNC INT DIA_Liesel_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Liesel_Hallo_Info()
{	
	AI_Output (other, self,"DIA_Liesel_Hallo_15_00"); //Cze��... khm... owco.
	B_LieselMaeh ();
};
// ************************************************************
// 			  			Komm mit
// ************************************************************
INSTANCE DIA_Liesel_KommMit (C_INFO)
{
	npc			= Follow_Sheep;
	nr			= 1;
	condition	= DIA_Liesel_KommMit_Condition;
	information	= DIA_Liesel_KommMit_Info;
	permanent	= TRUE;
	description = "Chod� ze mn�."; 
};                       
FUNC INT DIA_Liesel_KommMit_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Liesel_Hallo))
	&& (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Liesel_KommMit_Info()
{	
	AI_Output (other, self,"DIA_Liesel_KommMit_15_00");	//Chod� ze mn�.
	B_LieselMaeh ();
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  			Warte hier
// ************************************************************
INSTANCE DIA_Liesel_WarteHier (C_INFO)
{
	npc			= Follow_Sheep;
	nr			= 1;
	condition	= DIA_Liesel_WarteHier_Condition;
	information	= DIA_Liesel_WarteHier_Info;
	permanent	= TRUE;
	description = "Zaczekaj tutaj!";
};                       
FUNC INT DIA_Liesel_WarteHier_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE) 
	&& (Npc_KnowsInfo(other, DIA_Liesel_Hallo))
	&& (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Liesel_WarteHier_Info()
{	
	AI_Output (other, self,"DIA_Liesel_WarteHier_15_00");	//Zaczekaj tutaj!
	B_LieselMaeh ();
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	AI_StopProcessInfos	(self);
};
