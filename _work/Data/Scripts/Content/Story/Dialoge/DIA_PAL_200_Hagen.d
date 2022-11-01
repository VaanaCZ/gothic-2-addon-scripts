// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hagen_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Hagen_EXIT_Condition;
	information	= DIA_Hagen_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hagen_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Hagen_LastPetzCounter;
var int Hagen_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Hagen_PMSchulden (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PMSchulden_Condition;
	information = DIA_Hagen_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Hagen_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Hagen_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hagen_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //Hai fatto bene a venire. Puoi pagare subito la tua penale.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //Non prendi le leggi della città molto sul serio, vero?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //La lista delle tue malefatte si è allungata.
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //E non dirmi che non lo sapevi!
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //Dovrai pagare la penale massima.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //Bene, sembra che la situazione sia cambiata.
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //Non ci sono più testimoni per il tuo omicidio!
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //Nessuno testimonierà più che hai rubato!
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //Non ci sono più testimoni per la tua rissa.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //Tutte le accuse contro di te non sono più valide.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //Non so cosa sia successo in città e non lo voglio sapere.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //Assicurati solamente di non finire nei guai.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //Ad ogni modo, ho deciso di chiudere un occhio sul tuo debito.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //Cerca di non finire nuovamente al verde.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //Ciononostante, pagherai tutto il tuo debito.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //Allora, vuoi pagare?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Non ho abbastanza oro!",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Qual era il prezzo?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"Voglio pagare la penale!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //Qual era il prezzo?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Non ho abbastanza oro!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Qual era il prezzo?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PMSchulden,"Voglio pagare la penale!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Hagen_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Hagen_PETZMASTER   (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PETZMASTER_Condition;
	information = DIA_Hagen_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Hagen_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_PETZMASTER_Info()
{
	Hagen_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Hagen noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //La tua reputazione ti precede. Hai violato le leggi della città.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //Ti sei ficcato in un bel pasticcio.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //L'omicidio è un crimine grave!
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //Per non parlare delle altre malefatte.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //Le guardie hanno l'ordine di giustiziare gli assassini sul posto.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //L'omicidio non è accettato in questa città. Ma puoi dimostrare il tuo pentimento pagando una penale.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //Sei accusato di furto!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //Per non parlare delle altre cose di cui ho sentito.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //Questa è una violazione delle leggi della città. Dovrai pagare una penale per questo.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //Sei stato coinvolto in una rissa. Così facendo hai violato la legge.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //E cos'era quella cosa con la pecora?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //Una violazione delle leggi della città è una violazione delle leggi di Innos.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //Pertanto dovrai pagare per questo.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //Miravi alla nostra pecora. All'inizio non potevo crederci.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //Perché devo sempre occuparmi di queste sciocchezze?
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //Devi pagare una penale per compensare i tuoi crimini!
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //Quanto vuoi?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"Non ho abbastanza oro!",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"Voglio pagare la penale!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //Voglio pagare la penale!
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //Bene! Farò in modo che tutta la città lo venga a sapere. Questo ripulirà un po' la tua reputazione.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //Non ho abbastanza oro!
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //Allora vedi di ottenere l'oro il più in fretta possibile.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //E ti avverto: se ti macchi di altri reati, le cose per te peggioreranno ulteriormente.
	
	Hagen_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Hagen_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Hallo (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Hallo_Condition;
	information	 = 	DIA_Lord_Hagen_Hallo_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};
func int DIA_Lord_Hagen_Hallo_Condition ()
{	
	if (hero.guild != GIL_NONE)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //Ho già sentito parlare di te.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //Lothar ha detto che volevi parlarmi.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //Sei lo straniero che ha chiesto l'Occhio di Innos.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //Io sono Lord Hagen.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //Paladino del re, guerriero del nostro signore Innos e comandante in carica di Khorinis.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //Ho molte cose da fare, perciò non farmi sprecare tempo. Dimmi piuttosto perché sei qui.
};

///////////////////////////////////////////////////////////////////////
//	Info Frieden
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Frieden (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Frieden_Condition;
	information	 = 	DIA_Lord_Hagen_Frieden_Info;
	permanent	 = 	FALSE;
	description	 =  "Ho una dichiarazione di pace da parte dei mercenari!";
};
func int DIA_Lord_Hagen_Frieden_Condition ()
{	
	if (MIS_Lee_Friedensangebot == LOG_RUNNING)
	&& (Npc_HasItems (other, itwr_Passage_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Frieden_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //Porto un’offerta di pace da parte dei mercenari!
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //(irritato) Mmmh, fammi vedere!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //Conosco il generale Lee. Conosco anche le circostanze per le quali fu condannato ai lavori forzati nella colonia.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //Lo ritengo un uomo onorevole. Sono pronto a concedergli l'assoluzione, ma solamente a lui!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //Questo tuttavia non vale per i suoi uomini. Molti di loro sono solo dei tagliagole privi d'onore e meritevoli della punizione ricevuta!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //Non offrirò certo loro l'assoluzione. Riferiscigli le mie parole.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //È tutto?
	};
	B_LogEntry (Topic_Frieden,"Lord Hagen è disposto ad assolvere Lee, ma non gli altri mercenari."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Armee
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Armee (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Armee_Condition;
	information	 = 	DIA_Lord_Hagen_Armee_Info;
	permanent	 = 	FALSE;
	description	 =  "Gli eserciti del male si stanno avvicinando. Nella Valle delle Miniere.";
};
func int DIA_Lord_Hagen_Armee_Condition ()
{	
	if (!MIS_Lee_Friedensangebot == LOG_RUNNING)
	|| (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Armee_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //Gli eserciti del male si stanno avvicinando pericolosamente. Nella Valle delle Miniere.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //Nella Valle delle Miniere? Abbiamo inviato una spedizione laggiù. Abbiamo ricevuto un rapporto in cui si afferma che il passo è occupato dagli orchi.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //Ma finora non ho visto traccia di un'armata del male.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //È forse un misero trucchetto per convincermi della necessità di formare un'alleanza con i mercenari?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //No.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //(scettico) Di quale armata si dovrebbe trattare?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //Un'armata di draghi ha riunito schiere di servitori intorno a loro.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //Draghi? Secondo le vecchie scritture sono passati molti secoli da quando l'ultimo drago fu avvistato.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //Dimmi, perché dovrei credere a quello che dici?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //La domanda non è se puoi credermi o meno. La domanda è se puoi permetterti di NON credermi quando dico la verità.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //Fino a quando non avrò alcuna prova non manderò un solo uomo laggiù.
};

///////////////////////////////////////////////////////////////////////
//	Info Proof
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Proof (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Proof_Condition;
	information	 = 	DIA_Lord_Hagen_Proof_Info;
	permanent	 = 	TRUE;
	description	 =  "Vuoi che ti porti delle prove?";
};
func int DIA_Lord_Hagen_Proof_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee )
	&& (Hagen_BringProof == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Proof_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //Vuoi che ti porti delle prove?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //Esattamente. Attraversa il passo della Valle delle Miniere. Una volta oltre, cerca la spedizione e, quando l'avrai trovata, parla con il comandante Garond.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //Se c'è qualcuno è a conoscenza della situazione, è lui.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //Se confermerà le tue parole, sono pronto ad aiutarti.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //Vuoi dire che mi consegnerai l'Occhio di Innos?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //L'Occhio di Innos... va bene. Portami le prove e farò in modo che tu abbia il permesso di indossare l'amuleto.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //Posso dire di avere la tua parola?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //Certo, ce l'hai.
		Hagen_BringProof = TRUE;
	}
	else
	{
		if (hero.guild == GIL_NOV)
		{
			PrintScreen	(PRINT_Addon_GuildNeeded_NOV, -1,-1, FONT_Screen ,2);
		}
		else 
		{	
			PrintScreen	(PRINT_Addon_GuildNeeded, -1,-1, FONT_Screen ,2);
		};	
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Auge (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Auge_Condition;
	information	 = 	DIA_Lord_Hagen_Auge_Info;
	permanent	 = 	FALSE;
	description	 =  "Cosa sai dell’Occhio di Innos?";
};
func int DIA_Lord_Hagen_Auge_Condition ()
{	
	return TRUE;
};
func void DIA_Lord_Hagen_Auge_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_00"); //Cosa sai dell’Occhio di Innos?
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //È un artefatto divino. (pensieroso) Nelle vecchie profezie è sempre menzionato insieme ai draghi.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //Tuttavia, le scritture affermano che solo l'Eletto di Innos potrà indossarlo.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //Io SONO l'Eletto di Innos!
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //Allora forse ti sarà possibile indossare l'amuleto.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Pass (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Pass_Condition;
	information	 = 	DIA_Lord_Hagen_Pass_Info;
	permanent	 = 	FALSE;
	description	 =  "Come faccio a oltrepassare il passaggio?";
};
func int DIA_Lord_Hagen_Pass_Condition ()
{	
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Pass_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //Come faccio a oltrepassare il passo?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //Ti darò la chiave per il passo. Tuttavia, dovrai aprirti la strada attraverso le fila degli orchi.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //Che Innos ti protegga.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"Lord Hagen vuole che gli porti delle prove dell'esistenza dell'esercito del Male. Mi dirigerò verso la Valle delle Miniere per parlare con il Comandante Garond.");
	
	if (Fernando_ImKnast == FALSE)
	{
		B_StartOtherRoutine (Fernando,"WAIT"); 
	};
	
	Wld_InsertNpc (BDT_1020_Bandit_L, "NW_TROLLAREA_PATH_47");	//Joly: //ADDON stört dann nicht mehr
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lord_Hagen_Ornament		(C_INFO)
{
	npc		 	= PAL_200_Hagen;
	nr		 	= 10;
	condition	= DIA_Addon_Lord_Hagen_Ornament_Condition;
	information	= DIA_Addon_Lord_Hagen_Ornament_Info;

	description	= "Sto cercando un ornamento di metallo.";
};

func int DIA_Addon_Lord_Hagen_Ornament_Condition ()
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
	&& (Lord_Hagen_GotOrnament == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lord_Hagen_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //Sto cercando un ornamento di metallo. Era al circolo di pietra vicino alla fattoria di Lobart.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //Se parli di questa cosa... sospettavamo potesse trattarsi di una runa magica, ma si è rivelata assolutamente priva di valore.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //Se vuoi puoi prenderla. Io non so che farmene.
	
	CreateInvItems (self, ItMi_Ornament_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Ornament_Addon, 1);	
	Lord_Hagen_GotOrnament = TRUE;
	B_GivePlayerXP (XP_Ambient);	
};

///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Khorinis (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Khorinis_Condition;
	information	 = 	DIA_Lord_Hagen_Khorinis_Info;
	permanent	 = 	FALSE;
	description	 =  "Perché siete venuti a Khorinis?";
};
func int DIA_Lord_Hagen_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Khorinis_15_00"); //Perché siete venuti a Khorinis?
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //Siamo in missione per il regno. I nostri ordini vengono direttamente da re Rhobar.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //Ti ho già detto che abbiamo mandato una spedizione nella Valle delle Miniere. Quella è la ragione della nostra presenza qui.
};

///////////////////////////////////////////////////////////////////////
//	Info Minental
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Minental (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Minental_Condition;
	information	 = 	DIA_Lord_Hagen_Minental_Info;
	permanent	 = 	TRUE;
	description	 =  "Cosa ci fate voi uomini nella Valle delle Miniere?";
};
func int DIA_Lord_Hagen_Minental_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Khorinis))
	&& (KnowsPaladins_Ore == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Minental_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //Cosa ci fate voi uomini nella Valle delle Miniere?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //Non vedo perché dovrei dirtelo!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //Ci sei stato. Dovresti saperlo.
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //D'accordo, visto che andrai comunque laggiù, tanto vale dirtelo.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //Riguarda il metallo magico. Da esso può dipendere l'esito della guerra.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //Senza abbastanza armi di metallo magico, l'esercito del re non ha la minima possibilità contro i guerrieri d'élite degli orchi.
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //E le miniere dell'isola sono le ultime alle quali abbiamo ancora accesso.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //Appena la nostra nave sarà carica di metallo partiremo verso la terraferma.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //Allora la guerra contro gli orchi non sta andando bene?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //Ti ho già detto troppo.
	};
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Hagen_CanTeach		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	5;
	condition	 = 	DIA_Hagen_CanTeach_Condition;
	information	 = 	DIA_Hagen_CanTeach_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"Sto cercando un maestro spadaccino.";
};
func int DIA_Hagen_CanTeach_Condition ()
{	
	if (LordHagen_Teach2H == FALSE)
	&& (other.guild == GIL_PAL)
	&& (other.aivar[REAL_TALENT_2H] >= 90)
	&& (other.aivar[REAL_TALENT_2H] < 100)
	{
		return TRUE;
	};
};
func void DIA_Hagen_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //Sto cercando un maestro spadaccino.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //E dunque? Ne hai trovato uno.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"Lord Hagen può insegnarmi a combattere con le armi a due mani.");
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Hagen_Teach(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 100;
	condition	= DIA_Hagen_Teach_Condition;
	information	= DIA_Hagen_Teach_Info;
	permanent	= TRUE;
	description = "Iniziamo (apprendi il combattimento a due mani)";
};                       
//----------------------------------
var int DIA_Hagen_Teach_permanent;
//----------------------------------
FUNC INT DIA_Hagen_Teach_Condition()
{
	if (LordHagen_Teach2H == TRUE)
	&& (DIA_Hagen_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hagen_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Hagen_Teach_15_00"); //Iniziamo.
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);

};
FUNC VOID DIA_Hagen_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //Sei diventato un abile spadaccino. Non posso insegnarti nient'altro.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //Possano le tue gesta future essere guidate dalla saggezza dello spadaccino.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Hagen_Teach);
};

