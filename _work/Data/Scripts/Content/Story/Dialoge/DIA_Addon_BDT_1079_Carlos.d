//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Carlos_EXIT   (C_INFO)
{
	npc         = BDT_1079_Addon_Carlos;
	nr          = 999;
	condition   = DIA_Addon_Carlos_EXIT_Condition;
	information = DIA_Addon_Carlos_EXIT_Info;
	permanent   = TRUE;
	description = "Tak se mêj.";
};
FUNC INT DIA_Addon_Carlos_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Carlos_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Carlos_PICKPOCKET (C_INFO)
{
	npc			= BDT_1079_Addon_Carlos;
	nr			= 900;
	condition	= DIA_Addon_Carlos_PICKPOCKET_Condition;
	information	= DIA_Addon_Carlos_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Carlos_PICKPOCKET_Condition()
{
	C_Beklauen (71, 85);
};
 
FUNC VOID DIA_Addon_Carlos_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Carlos_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Carlos_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Carlos_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Carlos_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Carlos_PICKPOCKET_DoIt);
};

func void DIA_Addon_Carlos_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Carlos_PICKPOCKET);
};
	
func void DIA_Addon_Carlos_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Carlos_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Carlos_HI   (C_INFO)
{
	npc         = BDT_1079_Addon_Carlos;
	nr          = 1;
	condition   = DIA_Addon_Carlos_HI_Condition;
	information = DIA_Addon_Carlos_HI_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Carlos_HI_Condition()
{
	if Npc_IsDead (Franco)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Carlos_HI_Info()
{	
	AI_Output (self,other,"DIA_Addon_Carlos_HI_12_00"); //Hele, ty seš ten novej, co sejmul Franca?

	Info_ClearChoices (DIA_Addon_Carlos_HI);
	Info_AddChoice (DIA_Addon_Carlos_HI, "Co? Já? Ne!" ,DIA_Addon_Carlos_HI_No);
	Info_AddChoice (DIA_Addon_Carlos_HI, "Ano. Proè?" ,DIA_Addon_Carlos_HI_Yes);
};

func void DIA_Addon_Carlos_HI_Yes()
{
	AI_Output (other,self,"DIA_Addon_Carlos_HI_Yes_15_00"); //Ano, proè?
	AI_Output (self,other,"DIA_Addon_Carlos_HI_Yes_12_01"); //(vztekle) Protože teë jsem jeho místo pâevzal já. Udêlals to dobâe, díky moc!
	Info_ClearChoices (DIA_Addon_Carlos_HI);
};

func void DIA_Addon_Carlos_HI_No()
{
	AI_Output (other,self,"DIA_Addon_Carlos_HI_No_15_00"); //Co? Já? Ne!
	AI_Output (self,other,"DIA_Addon_Carlos_HI_No_12_01"); //Ale no tak, bez urážky!
	Info_ClearChoices (DIA_Addon_Carlos_HI);
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Carlos_Attentat   (C_INFO)
{
	npc         = BDT_1079_Addon_Carlos;
	nr          = 2;
	condition   = DIA_Addon_Carlos_Attentat_Condition;
	information = DIA_Addon_Carlos_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Carlos_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Carlos_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	
	AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_00");//Thorus mi nakázal, abych pro tábor našel nêkoho novýho místo toho útoèníka.
	
	if (Logan_Inside == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_01");//A Franco poslal Logana.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_02");//A Franco poslal nêkoho novýho.
	};
	
	AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_03");//Hele, já jenom dêlám, co mi âekne Thorus. O samotným útoku nevím ani zbla.
};

//---------------------------------------------------------------------
//	PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Carlos_PERM   (C_INFO)
{
	npc         = BDT_1079_Addon_Carlos;
	nr          = 3;
	condition   = DIA_Addon_Carlos_PERM_Condition;
	information = DIA_Addon_Carlos_PERM_Info;
	permanent   = TRUE;
	description	= "A jak se ti velí lovcùm?";
};
FUNC INT DIA_Addon_Carlos_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Carlos_PERM_Info()
{
	AI_Output (other, self, "DIA_Addon_Carlos_PERM_15_00"); //A jaký to je vést lovce?
	AI_Output (self, other, "DIA_Addon_Carlos_PERM_12_00"); //Dej mi pokoj!
	AI_StopProcessInfos (self);
};

