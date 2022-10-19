// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lee_EXIT   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 999;
	condition   = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lee_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// **************
// B_Lee_Teleport
// **************

var int Lee_Teleport; //damit es nur EINMAL kommt
// ------------------

func void B_Lee_Teleport()
{
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Ah, meno male che sei arrivato.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Cosa succede?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Ho trovato questa nella vecchia cappella.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //È una runa magica. Credo che ti teletrasporterà direttamente qui alla fattoria.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Ho pensato che saresti stato in grado di usarla.
	
	Lee_Teleport = TRUE;
};


// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Lee_PMSchulden (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Lee_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lee_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_PMSchulden_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //Sei qui per portare i soldi a Onar?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Ti avevo detto di non fare niente di stupido qui.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar ha sentito dire che la lista dei tuoi misfatti si è allungata.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Di conseguenza, adesso vuole più oro.
			AI_Output (other, self, "DIA_Lee_PMAdd_15_00"); //Quanto vuoi?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Lee_LastPetzCounter);
		
			if (diff > 0)
			{
				Lee_Schulden = Lee_Schulden + (diff * 50);
			};
		
			if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Lee_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Pensavo fossi più sveglio.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //Allora ho delle buone notizie per te.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //Improvvisamente non c'è più nessuno che ti abbia visto commettere un omicidio.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Nessuno testimonierà che ti ha visto rubare.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Non c'è più nessuno che ti abbia VISTO picchiare uno dei contadini.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //A quanto pare tutte le accuse contro di te si sono dissolte nel nulla.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //Strano modo di aggirare i problemi.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //In ogni caso, non devi più pagare.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Ma fai attenzione in futuro.
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Una cosa è chiara: devi, nondimeno, pagare tutta la tua penale.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //Allora, cosa ne dici?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Non ho abbastanza oro!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Qual era il prezzo?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"Voglio pagare la penale!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //Qual era il prezzo?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Non ho abbastanza oro!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Qual era il prezzo?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"Voglio pagare la penale!",DIA_Lee_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Lee_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Lee_PETZMASTER   (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Lee_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PETZMASTER_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	Lee_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Lee noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //Chi diavolo ha fatto entrare TE qui? (sorpreso) Sei TU il novizio che sta causando tutti quei problemi?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //Avevo sentito da Gorn che eri ancora vivo, ma che venissi qui... ad ogni modo...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //È bello che tu ti sia consegnato spontaneamente prima di peggiorare ulteriormente la tua situazione.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //I mercenari sono gente rude e i contadini qui non sono esattamente dei deboli, ma non puoi semplicemente andare in giro a uccidere le persone.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //Per non parlare delle altre malefatte che hai commesso.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Posso aiutarti a uscire da questo casino con una fedina pulita.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //Ti verrà a costare però. Onar è un uomo avido e solamente se LUI chiuderà un occhio il fatto verrà dimenticato.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Hai fatto bene a venire da me. Ho sentito dire che hai rubato qualcosa.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //E steso alcuni contadini.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //E ucciso delle pecore.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //Non puoi fare cose del genere qui. In questi casi, Onar vuole a tutti i costi che io la faccia pagare al colpevole.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //Questo significa: tu paghi, e lui intasca i soldi, ma almeno in questo modo il fatto viene dimenticato.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Se ti impegni in duello con uno dei mercenari è un conto...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //Ma se picchi un contadino, correrà subito da Onar. Ed egli si aspetta che io faccia qualcosa.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Per non dire del fatto che egli non sia esattamente entusiasta che qualcuno uccida le sue pecore.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Dovrai pagare una penale. Onar di regola intasca di persona il denaro, ma è l'unico modo di sistemare la faccenda.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar si aspetta che io protegga la sua fattoria. E questo include anche le sue pecore.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Dovrai pagargli un risarcimento!
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Quanto vuoi?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"Non ho abbastanza oro!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Voglio pagare la penale!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Voglio pagare la penale!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //Bene! Mi assicurerò che Onar riceva il denaro. Puoi considerare la faccenda dimenticata.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //Non ho abbastanza oro!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //Allora vallo a prendere il più in fretta possibile.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Ma non credere di poterlo rubare qui nella fattoria. Se verrai preso, le cose peggioreranno per te.
	
	Lee_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				 Hallo 
// ************************************************************
INSTANCE DIA_Lee_Hallo   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Hallo_Info()
{
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //Chi diavolo ha fatto entrare TE qui? (sorpreso) Cosa stai facendo qui? Pensavo fossi morto!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //Cosa te lo fa pensare?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn mi ha detto che sei stato tu a distruggere la Barriera.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Sì, esatto, sono stato io.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //Non avrei mai pensato che un uomo potesse sopravvivere a qualcosa del genere. Cosa ti porta qui? Non puoi essere qui senza una ragione...
};

// ************************************************************
// 			  				Paladine 
// ************************************************************
INSTANCE DIA_Lee_Paladine   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent   = FALSE;
	description = "Devo assolutamente parlare con i paladini in città...";
};
FUNC INT DIA_Lee_Paladine_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Paladine_Info()
{
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Devo assolutamente parlare con i paladini in città. Puoi aiutarmi a raggiungerli?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //(sospettoso) A cosa ti servono i paladini?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //È una lunga storia...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //Ho abbastanza tempo.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //(sospira) Xardas mi ha mandato in missione. Vuole che io ottenga un potente amuleto, l'Occhio di Innos.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Dunque sei ancora alleato con il negromante. Capisco. E i paladini hanno questo amuleto?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //Per quanto ne so sì.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Posso aiutarti a raggiungere i paladini. Ma prima dovrai diventare uno di noi.
};