FUNC VOID DIA_Hagen_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)) ,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)) ,DIA_Hagen_Teach_2H_5);	
};

FUNC VOID DIA_Hagen_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);	
	
};
//##############################################################
//###
//###	RitterAufnahme
//###
//##############################################################

//**************************************************************
//	Ich will auch ein Paladin werden.
//**************************************************************


INSTANCE DIA_Lord_Hagen_Knight		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	990;
	condition	 = 	DIA_Lord_Hagen_Knight_Condition;
	information	 = 	DIA_Lord_Hagen_Knight_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Voglio prestare servizio al fianco dell’ordine!";
};
FUNC INT DIA_Lord_Hagen_Knight_Condition ()
{	
	if (hero.guild == GIL_MIL)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Knight_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //Voglio prestare servizio al fianco dell’ordine!
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //Bene, hai dimostrato di avere il coraggio, l'abilità e le conoscenze per servire Innos.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //Le tue gesta dimostrano la purezza del cuore.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //Se così desideri, ti darò il benvenuto all'interno dell'ordine.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Non sono ancora del tutto sicuro.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Sono pronto!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //Essere un guerriero di Innos significa dedicarsi completamente alla causa di Innos.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //Solo i guerrieri più nobili e coraggiosi sono ammessi nell'ordine.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //Se sei veramente determinato a diventare un paladino, devi dimostrare il tuo valore.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //Non sono ancora del tutto sicuro.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //Allora prima libera il tuo cuore dal dubbio. Ritorna quando sarai pronto.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //Sono pronto!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //(serio) Così sia, allora!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //(serio) Molti uomini hanno intrapreso questo sentiero e offerto le loro vite nel nome di Innos.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //(serio) Giuri che le tue gesta onoreranno le loro morti e loderanno la gloria di Innos?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //Lo giuro!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //Allora d'ora in avanti sarai un membro della nostra fratellanza.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //Ti nomino dunque guerriero di Innos.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //Ti darò le armi e l'armatura di un cavaliere. Portale con onore, cavaliere!

	CreateInvItems (self,ITAR_PAL_M,1);
	B_GiveInvItems (self,other,ITAR_PAL_M,1);

	if ((other.HitChance[NPC_TALENT_2H]) >= (other.HitChance[NPC_TALENT_1H])) //Damit der SC auch seine Lieblingswaffe bekommt ;-)
	{
		CreateInvItems (self,ItMw_2h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_2h_Pal_Sword,1);
	}
	else
	{
		CreateInvItems (self,ItMw_1h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_1h_Pal_Sword,1);
	};		 
	
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,ITAR_PAL_M);

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //D'ora in avanti, in virtù del tuo rango, avrai libero accesso al monastero.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //Albrecht ti insegnerà la nostra magia. Vai a parlare con lui.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //E, naturalmente, i nostri alloggi nella parte alta della città sono ora aperti anche a te.

	hero.guild = GIL_PAL;
	Npc_SetTrueGuild (other, GIL_PAL);
	
	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};


