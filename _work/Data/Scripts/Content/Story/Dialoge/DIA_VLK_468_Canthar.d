
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Canthar_PICKPOCKET (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 900;
	condition	= DIA_Canthar_PICKPOCKET_Condition;
	information	= DIA_Canthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Canthar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 25);
};
 
FUNC VOID DIA_Canthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Canthar_PICKPOCKET);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_BACK 		,DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};
	
func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Canthar_EXIT(C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 999;
	condition	= DIA_Canthar_EXIT_Condition;
	information	= DIA_Canthar_EXIT_Info;
	permanent	= TRUE;
	description = "Devo andare!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //Devo andare!
	AI_Output (self, other,"DIA_Canthar_EXIT_09_01"); //Fai come ti pare.
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  			Personal CRIMES
// ************************************************************

INSTANCE DIA_Canthar_PersonalCRIMES (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_PersonalCRIMES_Condition;
	information	= DIA_Canthar_PersonalCRIMES_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

func INT DIA_Canthar_PersonalCRIMES_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Canthar_PersonalCRIMES_Info()
{	
	// ------ Spieler hat mich besiegt ------
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //È stata una cosa molto stupida, da parte tua, attaccarmi.
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //(con scherno) Pensavi di sconfiggermi così facilmente?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //O ti scusi, o ti farò pentire amaramente del tuo comportamento.
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //Ed esattamente cosa avresti in mente?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Non possiedo tanto!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Ecco il tuo oro... Finiamola qui!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Ecco il tuo oro... chiudiamo la questione!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //Molto ragionevole da parte tua.
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //Non possiedo tanto!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //Allora perché mi stai facendo perdere tempo?
	
	AI_StopProcessInfos(self);
};


// ************************************************************
// 			  				 Hallo 
// ************************************************************

INSTANCE DIA_Canthar_Hallo (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_Hallo_Condition;
	information	= DIA_Canthar_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Canthar_Hallo_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_Hallo_Info()
{	
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	// ------ OHNE Rüstung ------
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //Chi abbiamo qui?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Se in cammino per la città, sbaglio?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Forse.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Mmmh! (sbuffa) Sembri un fuggiasco! Tutti i fuggiaschi si dirigono in città.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Potresti essere un ex detenuto della colonia mineraria.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //(rudemente) Non mi interessa da dove vieni. Ma credo di avere un'offerta interessante da farti...
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//Come va il lavoro, bracciante?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "Ho l’aria di un contadino?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "Non posso lamentarmi."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen Rüstungen (höchst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //Cosa posso fare per te?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//Non posso lamentarmi.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//Posso fare qualcosa per te?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //Ho l’aria di un contadino?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //Proprio come un contadino, ma non parli come uno di loro!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //(riflettendo) Se non mi sbaglio, ho un'offerta molto interessante per te...
	
	Canthar_GotMe = TRUE;
	
	Info_ClearChoices	(DIA_Canthar_Hallo);
};


// ************************************************************
// 		  				 	WhatOffer				//E3
// ************************************************************

INSTANCE DIA_Canthar_WhatOffer (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_WhatOffer_Condition;
	information	= DIA_Canthar_WhatOffer_Info;
	permanent	= FALSE;
	description	= "Cosa puoi offrirmi?";
};                       

FUNC INT DIA_Canthar_WhatOffer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_WhatOffer_Info()
{	
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //Cos’hai da offrirmi?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //Da come sei conciato, le guardie non ti faranno mai entrare in città.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //(ironico) Se sei così 'convincente' con me come lo sarai con le guardie all'ingresso, non ti faranno mai entrare.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //Io posso aiutarti a entrare in città.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //Ho qui un piccolo pezzo di carta, con il sigillo reale e la firma del governatore. Un lasciapassare.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //Con questo pezzo di carta in tasca, potrai andare in giro conciato come un vagabondo e le guardie non ti diranno una parola.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //Interessato?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "No! Tieniti la tua carta!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Cosa vuoi in cambio del tuo lasciapassare?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Come entrerai in città?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Deve esserci un tranello..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //Sono un commerciante ambulante, vendo un po' di tutto.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Canthar commercia in tutti i tipi di armi."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //Deve esserci un tranello...
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //(esagerando) No. Nessuna trappola. Semplicemente mi devi un favore.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //Come entrerai in città?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Le guardie mi conoscono. Dirò loro semplicemente che ho perso il mio lasciapassare.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //Cosa vuoi in cambio del tuo lasciapassare?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //(compiaciuto) SAPEVO che eri l'uomo giusto!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Ascolta. Adesso ti darò il lasciapassare.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //Così?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Sì, così. MA se ti incontrerò in città, mi dovrai un favore.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //Affare fatto?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "Certo. Dammi quella carta.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //Certo. Dammi quella carta.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Ecco. Fai attenzione, è di valore.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //Un'ultima cosa: non pensare di venir meno alla parola data!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //Sono un mercante con delle conoscenze influenti qui in città e ti assicuro che gli affari andranno male.
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Ho avuto un lasciapassare da Canthar il mercante che mi permetterà di entrare in città. In cambio, gli devo un favore la prossima volta che lo vedrò.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //No! Tieniti la tua carta!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Mmmh. Sembra che io abbia sbagliato a giudicarti, eh?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //Bene. Vuoi qualcos'altro? Ti può interessare la mia roba?
	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
};


// ************************************************************
// 		  				 	TRADE				
// ************************************************************

instance DIA_Canthar_TRADE		(C_INFO)
{
	npc		 	= Vlk_468_Canthar;
	nr 			= 888;
	condition	= DIA_Canthar_TRADE_Condition;
	information	= DIA_Canthar_TRADE_Info;
	permanent	= TRUE;
	description	= "Mostrami la mercanzia.";
	trade		= TRUE;
};

func int DIA_Canthar_TRADE_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //Mostrami la mercanzia.
	
	B_GiveTradeInv (self);
	
	AI_Output (self, other, "DIA_Canthar_TRADE_09_01"); //Fai la tua scelta.
	
	
};



// ###########################################
// ###########################################

// 				In der Stadt 

// ###########################################
// ###########################################
/*
		-->
		Aber ein Händler namnes Canthar hat das erzählt. 
	*/

///////////////////////////////////////////////////////////////////////
//	Info PayPriceInCity
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_PAYPRICEINCITY		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_PAYPRICEINCITY_Condition;
	information	 = 	DIA_Canthar_PAYPRICEINCITY_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};

func int DIA_Canthar_PAYPRICEINCITY_Condition ()
{
	if (Canthar_InStadt == TRUE)
	&& (Npc_IsDead(Sarah) == FALSE) 
	&& (Canthar_GotMe == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_PAYPRICEINCITY_Info ()
{
	if (Canthar_Gefallen == TRUE)
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //Mi devi ancora un favore. È tempo di pagare il tuo debito.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //Ehi tu, ho da farti una proposta.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //Che vuoi?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Rivoglio indietro la mia vecchia bancarella al mercato. Sarah me l'ha portata via.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //Ma ha avuto quel posto per troppo tempo, rivoglio indietro la mia bancarella.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //E io cosa c'entro?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //Ti darò una lettera da infilarle in tasca.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Poi andrai da Andre e gli dirai che Sarah sta vendendo armi a Onar.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //Lei finirà in prigione, tu incasserai la taglia e io potrò avere indietro la mia bancarella.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //Hai due giorni per riuscirci.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //Cosa ci guadagno io?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Quando avrò la bancarella, ti darò un'arma, una dannatamente buona...
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "No. Non voglio avere nulla a che fare con tutto questo.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Va bene. Lo farò.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Cosa succede, se mi rifiuto di farlo?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //Cosa succede, se mi rifiuto di farlo?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //Sarebbe molto stupido da parte tua perché, vedi, io so che sei un detenuto evaso.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Se questo si sapesse in giro, la tua situazione qui in città potrebbe considerevolmente peggiorare...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //No. Non voglio avere nulla a che fare con tutto questo.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //Questa è stata la decisione sbagliata, ragazzo. Ne parleremo ancora.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //Va bene, sembra che non abbia scelta.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Sei un tipo in gamba. Ecco la lettera.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //E come dovrei riuscire a infilarle la lettera in tasca?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Lascia che ti mostri le sue cose e, mentre lo fa, nascondile la lettera addosso.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //E tieni presente che sono un uomo potente in città, perciò non tentare di fregarmi.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"Canthar vuole che gli faccia il favore che gli devo.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"Canthar ha promesso di darmi un'arma in cambio per fargli un favore.");
	};
	B_LogEntry (TOPIC_Canthar,"Devo ingannare la mercante Sarah, in modo che sembri che volesse vendere armi a Onar. Poi andrò da Lord Andre e gli dirò tutto.");
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};
///////////////////////////////////////////////////////////////////////
//	Info SarahErledigt
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_SARAHERLEDIGT		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_SARAHERLEDIGT_Condition;
	information	 = 	DIA_Canthar_SARAHERLEDIGT_Info;
	permanent	 =	TRUE;
	description	 = 	"Riguardo a Sarah...";
};
func int DIA_Canthar_SARAHERLEDIGT_Condition ()
{
	if 	(MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Canthar_SARAHERLEDIGT_Info ()
{
	if ((Npc_IsDead(Sarah)) == FALSE)
	{
		if (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay()+ 2))
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //Non hai un lavoro da fare?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Prima lascia la lettera addosso a Sarah, poi vai da Andre per accusarla.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //Fallo e non provare a prendermi in giro, te ne pentiresti.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //Te la stai prendendo comoda. Muoviti!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sarah è morta.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //Davvero? Meraviglioso. Allora hai completato solo metà del nostro piccolo affaruccio.
			
			MIS_Canthars_KomproBrief = LOG_SUCCESS;
			B_GivePlayerXP (XP_Ambient);
			Npc_ExchangeRoutine	(self,"MARKTSTAND"); 
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Success		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Success_Condition;
	information	 = 	DIA_Canthar_Success_Info;
	permanent	 =  FALSE;
	description	 = "Riguardo a Sarah...";
};
func int DIA_Canthar_Success_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)
	&& ((Npc_IsDead(Sarah)) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Success_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //Ben fatto. Sarah ha fatto la fine che meritava.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //Ho preso possesso dei suoi beni, perciò se hai bisogno di un'arma vieni da me.
	
	if (Kapitel == 1)
	{
		CreateInvItems (self,ItMw_ShortSword3 , 1); 
		CreateInvItems (self,ItMw_ShortSword4 , 1);
		CreateInvItems (self,ItMw_ShortSword5 , 1);
		CreateInvItems (self,ItMw_Kriegshammer1, 1); 
		
		CreateInvItems (self, ItMw_1h_Vlk_Sword, 1); 
		CreateInvItems (self, ItMw_1h_Nov_Mace, 1); 
	};
	if (Kapitel == 2)
	{
		CreateInvItems (self,ItMw_Stabkeule , 1);
		CreateInvItems (self,ItMw_Steinbrecher, 1); 
		CreateInvItems (self,ItMw_Schwert2 , 1); 
		CreateInvItems (self,ItMw_Bartaxt , 1); 
	};
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //Dovevi darmi un'arma se non sbaglio.
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //Esatto. Ecco, quest'arma è un capolavoro dell'arte di un fabbro ferraio.
				
		B_GiveInvItems (self, other, ItMW_Schiffsaxt,1);
	};
	B_GivePlayerXP (XP_Canthars_KomproBrief);
};

