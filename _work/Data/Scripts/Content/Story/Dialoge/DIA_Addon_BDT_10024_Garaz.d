//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Aspetta un attimo.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//C’è qualche problema?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Scavaragno. Un sacco di scavaragno. Siamo incappati in un nido.
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "Perché non attacchiamo gli scavaragno?";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//Perché non attacchiamo gli scavaragno?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//L'ho chiesto anch'io. Ma le guardie avevano 'cose più importanti' da fare.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//Bloodwyn ha incaricato me di risolvere il problema.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Non credo che tu stia pensando di combattere contro gli scavaragno.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//Perché dovrei? Per l'oro che si trova nella caverna?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Bloodwyn se ne prenderà comunque la maggior parte per sé. E io non rischio il collo per le briciole.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//Se TU vuoi combattere contro gli scavaragno, non ti fermerò. Ma non attirarli tutti qui fuori, va bene?
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "Puoi dirmi di più su Bloodwyn?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//Puoi dirmi di più su Bloodwyn?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Sì. È un bastardo affamato d'oro. Ispeziona ogni nuova vena e ogni pepita.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//Non si può allontanare troppo in cerca dell'oro. Ma di noi non gli importa proprio niente.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//Inoltre?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Pensa di essere il più grande e non sopporta che qualcuno sia messo meglio di lui. Insomma, io non mi metterei contro di lui.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Stai lontano da lui e non provocarlo, a meno che tu non voglia farlo infuriare e fargli perdere il controllo
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn lascerà definitivamente il tempio quando scoprirà che nella miniera è stata trovato un nuovo filone d'oro.");
	B_LogEntry (Topic_Addon_Tempel,"Quando Bloodwyn si irrita, perde il controllo. Una cosa che mi sarà sicuramente utile."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "Gli scavaragno sono storia vecchia.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//Così è tutto, gli scavaragno sono storia vecchia.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn sta arrivando. È quello che volevi, no?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//Voglio dire, hai ammazzato gli scavaragno per attirare qui Bloodwyn. Allora, qualsiasi cosa tu stia pensando, falla ORA.
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//Gliel'hai fatta vedere a quel fannullone. Bel lavoro.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//Allora darò un'occhiata nella caverna.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//Ehi, amico, qui c'è veramente un sacco d'oro.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//Per raggiungere quei blocchi lassù ci vorrebbe una scala.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Ma dalla caduta della Barriera, nessuno ha più usato scale… un vero peccato
};