//***********************************************
//	Wie kann ich mich würdig erweisen
//***********************************************

INSTANCE DIA_Lord_Hagen_WhatProof		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	991;
	condition	 = 	DIA_Lord_Hagen_WhatProof_Condition;
	information	 = 	DIA_Lord_Hagen_WhatProof_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Come posso provare di essere valoroso?";
};

FUNC INT DIA_Lord_Hagen_WhatProof_Condition ()
{	
	if (Hagen_GaveInfoKnight == TRUE)	
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_WhatProof_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //Come posso provare di essere valoroso?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //Le tue gesta riveleranno se sei degno o meno.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //Combattiamo per la libertà e la giustizia in nome di Innos.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //Combattiamo contro Beliar e i suoi seguaci, coloro che vogliono distruggere il giusto ordine di Innos.
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //Capisco.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //Non capisci un bel niente! Il nostro onore è la nostra vita e la nostra vita è Innos.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //Un paladino scende in battaglia lodando Innos e molti di noi hanno perso la vita sull'altare dell'eterno conflitto tra il bene e il male.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //Ognuno di noi si è impegnato secondo questa tradizione. Se falliamo, infanghiamo le gesta dei nostri compagni caduti.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //Solamente chi comprende veramente tutto ciò è degno di essere un paladino.
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

INSTANCE DIA_Lord_Hagen_KAP3_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP3_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   PERM KAP 3
// ************************************************************

var int Hagen_KnowsEyeKaputt;
// --------------------------

INSTANCE DIA_Lord_Hagen_KAP3U4_PERM(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 998;
	condition	= DIA_Lord_Hagen_KAP3U4_PERM_Condition;
	information	= DIA_Lord_Hagen_KAP3U4_PERM_Info;
	permanent	= TRUE;
	description = "Come vanno le cose?";
};                       
FUNC INT DIA_Lord_Hagen_KAP3U4_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3U4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //Come vanno le cose?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //Devo trovare un modo per salvare la spedizione.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //Dobbiamo fare qualcosa per i draghi.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //(tra sé) Forse l'Occhio di Innos può salvarci...
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //Finirò per impazzire. Sono un soldato, non un burocrate.
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //Con tutte queste scartoffie da smaltire, mi ricordo a malapena come si brandisce una spada.
	};
};

