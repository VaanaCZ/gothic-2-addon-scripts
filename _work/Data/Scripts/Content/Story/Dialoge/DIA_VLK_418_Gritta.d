// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_EXIT_Condition;
	information	= DIA_Gritta_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gritta_PICKPOCKET (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 900;
	condition	= DIA_Gritta_PICKPOCKET_Condition;
	information	= DIA_Gritta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Gritta_PICKPOCKET_Condition()
{
	C_Beklauen (20, 20);
};
 
FUNC VOID DIA_Gritta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gritta_PICKPOCKET);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_BACK 		,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
	
func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Gritta_Hello(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 10;
	condition	= DIA_Gritta_Hello_Condition;
	information	= DIA_Gritta_Hello_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       
FUNC INT DIA_Gritta_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //Che cosa vuoi straniero? Se sei venuto a mendicare, mi dispiace deluderti. Sono una povera vedova.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Il mio nome è Brahim. Il mio nome è Gritta e da quando è morto mio marito, ho mandato avanti la casa di mio zio, Thorben.
};
//*************************************************************
//			Matteo will sein Geld
//*************************************************************
INSTANCE DIA_Gritta_WantsMoney(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 2;
	condition	= DIA_Gritta_WantsMoney_Condition;
	information	= DIA_Gritta_WantsMoney_Info;
	permanent	= FALSE;
	description = "Mi manda Matteo. Gli devi ancora qualche moneta d’oro.";
};                       
FUNC INT DIA_Gritta_WantsMoney_Condition()
{
	if (MIS_Matteo_Gold == LOG_RUNNING)
	{
		return TRUE;
	};	
};
//------------------------------------
var int Gritta_WantPay;
var int Gritta_Threatened;
//------------------------------------
FUNC VOID DIA_Gritta_WantsMoney_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //Mi manda Matteo. Gli devi ancora qualche moneta d’oro.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //Vuole i suoi soldi? E per farci cosa? I beni che ha consegnato erano difettati, brutta stoffa e brutte cuciture.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //E hai visto i colori? Questi non sono i colori che ho ordinato! Questa è una frode, ecco cos'è!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //Lascia che ti dica una cosa. Se mio marito fosse ancora vivo, non avrebbe avuto il coraggio di farlo. Oh, il mio povero marito...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Piantala. Dov’è la grana?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continua...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //...era proprio un brav'uomo. Bello e gran lavoratore, un gentiluomo di vecchio stampo. Avevamo tutto, ricchezza, felicità...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //...alcune volte eravamo stati invitati anche agli eventi dell'alta società. Le feste, tutti quei vestiti e acconciature bellissime...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //...cibo raffinato e conversazioni civili. Era tutto bellissimo a quei tempi. Nessuno si sarebbe permesso di umiliare il cuore di una povera vedova con...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Piantala. Dov’è la grana?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continua...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //...Pretese così ridicole... Cosa dovrei fare? La mia pensione basta a malapena ad arrivare a fine mese e i tempi si stanno facendo sempre più duri. Lo si vede ovunque...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //...La gente deve fare economia e risparmiare. Sono passate settimane da quando l'ultima nave è arrivata in città. Mio marito era il capitano di una nave mercantile anzi, ne era il proprietario...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //...dai suoi lunghi viaggi mi portava sempre dei regali, stoffe di rara bellezza dal continente, spezie preziose dalle contee meridionali...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Piantala. Dov’è la grana?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continua...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //...molta gente non ha nemmeno mai sentito parlare di queste cose. Ma un giorno sentii la voce che la Gritta, questo il nome della nave, era affondata. Mio marito l'aveva chiamata...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //...così in nome del nostro amore. Ho pianto e pregato che mio marito fosse sopravvissuto al disastro, ogni giorno ho sperato di avere sue notizie, ma la mia attesa è stata vana...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //...possa Innos avere pietà della sua anima. Che possa riposare in pace. Da allora, ho vissuto in condizioni modeste e ora quell'insensibile senz'anima di Matteo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //...è alla ricerca dei miei ultimi averi. Ti prego, abbi pietà di una povera donna. Se mio marito fosse ancora vivo, non avrebbe avuto il coraggio di fare una cosa del genere. Oh, il mio povero marito...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Piantala. Dov’è la grana?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continua...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //Piantala. Dov’è la grana?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //(spavalda) Ma non ho l'oro, sono solamente una povera vedova!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Tira fuori la grana, o sarà peggio per te!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Non rimane che vendere la tua roba...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pagherà il conto per te.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Allora venderemo alcuni dei tuoi vestiti. Sono sicuro che hai ancora qualcosa nel tuo armadio...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //Come ti permetti, villano zoticone! Va bene, prendi l'oro.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //(ghigno) Vedi, non è stato così difficile.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //(aspramente) E ora, per cortesia, via da casa mia.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Pagherò il conto per te.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //Lo faresti per me? Oh, sapevo che non eri un avido bastardo come Matteo!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //Certo, certo, non preoccuparti.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Torna una volta che ti sarai occupato della questione, voglio dimostrarti la mia gratitudine.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //(minaccioso) Tira fuori i soldi con le buone, altrimenti proverò con le cattive!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //(spavalda) Sei solo un volgare criminale. Avanti, tira fuori la tua arma e chiamerò le guardie!
	
	Gritta_Threatened = TRUE;
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance DIA_Gritta_WINE		(C_INFO)
{
	npc			 = 	VLK_418_Gritta;
	nr			 = 	2;
	condition	 = 	DIA_Gritta_WINE_Condition;
	information	 = 	DIA_Gritta_WINE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gritta_WINE_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Gritta_WantPay == TRUE)
	&& (MIS_Matteo_Gold == LOG_SUCCESS)
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		return TRUE;
	};
};
func void DIA_Gritta_WINE_Info ()
{
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //È stato un gesto molto nobile da parte tua pagare al posto mio. Voglio dimostrarti la mia gratitudine.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Ecco una bottiglia di vino di mio marito. Possa Innos far riposare la sua anima, farlo tornare dalle isole meridionali.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //In più, spargerò la voce. Meno male che c'è qualcuno in città con un po' di virtù...
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //Certo, certo, non preoccuparti.

	B_GivePlayerXP 		(XP_PayForGritta);
	B_GiveInvItems 		(self, other, Itfo_Wine, 1);
	
	AI_StopProcessInfos (self); 
};
// *************************************************************
//							PERM (1u2)
// *************************************************************
instance DIA_Gritta_PERM (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr		 	= 3;
	condition	= DIA_Gritta_PERM_Condition;
	information	= DIA_Gritta_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Gritta_PERM_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other, DIA_Gritta_WantsMoney))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Gritta_PERM_Info ()
{
	if (Npc_KnowsInfo (other, DIA_Gritta_WINE))
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Finché ci saranno uomini come te in città, ho ancora la speranza che tutto si risolverà per il meglio.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Torna quando avrai sistemato la faccenda con Matteo.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //Perché stai lì impalato come un idiota? Non avresti il coraggio di attaccarmi in ogni caso!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //Cos'altro vuoi? Hai preso il mio oro, ora vattene!
	};
	
	AI_StopProcessInfos (self); 
};


