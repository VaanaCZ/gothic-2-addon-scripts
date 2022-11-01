//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "Cosa stai facendo, qui?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Cosa stai facendo, qui?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Cerchi qualcosa?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Piante: sto cercando delle piante.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Di solito, cerco delle piante.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Quasi tutto quello che cresce qui può essere usato per qualcosa.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//Molte piante hanno proprietà curative e con l'erba di palude si possono fare dei sigari.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Prima di finire dietro alla Barriera ero un alchimista.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "Perché ti hanno messo dietro alla Barriera?";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Perché ti hanno messo dietro alla Barriera?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Ho lavorato parecchio con le pozioni che alterano gli stati mentali.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Una sera, il mio padrone Ignaz ha bevuto il mio 'esperimento' invece del suo vino.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//E questo lo ha reso temporaneamente, eh… imprevedibile e da allora è rimasto un po' confuso.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//(sprezzante) Per questo i maghi mi hanno cacciato dietro alla Barriera. L'hanno definita 'Ricerca di conoscenze proibite'.
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "Cosa mi dici del campo?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Cosa mi dici del campo?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Non molto. Non ci sono mai stato.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Solo gli uomini di Raven sono lì dall'inizio, tutti gli altri che sono arrivati dopo, come me, devono aspettare finché non hanno bisogno di gente.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "Da dove siete venuti?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Da dove siete venuti?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //Beh, come te, suppongo, con i pirati, dal mare.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //La valle è rimasta completamente tagliata fuori. Non c'è alcun collegamento via terra.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(pensoso) Giusto.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "Quando hanno bisogno di gente nuova?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //Quando hanno bisogno di gente nuova?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //Beh, quando qualcuno viene a mancare all'interno.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Se uno scavatore viene mangiato da uno scavaragno, fanno entrare un sostituto.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //A volte si uccidono anche l'un l'altro. Ma ultimamente hanno rigato diritto.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Raven ha in qualche modo controllato l'accesso alla miniera, così non tutti possono entrare.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Ma non so esattamente come funziona: non ci sono mai entrato.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "A proposito di Fortuno…";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno ha le idee confuse e farebbe meglio a bersi una pozione per recuperare la memoria.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? È il servitore di Raven, no?
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//Lo era: adesso è ridotto a una larva. Ed è colpa di Raven.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Raven? Fino ad ora, avevo una buona opinione di lui. Ehm, va bene. Ma qui nella palude, non posso preparare pozioni.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//Potrei preparare la pozione. Nel campo c'è un banco dell'alchimista. Mi serve solo la ricetta.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//Fai attenzione con questa ricetta. La preparazione di questa pozione è pericolosa.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Se nella preparazione qualcosa va storto o gli ingredienti non sono quelli giusti, la pozione sarà letale.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//Farò attenzione.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel mi ha dato la ricetta di una pozione. Posso usarla per aiutare Fortuno a ricordare. Devo aspettare di conoscere bene tutti gli ingredienti prima di preparare la pozione. Altrimenti è mortale.");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "Puoi insegnarmi qualcosa?";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//Puoi insegnarmi qualcosa?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//Non c'è tempo. Sono qui per l'oro. E finché non riesco a entrare nel campo, mi mantengo vendendo le mie erbe.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Ma se ti servono delle pozioni, ne ho ancora qualcuna.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Posso acquistare pozioni e piante da Miguel.");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};



