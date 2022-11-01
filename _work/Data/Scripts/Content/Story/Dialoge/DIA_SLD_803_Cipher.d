// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Cipher_EXIT(C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 999;
	condition	= DIA_Cipher_EXIT_Condition;
	information	= DIA_Cipher_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cipher_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Cipher_Hello (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 1;
	condition	= DIA_Cipher_Hello_Condition;
	information	= DIA_Cipher_Hello_Info;
	permanent	= FALSE;
	description = "Cosa succede?";
};                       

FUNC INT DIA_Cipher_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Cipher_Hello_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //Come vanno le cose?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //Ehi, non ti ho già visto da qualche parte?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //È possibile...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //Mi occupavo dell'erba di palude ai tempi della colonia, ricordi?
};

// ************************************************************
// 			  					TradeWhat 
// ************************************************************

instance DIA_Cipher_TradeWhat (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TradeWhat_Condition;
	information	= DIA_Cipher_TradeWhat_Info;
	permanent	= FALSE;
	description = "E di cosa ti stai occupando adesso?";
};                       

FUNC INT DIA_Cipher_TradeWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TradeWhat_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TradeWhat_15_00"); //E di cosa ti stai occupando adesso?
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_01"); //Ah, non chiedermelo.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //Ho portato con me un intero pacco di erba di palude dalla colonia mineraria.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //A molti dei mercenari piace fumare qualcosa di tanto in tanto. Ho messo da parte una piccola fortuna.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //Ma qualche bastardo ha rubato tutta l'erba dal mio forziere!
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "Il mercenario Cipher ha perso un pacco di erba di palude.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Sono sicuro che è stato Bodo. Dorme nella mia stessa stanza e ha sempre quel ghigno da idiota stampato in faccia quando mi guarda...
		B_LogEntry (Topic_CipherPaket, "Sospetta che Bodo lo abbia rubato.");
	};
	
	MIS_Cipher_Paket = LOG_RUNNING;
};

// ************************************************************
// 			  					DoWithThief 
// ************************************************************

instance DIA_Cipher_DoWithThief (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DoWithThief_Condition;
	information	= DIA_Cipher_DoWithThief_Info;
	permanent	= FALSE;
	description = "Quindi, cosa pensi di farne del ladro?";
};                       

FUNC INT DIA_Cipher_DoWithThief_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DoWithThief_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Quindi, cosa pensi di farne del ladro?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Uno di questi giorni lo scoprirò a fumarsi la mia erba.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //E allora troverò un posticino tranquillo e gli darò una lezione che non dimenticherà facilmente.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Se lo stendo nel mezzo del cortile gli altri contadini se ne accorgeranno e dovrò pagare un patrimonio.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //Perché?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //Semplice. Non possiamo toccare i contadini, altrimenti Lee ci farà pagare una penale salata. Così ha deciso Onar.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //E più testimoni ci sono, più ci saranno proteste. Questo rende le cose più costose.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Quindi mi occuperò della cosa senza dare troppo nell'occhio...
};

// ************************************************************
// 			  					WannaJoin 
// ************************************************************

instance DIA_Cipher_WannaJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_WannaJoin_Condition;
	information	= DIA_Cipher_WannaJoin_Info;
	permanent	= FALSE;
	description = "Voglio unirmi agli uomini di Lee!";
};                       

FUNC INT DIA_Cipher_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //Voglio unirmi agli uomini di Lee!
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //Gli uomini di Lee?!? Se Lee continua così, presto non ci sarà più nessuno dei suoi uomini!
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //Perché?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee è sempre stato un tipo tranquillo. Lo era anche ai tempi della colonia.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Ma ultimamente sta esagerando. Vuole star seduto ad aspettare che i paladini muoiano di fame.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Silvio pensa che dovremmo ripulire la zona delle fattorie minori e i dintorni della città.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //Penso che sarebbe un'ottima novità.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //Attualmente la maggior parte di noi è qui a girarsi i pollici, vuoi unirti al gruppo lo stesso?
};

// ************************************************************
// 			  					YesJoin 
// ************************************************************

instance DIA_Cipher_YesJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_YesJoin_Condition;
	information	= DIA_Cipher_YesJoin_Info;
	permanent	= FALSE;
	description = "Voglio diventare uno di voi, costi quello che costi!";
};                       

FUNC INT DIA_Cipher_YesJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_YesJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //Voglio diventare uno di voi, costi quello che costi!
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //Sai già che noi facciamo una votazione per ogni nuova recluta?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //Cosa stai cercando di dirmi?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //Beh, non fumo qualcosa da molto tempo. Portami qualche sigaro di erba di palude e avrai il mio voto.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Sicuramente potrai fare qualcosa a riguardo.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher mi concederà il suo voto se gli porterò alcuni sigari d'erba di palude.");
};