//###########################################
//##
//##	Kapitel 3
//##
//###########################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_Kap3_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_Kap3_EXIT_Condition;
	information	= DIA_Gritta_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//		Perm3U4U5
// ************************************************************

//------------------------------------
var int GrittaXP_Once;
//-----------------------------

INSTANCE DIA_Gritta_Perm3U4U5(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 31;
	condition	= DIA_Gritta_Perm3U4U5_Condition;
	information	= DIA_Gritta_Perm3U4U5_Info;
	permanent	= TRUE;
	description = "Come va?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //Come va?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //Sta andando tutto in malora. Ovunque guardi, ci sono crimini e violenze. Pensa che hanno addirittura assassinato uno dei paladini.
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"È la guerra: queste cose accadono.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Andrà tutto bene.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Che cosa hai sentito?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Oh, sono così emozionata, Lord Hagen ha liberato il mercenario.
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //E che cosa ti interessa?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //Pensaci. Credi che i mercenari sarebbero rimasti mentre uno dei loro compari veniva impiccato?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Avrebbero provato a liberarlo e ci sarebbero stati spargimenti di sangue. Posso solo ringraziare Innos.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //I paladini si stanno preparando e sembra che se ne andranno presto.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //Come sempre, ma non ho voglia di lamentarmi.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //È la guerra: queste cose accadono.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Sì, c'è una guerra soprattutto. Tutti stanno soffrendo e si chiedono cosa faranno.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //Qualche volta mi chiedo che cosa abbiamo fatto per meritarci una simile punizioni da Innos.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //Andrà tutto bene.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //Stai provando a tirarmi su, sei gentile.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //Che cosa hai sentito?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Solamente quello che si dicono l'un l'altro per strada.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //Ho sentito dire che hanno già preso l'assassino, ma non posso assicurarti che sia vero.
};