// ************************************************************
// 			  				PaladineHOW
// ************************************************************
INSTANCE DIA_Lee_PaladineHOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 3;
	condition   = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent   = FALSE;
	description = "Puoi aiutarmi a trovare i paladini?";
};
FUNC INT DIA_Lee_PaladineHOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PaladineHOW_Info()
{
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //Puoi aiutarmi a trovare i paladini?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Fidati, ho un piano. Credo tu sia l'uomo giusto per questo...
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Ti porterò dai paladini e tu mi farai un favore. Ma prima, unisciti a noi!
};

// ************************************************************
// 			  				Lees Plan
// ************************************************************
INSTANCE DIA_Lee_LeesPlan (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent   = FALSE;
	description = "Cosa stai facendo esattamente, qui?";
};
FUNC INT DIA_Lee_LeesPlan_Condition()
{
	if (Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lee_LeesPlan_Info()
{
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //Cosa stai facendo esattamente, qui?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Molto semplice: farò in modo che tutti noi potremo lasciare quest'isola.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar ci ha assunti per difendere la sua fattoria ed è esattamente quello che faremo.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Ma la nostra ricompensa è ben più della nostra paga. Aiutando le fattorie tagliamo anche i rifornimenti della città.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //E meno i paladini avranno da mangiare, prima ascolteranno quando farò finalmente loro un'offerta di pace.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Peccato che ti sei unito proprio a loro.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //Come sarà la tua offerta?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //Principalmente, riguarderà la nostra amnistia e un passaggio per la terraferma. Ne saprai di più quando sarà il momento.
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
INSTANCE DIA_Lee_WannaJoin (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent   = FALSE;
	description = "Voglio unirmi a voi!";
};
FUNC INT DIA_Lee_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //Voglio unirmi a voi!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //Speravo l'avresti detto! Ho bisogno di ogni uomo valido qui.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //Gli ultimi mercenari che ho accettato non hanno fatto altro che creare problemi!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //In genere, puoi iniziare subito. Beh, prima ci sono un paio di cose da sistemare, ma non dovrebbero esserci problemi...
};

// ************************************************************
// 			  				ClearWhat
// ************************************************************
INSTANCE DIA_Lee_ClearWhat (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent   = FALSE;
	description = "Cosa devo sapere prima di potermi unire a voi?";
};
FUNC INT DIA_Lee_ClearWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ClearWhat_Info()
{
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //Cosa devo sapere prima di potermi unire a voi?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Onar, il proprietario terriero, è colui che ci ha assunto. Puoi stare nella fattoria solo con la sua approvazione.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //E poi ci sono i ragazzi. Posso accettarti solo se la maggior parte dei mercenari sarà d'accordo che tu ti unisca a noi.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Ma non andare da Onar prima che tutto sia sistemato. È un tipo molto impaziente...
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Per essere accettato come mercenario, devo ottenere l'approvazione di Onar dopo aver persuaso i mercenari.");
};

// ************************************************************
// 			  				OtherSld
// ************************************************************
INSTANCE DIA_Lee_OtherSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 7;
	condition   = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent   = FALSE;
	description = "Come faccio a convincere i mercenari a votare per il mio ingresso?";
};
FUNC INT DIA_Lee_OtherSld_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_OtherSld_Info()
{
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Come faccio a convincere i mercenari a votare per il mio ingresso?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //Facendo quello che dovresti fare come mercenario, direi.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Parla con Torlof. Di solito è fuori, di fronte alla casa. Ti metterà alla prova.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Se riuscirai a superare la prova, avrai guadagnato buona parte del rispetto necessario.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Egli ti dirà tutte le altre cose che devi sapere.
	
	B_LogEntry (TOPIC_BecomeSLD,"Per essere accettato come mercenario, devo superare la prova di Torlof e guadagnarmi il rispetto degli altri mercenari.");
};
			
///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lee_Ranger		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lee_Ranger_Condition;
	information	 = 	DIA_Addon_Lee_Ranger_Info;

	description	 = 	"Cosa sai dell’Anello dell'Acqua?";
};

func int DIA_Addon_Lee_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (SC_KnowsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lee_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //Cosa sai dell’Anello dell'Acqua?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //(ride) Lo sapevo. Devi proprio immischiarti in affari che non ti riguardano, eh?
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //Suvvia, dimmelo.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Il mio coinvolgimento in questa faccenda è marginale. So che questa gilda segreta esiste, e che dietro ci sono i Maghi dell'Acqua.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Dopo la caduta della Barriera, l'accordo che avevo stretto con i Maghi dell'Acqua è decaduto.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Ovviamente do ancora una mano quando posso. Ma ho anch'io i miei problemi, e non ho molto tempo da dedicare ad altre faccende.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Se vuoi saperne di più, parla con Cord. È uno di loro, per quanto ne so.
		
	RangerHelp_gildeSLD = TRUE;	
	SC_KnowsCordAsRangerFromLee = TRUE;
};			
			