// ************************************************************
// 	  				   PERM KAP3U4
// ************************************************************

INSTANCE DIA_Lord_Hagen_EyeBroken(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 1;
	condition	= DIA_Lord_Hagen_EyeBroken_Condition;
	information	= DIA_Lord_Hagen_EyeBroken_Info;
	permanent	= FALSE;
	description = "Ho l’Occhio... è rotto.";
};                       
FUNC INT DIA_Lord_Hagen_EyeBroken_Condition()
{
	if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE)	))
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_EyeBroken_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_07"); //Ho l’Occhio... è rotto.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //COSA? Per Innos! Cos'hai fatto? Abbiamo bisogno dell'Occhio!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //Parla con Pyrokar! Dev'esserci un modo per rimetterlo insieme.
	Hagen_KnowsEyeKaputt = TRUE;
};

//*********************************************************************
//	Info BACKINTOWN
//*********************************************************************

instance DIA_Lord_Hagen_BACKINTOWN		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_BACKINTOWN_Condition;
	information	 = 	DIA_Lord_Hagen_BACKINTOWN_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Ho notizie per te da parte di Garond.";
};
func int DIA_Lord_Hagen_BACKINTOWN_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) >= 1)
	&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_BACKINTOWN_Info ()
{
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //Ti porto notizie da Garond. Tieni, mi ha dato questo messaggio per te.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //La nostra situazione è peggiore di quanto temessi. Ma riferiscimi la situazione della Valle delle Miniere.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //I paladini sono rintanati nel castello della Valle delle Miniere, circondati dagli orchi.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //Ci sono state molte perdite durante le operazioni di estrazione ed è rimasto a malapena del metallo.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //Beh, potrei anche dire che senza un aiuto i ragazzi sono perduti. Questa è la situazione.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //Troverò un modo per salvare la spedizione. Hai fatto molto per noi. Innos ti ringrazierà...
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //Non sono interessato alla sua gratitudine. Voglio il suo occhio.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //Sì, certo. Mantengo sempre la parola data. Prendi questa lettera, ti aprirà le porte del monastero.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //Parla con Pyrokar, il più potente Mago del Fuoco e mostragli questa autorizzazione. Ti concederà l'accesso all'Occhio di Innos.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //Un'altra cosa, prima di andare...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //Prendi questa runa come segno di gratitudine. Ti riporterà in città in tutta sicurezza ogni volta che lo desidererai.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"Lord Hagen mi ha affidato un messaggio. Questo convincerà maestro Pyrokar a consegnarmi l'Occhio di Innos, al monastero.");

			Wld_InsertNpc 		(VLK_4250_Jorgen,"NW_MONASTERY_BRIDGE_01");
			Wld_InsertNpc		(BDT_1050_Landstreicher, "NW_TROLLAREA_NOVCHASE_01");
			Wld_InsertNpc		(BDT_1051_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09"); 
			Wld_InsertNpc		(BDT_1052_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09");
			B_KillNpc 			(BDT_1020_Bandit_L);	//Joly: macht Platz für DMT_1200_Dementor
			Wld_InsertNpc		(DMT_1200_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1201_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1202_Dementor, "NW_TROLLAREA_RITUAL_01");
			//Wld_InsertNpc		(DMT_1203_Dementor, "NW_TROLLAREA_RITUAL_02");//Joly:waren zu viele!
			Wld_InsertNpc		(DMT_1204_Dementor, "NW_TROLLAREA_RITUAL_03");
			//Wld_InsertNpc		(DMT_1205_Dementor, "NW_TROLLAREA_RITUAL_04");
			Wld_InsertNpc		(DMT_1206_Dementor, "NW_TROLLAREA_RITUAL_05");
			Wld_InsertNpc		(DMT_1207_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1208_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1209_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1210_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1211_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			B_StartOtherRoutine (Pedro,"Tot"); 
				if (Npc_IsDead (MiltenNW))	//Wichtig, damit Milten vor dem Kloster steht!!!!!
				{ 
					Wld_InsertNpc (PC_MAGE_NW ,"NW_MONASTERY_ENTRY_01");
					B_StartOtherRoutine (MiltenNW,"START");		//zur Sicherheit
				};		
			Wld_InsertNpc		(NOV_650_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_650_ToterNovize);
			Wld_InsertNpc		(NOV_651_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_651_ToterNovize);
			Wld_InsertNpc		(NOV_652_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_652_ToterNovize);
			Wld_InsertNpc		(NOV_653_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_653_ToterNovize);
			Wld_InsertNpc		(NOV_654_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_654_ToterNovize);
			Wld_InsertNpc		(NOV_655_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_655_ToterNovize);
			Wld_InsertNpc		(NOV_656_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_656_ToterNovize);
	
			TEXT_Innoseye_Setting	=	TEXT_Innoseye_Setting_Broken; 
			Wld_InsertItem		(ItMi_InnosEye_Broken_Mis , "FP_TROLLAREA_RITUAL_ITEM"); 
};

//--------Hier kommt der gesamte Befreie den schmied Klumpatsch-------------


//*********************************************************
//		Lasse Bennet aus dem Knast
//*********************************************************

var int Hagen_einmalBennet;
// -----------------------

INSTANCE DIA_Lord_Hagen_RescueBennet		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_RescueBennet_Condition;
	information	 = 	DIA_Lord_Hagen_RescueBennet_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Ho bisogno di parlarti a proposito di Bennet.";
};

FUNC INT DIA_Lord_Hagen_RescueBennet_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Cornelius_IsLiar == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //Ho bisogno di parlarti a proposito di Bennet.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //Ma stai parlando del mercenario che ha ucciso uno dei miei uomini.
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Perché sei così sicuro che sia Bennet l’assassino?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Credo che Bennet sia innocente.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Bennet potrebbe aiutarci a riparare l’Occhio di Innos.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //Bennet potrebbe aiutarci a riparare l’Occhio di Innos.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //Anche se potesse evocare il potere di Innos stesso sulla terra...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //Ha assassinato un paladino. Verrà giustiziato per questo!
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //Perché sei così sicuro che sia Bennet l’assassino?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //Abbiamo un testimone.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //Come puoi vedere, non c'è alcun dubbio riguardo la colpevolezza di quel mercenario.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Chi sarebbe questo testimone?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, il segretario del governatore, ha assistito all'omicidio.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //La sua descrizione calza a pennello a Bennet, non ci sono dubbi. Per quanto mi riguarda, questo basta.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Il mercenario verrà impiccato per tradimento.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, il segretario del governatore, è il testimone. Egli afferma di avere assistito all'omicidio."); 

	RecueBennet_KnowsCornelius = TRUE;
	//RescueBennet_KnowsWitness = TRUE; 
};
/*
FUNC VOID DIA_Lord_Hagen_RescueBennet_Witness()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Wer ist der Zeuge?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, der Sekretär des Statthalters, hat den Mord gesehen.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Seine Beschreibung trifft zweifelsfrei auf Bennet zu. Damit ist die Sache für mich erledigt.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Der Söldner wird wegen Landesverrats hängen.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, der Sekretär des Stadthalters, ist also der Zeuge. Er behauptet, den Mord beobachtet zu haben."); 

	RecueBennet_KnowsCornelius = TRUE;
};
*/
FUNC VOID DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //Credo che Bennet sia innocente.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //Le prove sono inconfutabili. Egli è colpevole.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //Cosa succederebbe se la prova fosse inattendibile?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //Attento a quello che dici. Stai facendo delle gravi accuse.
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //Se non puoi portarmi la prova che il testimone ha mentito, allora farai meglio a tenere a freno la lingua.
};


