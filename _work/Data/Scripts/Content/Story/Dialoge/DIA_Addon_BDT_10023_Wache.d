//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_Hi   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10023_Wache_Hi_Condition()
{	
	if (Npc_GetDistToNpc (self,other) <= 300)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Ehi, dove vai? Vuoi entrare in questo passaggio?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//Beh, certo, perché no?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Là dietro ci sono anche più schiavi. Per quanto mi riguarda, puoi entrare, ma non fargli troppo male altrimenti non riescono più a lavorare.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Dopo tutto, non vogliamo che perdano tempo: devono estrarre l'oro.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Capisco. E chi ha dato quest'ordine?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//È un ordine diretto di Bloodwyn.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//Pensavo che il capo qui fosse Raven.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//Sì, ma ha dato gli schiavi a Bloodwyn perché a lui non servono più.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Raven non sa più cosa fare degli schiavi. Ora appartengono a Bloodwyn."); 
};
//---------------------------------------------------------------------
//	Info go
//---------------------------------------------------------------------
var int PrisonGuard_Rules;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_go   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent   = TRUE;
	description = "Lascia andare gli schiavi!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//Lascia andare gli schiavi!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//Ascolta. Qui comanda Bloodwyn. Gli schiavi sono suoi, quindi è lui che ha il diritto di liberarli.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//Inoltre, anche Thorus ha voce in capitolo. E tu?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Solo Bloodwyn e Thorus hanno il diritto di liberare gli schiavi.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//Tu HAI voce in capitolo?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Ho fatto una chiacchierata con Thorus.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(mostra la testa di Bloodwyn)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Decido io CHI entra nella miniera.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//Decido io CHI entra nella miniera.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//Stai facendo il lavoro che era di Esteban. Allora NON HAI ASSOLUTAMENTE voce in capitolo, qui. Sparisci.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Ecco, è sufficiente?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//(sta per vomitare) Metti via. Non voglio vedere!
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Faresti meglio a lasciar andare gli schiavi ADESSO.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//Aspetta un attimo. Bloodwyn non è l'unico ad avere voce in capitolo, qui. Finché non ho un ordine da Thorus, non verrà liberato nessuno.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Ho fatto una chiacchierata con Thorus.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//Ma hai appena detto che gli schiavi appartengono a Bloodwyn.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//Sì, ma ho anche detto che non lascerò andare via nessuno senza un ordine di Thorus.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Sei uno di quelli che non fa neppure la pipì senza un ordine, eh?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//Sì, ma ho anche detto
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//…va bene, risparmiami il resto.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//Ho parlato con Thorus. Ha ordinato che gli schiavi vengano liberati.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//Va bene, se lo ha ordinato Thorus. Ma mi domando perché mai abbia deciso una cosa del genere
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//…ma tu non sei pagato per porti delle domande.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Va bene, va bene. Evidentemente qui non c'è più bisogno di me, quindi vado a prendermi un po' di stufato.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