// ************************************************************
// 			  				JoinNOW
// ************************************************************
var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

INSTANCE DIA_Lee_JoinNOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 8;
	condition   = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent   = TRUE;
	description = "Sono pronto per unirmi a voi!";
};
FUNC INT DIA_Lee_JoinNOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (Lee_OnarOK == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_JoinNOW_Info()
{
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Sono pronto per unirmi a voi!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //Non prima che tu abbia superato la prova di Torlof.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //Dunque hai superato la prova di Torlof?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Sì.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //Sono contento.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //Cosa dicono gli altri mercenari?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Non sono sicuro di avere dalla mia parte abbastanza di essi.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //Allora parla con Torlof, sa quasi tutto quello che si dice qui alla fattoria.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //La maggior parte di loro è dalla mia parte.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //Bene, allora vai a parlare con Onar adesso. Gli ho già parlato di te.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Ma dovrai trattare la tua paga da solo.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Tutto quello che mi serve ora è l'approvazione di Onar.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Hai visto Onar?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Ha accettato.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //Benvenuto a bordo, ragazzo!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Tieni, prendi un'armatura decente prima!
			Npc_SetTrueGuild (other, GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine (Lothar, "START");
			
			CreateInvItems (other, ItAr_Sld_L, 1);
			AI_EquipArmor (other, ItAr_Sld_L);
						
			Snd_Play ("LEVELUP"); 
	
			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			B_GivePlayerXP (XP_BecomeMercenary);
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Sono felice di averti con noi.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //Ho già il tuo primo incarico.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Ha a che fare con i paladini. È ora che tu vada a incontrarli
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //Volevi comunque andarci.
		};
	};
};