//**************************************************************
//	Cornelius hat gelogen.	
//**************************************************************

INSTANCE DIA_Lord_Hagen_Cornelius		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_Cornelius_Condition;
	information	 = 	DIA_Lord_Hagen_Cornelius_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Cornelius ha mentito.";
};

FUNC INT DIA_Lord_Hagen_Cornelius_Condition ()
{	
	if (Npc_HasItems (other,ItWr_CorneliusTagebuch_Mis) >= 1)
	&& (Cornelius_IsLiar == TRUE)
	&& (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Cornelius_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //Cornelius ha mentito.
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //Come fai a saperlo?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //Tieni, è il suo diario. È tutto qui dentro.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //(furioso) Quel viscido delinquente!
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //Di fronte a questa nuova prova non c'è nient'altro da fare.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //Per i poteri conferitimi dal re e dalla chiesa, dichiaro...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //...che il prigioniero Bennet è sollevato da tutte le accuse, e pertanto è nuovamente un uomo libero.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //Cornelius dovrà essere immediatamente arrestato per spergiuro.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //Risparmiati la fatica, Cornelius è morto.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //Allora ha già ricevuto la sua giusta punizione. Ben fatto.
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //Ha già tagliato la corda.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //Prima o poi spunterà fuori. E allora lo arresteremo.
		B_StartOtherRoutine (Cornelius,"FLED");
	}
	else 
	{
		B_StartOtherRoutine (Cornelius,"PRISON");
	};
	
	
	MIS_RescueBennet = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_RescueBennet);
	
	if (hero.guild == GIL_MIL)
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //Le tue gesta potrebbero provenire da un onore pari al nostro.
	};
};
//--------Hier endet der gesamte Befreie den Schmied Klumpatsch-------------




