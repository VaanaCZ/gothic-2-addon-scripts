// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Ah, un cliente. Cosa posso fare per te?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "Sto cercando una stanza.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //Sto cercando una stanza.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //Allora sei venuto nel posto giusto.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Uno dei paladini mi ha detto che posso passare la notte qui gratuitamente.
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Quanto costa una stanza per una notte?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Assolutamente nulla.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //I paladini sono responsabili degli alloggi di tutti i viaggiatori.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //Quindi posso passare la notte qua senza pagare?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Sì, sì.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Sali le scale.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Abbiamo ancora uno o due letti liberi.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "Perché i paladini pagano per qualsiasi cosa?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Perché i paladini pagano per qualsiasi cosa?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Onestamente non lo so.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //La cosa certa è che vogliono togliere i poveracci dalle strade per impedire loro di commettere qualche sciocchezza.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //Per contro, vogliono stare dalla parte dei mercanti ambulanti.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Ora che i contadini sono in rivolta, dobbiamo fare affidamento sui mercanti per gli approvvigionamenti.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //Inoltre, credo che vogliano alzare il morale della città.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre ha addirittura organizzato una distribuzione di birra gratuita nella piazza delle impiccagioni.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "Chi occupa questa posizione, adesso?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //Chi occupa questa posizione, adesso?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //La maggior parte di loro sono commercianti ambulanti provenienti dal mercato.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Aha.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //Attento a quello che fai con la loro mercanzia. Non voglio guai, qui!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "Ho qualche domanda sulla città...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //Ho qualche domanda sulla città...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Dove posso fare acquisti nei dintorni?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Parlami della città.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Dove posso fare acquisti nei dintorni?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //Il mercato è esattamente davanti alla porta. Dovresti essere in grado di trovare lì tutto quello che ti serve.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Ci sono altri negozi e artigiani dall'altro lato della città. La maggior parte sono vicini al cancello cittadino.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //In più, c'è un pescivendolo nella zona portuale. Il suo negozio si affaccia direttamente sul porto. È facile da trovare.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Parlami della città.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis è una delle città più ricche del regno, anche se al momento può non sembrare così.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Ma da quando è cominciata la guerra degli orchi, il commercio ristagna. Il re ha richiesto l'impiego dell'intera flotta mercantile per uso militare,
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //il che significa che non si vedono navi nel porto. Perciò, gli approvvigionamenti sono decisamente scarsi in questo momento e molti cittadini sono preoccupati.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nessuno sa con certezza cosa ci riservi il futuro. Non c'è niente che possiamo fare, se non aspettare e vedere che cosa succede. Non c'è altro da fare.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht´s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "Cosa succede?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //Come va?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Non sembri molto interessato ai problemi degli altri, in fin dei conti.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Sì, certo.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"Dipende.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Non proprio.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Non proprio.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //Ecco quello che voglio dire. Ognuno pensa unicamente a se stesso. Quindi, che cosa vuoi?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //Dipende.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //Dipende da quanto ci si può guadagnare, vuoi dire.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Non ho bisogno di gente come te qui.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Sì, certo.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //Chi può dirlo? Il mondo è pieno di sorprese. Ho fatto un po' di pulizia di recente e ho venduto un mucchio di vecchie mappe a Brahim, il cartografo che si trova al porto.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Sfortunatamente, ho notato che mi manca un documento.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Credo sia scivolato in mezzo alle altre carte.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Puoi recuperarlo da parte mia?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Ad Hanna manca un documento. Sembra che si trovi al porto, da Brahim il cartografo."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Non sono un fattorino.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"Cosa ci guadagno io?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Vedrò cosa posso fare.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Non sono un fattorino.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Capisco, i problemi di una donna comune sono sacrileghi per te. Immagino che dovrò occuparmene da sola.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //Cosa ci guadagno io?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Ah, lo sapevo! Non sei tanto diverso dai barboni che abitano al porto.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Cosa vorresti chiedere a una povera donna?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Lascia stare.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Potresti essere più gentile con me.",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Oro.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Lascia stare.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Almeno ti è rimasto un briciolo di dignità. Se mi riporterai quel documento, ti darò 75 pezzi d'oro.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Potresti mostrarti più gentile con me.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //Ma è oltraggioso! Io... fuori di qui, villano zoticone!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Oro.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Soldi contanti è il massimo che posso offrirti. Diciamo che è un compito che valuto 50 pezzi d'oro.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Se riesci a riportarmi quel documento, ti darò 50 pezzi d'oro.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Vedrò cosa posso fare.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //Sei così caro. Ti auguro tanta fortuna!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Se mi riporti quel documento, ti darò una ricompensa.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftstück?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Intendevi questo documento?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //Intendevi questo documento?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Sì, esattamente questo. Grazie.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //Qual è la mia ricompensa?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Non così in fretta. Ecco i tuoi soldi.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Dove... Da dove vieni?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //Ho trovato qualcosa di interessante nella tua cantina.
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //Che cosa facevi nella mia cantina?!?
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //Lo sai bene!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(Con freddezza) Non so di cosa tu stia parlando...
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(Diffidente) Guardati! Da dove vieni? Mmmh?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //(Imbarazzato) Io...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(Ride) Io lo so!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(Con tono cospirativo) Non devi dirmi niente. So tutto.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Cerca solo di non rubare nulla qui, capito?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //Non possiamo permetterci di attirare attenzione alla locanda.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "Guarda quale libro ho qui!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Guarda quale libro ho qui!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //Il libro mastro di Lehmar. Come fai ad averlo?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //Beh...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //Se Lehmar non ce l'ha più, è una buona cosa. Ma lo vorrei per me...
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Ecco… prendi il libro.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Ecco... prendi il libro.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Grazie.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Prendi questo come compenso.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //Che cosa mi hai dato?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //È la chiave per il cancello della ricchezza.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Tutto ciò che c'è dentro al nascondiglio?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //Non vedo nessuno di loro da un pezzo.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Appena ne avrò l'occasione, andrò giù a vedere come stanno le cose.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Sì. Ma faresti meglio a non parlarne con nessuno...
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //Sapevi qualcosa del nascondiglio dei ladri?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(Sorride compiaciuta) Non so di cosa tu stia parlando...
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //C'erano i militari... qualcuno ha fatto la spia!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Non hanno potuto accusarmi di niente, ma Cassia e la sua gente sono morti!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Sono certa che sei stato TU...
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //L'ho comprato appositamente per te.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Mi è costato un sacco di soldi, ma ne vale la pena, brutto porco...
};	

	