// ************************************************************
// 			  				KEIN SLD
// ************************************************************
INSTANCE DIA_Lee_KeinSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_KeinSld_Condition()
{
	if ( (other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KeinSld_Info()
{
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Vedo che sei al servizio dei paladini ora.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //Sei entrato a fare parte del monastero? (ride) Mi sarei aspettato tutto tranne quello.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //Beh, non puoi più diventare un mercenario ora.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Ma chi lo sa, forse puoi fare una o due cose per me, o io per te.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Vedremo. Ad ogni modo, ti auguro ogni bene.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Ma non pensare lontanamente di ingannarmi, intesi?
};

// ************************************************************
// 			  				ToHagen
// ************************************************************
INSTANCE DIA_Lee_ToHagen(C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent   = FALSE;
	description = "E come faccio a raggiungere i paladini, adesso?";
};
FUNC INT DIA_Lee_ToHagen_Condition()
{
	if (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ToHagen_Info()
{
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //E come faccio a raggiungere i paladini, adesso?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //Molto semplice. Dovrai portargli la nostra offerta di pace.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Conosco Lord Hagen, il comandante dei paladini, dai tempi in cui ero nell'esercito reale.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //So bene come ragiona, non ha abbastanza uomini. Accetterà l'offerta. Perlomeno ti ascolterà.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Ho scritto una lettera, tieni.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //Ad ogni modo, dovresti essere ammesso a cospetto del capo dei paladini.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee vuole mandarmi da Lord Hagen per discutere un trattato di pace. Potrebbe essere un modo per parlare con i paladini.");
};
		
// ************************************************************
// 			  			AngebotSuccess
// ************************************************************
INSTANCE DIA_Lee_AngebotSuccess (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_AngebotSuccess_Condition;
	information = DIA_Lee_AngebotSuccess_Info;
	permanent   = FALSE;
	description = "Ho recapitato a Lord Hagen la tua offerta di pace.";
};
FUNC INT DIA_Lee_AngebotSuccess_Condition()
{
	if (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AngebotSuccess_Info()
{
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Ho recapitato a Lord Hagen la tua offerta di pace.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //Cosa ti ha detto?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Dice che concederà l'amnistia a te, ma non ai tuoi uomini.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Quello stupido testardo. La maggior parte degli uomini nell'esercito del RE sono dei tagliagole peggiori dei miei uomini.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Cosa farai adesso?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Dobbiamo trovare un altro modo per andarcene. Se necessario, ci impadroniremo della nave. Ci devo pensare.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Togliere la testa dal cappio e abbandonare i miei uomini è fuori discussione.

	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};

// ************************************************************
// 			  			Background
// ************************************************************
INSTANCE DIA_Lee_Background (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent   = FALSE;
	description = "Perché desideri così ardentemente andare sulla terraferma?";
};
FUNC INT DIA_Lee_Background_Condition()
{
	if (MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Background_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Perché desideri così ardentemente andare sulla terraferma?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Come saprai, servivo il re come generale.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Ma i suoi leccapiedi mi hanno tradito, poiché sapevo qualcosa che non avrei dovuto sapere.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Mi hanno gettato nella colonia mineraria e il re ha permesso tutto ciò.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //Ho avuto molto tempo per rifletterci.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Mi vendicherò.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //(stupito) Sul re?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //(determinato) Sul re! E su tutti i suoi leccapiedi. Si pentiranno amaramente di quello che mi hanno fatto...
};

// ************************************************************
// 			  		RescueGorn
// ************************************************************
INSTANCE DIA_Lee_RescueGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent   = FALSE;
	description = "Mi dirigerò verso la Valle delle Miniere.";
};
FUNC INT DIA_Lee_RescueGorn_Condition()
{
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RescueGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Mi dirigerò verso la Valle delle Miniere.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Non ho mai pensato che saresti rimasto alla fattoria a lungo.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //Se torni nella colonia, vedi come sta Gorn. I paladini lo tengono prigioniero laggiù.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn è un buon uomo e mi servirebbe veramente qui, quindi se avrai la possibilità di liberarlo, fallo.
	
	KnowsAboutGorn = TRUE;
};
// ************************************************************
// 			 RescueGorn Success
// ************************************************************
INSTANCE DIA_Lee_Success (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent   = FALSE;
	description = "Ho liberato Gorn.";
};
FUNC INT DIA_Lee_Success_Condition()
{
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel >= 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Success_Info()
{
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //Ho liberato Gorn.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Sì, me lo ha detto. Ottimo lavoro.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //Vale più di Silvio e dei suoi ragazzi messi assieme.
	
	B_GivePlayerXP (XP_Ambient);
	
};
// ************************************************************
// 			  				AboutGorn
// ************************************************************
INSTANCE DIA_Lee_AboutGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent   = FALSE;
	description = "Gorn ti ha parlato di me??? Che cosa gli è successo?";
};
FUNC INT DIA_Lee_AboutGorn_Condition()
{
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (other,DIA_Lee_RescueGorn) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AboutGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Gorn ti ha parlato di me??? Che cosa gli è successo?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Ti ricordi di lui, vero?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Fammi pensare...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Certo.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Certo.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //È stato catturato dai paladini e rimandato nella Valle delle Miniere con un convoglio di detenuti.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Se la strada per la Valle delle Miniere non fosse infestata da paladini e orchi, avrei già mandato un paio di ragazzi a liberarlo.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Ma per come stanno le cose, non c'è possibilità. Poveraccio.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Fammi pensare...
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Grosso, scuro, cattivo, con una grande ascia, ha riconquistato la nostra miniera insieme a te, nella colonia.
};

// ************************************************************
// 			  				WegenBullco
// ************************************************************
INSTANCE DIA_Lee_WegenBullco (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent   = FALSE;
	description = "Adesso Onar possiede qualche pecora in meno, grazie a Bullco...";
};
FUNC INT DIA_Lee_WegenBullco_Condition()
{
	if (Kapitel < 4) 
	&& (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (Onar_WegenPepe == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WegenBullco_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Adesso Onar possiede qualche pecora in meno, grazie a Bullco...
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //Oh, non me ne parlare! Ho già abbastanza problemi.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //Anch'io. Bullco sembra avercela con me. Vuole che io lasci la fattoria...
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //Sì, e...? Fatti valere.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //Puoi dirgli di contenersi, altrimenti sottrarrò il costo delle pecore dalla sua paga...
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

// ************************************************************
// 							Drachen Report
// ************************************************************
instance DIA_Lee_Report (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Report_Condition;
	information	= DIA_Lee_Report_Info;
	permanent	= TRUE;
	description = "Vengo dalla Valle delle Miniere....";
};                       
FUNC INT DIA_Lee_Report_Condition()
{
	if (EnterOW_Kapitel2 == TRUE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Report_Info()
{	
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Vengo dalla Valle delle Miniere. Il castello è stato attaccato dai draghi!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //Dunque era vero! Lares mi aveva detto che storie di draghi stavano circolando in città... non ci credevo...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //Che mi dici dei paladini?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Sono stati pesantemente decimati.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //Bene! Forse ora Lord Hagen ripenserà alla mia offerta...
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //E se non lo farà... (severo) Allora troveremo un altro modo per andarcene da qui...
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //Bene! Forse questo costringerà Lord Hagen ad andare nella Valle delle Miniere con i suoi uomini...
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //Meno paladini rimarranno qui, meglio sarà.
	};
};

// ************************************************************
// 							Armor M freischalten
// ************************************************************

var int Lee_Give_Sld_M;
// -----------------------

instance DIA_Lee_ArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorM_Condition;
	information	= DIA_Lee_ArmorM_Info;
	permanent	= TRUE;
	description = "Che ne dici di un’armatura migliore?";
};                       
FUNC INT DIA_Lee_ArmorM_Condition()
{
	if (Kapitel == 2)
	&& (other.guild == GIL_SLD)
	&& (Lee_Give_Sld_M == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //Che ne dici di un’armatura migliore?
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Hai compiuto la tua missione.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //Ho qui un'armatura migliore per te. Naturalmente, se hai i soldi necessari.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof ha un incarico da parte di Onar di cui avremmo dovuto occuparci già da tempo.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Occupatene tu, poi potremo parlare di un'armatura migliore!
	};
};

// ************************************************************
// 							Armor M kaufen
// ************************************************************
var int Lee_SldMGiven;
// -------------------

instance DIA_Lee_BuyArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorM_Condition;
	information	= DIA_Lee_BuyArmorM_Info;
	permanent	= TRUE;
	description = "Compra un’armatura da mercenario media. Protezione: armi 45, frecce 45. Costo: 500 monete d’oro";
};                       
FUNC INT DIA_Lee_BuyArmorM_Condition()
{
	if (Lee_Give_Sld_M == TRUE)
	&& (Lee_SldMGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Dammi l'armatura.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Eccotela. Una buona armatura.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Ma non è un regalo! Prima voglio vedere l'oro!
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Lee_KAP3_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP3_EXIT_Condition;
	information	= DIA_Lee_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				  		Teleport
// ************************************************************

INSTANCE DIA_Lee_Teleport(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 1;
	condition	= DIA_Lee_Teleport_Condition;
	information	= DIA_Lee_Teleport_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Lee_Teleport_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (Lee_Teleport == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Teleport_Info()
{	
	 B_Lee_Teleport();
};

// ************************************************************
// 							Armor H freischalten
// ************************************************************

instance DIA_Lee_ArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorH_Condition;
	information	= DIA_Lee_ArmorH_Info;
	permanent	= FALSE;
	description = "Hai un’armatura migliore per me?";
};                       
FUNC INT DIA_Lee_ArmorH_Condition()
{
	if (Kapitel == 3)
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //Hai un’armatura migliore per me?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Certamente.
};

// ************************************************************
// 							Armor H kaufen
// ************************************************************
var int Lee_SldHGiven;
// -------------------

instance DIA_Lee_BuyArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorH_Condition;
	information	= DIA_Lee_BuyArmorH_Info;
	permanent	= TRUE;
	description = "Compra un’armatura da mercenario pesante. Protezione: armi 60, frecce 60. Costo: 1000 monete d’oro";
};                       
FUNC INT DIA_Lee_BuyArmorH_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_ArmorH))
	&& (Lee_SldHGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Dammi l'armatura pesante.
	
	if (B_GiveInvItems (other, self, itmi_gold, 2500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Eccotela. Un'armatura molto buona. È la stessa che indosso io.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Sai come funziona. Prima l'oro!
	};
};


// ************************************************************
// 	Richter
// ************************************************************

INSTANCE DIA_Lee_Richter (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Richter_Condition;
	information	= DIA_Lee_Richter_Info;
	permanent	= FALSE;
	description = "Non hai nient’altro da farmi fare?";
};                       
FUNC INT DIA_Lee_Richter_Condition()
{
	if (Kapitel >= 3)
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	&& ((Npc_IsDead(Richter))== FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Richter_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //Non hai nient’altro da farmi fare?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Non ti accontenti mai, eh? Sei già abbastanza inguaiato come sei. Che altro vuoi, allora?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Un altro incarico. Sono un mercenario, ricordi?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //D'accordo, ci sarebbe qualcosa. È proprio quello che fa per te.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Ho un debito da saldare con il giudice in città. Preferirei farlo di persona, a dire il vero.
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //Ma i paladini non permetterebbero di avvicinarmi neanche lontanamente alla sua casa.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //La cosa andrà gestita con un po' di buon senso, quindi fai attenzione. Andrai dal giudice e gli offrirai i tuoi servigi.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Dovrai cercare di guadagnarti la sua fiducia e svolgere alcuni lavoretti sporchi, fino a quando non scoprirai qualcosa per incriminarlo.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Quel porco ha fatto così tante ingiustizie che la sua puzza arriva fino agli dei.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Portami qualcosa che io possa utilizzare per diffamare il suo nome con l'esercito, in modo che passi il resto della sua vita a marcire in prigione.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //Ma non voglio che tu lo uccida. Sarebbe troppo breve. Voglio vederlo soffrire, capito?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //Pensi di poterlo fare?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee vuole che trovi alcune prove che incriminino il giudice di Khorinis. Per farlo ho offerto i miei servigi al giudice, e terrò gli occhi aperti."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Mi rifiuto di farlo.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Nessun problema. Il prezzo?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Nessun problema. Il prezzo?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //La tua ricompensa dipenderà da quello che riuscirai a portarmi, quindi cerca di sforzarti.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Non voglio farlo. Non intendo diventare il leccapiedi di quel porco.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //Non fare il difficile. Ad ogni modo, è lui quello che ti ha condannato e fatto gettare all'interno della Barriera. O te ne sei dimenticato?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Fai quello che ti pare, ma credo che farai la scelta giusta.
	Info_ClearChoices	(DIA_Lee_Richter);
};



// ************************************************************
// 	RichterBeweise
// ************************************************************

INSTANCE DIA_Lee_RichterBeweise (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_RichterBeweise_Condition;
	information	= DIA_Lee_RichterBeweise_Info;

	description = "Ho trovato qualcosa per incriminare il giudice.";
};                       
FUNC INT DIA_Lee_RichterBeweise_Condition()
{
	if (Kapitel >= 3)
	&& (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_RichterKomproBrief_MIS))
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RichterBeweise_Info()
{	
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //Ho trovato qualcosa per incriminare il giudice.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //Davvero? Di cosa si tratta?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Ha pagato alcuni malviventi per derubare il governatore di Khorinis.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Poco dopo, li ha fatti arrestare e si è intascato tutto l'oro.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Ti ho portato la pergamena che il giudice ha scritto ai delinquenti come prova.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Mostramela.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Finalmente. Questo dovrebbe essere sufficiente a farlo sanguinare. Sono impressionato.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Sono disposto a sborsare parecchio per questo. Ecco la tua ricompensa.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //E non una parola con nessun altro, intesi?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //Ottimo. Ma il problema si è risolto da solo. Il giudice è morto.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Qualche idiota lo ha ucciso. Oh, beh, va bene anche così.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Eccoti un po' di monete. È tutto quello che la pergamena può valere per me ora.
			CreateInvItems (self, ItMi_Gold, 50);									
			B_GiveInvItems (self, other, ItMi_Gold, 50);		
			MIS_Lee_JudgeRichter = LOG_FAILED;
			B_GivePlayerXP (XP_Ambient);			
		};
};

// ************************************************************
// 	  				   Was ist mit Bennet?
// ************************************************************

INSTANCE DIA_Lee_TalkAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_TalkAboutBennet_Condition;
	information	= DIA_Lee_TalkAboutBennet_Info;
	permanent	= FALSE;
	description = "Cosa mi dici di Bennet?";
};                       
FUNC INT DIA_Lee_TalkAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (KApitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_TalkAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_TalkAboutBennet_15_00"); //Cosa mi dici di Bennet?
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Dunque l'hai saputo. Quei bastardi lo hanno rinchiuso in cella, proprio come si dice.
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Come se non avessi già abbastanza problemi con i miei uomini ora devo anche occuparmi dei paladini.
	};
};

//**************************************************************
//	Was willst du wegen Bennet unternehmen?
//**************************************************************

INSTANCE DIA_Lee_DoAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_DoAboutBennet_Condition;
	information	= DIA_Lee_DoAboutBennet_Info;
	permanent	= FALSE;
	description = "Cosa pensi di fare a proposito di Bennet?";
};                       
FUNC INT DIA_Lee_DoAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_TalkAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_DoAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Cosa pensi di fare a proposito di Bennet?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Non lo so ancora. Alcuni dei ragazzi vorrebbero correre in città e far saltare i denti a Lord Hagen.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Fortunatamente non abbiamo abbastanza persone per un'operazione di quel genere. Inoltre, non è il mio stile.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //Intendi stare seduto a vedere cosa succede, quindi?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //Certamente no.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Se non riuscirò a provare l'innocenza di Bennet al più presto, Lee non potrà frenare i mercenari. I suoi uomini non esiteranno ad attaccare la città e liberare Bennet con la forza."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares è ancora in città e sta cercando di scoprire come fare per tirare Bennet fuori da lì.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //Fino ad allora, cercherò di calmare i miei uomini. Spero solo che Lares non ci metta troppo.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //Oh, già. Prima che mi dimentichi... Buster vuole parlarti. Non ha voluto dirmi riguardo a cosa. Forse faresti meglio ad andare a parlargli!
	};
};

//**************************************************************
//	Kann ich dir helfen?
//**************************************************************

INSTANCE DIA_Lee_CanHelpYou(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_CanHelpYou_Condition;
	information	= DIA_Lee_CanHelpYou_Info;
	permanent	= FALSE;
	description = "Posso aiutarti in questa faccenda che riguarda Bennet?";
};                       
FUNC INT DIA_Lee_CanHelpYou_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_CanHelpYou_Info()
{	
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //Posso aiutarti in questa faccenda che riguarda Bennet?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Certo, un po' di intelligenza e buonsenso non faranno male in questa storia.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Innos sa se non ci sono già abbastanza idioti qui intorno.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //Recati in città e vedi se riesci a trovare un modo per far uscire Bennet da lì.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Ma non metterci troppo, non so fino a quando riuscirò ancora a tenere gli uomini sotto controllo.
};

//**************************************************************
//	Gibts was neues wegen Bennet?
//**************************************************************

//----------------------------------
var int DIA_Lee_AnyNews_OneTime;
//----------------------------------

INSTANCE DIA_Lee_AnyNews(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_AnyNews_Condition;
	information	= DIA_Lee_AnyNews_Info;
	permanent	= TRUE;
	description = "Novità su Bennet?";
};                       
FUNC INT DIA_Lee_AnyNews_Condition()
{
	if (MIS_RescueBennet != FALSE)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))
	&& (DIA_Lee_AnyNews_OneTime == FALSE) 	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //Novità su Bennet?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Perlomeno non sembra aver subito danni permanenti in prigione.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Bel lavoro.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //No, non ne sappiamo ancora abbastanza.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info Sylvio
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_SYLVIO		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	3;
	condition	 = 	DIA_Lee_SYLVIO_Condition;
	information	 = 	DIA_Lee_SYLVIO_Info;

	description	 = 	"Che cosa è successo, nel frattempo?";
};

func int DIA_Lee_SYLVIO_Condition ()
{
	if (MIS_ReadyforChapter4 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Lee_SYLVIO_Info ()
{
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //Che cosa è successo, nel frattempo?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Silvio, quel bastardo, è venuto a sapere dei draghi nella Valle delle Miniere, e ha gettato l'intera fattoria nel caos.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Ha cercato di convincere i ragazzi a seguirlo nella Valle delle Miniere. Gli ha promesso gloria, onore, oro e ogni genere di cose.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Molti di loro non hanno interesse a farsi ammazzare per Silvio, ma c'è stato qualche idiota che si è fatto incantare dalle sue ciance.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Alla fine della storia, si sono equipaggiati da Bennet e sono partiti.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //(senza interesse) Beh, per quanto mi riguarda sono felice che Silvio sia finalmente sparito dalla fattoria.
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Lee_KAP4_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP4_EXIT_Condition;
	information	= DIA_Lee_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_CanTeach		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	10;
	condition	 = 	DIA_Lee_CanTeach_Condition;
	information	 = 	DIA_Lee_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Vorresti addestrarmi?";
};
func int DIA_Lee_CanTeach_Condition ()
{	
	if Kapitel >= 4
	&& Lee_TeachPlayer == FALSE
	{
		return TRUE;
	};
};
func void DIA_Lee_CanTeach_Info ()
{
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //Puoi addestrarmi?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Posso mostrarti come combattere con una spada a due mani.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Ma non ho tempo per insegnarti anche le basi.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Appena avrai raggiunto un certo livello di abilità, mi occuperò di te. Fino ad allora, dovrai cercarti un altro maestro.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //Ho sentito dire che sei abbastanza abile. Ma scommetto che posso ancora insegnarti un paio di cosette.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee mi insegnerà a brandire le armi a due mani.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Quindi, se vuoi, ti insegnerò qualcosa. Ti costerà un po', però.
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Quanto vuoi?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 pezzi d'oro e siamo in affari.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"Il prezzo è troppo alto per me.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"Affare fatto. Ecco l’oro.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //Il prezzo è troppo alto per me.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //Pensaci. Insegnanti del mio calibro sono difficili da trovare.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //Affare fatto. Ecco l'oro.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //D'accordo, te lo prometto: valgo il prezzo pagato.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Lee mi insegnerà a brandire le armi a due mani.");
};
 
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Lee_Teach(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 10;
	condition	= DIA_Lee_Teach_Condition;
	information	= DIA_Lee_Teach_Info;
	permanent	= TRUE;
	description = "Diamo inizio all’addestramento.";
};                       

FUNC INT DIA_Lee_Teach_Condition()
{
	IF (Lee_Teachplayer == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Lee_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Diamo inizio all’addestramento.
	
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);

};

FUNC VOID DIA_Lee_Teach_Back ()
{
	Info_ClearChoices (DIA_Lee_Teach);
};


FUNC VOID DIA_Lee_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Ora sei un vero maestro del combattimento con le armi a due mani.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Non hai più bisogno di un insegnante.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

FUNC VOID DIA_Lee_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Ora sei un vero maestro del combattimento con le armi a due mani.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Non hai più bisogno di un insegnante.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachenei
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DRACHENEI		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	4;
	condition	 = 	DIA_Lee_DRACHENEI_Condition;
	information	 = 	DIA_Lee_DRACHENEI_Info;

	description	 = 	"Gli uomini lucertola stanno distribuendo uova di drago per tutto il paese.";
};

func int DIA_Lee_DRACHENEI_Condition ()
{

	if (Npc_HasItems (other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Gli uomini lucertola stanno distribuendo uova di drago per tutto il paese.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //Avrei dovuto saperlo. È ora di andarsene da qui.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //Cosa dovrei fare con loro, dunque?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Annientali. Che altro?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Forse le corazze potrebbero essere usate per creare un'armatura o qualcosa del genere.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Sembrano abbastanza solide. Parlane con Bennet.
		B_LogEntry (TOPIC_DRACHENEIER,"Non c'era molto che Lee potesse fare con l'uovo di drago. Mi ha mandato da Bennet il fabbro."); 
	};
};

//********************************************************************
//	Kap 4 Perm
//********************************************************************

INSTANCE DIA_Lee_KAP4_Perm(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 49;
	condition	= DIA_Lee_KAP4_Perm_Condition;
	information	= DIA_Lee_KAP4_Perm_Info;
	permanent	= TRUE;
	description = "Come vanno le cose alla fattoria?";
};                       
FUNC INT DIA_Lee_KAP4_Perm_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Come vanno le cose alla fattoria?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //Bene, da quando Silvio è partito abbiamo finalmente un po' di pace qui.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //Non sembra male.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Sfortunatamente, non abbiamo meno lavoro. Gli uomini sono sempre più scontenti, poiché devono svolgere il lavoro degli uomini di Silvio, oltre al loro.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Ma lascia che me ne preoccupi io. Posso gestire la cosa.
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Lee_KAP5_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP5_EXIT_Condition;
	information	= DIA_Lee_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GetShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GetShip_Condition;
	information	 = 	DIA_Lee_GetShip_Info;
	
	description	 = 	"Hai idea di come possa prendere il controllo della nave dei paladini?";
};
func int DIA_Lee_GetShip_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{	
		return TRUE;
	};
};
func void DIA_Lee_GetShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Hai qualche idea su come posso prendere il controllo della nave dei paladini?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //Pensi che sarei ancora qui se lo sapessi? Quella cosa è protetta meglio di quanto i trasporti di metallo lo fossero a Campo Vecchio.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Dev'esserci un modo per salire a bordo della nave.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Certo. Salire a bordo è facile.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Dopo tutto, abbiamo il giudice in pugno. Dovresti andare da lui ed estorcergli una lettera d'autorizzazione per la nave.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee suggerisce che il modo migliore per salire a bordo della nave dei paladini sia ottenere una lettera di autorizzazione del giudice. Ma non credo sia disponibile a scriverne una per me.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //Ho una lettera d'autorizzazione falsificata qui. Con questa la guardie della nave ti faranno passare.
		
			B_LogEntry (TOPIC_Ship,"Buon vecchio Lee. Ha falsificato una lettera che mi permetterà di salire a bordo della nave dei paladini.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Ma non basta. Per condurre una nave hai bisogno di un capitano, un equipaggio e altro.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Sono richieste parecchie cose.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "Chi posso ingaggiare come equipaggio?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Conosci qualcuno che potrebbe governare la nave?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Conosci qualcuno che potrebbe governare la nave?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Per quanto ne so, Torlof una volta navigava per il mare. Sa il fatto suo.

	B_LogEntry (TOPIC_Captain,"Torlof è un vecchio marinaio, forse vorrà diventare il mio capitano.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //Chi posso ingaggiare come equipaggio?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //Dovrai deciderlo da solo. Ma io prenderei con me solo persone di cui mi fido. Hai abbastanza persone di cui puoi fidarti?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Se ti serve un fabbro nell'equipaggio, dovresti chiedere a Bennet. È sicuramente il migliore che potrai trovare.

	B_LogEntry (TOPIC_Crew,"Per quanto riguarda l'equipaggio, non c'è molto che Lee possa fare per me. Ma mi ha detto che dovrei scegliere solamente persone di cui mi possa fidare. Inoltre, dovrei chiedere a Bennet, potrebbe essere interessato.");
};

func void DIA_Lee_GetShip_back ()
{
	Info_ClearChoices	(DIA_Lee_GetShip);
};

///////////////////////////////////////////////////////////////////////
//	GotRichtersPermissionForShip
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GotRichtersPermissionForShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GotRichtersPermissionForShip_Condition;
	information	 = 	DIA_Lee_GotRichtersPermissionForShip_Info;

	description	 = 	"L’autorizzazione scritta ha avuto l’effetto desiderato.";
};
func int DIA_Lee_GotRichtersPermissionForShip_Condition ()
{	
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)	
	{
		return TRUE;
	};
};
func void DIA_Lee_GotRichtersPermissionForShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //L'autorizzazione scritta ha funzionato. La nave è mia ora. Il giudice è stato molto cooperativo.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //Bene. Il tuo lungo periodo di umiliazione con quei bastardi è finalmente servito a qualcosa.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Ich will das Schiff klauen
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StealShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StealShip_Condition;
	information	 = 	DIA_Lee_StealShip_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"Voglio rubare la nave.";
};

func int DIA_Lee_StealShip_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Lee_GetShip))
	&& (hero.guild == GIL_DJG)
	&& (MIS_RichtersPermissionForShip == 0)	//Joly: kein Richter Erpressen nötig!
	{
		return TRUE;
	};	
};

