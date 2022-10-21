///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_EXIT   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 999;
	condition   = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hallo   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent   = FALSE;
	description = "Cosa fai qui in piedi?";
};

FUNC INT DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hallo_15_00");//Cosa fai qui in piedi?
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Vengo dal castello. Mi hanno mandato a cercare i dispersi e a controllare la zona.
};
///////////////////////////////////////////////////////////////////////
//	Info Vermisste
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Vermisste   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Vermisste_Condition;
	information = DIA_Jergan_Vermisste_Info;
	permanent   = FALSE;
	description = "Quei dispersi?";
};

FUNC INT DIA_Jergan_Vermisste_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Vermisste_Info()
{
	AI_Output (other, self,"DIA_Jergan_Vermisste_15_00");//Quei dispersi?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Alcuni sono scappati quando i draghi hanno attaccato, non c'è da stupirsi!
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Ma se ci sono dei sopravvissuti, li porterò indietro.
};
///////////////////////////////////////////////////////////////////////
//	Info Burg 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Burg   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent   = FALSE;
	description = "Puoi aiutarmi a entrare nel castello?";
};

FUNC INT DIA_Jergan_Burg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Burg_Info()
{
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//Puoi aiutarmi a entrare nel castello?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Certo, ma dovrai farmi un favore
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Se riuscirai a raggiungere il castello, parla con il paladino Oric. Digli che suo fratello c'è rimasto su al passo.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Quando sono al castello, devo dire a Oric che suo fratello è caduto al passo.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Gegend   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Gegend_Info;
	permanent   = TRUE;
	description = "Cosa c’è da sapere su questa zona?";
};

FUNC INT DIA_Jergan_Gegend_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
var int Jergan_Tell;
FUNC VOID DIA_Jergan_Gegend_Info()
{
	if (Jergan_Tell == FALSE)
	{
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//Cosa c’è da sapere su questa zona?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Se vuoi vivere, torna da dovunque sei venuto.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//I pelleverde hanno stretto d'assedio il castello ormai da settimane e inoltre i draghi stanno nascondendosi da qualche parte.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//L'intera Valle delle Miniere brulica di orchi, non importa dove sei diretto, non sarà una passeggiata.
	Jergan_Tell = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hilfe   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Hilfe_Condition;
	information = DIA_Jergan_Hilfe_Info;
	permanent   = FALSE;
	description = "Come arrivo al castello?";
};

FUNC INT DIA_Jergan_Hilfe_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Burg)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Hilfe_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hilfe_15_00");//Come arrivo al castello?
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Innanzitutto, dimenticati la strada diretta. Ma se aggiri il castello, potresti avere qualche possibilità dal retro.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Dovresti stare lontano dai sentieri e usare il fiume. Sarà meglio se nuoterai verso valle per un tratto. Dovrebbe essere più facile da lì.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Gli orchi hanno posizionato un ariete dietro il castello. Puoi entrare da quella parte, avvicinati di soppiatto agli orchi il più vicino possibile e poi corri più veloce che puoi.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Dovresti farcela se sei abbastanza veloce.
};


//2. Begegnung
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Mine   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent   = FALSE;
	description = "Cosa stai facendo, qui?";
};

FUNC INT DIA_Jergan_Mine_Condition()
{	
	if( Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Mine_Info()
{
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//Cosa stai facendo qui?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Sono un esploratore. Vago per la regione. Ma tutti questi squartatori non mi rendono la vita facile.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//È una buona occasione per recuperare qualche trofeo, ammesso che tu sappia quello che stai facendo.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Claw   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent   = FALSE;
	description = "Puoi insegnarmi a farlo?";
};

FUNC INT DIA_Jergan_Claw_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Mine)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Claw_Info()
{
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//Puoi insegnarmi a farlo?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//Posso mostrarti come rimuovere gli artigli di quelle bestiacce dopo che saranno morte.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen lernen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Teach   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent   = TRUE;
	description = "(Apprendi come rimuovere gli artigli)";
};
FUNC INT DIA_Jergan_Teach_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Claw)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Teach_Info()
{
	AI_Output (other, self,"DIA_Jergan_Teach_15_00");//Mostrami come rimuovere gli artigli.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
	{
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//L'importante è rimuovere gli artigli con uno strappo. Non essere troppo esitante, e non tagliare con la lama.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//In questo modo non rimuovi solamente gli artigli degli squartatori, ma anche delle lucertole e delle bestie d'ombra.
	};
};
///////////////////////////////////////////////////////////////////////
//	Diego
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Diego   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent   = FALSE;
	description = "Sai dove si è diretto Diego?";
};

FUNC INT DIA_Jergan_Diego_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& (Npc_KnowsInfo (other, DIA_DiegoOw_Hallo) == FALSE)
	&& Npc_KnowsInfo (other,DIA_Parcival_Diego)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Diego_Info()
{
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//Sai dove si è diretto Diego?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//Diego? Era uno dei minatori di Silvestro. Ma se l'è svignata.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//L'ho visto con due cavalieri e una cassa, non molto distante da qui.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Riesci a vedere quella vecchia torre di guardia da qui, vero? Vai laggiù, e poi verso il castello.
	AI_Output (self, other,"DIA_Jergan_Diego_13_04");//Un sentiero conduce attraverso le rocce sulla destra. Sono andati di lì.
};
///////////////////////////////////////////////////////////////////////
//	Rudelführer getötet
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Jergan_Leader   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Jergan_Leader_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_IsDead(NewMine_LeadSnapper) 
	&& Npc_KnowsInfo (other,DIA_Bilgot_KNOWSLEADSNAPPER)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Leader_Info()
{
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//Dunque hai ucciso il capobranco. E hai preso gli artigli di quella bestiaccia?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//Sì.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Varranno sicuramente molto. Ci sono alcune persone che collezionano queste cose.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Se trovi l'acquirente giusto farai un mucchio di soldi.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//No.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Dovresti farlo. Sono sicuro che valgono una fortuna.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jergan_PICKPOCKET (C_INFO)
{
	npc			= VLK_4110_Jergan;
	nr			= 900;
	condition	= DIA_Jergan_PICKPOCKET_Condition;
	information	= DIA_Jergan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Jergan_PICKPOCKET_Condition()
{
	C_Beklauen (84, 110);
};
 
FUNC VOID DIA_Jergan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jergan_PICKPOCKET);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_BACK 		,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};
	
func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};














