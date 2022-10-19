// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Khaled_EXIT (C_INFO)
{
	npc         = SLD_823_Khaled;
	nr          = 999;
	condition   = DIA_Khaled_EXIT_Condition;
	information = DIA_Khaled_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Khaled_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Khaled_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				Hallo 
// ************************************************************
var int Khaled_weiter;

instance DIA_Khaled_Hallo		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 1;
	condition	= DIA_Khaled_Hallo_Condition;
	information	= DIA_Khaled_Hallo_Info;
	permanent	= TRUE;
	description	= "Va tutto bene?";
};

func int DIA_Khaled_Hallo_Condition ()
{
	if (Khaled_weiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Khaled_Hallo_15_00"); //Ve la cavate bene?
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	{
		AI_Output (self, other, "DIA_Khaled_Hallo_11_01"); //Dunque vuoi unirti a noi, allora? Hai almeno un'arma decente?
		Khaled_weiter = TRUE;
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Khaled è un venditore di armi.");
	}
	else
	{
		AI_Output (self, other, "DIA_Khaled_Hallo_11_02"); //Se è qualcosa di importante, vai a parlare con Lee. Altrimenti, lasciami in pace.
		AI_StopProcessInfos (self);
	};	
};

// ************************************************************
// 			  				TRADE 
// ************************************************************
instance DIA_Khaled_TRADE		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 700;
	condition	= DIA_Khaled_TRADE_Condition;
	information	= DIA_Khaled_TRADE_Info;
	permanent	= TRUE;
	description	= "Quali armi hai da offrirmi?";
	trade		= TRUE;
};

func int DIA_Khaled_TRADE_Condition ()
{
	if (Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Khaled_TRADE_15_00"); //Quali armi hai da offrirmi?
	B_GiveTradeInv (self);
	AI_Output (self, other, "DIA_Khaled_TRADE_11_01"); //Solo le migliori. Dacci un'occhiata.
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************
instance DIA_Khaled_WannaJoin		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 10;
	condition	= DIA_Khaled_WannaJoin_Condition;
	information	= DIA_Khaled_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Ti dispiacerebbe se mi unissi a voi?";
};

func int DIA_Khaled_WannaJoin_Condition ()
{
	if (Khaled_weiter == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Khaled_WannaJoin_15_00"); //Ti dispiacerebbe se mi unissi a voi?
	AI_Output (self, other, "DIA_Khaled_WannaJoin_11_01"); //Una volta che avrai passato la prova, voterò per te.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Khaled_WannaJoin_15_02"); //L'ho già passata.
		AI_Output (self, other, "DIA_Khaled_WannaJoin_11_03"); //Bene, allora è tutto a posto.
	};
};

// ************************************************************
// 			  				Woher 
// ************************************************************
instance DIA_Khaled_Woher		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 3;
	condition	= DIA_Khaled_Woher_Condition;
	information	= DIA_Khaled_Woher_Info;
	permanent	= FALSE;
	description	= "Come sei finito insieme ai mercenari?";
};

func int DIA_Khaled_Woher_Condition ()
{
	if (Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Woher_Info ()
{
	AI_Output (other, self, "DIA_Khaled_Woher_15_00"); //Come sei finito insieme ai mercenari?
	AI_Output (self, other, "DIA_Khaled_Woher_11_01"); //Sono venuto con Silvio da sud. Facevamo parte di un esercito di mercenari che combatteva contro gli orchi.
};

// ************************************************************
// 			  				AboutSylvio 
// ************************************************************
instance DIA_Khaled_AboutSylvio		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 4;
	condition	= DIA_Khaled_AboutSylvio_Condition;
	information	= DIA_Khaled_AboutSylvio_Info;
	permanent	= FALSE;
	description	= "Cosa pensi di Silvio?";
};

func int DIA_Khaled_AboutSylvio_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutSylvio_Info ()
{
	AI_Output (other, self, "DIA_Khaled_AboutSylvio_15_00"); //Cosa pensi di Sylvio?
	AI_Output (self, other, "DIA_Khaled_AboutSylvio_11_01"); //È un tipo pericoloso! E molti dei mercenari che sono venuti con lui ascoltano tutto quello che dice. Farai meglio a non farlo arrabbiare.
};

// ************************************************************
// 			  				AboutLee 
// ************************************************************
instance DIA_Khaled_AboutLee		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 5;
	condition	= DIA_Khaled_AboutLee_Condition;
	information	= DIA_Khaled_AboutLee_Info;
	permanent	= FALSE;
	description	= "Cosa pensi di Lee?";
};

func int DIA_Khaled_AboutLee_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutLee_Info ()
{
	AI_Output (other, self, "DIA_Khaled_AboutLee_15_00"); //Cosa pensi di Lee?
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_01"); //Penso che l'unica cosa che conti veramente per Lee sia andarsene da quest'isola.
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_02"); //Vuole raggiungere la terraferma. Sembra che abbia un conto in sospeso con qualcuno laggiù...
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_03"); //Ad ogni modo, svolge un lavoro ben migliore di quanto potrebbe fare Silvio.
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_04"); //Inoltre, è un ottimo capo. Il più delle volte possiamo fare quello che vogliamo qui.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Khaled_PICKPOCKET (C_INFO)
{
	npc			= SLD_823_Khaled;
	nr			= 900;
	condition	= DIA_Khaled_PICKPOCKET_Condition;
	information	= DIA_Khaled_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Khaled_PICKPOCKET_Condition()
{
	C_Beklauen (78, 85);
};
 
FUNC VOID DIA_Khaled_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Khaled_PICKPOCKET);
	Info_AddChoice		(DIA_Khaled_PICKPOCKET, DIALOG_BACK 		,DIA_Khaled_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Khaled_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Khaled_PICKPOCKET_DoIt);
};

func void DIA_Khaled_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Khaled_PICKPOCKET);
};
	
func void DIA_Khaled_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Khaled_PICKPOCKET);
};