func void DIA_Lee_StealShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Voglio rubare la nave.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //E come vorresti fare?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //Facilissimo. Vado lì, gli mostro i tuoi documenti e prendo la nave.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Se lo dici tu. Tieni, spero tu sappia ciò che stai facendo.
	
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
};

//Lee anheuern

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lee_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ti piacerebbe accompagnarmi sulla nave?";
};
func int DIA_Lee_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lee_GetShip))
	{
		return TRUE;
	};
};
func void DIA_Lee_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //Ti piacerebbe accompagnarmi sulla nave?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //Stai scherzando? Certo che vengo. Ho alcuni vecchi conti da saldare sulla terraferma.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //Inoltre, posso insegnarti il combattimento con le armi a una o due mani. Potrei esserti molto utile.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee sembra impaziente di rivedere nuovamente la terra ferma. Si è offerto di aiutarmi. Sarebbe difficile trovare un buon maestro d'armi come lui da altre parti.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //La nave è piena al momento, ma tornerò non appena ci sarà un posto.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Ti farò sapere in caso avessi bisogno di te.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Vai a fare i bagagli, allora!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //Vai a fare i bagagli, allora!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Cosa? Adesso?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Sì, ho intenzione di andarmene da qui, e se vuoi unirti a me, vieni al porto. Ci incontreremo alla nave.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //Ho aspettato a lungo questo momento. Ci sarò.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	Lee_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
		
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

