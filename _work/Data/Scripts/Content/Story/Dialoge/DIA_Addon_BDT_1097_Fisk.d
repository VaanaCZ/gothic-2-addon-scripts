//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_EXIT   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 999;
	condition   = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fisk_PICKPOCKET (C_INFO)
{
	npc			= BDT_1097_Addon_Fisk;
	nr			= 900;
	condition	= DIA_Addon_Fisk_PICKPOCKET_Condition;
	information	= DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       
FUNC INT DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	C_Beklauen (118, 300);
};
 
FUNC VOID DIA_Addon_Fisk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
	
func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Hi   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 1;
	condition   = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fisk_Hi_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Ehi, se cerchi un commerciante corretto qui nel campo, l'hai trovato.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//La mia capanna è proprio dietro a Esteban. Quindi se ti serve qualcosa, passa pure.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk si occupa di mercanzie di tutti i tipi.");
	
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine  (self,"START");
};
//--------------------------------------------------------------------
//	Info Trade
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Trade   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 888;
	condition   = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;

};
FUNC INT DIA_Addon_Fisk_Trade_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Trade_Info()
{
	B_Say (other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	
	//Bolzen nachfüllen
	if (Npc_HasItems (self, ItRw_Bolt) < 50)
	{
		CreateInvItems (self,ItRw_Bolt, (50 - Npc_HasItems (self, ItRw_Bolt))); 
	};
	//Pfeile nachfüllen
	if (Npc_HasItems (self, ItRw_Arrow) < 50)
	{
		CreateInvItems (self,ItRw_Arrow, (50 - Npc_HasItems (self, ItRw_Arrow))); 
	};
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Attentat   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fisk_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //Senti, non voglio avere niente a che fare con questo, capito?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //(innocente) Ho i miei pensieri, sono anch'io una vittima.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //In che senso?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //Per la mia ultima consegna ho pagato molto oro.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Ma non ho mai ricevuto nulla! Qualche maiale deve avermela portata via.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //(offeso) Sono stato derubato, probabilmente da uno dei nostri!
};

//---------------------------------------------------------------------
//	Lieferung
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Lieferung   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 3;
	condition   = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent   = FALSE;
	description	= "Che tipo di consegna?";
};
FUNC INT DIA_Addon_Fisk_Lieferung_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //Che tipo di consegna?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Un pacchetto di grimaldelli. Me lo dovevano procurare dai pirati.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Ma un tizio di nome Juan me l'ha portato via. (arrabbiato) E con questo anche l'oro che mi era costato!
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Quel bastardo si nasconde da qualche parte nella palude.
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Un tale Juan era in affari coi briganti. Dicono che nasconde qualcosa nella palude.");
	B_LogEntry (Topic_Addon_Fisk,"Un tizio di nome Juan ha rubato la consegna (un pacchetto di grimaldelli) a Fisk. Si nasconde da qualche parte nella palude.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //È morto.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Bene, allora non può procurarmi altri guai!
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //È ancora vivo
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Hai lasciato vivere quel maiale?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Non era solo
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Non importa, posso occuparmi lo stesso di quelle carogne
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //Per quanto ti riguarda
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Ho un buon rapporto con Huno.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Farò in modo che tu non debba spendere più molto per la tua armatura, d'ora in poi.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //Ed ecco, ho avuto questa pietra da Corristo tempo fa.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //È l'unica cosa che mi è rimasta dopo la mia fuga dalla Barriera. Penso ne sarà più utile a te.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //Inoltre, ti darò una delle mie armi.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h größer oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //(perfido) Una mano lava l'altra, non è cambiato da allora.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "Ho il tuo pacchetto.";
};
FUNC INT DIA_Addon_Fisk_GivePaket_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Lennar_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //Ho il tuo pacchetto.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //(compiaciuto) Davvero! (sospettoso) E Juan?
	
	B_Addon_Fisk_AboutJuan();
	
	B_Addon_Fisk_Belohnung();
};

//---------------------------------------------------------------------
//	Paket OPEN - 
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_PaketOpen (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 5;
	condition   = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent   = FALSE;
	description = "Ho aperto il tuo pacchetto!";
};
FUNC INT DIA_Addon_Fisk_PaketOpen_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (LennarPaket_Open == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //Ho aperto il tuo pacchetto!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //(ride) Ma certo! Non hai saputo aspettare, vero?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //Almeno hai ancora i grimaldelli?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //E, cosa più importante, cosa è successo a Juan?

	B_Addon_Fisk_AboutJuan();
};