//**************************************************************
//	Auge Innos ganz!	
//**************************************************************

INSTANCE DIA_Lord_Hagen_AugeAmStart	(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	4;
	condition	 = 	DIA_Lord_Hagen_AugeAmStart_Condition;
	information	 = 	DIA_Lord_Hagen_AugeAmStart_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Ho con me l’Occhio!";
};

FUNC INT DIA_Lord_Hagen_AugeAmStart_Condition ()
{	
	if (Kapitel <= 4)
	&& (MIS_ReadyForChapter4 == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_AugeAmStart_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //Ho con me l’Occhio!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //(riverente) Hai con te l'Occhio!
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //E l'hai anche riparato!
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //Dunque tu sei l'Eletto di Innos!
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //Partirò e andrò a uccidere tutti i draghi della Valle delle Miniere!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //Vai con Innos e distruggi il Male con il suo potere!
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

INSTANCE DIA_Lord_Hagen_KAP4_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP4_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Antipaladine
///////////////////////////////////////////////////////////////////////

instance DIA_Lord_Hagen_ANTIPALADINE(C_INFO)
{
	npc		 	= 	PAL_200_Hagen;
	nr		 	= 	3;
	condition	 = 	DIA_Lord_Hagen_ANTIPALADINE_Condition;
	information	 = 	DIA_Lord_Hagen_ANTIPALADINE_Info;
	permanent	 = 	TRUE;

	description	 = 	"I guerrieri migliori degli orchi stanno attaccando il territorio.";
};

func int DIA_Lord_Hagen_ANTIPALADINE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)))
	&& (Hagen_SawOrcRing == FALSE)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};
