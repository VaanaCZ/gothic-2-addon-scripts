//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_EXIT   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 999;
	condition   = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tom_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Tom_PICKPOCKET (C_INFO)
{
	npc			= BDT_1080_Addon_Tom;
	nr			= 900;
	condition	= DIA_Addon_Tom_PICKPOCKET_Condition;
	information	= DIA_Addon_Tom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Tom_PICKPOCKET_Condition()
{
	C_Beklauen (40, 52);
};
 
FUNC VOID DIA_Addon_Tom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
	
func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_HI   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 1;
	condition   = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent   = FALSE;
	description = "Perché stai seduto qui?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //Perché stai seduto qui?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //Ho dei problemi. Al momento, è meglio per la mia salute se non mi faccio vedere al campo.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //Che c'è che non va?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //Ho avuto rapporti davvero ottimi con alcuni dei pirati, capisci?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Mi vedevo sempre coi ragazzi fuori dal loro campo e facevo qualche affare.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //Senti! Ho comprato roba per mezzo campo. 'Tom, portami questo. Tom, portami quello.'
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //E poi quel bastardo di Esteban si è messo in mezzo.
};
//---------------------------------------------------------------------
//	Info Juan
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Juan   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 2;
	condition   = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent   = FALSE;
	description = "Cosa è successo?";
};
FUNC INT DIA_Addon_Tom_Juan_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Juan_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Juan_15_00"); //Cosa è successo?
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban ha mandato Juan, uno dei suoi ragazzi. Quel bastardo ci ha teso un'imboscata.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //Stavo per fare un affare coi pirati quando questo è saltato fuori all'improvviso e mi ha steso con due colpi!
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //Ragazzi, era davvero veloce! Ma non abbastanza veloce. Sono riuscito a tenermi alla larga.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Così, Juan è responsabile dell'omicidio di Hank e Angus. Si è appostato e li ha uccisi.");
};

//---------------------------------------------------------------------
//	Info Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Esteban   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 3;
	condition   = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent   = FALSE;
	description = "E sei stato nascosto qui dall'imboscata in poi?";
};
FUNC INT DIA_Addon_Tom_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_Juan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Esteban_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //E sei stato nascosto qui dall'imboscata in poi?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Prima sono tornato al campo e ho fatto sapere a Fisk, Huno e agli altri che si potevano scordare la consegna.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //E che c'era lo zampino di Esteban.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Se Esteban scopre che ho raccontato agli altri che il responsabile era LUI, sono un uomo morto.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_04"); //Ecco perché non posso tornare al campo.
	
	Tom_tells = TRUE;
};

//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Dead   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 4;
	condition   = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent   = FALSE;
	description = "Esteban è morto.";
};
FUNC INT DIA_Addon_Tom_Dead_Condition()
{	
	if (Npc_IsDead (Esteban))
	&& (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Dead_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Esteban è morto.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //Davvero? Ragazzi, che FORTUNA!
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //Chi è stato?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //(perfido) Diciamo che è stato... qualcuno che conosci...
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Grazie per essere venuto da me. Ora posso tornare al campo
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"LAGER");
};

//---------------------------------------------------------------------
// PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_PERM   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 5;
	condition   = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent   = TRUE;
	description = "E a parte questo?";
};
FUNC INT DIA_Addon_Tom_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_PERM_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //Che altro?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Ora posso farmi di nuovo una bella bevuta da Lucia in sante pace.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //Ora poso finalmente farmi vedere di nuovo al campo!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //Oppure? Oppure me ne starò qui a contare le rocce
		};
	};
};