FUNC VOID DIA_Lee_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Ti farò sapere in caso avessi bisogno di te.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //Devi sapere quello che vuoi. Ma non si hanno mai abbastanza guerrieri abili intorno.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //(ghigno) A meno che non siano dei totali imbecilli come Silvio.

	Lee_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_LeaveMyShip_Condition;
	information	 = 	DIA_Lee_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Non penso di avere bisogno di te!";
};

func int DIA_Lee_LeaveMyShip_Condition ()
{	
	if (Lee_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //Non penso di avere bisogno di te!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Fai come vuoi, sai dove trovarmi!
	
	Lee_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};


///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StillNeedYou_Condition;
	information	 = 	DIA_Lee_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Potresti essermi utile in qualche modo!";
};
func int DIA_Lee_StillNeedYou_Condition ()
{	
	if ((Lee_IsOnBOard == LOG_OBSOLETE)		//Hier braucht man natürlich nur eine variable abfragen
	|| (Lee_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lee_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //Potresti essermi utile in qualche modo!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //Sapevo che ti sarei servito! Ci vediamo sulla nave.
		
		Lee_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //Chiarisciti le idee, dannazione. Prima mi dici che dovrei venire, poi mi mandi via.
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //Trovati un altro idiota!
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lee_KAP6_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP6_EXIT_Condition;
	information	= DIA_Lee_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



