//---------------------------------------------------------------------

				//Canthat hat seinen Marktstand OHNE Spieler Hilfe 

//---------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info Canthar hat den Stand 
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Again		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Again_Condition;
	information	 = 	DIA_Canthar_Again_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Canthar_Again_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Again_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Again_09_00"); //Oh, eccoti di nuovo.
	
	if (MIS_Canthars_KomproBrief  == LOG_FAILED)
	{
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //Perché non sei in cella?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //Sono stato rilasciato. Come ti ho già detto, sono un uomo molto influente in città.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //Nel frattempo, mi sono occupato di Sarah personalmente.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //Non ti avevo avvertito? Sarebbe stato meglio se avessi fatto ciò che ti ho detto.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //Ora circola voce tra i mercanti che tu sia un detenuto.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //Una brutta storia. Non riuscirai nemmeno più a racimolare un pezzo di pane qui al mercato.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //Potrei, ovviamente, sistemare le cose per conto tuo..
	B_Say_Gold 	(self, other, Canthar_Gold);
	
	AI_StopProcessInfos (self);
	
};

///////////////////////////////////////////////////////////////////////
//	Info Canthar bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Pay		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_Pay_Condition;
	information	 = 	DIA_Canthar_Pay_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};

func int DIA_Canthar_Pay_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Canthar_Again)
	&& (Canthar_Sperre == TRUE)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Pay_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //Sei venuto a pagare?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"Va bene. Pagherò...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"Non ho abbastanza soldi con me...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"Qual era il prezzo?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //D'accordo, pagherò, non mi lasci scelta.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //(ghigna) Bene. La tua reputazione tra i mercanti si risolleverà.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //Non ho abbastanza soldi con me...
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Allora trovali.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //Qual era il prezzo?
	B_Say_Gold 	(self, other, Canthar_Gold);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Canthar im Knast
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_CANTHARANGEPISST		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_CANTHARANGEPISST_Condition;
	information	 = 	DIA_Canthar_CANTHARANGEPISST_Info;
	important	 = 	TRUE;
	permanent	 =  TRUE;
};
func int DIA_Canthar_CANTHARANGEPISST_Condition ()
{
	if (Canthar_Ausgeliefert == TRUE)  //SC hat Canthar bei Andre verpfiffen!
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	&& Npc_IsInState  (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_CANTHARANGEPISST_Info ()
{
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Ti ho avvisato, ma non mi hai dato ascolto. Ne discuteremo dopo.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //Ora sparisci, voglio il resto.
	
	AI_StopProcessInfos (self);	
};
///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_MinenAnteil		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 = 	3;
	condition	 = 	DIA_Canthar_MinenAnteil_Condition;
	information	 = 	DIA_Canthar_MinenAnteil_Info;

	description	 = 	"Stai vendendo azioni della miniera illegali!";
};

func int DIA_Canthar_MinenAnteil_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
		{
				return TRUE;
		};
};

func void DIA_Canthar_MinenAnteil_Info ()
{
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //Stai vendendo azioni della miniera illegali!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //Sì, e allora? Se non lo facessi io, lo farebbe qualcun altro.
	B_GivePlayerXP (XP_Ambient);
};