//---------------------------------------------------------------------
//	- Dietriche abgeben! 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePicks (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 6;
	condition   = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent   = TRUE;
	description = "Eccoti una dozzina di grimaldelli…";
};
FUNC INT DIA_Addon_Fisk_GivePicks_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_PaketOpen))
	&& (MIS_Lennar_Lockpick == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Ecco una dozzina di grimaldelli

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Molto bene. C'è già qualcuno che aspetta della merce nuova.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //Ma non sono una dozzina! (maliziosamente) Non stai cercando di fregarmi, vero?
	};
};


//---------------------------------------------------------------------
//	Inspektor
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Inspektor (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 7;
	condition   = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent   = FALSE;
	description = "Juan lavorava per Esteban!";
};
FUNC INT DIA_Addon_Fisk_Inspektor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Lieferung))
	&& (Npc_KnowsInfo (other, DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //Juan lavorava per Esteban!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //(meravigliato) Cosa?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Niente giochetti con me! Lo sapevi!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //(calmo) Bene. Hai ragione. Ma spero che tu capisca perché non ti ho detto niente.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //Al campo tutti sanno che lavori per Esteban.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //Non voglio assolutamente essere trascinato in questo affare solo perché tieni a una pietra rossa.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Non lavoro proprio per Esteban…",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Non ti credo!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Capisco!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Capisco!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Bene! Allora lascia perdere. Non voglio che ci sentano!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Non ti credo!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //Credi pure quello che vuoi! Ma ti avverto, se pensi di raccontare a Esteban qualche storia su di me, il prossimo sei tu!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //Non sto veramente lavorando per Esteban
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //Allora? Vuoi gettare fumo negli occhi a quel vecchio maiale?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //Ti darò un buon consiglio, ma tienilo per te.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //E quanto a Esteban, non fidarti di NESSUNO, neanche di me, chiaro?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //E adesso basta, non voglio che ci sentano!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

//--------------------------------------------------------------------
//	Info Meeting
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Meeting   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent   = FALSE;
	description = "E così il mandante dell'attacco sei TU.";
};
FUNC INT DIA_Addon_Fisk_Meeting_Condition()
{	
	if (Npc_GetDistToWP  (self, "BL_INN_UP_06") <= 500)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//E così il mandante dell'attacco sei TU.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Sì. Esteban intralcia i miei affari.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Non lascia entrare nella miniera nessuno dei briganti che lavorano per me. Fa in modo che TUTTI lavorino per lui, e solo per lui.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//Così può intascare una percentuale su ogni affare e controlla l'intero campo.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Cosa pensi di fare, adesso?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Vuoi prendere il suo posto?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Potrei venderti a Esteban…",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//Vuoi prendere il suo posto?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//No, io sono un commerciante, voglio solo continuare a fare il mio lavoro in pace.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Potrei venderti a Esteban
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//E poi? Cosa pensi che succederebbe? Pensi che ti darà quello che vuoi?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Scordatelo, ho un'idea migliore.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Cosa stai architettando?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Toglierò di mezzo Esteban. Questo significa che TU lo ucciderai e prenderai il suo posto.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Ma se le sue guardie del corpo sono con lui, non ho nessuna chance.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//Allora dovremo allontanarle... dicendo la verità.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Quale verità?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//Hai fatto il tuo lavoro. Tu sai che il mandante dell'attacco sono io.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Dillo a Esteban, che manderà i suoi ragazzi ad uccidermi. Li aspetterò qui.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//Quando se ne saranno andati, potrai occuparti del bastardo mentre io penserò alle guardie.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban è morto. Posso dedicarmi di nuovo al mio lavoro
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Ecco, questo è per te
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Fisk è il mandante dell'attacco contro Esteban.");
};
//--------------------------------------------------------------------
//	Info Sieg
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Sieg   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent   = FALSE;
	description = "Esteban è finito.";
};
FUNC INT DIA_Addon_Fisk_Sieg_Condition()
{	
	if (MIS_Judas == LOG_SUCCESS)
	&&  Npc_IsDead (Esteban)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban è finito.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//Ho aspettato a lungo questo momento.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Penso che tu abbia qualcosa da fare, ora, e io devo tornare al mio lavoro.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Allora, se hai bisogno d'altro, sai dove trovarmi.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};