var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //I guerrieri migliori degli orchi stanno attaccando il territorio.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Ho informato Lord Hagen delle orde dei signori degli orchi in avvicinamento."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //Cosa te lo fa pensare?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //Ho parlato con uno di loro. Hanno menzionato il tuo nome.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //Sciocchezze. I miei uomini non hanno segnalato nessuna invasione di orchi finora.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //Forse alcuni dei loro esploratori si sono persi nei boschi della zona.

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //Non erano esploratori. Ho preso questo anello da uno di loro.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //Fammelo vedere.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //Mmmh. Questo è sicuramente inquietante.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //Questo è il segno della loro forza. Dunque gli orchi hanno lasciato le palizzate e stanno combattendo in campo aperto.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //Non ne ho visti tantissimi finora. Principalmente i loro signori della guerra e qualche guerriero.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //Davvero? Allora staranno complottando qualcos'altro. È strano che i capi degli orchi lascino la protezione delle palizzate da soli.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //Tuttavia, sarebbe una buona opportunità per infliggergli un colpo significativo.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //Se perderanno i loro capi, il morale delle truppe calerà.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //Hai un nuovo incarico, cavaliere. Vai a uccidere tutti i capi degli orchi che troverai nella zona.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //Portami i loro anelli. Sarà un brutto colpo per gli orchi.
			
			B_LogEntry (TOPIC_OrcElite,"Ho portato a Hage l'anello di un signore degli orchi come prova. Vuole che gli porti tutti quelli che riuscirò a trovare."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //Chiedi informazioni a Ingmar. Ti può dare un paio di dritte su come combattere contro i capi degli orchi.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //I guerrieri orchi d'élite sono la sua specialità. Si è spesso dovuto occupare di loro.
			B_LogEntry (TOPIC_OrcElite,"I guerrieri orchi d'elite sono la specialità di Ingmar."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //La tua parola che hai ucciso il signore della guerra capo degli orchi non basta.
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //Mi serve una prova tangibile, se dovrò reagire di conseguenza.
		
			B_LogEntry (TOPIC_OrcElite,"Hagen non è disposto a credermi. Chiede una prova che i guerrieri d'élite stiano attaccando le terre civilizzate. Beh, mi sarei sorpreso se non lo avesse fatto."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info RingeBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_RINGEBRINGEN		(C_INFO)
{
	npc		 = 	PAL_200_Hagen;
	nr		 = 	5;
	condition	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Condition;
	information	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ho qualcos’altro da riferire sugli uomini di guerra orcheschi.";
};

func int DIA_Lord_Hagen_RINGEBRINGEN_Condition ()
{
	if (Hagen_SawOrcRing == TRUE)
	&& (Npc_HasItems (other,ItRi_OrcEliteRing) >= 1)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

var int OrkRingCounter;

func void DIA_Lord_Hagen_RINGEBRINGEN_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //Ho qualcos’altro da riferire sugli uomini di guerra orcheschi.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //Allora dimmi.

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld für einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //Posso darti un altro anello degli orchi.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //Posso darti alcuni anelli degli orchi.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //Sono fiero di te. Continua così!

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //Potrebbe essercene qualcun altro là fuori.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //Presto saranno in ginocchio.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //Sarei sorpreso se tu ne trovassi ancora in giro molti.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //Sei libero di continuare a portarmi i loro anelli, ma penso che gli orchi abbiano capito il messaggio ormai.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //Tieni. Permettimi di darti dell'oro per il tuo equipaggiamento.

	OrcRingGeld	= (Ringcount * HagensRingOffer);	

	CreateInvItems (self, ItMi_Gold, OrcRingGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OrcRingGeld);
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

INSTANCE DIA_Lord_Hagen_KAP5_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP5_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************************
//		Die Drachen sind tot
//****************************************************************************

INSTANCE DIA_Lord_Hagen_AllDragonsDead(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_AllDragonsDead_Condition;
	information	= DIA_Lord_Hagen_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "I draghi sono morti.";
};                       
FUNC INT DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //I draghi sono morti.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //Sapevo che Innos ti avrebbe dato la forza per sconfiggere i draghi!
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //Dov'è il metallo?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //Gli orchi assediano ancora il castello nella Valle delle Miniere. Garond non può lasciare il castello fino a quando l'assedio non avrà termine.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //(furioso) Dannazione!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //Se Garond non è in grado di gestire la situazione, allora dovrò occuparmene di persona.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //Non mi farò fermare da un paio di orchi! Non io!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //Ho già informato i miei uomini. Siamo pronti a partire.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //Andremo TUTTI quanti. Lascerò solo qualche guardia sulla nave.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //Questo dovrebbe essere sufficiente a porre fine agli orchi!

	MIS_SCVisitShip = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"ShipFree");	
};

// ************************************************************
// 	  				   Ich brauche das Schiff
// ************************************************************

INSTANCE DIA_Lord_Hagen_NeedShip(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_NeedShip_Condition;
	information	= DIA_Lord_Hagen_NeedShip_Info;
	permanent	= FALSE;
	description = "Mi serve una nave.";
};                       
FUNC INT DIA_Lord_Hagen_NeedShip_Condition()
{
	if (ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_NeedShip_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //Mi serve una nave.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //Allora hai bisogno di molte persone, soldato.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //(ride) È una frase che sento quasi tutti i giorni, venerabile. Ma...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //Non hai neanche un capitano, per non parlare dell'equipaggio.
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //Che mi dici della nave nel porto?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //Appartiene a me, e ciò basta. Trasporteremo il metallo con quella nave.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //Una volta che avremo finito, potrai chiedermelo di nuovo.
};


// ************************************************************
// 	  				 Tor auf
// ************************************************************

INSTANCE DIA_Lord_Hagen_GateOpen (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_GateOpen_Condition;
	information	= DIA_Lord_Hagen_GateOpen_Info;
	permanent	= FALSE;
	description = "Gli orchi hanno attaccato il castello nella Valle delle Miniere!";
};                       
FUNC INT DIA_Lord_Hagen_GateOpen_Condition()
{
	if (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_GateOpen_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //Gli orchi hanno attaccato il castello nella Valle delle Miniere!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //Per Innos! Cos'è successo esattamente?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //I cancelli sono stati aperti in qualche modo...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //In qualche modo?!? Com'è possibile... Dev'esserci un traditore all'interno del castello!
};

// ************************************************************
// 	  						 PERM
// ************************************************************

INSTANCE DIA_Lord_Hagen_Perm5 (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_Perm5_Condition;
	information	= DIA_Lord_Hagen_Perm5_Info;
	permanent	= TRUE;
	description = "Che cosa stai aspettando?";
};                       
FUNC INT DIA_Lord_Hagen_Perm5_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_Perm5_Info()
{	
	AI_Output (other,self, "DIA_Lord_Hagen_Add_15_33"); //Che cosa stai aspettando?
	if (MIS_OCGateOpen == FALSE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //Stiamo aspettando l'equipaggiamento e le provviste. Poi partiremo immediatamente!
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //Ora che il castello è stato assaltato, abbiamo bisogno di ancora più provviste.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //Ma ciò non ritarderà la nostra partenza a lungo.
	};
};
