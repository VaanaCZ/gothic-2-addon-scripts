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
	description = "Ci si vede.";
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
	AI_Output (self,other,"DIA_Addon_Carlos_HI_12_00"); //Ehi, sei tu quello nuovo che ha steso Franco?

	Info_ClearChoices (DIA_Addon_Carlos_HI);
	Info_AddChoice (DIA_Addon_Carlos_HI, "Cosa? Io? No!" ,DIA_Addon_Carlos_HI_No);
	Info_AddChoice (DIA_Addon_Carlos_HI, "Sì. Perché?" ,DIA_Addon_Carlos_HI_Yes);
};

func void DIA_Addon_Carlos_HI_Yes()
{
	AI_Output (other,self,"DIA_Addon_Carlos_HI_Yes_15_00"); //Sì, perché?
	AI_Output (self,other,"DIA_Addon_Carlos_HI_Yes_12_01"); //(arrabbiato) Perché ora il suo lavoro lo devo fare io. Hai fatto un ottimo lavoro! Grazie mille!
	Info_ClearChoices (DIA_Addon_Carlos_HI);
};

func void DIA_Addon_Carlos_HI_No()
{
	AI_Output (other,self,"DIA_Addon_Carlos_HI_No_15_00"); //Cosa? Io? No!
	AI_Output (self,other,"DIA_Addon_Carlos_HI_No_12_01"); //Ah! Senza offesa!
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
	
	AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_00");//Dopo la morte dell'assalitore, Thorus mi ha incaricato di trovare un uomo nuovo per il campo.
	
	if (Logan_Inside == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_01");//E Franco ha mandato Logan.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_02");//E Franco ha mandato un tizio nuovo.
	};
	
	AI_Output (self, other, "DIA_Addon_Carlos_Attentat_12_03");//Ehi, faccio solo quello che mi dice Thorus. Non so niente dell'attacco.
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
	description	= "E com'è guidare i cacciatori?";
};
FUNC INT DIA_Addon_Carlos_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Carlos_PERM_Info()
{
	AI_Output (other, self, "DIA_Addon_Carlos_PERM_15_00"); //E com'è guidare i cacciatori?
	AI_Output (self, other, "DIA_Addon_Carlos_PERM_12_00"); //Lasciami in pace!
	AI_StopProcessInfos (self);
};

