// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Garett_EXIT(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 999;
	condition	= DIA_Addon_Garett_EXIT_Condition;
	information	= DIA_Addon_Garett_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Garett_PICKPOCKET (C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 900;
	condition	= DIA_Addon_Garett_PICKPOCKET_Condition;
	information	= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen (36, 55);
};
 
FUNC VOID DIA_Addon_Garett_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
	
func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
INSTANCE DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Anheuern_Condition;
	information	= DIA_Addon_Garett_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Anheuern_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Non chiedermi nemmeno di unirmi alle tue truppe di razziatori.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //Cosa pensi che faranno gli altri una volta che me ne sarò andato?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //Al mio ritorno non troverò neppure UNA cassa nella mia capanna!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Resterò qui a far la guardia alle scorte.
};

// ************************************************************
// 	 				   Hello 
// ************************************************************
INSTANCE DIA_Addon_Garett_Hello(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Hello_Condition;
	information	= DIA_Addon_Garett_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Hello_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //Cosa abbiamo qui? Una faccia nuova. E non di uno di quegli sporchi briganti, spero.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Sono Garett. Se ti serve qualcosa, chiedi a me.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //Posso procurarti di tutto. Vino, armi e tutto ciò di cui puoi aver bisogno.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Tranne l'alcol: per quello dovrai rivolgerti a Samuel.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	
};

// ************************************************************
// 	 				  		Samuel 
// ************************************************************
INSTANCE DIA_Addon_Garett_Samuel(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 2;
	condition	= DIA_Addon_Garett_Samuel_Condition;
	information	= DIA_Addon_Garett_Samuel_Info;
	permanent	= FALSE;
	description = "Chi è Samuel?";
};                       
FUNC INT DIA_Addon_Garett_Samuel_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Samuel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //Chi è Samuel?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //È il nostro distillatore clandestino. La sua caverna è sulla spiaggia, non lontano dal campo.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //Dritto a nord, non puoi sbagliarti.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Farai bene a tenere sempre una buona scorta di grog.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Alcuni dei ragazzi non vedono di buon occhio i novellini, se capisci cosa intendo.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //Ma una bella sorsata di grog può fare meraviglie!

	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
INSTANCE DIA_Addon_Garett_Warez(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Warez_Condition;
	information	= DIA_Addon_Garett_Warez_Info;

	description = "Dove ti procuri le provviste?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Dove ti procuri le provviste?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Skip porta sempre un sacco di roba da Khorinis quando viene a trovarci.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Fino a non molto tempo fa, ne vendeva una parte direttamente ai briganti.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Ma da quando siamo in guerra con i briganti, tutta la roba finisce a me.
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
INSTANCE DIA_Addon_Garett_Bandits(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Bandits_Condition;
	information	= DIA_Addon_Garett_Bandits_Info;

	description = "Cosa mi dici dei briganti?";
};                       
FUNC INT DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Garett_Bandits_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //Cosa sai dei briganti?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //Parlane con Skip, che è meglio.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Ha passato un sacco di guai con quella gentaglia.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg ha dato ordine di eliminare qualsiasi brigante si avvicini all'accampamento.
};



// ************************************************************
// ***														***
// 						Greg + Kompass
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg 
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Greg(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 4;
	condition	= DIA_Addon_Garett_Greg_Condition;
	information	= DIA_Addon_Garett_Greg_Info;
	permanent	= FALSE;
	description = "Com'è il tuo Capitano, Greg?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //Com'è il tuo Capitano, Greg?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //È un coriaceo vecchio bastardo, poco ma sicuro.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //E avido fin nel midollo.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Ha detto a Francis, il nostro tesoriere, di darci quel tanto che basta a evitare l'ammutinamento.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //E se uno di noi mette le mani su qualcosa di DAVVERO prezioso, inevitabilmente finisce per prendersela lui.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Una volta ho preso una bussola su una nave.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //Naturalmente quel bastardo di Greg se l'è fatta dare.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Bah! L'avrà sepolta da qualche parte insieme al resto dei suoi tesori.
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Tips(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 5;
	condition	= DIA_Addon_Garett_Tips_Condition;
	information	= DIA_Addon_Garett_Tips_Info;

	description = "Dove potrebbe aver sepolto la bussola Greg?";
};                       
FUNC INT DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Tips_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Dove potrebbe aver sepolto la bussola Greg?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Greg una volta mi ha detto ridendo che la Morte in persona veglia sulla mia bussola.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Qualcos'altro?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //C'è una spiaggia lungo la costa meridionale. Ci si arriva solo via mare.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Si dice che Greg ci sia andato spesso. Forse troverai qualcosa lì.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //Una volta ci sono andato anch'io, ma quella zona pullula di mostri.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Se vuoi provarci, non dimenticare di portare con te una piccozza.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg ha preso a Garret una bussola preziosa. Garret sospetta che l'abbia sepolta da qualche parte lungo la spiaggia a sud.");
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 6;
	condition	= DIA_Addon_Garett_GiveKompass_Condition;
	information	= DIA_Addon_Garett_GiveKompass_Info;
	permanent	= FALSE;
	description = "Ecco la tua bussola.";
};                       
FUNC INT DIA_Addon_Garett_GiveKompass_Condition()
{
	if (Npc_HasItems (other,ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Addon_Garett_GiveKompass_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Ecco la tua bussola.
	
	//Patch m.f. - weil Händler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //(felice) Sì, è proprio lei. Credevo non l'avrei più rivista.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //Grazie amico!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Questa volta NON me la farò soffiare da Greg...
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //Tieni, prendi questa cintura. È l'oggetto più prezioso che ho.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Sono stato io a vendertela, ricordi?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //E l'hai pagata un mucchio di soldi - (in fretta) non che non li valesse. Tieni, riprenditi il tuo oro.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Ho riportato a Garret la sua bussola, era molto contento.");
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP (XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis 
// ************************************************************
INSTANCE DIA_Addon_Garett_Francis(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 7;
	condition	= DIA_Addon_Garett_Francis_Condition;
	information	= DIA_Addon_Garett_Francis_Info;
	permanent	= FALSE;
	description = "Cosa puoi dirmi di Francis?";
};                       
FUNC INT DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Francis_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //Cosa puoi dirmi di Francis?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Finché Greg non torna, comanda lui.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //Ma Francis non ha proprio la stoffa del capo!
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Non riesce neanche a far alzare dal letto Morgan.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Henry e i suoi ragazzi sono gli unici che facciano qualcosa qui.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Gli altri se la spassano invece di lavorare.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //Spero solo che Greg torni presto.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //Darà una bella lezione a quei lavativi.
	};
};

// ************************************************************
// 								PERM
// ************************************************************
INSTANCE DIA_Addon_Garett_PERM   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 99;
	condition   = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent   = TRUE;
	description = "Qualche novità?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Novità?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Da quando non c'è Greg, qui non succede niente.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Ora che Greg è tornato, le cose hanno ripreso a girare per il verso giusto.
	};
};

// ************************************************************
// 								Trade
// ************************************************************
INSTANCE DIA_Addon_Garett_Trade   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 888;
	condition   = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent   = TRUE;
	description = DIALOG_TRADE;
	trade		= TRUE;
};
FUNC INT DIA_Addon_Garett_Trade_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; 	Garett_Random = Hlp_Random (3); 
	if Garett_Random == 0
	{
		B_Say (other,self,"$TRADE_1");
	}
	else if Garett_Random == 1
	{
		B_Say (other,self,"$TRADE_2");
	}
	else
	{
		B_Say (other,self,"$TRADE_3");
	};	
		
	B_GiveTradeInv (self);
	
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
};