// ************************************************************
// 			  					Joints 
// ************************************************************

instance DIA_Cipher_Joints (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_Joints_Condition;
	information	= DIA_Cipher_Joints_Info;
	permanent	= TRUE;
	description = "Riguardo all’erba di palude...";
};                       

FUNC INT DIA_Cipher_Joints_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_Joints_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //Riguardo all’erba di palude...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //Mi hai riportato il mio pacco! Ora sarà tutto a posto.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Voterò sicuramente per te...
			
			B_LogEntry (TOPIC_SLDRespekt,"Cipher voterà per me quando mi unirò ai mercenari.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist glücklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Vedrò cosa posso fare...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Ecco alcuni ciuffi per te...", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Vedrò cosa posso fare.
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //Ecco alcuni ciuffi per te...
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //Ah! Sei il mio uomo!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //Hai il mio voto.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Cipher voterà per me quando mi unirò ai mercenari.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //Tutto qui? Posso fumare quella roba in un solo tiro!
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //Devono essere almeno 10 sigari.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //Ad ogni modo, hai il mio voto per la tua candidatura.
		};
	};

	Info_ClearChoices (DIA_Cipher_Joints);
};


// ************************************************************
// 			  					TRADE
// ************************************************************

instance DIA_Cipher_TRADE (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TRADE_Condition;
	information	= DIA_Cipher_TRADE_Info;
	permanent	= TRUE;
	description = "Mostrami la mercanzia.";
	trade		= TRUE;
};                       

FUNC INT DIA_Cipher_TRADE_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TRADE_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Mostrami la mercanzia.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Certo. Serviti pure.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //Non ho erba di palude al momento. Vuoi qualcos'altro?
	};
};

// ************************************************************
// 			  					Dar Dieb
// ************************************************************

instance DIA_Cipher_DarDieb (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarDieb_Condition;
	information	= DIA_Cipher_DarDieb_Info;
	permanent	= FALSE;
	description = "So chi ha preso la tua erba.";
};                       

FUNC INT DIA_Cipher_DarDieb_Condition()
{
	if ( (Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE) )
	&& (!Npc_IsDead (Dar))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarDieb_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //So chi ha preso la tua erba.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //Chi? È stato Bodo?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //No, è stato uno dei mercenari, Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //Quel bastardo, dov'è ora?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //Trovarlo non ti aiuterà, non ha più con sé il pacco. Lo ha venduto a Khorinis.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //DOV'È?!?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Dietro le cucine, nell'angolo...
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //LO PESTERÒ A SANGUE!
	
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Dar, AR_NONE, 0);
};

// ************************************************************
// 			  					Dar LOST
// ************************************************************

instance DIA_Cipher_DarLOST (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarLOST_Condition;
	information	= DIA_Cipher_DarLOST_Info;
	permanent	= FALSE;
	description = "Hai dato a Dar ciò che si meritava... ti senti meglio?";
};                       

FUNC INT DIA_Cipher_DarLOST_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarLOST_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Hai dato a Dar ciò che si meritava... ti senti meglio?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //(sospira) Sì, è stato bello.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //Non per LUI, immagino...
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //Quel piccolo mentecatto non deve infilare il naso nel mio forziere!
	
	B_GivePlayerXP ((XP_Ambient)*2);
};

// ************************************************************
// 			  				Kraut PAKET
// ************************************************************

instance DIA_Cipher_KrautPaket (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_KrautPaket_Condition;
	information	= DIA_Cipher_KrautPaket_Info;
	permanent	= FALSE;
	description = "Per caso, questa confezione d’erba di palude è tua?";
};                       

FUNC INT DIA_Cipher_KrautPaket_Condition()
{
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_KrautPaket_Info()
{	
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //Per caso, questo pacco d’erba di palude è tuo?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //Certo che sì! Dove l'hai preso?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //È una lunga storia...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //Non importa, davvero, sei un bravo ragazzo.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Ecco, prendi questo come ricompensa. Divertiti!
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Fammene arrotolare subito un paio...
	CreateInvItems (self, itmi_joint, 40);
	Npc_RemoveInvItems (self, ItMi_HerbPaket, 1);
	
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_CipherPaket);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_CipherSLD_PICKPOCKET (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 900;
	condition	= DIA_CipherSLD_PICKPOCKET_Condition;
	information	= DIA_CipherSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_CipherSLD_PICKPOCKET_Condition()
{
	C_Beklauen (65, 65);
};
 
FUNC VOID DIA_CipherSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_BACK 		,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};
	
func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};


		



		
	
//#####################################################################
//##
//##
//##						Bis - KAPITEL 3 - (danach in OW!)
//##
//##
//#####################################################################
	

	



	
/**/
