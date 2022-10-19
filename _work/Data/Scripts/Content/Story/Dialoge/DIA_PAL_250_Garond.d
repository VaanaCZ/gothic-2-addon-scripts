// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_garond_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_EXIT_Condition;
	information	= DIA_Garond_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Garond_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garond_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Garond_LastPetzCounter;
var int Garond_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Garond_PMSchulden (C_INFO)
{
	npc         = PAL_250_Garond;
	nr          = 1;
	condition   = DIA_Garond_PMSchulden_Condition;
	information = DIA_Garond_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Garond_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Garond_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Garond_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garond_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Non discuteremo di nulla fino a quando non avrai pagato la tua penale.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //Ed essa è salita in seguito alle ultime accuse.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Sembra che tu ti sia cacciato in altri guai.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //Ma spero che pagherai per tutto quanto ora! In totale, si arriva a...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Sono molto deluso. La tua penale ammonta a...
		};
				
		var int diff; diff = (B_GetTotalPetzCounter(self) - Garond_LastPetzCounter);
		
		if (diff > 0)
		{
			Garond_Schulden = Garond_Schulden + (diff * 50);
		};
		
		if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
		B_Say_Gold (self, other, Garond_Schulden);
	}
	else if (B_GetGreatestPetzCrime(self) < Garond_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Sono spuntate fuori alcune novità.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Improvvisamente non sei più accusato di omicidio.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Nessuno ricorda di averti visto commettere un furto.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //Non c'è più alcun testimone che dichiara di averti visto coinvolto in qualche rissa.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Sembra che tutte le accuse nei tuoi confronti siano cadute.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //Non ho idea di cosa stia succedendo qui, ma ti avverto... non esagerare!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //Ho deciso di dimenticare i tuoi debiti.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //E non finire più nei guai all'interno del castello!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //Voglio che sia chiara una cosa: dovrai comunque pagare tutta la tua penale.
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //Allora, cosa ne pensi?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Non ho abbastanza oro!",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Qual era il prezzo?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"Voglio pagare la penale!",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //Qual era il prezzo?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Non ho abbastanza oro!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Qual era il prezzo?",DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PMSchulden,"Voglio pagare la penale!",DIA_Garond_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Garond_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Garond_PETZMASTER   (C_INFO)
{
	npc         = PAL_250_Garond;
	nr          = 1;
	condition   = DIA_Garond_PETZMASTER_Condition;
	information = DIA_Garond_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Garond_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Garond_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_PETZMASTER_Info()
{
	Garond_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Garond noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Così tu sei quello che ha combinato tutti questi guai nel castello.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //Mi stavo domandando quando saresti venuto da me.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //L'omicidio è proprio l'ultima cosa di cui abbiamo bisogno qui.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //Ho bisogno di ogni singolo uomo, e ora ne ho un altro in meno!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //Per non parlare degli altri guai nei quali ti sei cacciato.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Lascia che ti spieghi qualcosa. Siamo tutti nella stessa trappola qui.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //E ho disperatamente bisogno di ogni singolo uomo, te compreso.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Se senti di dover uccidere qualcuno, tutto quello che devi fare è lasciare il castello. Ci sono un sacco di orchi da uccidere là fuori.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Dovrò importi una punizione, sebbene io detesti veramente dovermi occupare di queste scelleratezze.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //Girano voci che tu stia rubacchiando alcune cose qui.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //Per non parlare delle altre cose di cui ho sentito.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Non la passerai liscia. Sembra che tu non capisca la serietà della situazione.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Dovrai pagare una penale per compensare i tuoi crimini!
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Non mi piace assistere a delle risse tra i miei uomini.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //E quella faccenda della pecora, non era comunque necessaria.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Quindi dovrai pagare una penale per questo!
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Ti sei messo a uccidere le nostre pecore? Esse appartengono a tutti.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Dovrai pagare per il cibo.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Quanto vuoi?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"Non ho abbastanza oro!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Voglio pagare la penale!",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Voglio pagare la penale!
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //D'accordo, dirò ai ragazzi di calmarsi. Ma non farti più beccare a farlo di nuovo!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //Non ho abbastanza oro!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //Allora dovresti tornare con l'oro il più presto possibile.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //E ti avverto, causa altri guai in futuro, e il prezzo salirà!
	
	Garond_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Garond_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Garond_Hello (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Hello_Condition;
	information	= DIA_Garond_Hello_Info;
	IMPORTANT 	= TRUE;
	permanent	= FALSE;
};                       

FUNC INT DIA_Garond_Hello_Condition()
{
	if (Kapitel == 2)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garond_Hello_Info()
{	
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //Da dove vieni? Non sei uno dei minatori, e non sei uno dei miei uomini. Dunque?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Sono giunto attraverso il passo.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //Oltre il passo...? Sei riuscito a passare, per Innos!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Perché hai scelto questa via, mago?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Quali sono i tuoi ordini, soldato?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Mi chiedo perché un mercenario se ne sia preso la briga. Cosa ci fai qui?
		};
};

//**********************************
//	Ich brauch Beweise 
//**********************************

INSTANCE DIA_Garond_NeedProof (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 1;
	condition	= DIA_Garond_NeedProof_Condition;
	information	= DIA_Garond_NeedProof_Info;
	description = "Sono stato da Lord Hagen";
};                       

FUNC INT DIA_Garond_NeedProof_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garond_Hello))
	&& (MIS_OLDWORLD == LOG_RUNNING)
	&&	(Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garond_NeedProof_Info()
{		
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Vengo per conto di Lord Hagen. Vuole che io gli porti la prova della presenza dei draghi.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //E tu sei venuto qui solamente per trovarla e sparire nuovamente?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //È quello che intendo di fare.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //Dunque vuole delle prove? Le avrà. Ma non posso rimandarti da Lord Hagen senza fornirgli delle informazioni riguardo il metallo.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //Ascolta, Lord Hagen deve assolutamente venire a sapere qual è la situazione qui e quanto metallo abbiamo estratto finora.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //D'accordo, cosa vuoi che faccia per te?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //Ho tre gruppi di minatori là fuori, ma non mi hanno ancora inviato una singola pepita.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Vai a controllare le miniere e riferiscimi quanto metallo hanno estratto.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //Dopo di che, ti scriverò una lettera da consegnare a Lord Hagen.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Oh, beh... sembra che io non abbia scelta.
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Prima che il Comandante Garond mi mandi indietro, vuole che cerchi i tre gruppi di estrattori e riferirgli quanto metallo è stato messo via.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Il comandante Garond mi ha dato un incarico. Ha mandato fuori tre gruppi di estrattori alla ricerca di metallo magico. Non ne hanno ancora portato indietro.");
	B_LogEntry (TOPIC_ScoutMine,"Devo trovare i tre gruppi di estrattori e scoprire quanto metallo hanno messo da parte.");

};
// ************************************************************
// 			  Warum ich?
// ************************************************************

INSTANCE DIA_Garond_Why (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Why_Condition;
	information	= DIA_Garond_Why_Info;
	permanent	= FALSE;
	description = "Perché, fra tutti, proprio io?";
};                       

FUNC INT DIA_Garond_Why_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Why_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Perché, fra tutti, proprio io?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Perché conosci una via attraverso le fila degli orchi. I miei ragazzi sarebbero irrimediabilmente perduti là fuori.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //Tu, d'altro canto, sei già riuscito a passare una volta, e questo ti rende la persona più adatta per questo lavoro.
};
// ************************************************************
// 			Ausrüstung
// ************************************************************

INSTANCE DIA_Garond_Equipment (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Equipment_Condition;
	information	= DIA_Garond_Equipment_Info;
	permanent	= FALSE;
	description = "Ho bisogno di equipaggiamento.";
};                       

FUNC INT DIA_Garond_Equipment_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& ((other.guild == GIL_KDF)
	||  (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Equipment_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Ho bisogno di equipaggiamento.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Parla con il mago Milten qui al castello. Egli saprà cosa ti occorrerà.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Parlane con Tandor. Potrà fornirti tutto quello di cui avrai bisogno.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor commercia in armi al castello.");
	};
};
// ************************************************************
// 			Zahlen
// ************************************************************

INSTANCE DIA_Garond_zahlen (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_zahlen_Condition;
	information	= DIA_Garond_zahlen_Info;
	permanent	= FALSE;
	description = "Quanto sei disposto a pagarmi per il lavoro?";
};                       

FUNC INT DIA_Garond_zahlen_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_zahlen_Info()
{		
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Quanto sei disposto a pagarmi per il lavoro?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //(irritato) Non sono abituato a contrattare con i mercenari.
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Oh beh, immagino di non avere scelta. Ti pagherò 500 pezzi d'oro se ti occuperai di questa missione.
};
// ************************************************************
// 	Wo finde ich die Schürfstellen?
// ************************************************************

INSTANCE DIA_Garond_Wo (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Wo_Condition;
	information	= DIA_Garond_Wo_Info;
	permanent	= FALSE;
	description = "Dove si trovano i siti minerari?";
};                       

FUNC INT DIA_Garond_Wo_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Wo_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Wo_15_00"); //Dove si trovano i siti minerari?
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //Tieni, prendi questa mappa. Mostra le due aree dove sono situate le miniere.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Se hai altre domande, chiedi a Parcival. Ti potrà dire tutto quello di cui avrai bisogno sui minatori.
	
	B_LogEntry (TOPIC_ScoutMine,"Il paladino Parcival può darmi informazioni sugli estrattori.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Dannazione! Cosa sta succedendo là fuori? Beliar in persona è giunto ad annientarci?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //I miei uomini sono quasi tutti morti, e con quel poco di metallo che abbiamo NON POSSIAMO NEMMENO FERMARE UN ORCO, FIGURIAMOCI UN ESERCITO!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Questa spedizione è destinata a fallire.
};

// ************************************************************
// 	Fajeth
// ************************************************************
INSTANCE DIA_Garond_Fajeth (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Fajeth_Condition;
	information	= DIA_Garond_Fajeth_Info;
	permanent	= FALSE;
	description = "Ho parlato con Fajeth.";
};                       

FUNC INT DIA_Garond_Fajeth_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Fajeth_Ore == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Fajeth_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_00"); //Ho parlato con Fajeth.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //Cosa ti ha detto?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //I suoi uomini hanno estratto due casse di metallo.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Mmmh... Due casse? Non mi servono due casse, me ne servono DUECENTO.
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Dice che ha bisogno di altri uomini.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Cosa? Dovrei dunque mandare altri uomini verso morte certa? Può scordarselo.
 	
 	Ore_Counter = (Ore_Counter +1);
 	B_GivePlayerXP (XP_Fajeth_Ore);
 	
 	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};

// ************************************************************
// 	Silvestro
// ************************************************************
INSTANCE DIA_Garond_Silvestro (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Silvestro_Condition;
	information	= DIA_Garond_Silvestro_Info;
	permanent	= FALSE;
	description = "Riguardo al sito minerario di Silvestro...";
};                       

FUNC INT DIA_Garond_Silvestro_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Silvestro_Ore == TRUE)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Silvestro_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Riguardo al sito minerario di Silvestro...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Lo hai incontrato? Gli hai parlato?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Sono tutti morti laggiù. Sono stati sorpresi dagli scavaragni.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //Che mi dici del metallo? Sai quanto ne hanno estratto?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Sono riusciti a mettere al sicuro qualche cassa. Sono in una caverna, lungo il sentiero che collega il castello alla miniera.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Dannazione! Erano degli uomini valorosi... possa Innos avere pietà delle loro anime.
	
	Ore_Counter = (Ore_Counter +1);
	B_GivePlayerXP (XP_Silvestro_Ore);
	
	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};
// ************************************************************
// 	Marcos
// ************************************************************
INSTANCE DIA_Garond_Marcos (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Marcos_Condition;
	information	= DIA_Garond_Marcos_Info;
	permanent	= FALSE;
	description = "Ho incontrato Marcos.";
};                       

FUNC INT DIA_Garond_Marcos_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Marcos_Ore == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Marcos_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Marcos_15_00"); //Ho incontrato Marcos.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //E... ? Cos'ha da riferire? Quanto metallo ha pronto per noi?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Quattro casse. Ha lasciato la miniera per portare il metallo al sicuro.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Ora sta proteggendo le casse in una piccola valle dietro le linee degli orchi. Tuttavia, chiede dei rinforzi.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Cosa? Solo quattro casse... e ha lasciato la miniera? Dannazione, non va per niente bene.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //E ora vuole altri uomini...? Bene, d'accordo, gli manderò un paio di persone.
	
	
	Marcos_Guard1.flags = 0;
	Marcos_Guard2.flags = 0;
	
	B_StartOtherRoutine (Marcos_Guard1,"MARCOS");
	B_StartOtherRoutine (Marcos_Guard2,"MARCOS");
	
	AI_Teleport (Marcos_Guard1,"OW_STAND_GUARDS");
	AI_Teleport (Marcos_Guard1,"OW_STAND_GUARDS");
	
	Ore_Counter = (Ore_Counter +1);
	MIS_Marcos_Jungs = LOG_SUCCESS;

	B_GivePlayerXP (XP_Marcos_Ore);
	
	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};		
// ************************************************************
// Info Success
// ************************************************************

INSTANCE DIA_Garond_Success (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Success_Condition;
	information	= DIA_Garond_Success_Info;
	permanent	= FALSE;
	description = "E lettera di Lord Hagen?";
};                       

FUNC INT DIA_Garond_Success_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Success_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Success_15_00"); //E la lettera di Lord Hagen?
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //Abbiamo dieci casse di metallo in tutto, e abbiamo perduto un numero doppio di validi uomini.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Avrai la tua lettera. Lord Hagen DEVE sapere cosa sta succedendo. Questa valle è maledetta, il male risiede qui.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Il comandante Garond mi ha dato una lettera. Anche questa dovrebbe essere una prova. Posso portarla a Lord Hagen.");
	
	MIS_ScoutMine = LOG_SUCCESS;
	B_GivePlayerXP (XP_ScoutMine);
	MIS_ReadyForChapter3  = TRUE; 	//Joly: Bei Levelchange ab hier in die Newworld  -> Kapitel 3!!!!!!
	B_NPC_IsAliveCheck (OldWorld_Zen);
};
// ************************************************************
// SLD bezahlen
// ************************************************************

INSTANCE DIA_Garond_SLD (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_SLD_Condition;
	information	= DIA_Garond_SLD_Info;
	permanent	= FALSE;
	description = "E la mia paga?";
};                       

FUNC INT DIA_Garond_SLD_Condition()
{
	if (MIS_ScoutMine == LOG_SUCCESS)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_SLD_Info()
{		
	AI_Output (other,self ,"DIA_Garond_SLD_15_00"); //E la mia paga?
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //Ah sì, giusto. Ti devo ancora dell'oro. Ecco la tua ricompensa.
	B_GiveInvItems (self, other, itMI_Gold, 500);
};
// ************************************************************
// Info Perm wenn Scout Mine == RUNNING
// ************************************************************
INSTANCE DIA_Garond_Running (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 10;
	condition	= DIA_Garond_Running_Condition;
	information	= DIA_Garond_Running_Info;
	permanent	= TRUE;
	description = "Come vanno le cose?";
};                       

FUNC INT DIA_Garond_Running_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Running_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //Come vanno le cose?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Ora sto solo aspettando notizie dall'ultima miniera, e spero che siano buone notizie.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Ho bisogno dei rapporti da parte delle altre due miniere. Dopo vedremo.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Dovresti partire per le miniere. Ho un disperato bisogno di notizie sullo stato dell'estrazione del metallo.
	};
	
};
// ************************************************************
// Gorn
// ************************************************************

INSTANCE DIA_Garond_Gorn (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Gorn_Condition;
	information	= DIA_Garond_Gorn_Info;
	permanent	= FALSE;
	description = "Voglio che lasci libero Gorn.";
};                       

FUNC INT DIA_Garond_Gorn_Condition()
{
	if (Npc_KnowsInfo (other, DIA_MiltenOW_Gorn))
	&& (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_Garond_NeedProof))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Gorn_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Gorn_15_00"); //Voglio che lasci libero Gorn.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //Non posso rilasciarlo. Ha commesso molti crimini e deve scontarli.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //Posso pagare la penale al posto suo?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //Potrebbe essere una possibilità, ma sicuramente non una economica. Voglio 1000 pezzi d'oro per Gorn.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //Sono un sacco di soldi.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //Anche Gorn ha molto di cui rispondere. Portami l'oro e io libererò Gorn.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Garond vuole un migliaio di pezzi d'oro per liberare Gorn.");
};
// ************************************************************
// Gorn freikaufen
// ************************************************************

INSTANCE DIA_Garond_Pay (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Pay_Condition;
	information	= DIA_Garond_Pay_Info;
	permanent	= TRUE;
	description = "Voglio comprare la libertà di Gorn. (Paga 1000 monete d’oro)";
};                       
FUNC INT DIA_Garond_Pay_Condition()
{
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Pay_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Voglio pagare per liberare Gorn.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //D'accordo. Puoi andare da Gerold e dirgli di rilasciare Gorn su mio ordine.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Ho pagato Garond. Ora posso tirare fuori Gorn. La guardia Gerold lo lascerà andare.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //Allora portami 1000 pezzi d'oro.
	};	
};
// ************************************************************
// Info Perm in Kap.2
// ************************************************************
INSTANCE DIA_Garond_Perm2 (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 9;
	condition	= DIA_Garond_Perm2_Condition;
	information	= DIA_Garond_Perm2_Info;
	permanent	= TRUE;
	description = "Cosa pensi di fare, adesso?";
};                       

FUNC INT DIA_Garond_Perm2_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garond_Success)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Perm2_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Cosa pensi di fare adesso?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //Ho provato di tutto. Ormai sei l'unica speranza che Lord Hagen mi mandi dei rinforzi.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Continueremo a resistere e pregare che Innos non ci abbandoni allo sconforto in questi tempi oscuri.
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

INSTANCE DIA_Garond_KAP3_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP3_EXIT_Condition;
	information	= DIA_Garond_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGibtsNeues
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_WASGIBTSNEUES		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	30;
	condition	 = 	DIA_Garond_WASGIBTSNEUES_Condition;
	information	 = 	DIA_Garond_WASGIBTSNEUES_Info;
	permanent	 = 	TRUE;
	description	 = 	"Novità?";
};

func int DIA_Garond_WASGIBTSNEUES_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Garond_WASGIBTSNEUES_Info ()
{
	AI_Output (other, self, "DIA_Garond_WASGIBTSNEUES_15_00"); //Novità?
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Dannazione. Perché rimani qui a perdere tempo? Ho bisogno di quei maledetti rinforzi!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Persino Milten ha lasciato il castello. Ma non mi servono meno persone, me ne servono di più!
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

INSTANCE DIA_Garond_KAP4_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP4_EXIT_Condition;
	information	= DIA_Garond_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_BACKINKAP4		(C_INFO)
{
	npc		 = 	PAL_250_Garond;
	nr		 = 	12;
	condition	 = 	DIA_Garond_BACKINKAP4_Condition;
	information	 = 	DIA_Garond_BACKINKAP4_Info;
	Permanent	 =	FALSE;
	description	 = 	"Sono tornato.";
};

func int DIA_Garond_BACKINKAP4_Condition ()
{
	if (Kapitel == 4)
		{
				return TRUE;
		};
};

func void DIA_Garond_BACKINKAP4_Info ()
{
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Sono tornato.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //Questo lo vedo da solo. Dove sono i rinforzi?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Lord Hagen verrà non appena avrà sistemato tutto quanto. Sono successe molte cose.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //Non mi interessa. Ho bisogno di truppe. Ci sono sempre più orchi, e non potremo resistere ancora a lungo.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //I miei uomini sono esausti, e stiamo esaurendo le provviste.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Sono arrivati alcuni volontari.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Intendi te stesso e i tuoi compagni cacciatori di draghi, eh? Potete aiutarci, ma siete ancora troppo pochi.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Intendi i cacciatori di draghi fuori nel cortile? Possono aiutarci, ma sono ancora troppo pochi.
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Se Hagen non mi invia al più presto degli uomini, non so cosa succederà.

	B_InitNpcGlobals ();//Joly: zur Sicherheit

	//	Angar wird zum Stonehenge geschickt
	//-----------------------------------------
	AI_Teleport 		 (DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");	
	B_StartOtherRoutine 	(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;


	// Die Drachenjäger vom Spielstart verziehen sich in ihr Lager.
	//-----------------------------------------
	B_StartOtherRoutine 	(Kjorn,	"START");
	B_StartOtherRoutine 	(Godar,	"START");
	B_StartOtherRoutine 	(Hokurn,"START");
	B_StartOtherRoutine 	(PC_Fighter_DJG,"START");
	B_StartOtherRoutine  (Kurgan,"START");

	if 	(DJG_BiffParty == FALSE)
	{
	B_StartOtherRoutine 	(Biff,"START");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_DragonPlettBericht		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	11;
	condition	 = 	DIA_Garond_DragonPlettBericht_Condition;
	information	 = 	DIA_Garond_DragonPlettBericht_Info;
	permanent	 = 	TRUE;
	description	 = 	"Riguardo ai dragoni...";
};

var int DIA_Garond_DragonPlettBericht_NoPerm;
func int DIA_Garond_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Garond_BACKINKAP4))
	&& (DIA_Garond_DragonPlettBericht_NoPerm == FALSE)
	{
		return TRUE;
	};
};

var int Garond_DragonCounter;
var int Garond_SwampdragonKilled_OneTime;
var int Garond_RockdragonKilled_OneTime;
var int Garond_FireDragonKilled_OneTime;
var int Garond_IcedragonKilled_OneTime;
var int Garond_OricExperte_OneTime;
func void DIA_Garond_DragonPlettBericht_Info ()
{
	B_LogEntry (TOPIC_DRACHENJAGD,"Garond è sicuramente interessato alla faccenda dei draghi, anche se dà l'impressione che non glie ne importi nulla."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //Ho alcune nuove notizie riguardanti i draghi.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //Dimmi tutto.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //Ho ucciso il drago nella palude a est di qui.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //Il drago nella fortezza di pietra a sud è morto.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //Il drago del fuoco nel vulcano a sud non seminerà più distruzione.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Sono stato nella regione dei ghiacci occidentale, e lì mi sono occupato del drago.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //Questa è una buona notizia. Tieni. Ti darò un po' di oro per il tuo equipaggiamento.
		
		DrachenGeld = (CurrentDragonCount * Garond_KilledDragonGeld);
		XP_LocalGarond =  (CurrentDragonCount * XP_Garond_KilledDragon);

		B_GivePlayerXP (XP_LocalGarond);

		CreateInvItems (self, ItMi_Gold, DrachenGeld);									
		B_GiveInvItems (self, other, ItMi_Gold, DrachenGeld);					

		Garond_DragonCounter = MIS_KilledDragons;

		if (MIS_AllDragonsDead == TRUE)
		{
			DIA_Garond_DragonPlettBericht_NoPerm = TRUE;
		};
	};
		
	if (Garond_OricExperte_OneTime == FALSE)
	&& ((Npc_IsDead(Oric))	== FALSE)
	&& (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //Puoi darmi altre informazioni sui draghi?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Ho altre cose di cui occuparmi. Il mio stratega Oric potrà dirti di più sull'argomento.
		B_LogEntry (TOPIC_DRACHENJAGD,"L'ufficiale strategico di Garond, Oric, potrebbe avere delle informazioni utili per me."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Ci sono stati altri attacchi di drago nel frattempo?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Fortunatamente no. Per il momento si tengono a distanza.
	};
};

//*********************************************************************
//	Ich habe alle drachen getötet
//*********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_AllDragonDead		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	12;
	condition	 = 	DIA_Garond_AllDragonDead_Condition;
	information	 = 	DIA_Garond_AllDragonDead_Info;
	Permanent	 =	FALSE;
	description	 = 	"Tutti i draghi sono morti.";
};

func int DIA_Garond_AllDragonDead_Condition ()
{
	if (MIS_AllDragonsDead == TRUE)
	&& (DIA_Garond_DragonPlettBericht_NoPerm == TRUE)	
	&& (Kapitel >= 4)
	{
			return TRUE;
	};
};

func void DIA_Garond_AllDragonDead_Info ()
{
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //Tutti i draghi sono morti.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //(incredulo) Tutti quanti? Dunque il male è stato sgominato definitivamente?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //No, ahimè no. Rimane ancora il loro capo.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Non erano forse i draghi a capo degli orchi?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Sì, vero, ma anch'essi hanno il proprio padrone. Dobbiamo liberarci anche di esso.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Io non posso sicuramente andare. Devo proteggere il metallo, e quei maledetti orchi sono ancora in circolazione.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Dovrai occupartene da solo. Non posso aiutarti.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Che Innos ti protegga.
};

///////////////////////////////////////////////////////////////////////
//	Mission JanBecomeSmith
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_JanBecomeSmith		(C_INFO)
{
	npc			= 	PAL_250_Garond;
	nr		 	= 	12;
	condition	= 	DIA_Garond_JanBecomeSmith_Condition;
	information	= 	DIA_Garond_JanBecomeSmith_Info;
	Permanent	=	TRUE;
	description	= 	"C’è un problema con il fabbro.";
};

func int DIA_Garond_JanBecomeSmith_Condition ()
{
	if (MIS_JanBecomesSmith == LOG_RUNNING)
		&& (Kapitel >= 4)
	{
			return TRUE;
	};
};

func void DIA_Garond_JanBecomeSmith_Info ()
{
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //C’è un problema con il fabbro.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Quale fabbro? È scomparso nella falegnameria.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //È tornato? Allora puoi dirgli...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //No, sto parlando di Jan.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //È un Cacciatore di Draghi, proprio come me, e un buon fabbro.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Uno dei cacciatori di draghi. È un fabbro.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //Ottimo. Il nostro ultimo fabbro ha tagliato la corda, quel codardo.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan sarebbe felice di lavorare alla fucina.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Capisco. Dunque pensi io possa fidarmi di lui.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Sì.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Se sei così sicuro, allora potrai renderti suo garante.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Se causerà qualche guaio ne risponderai tu. D'accordo?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Ci penserò su.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Garantisco per Jan.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Ci penserò su.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Come posso fidarmi di lui se nemmeno tu ti fidi?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Senza qualcuno che garantisca per lui, questo Jan dovrà tenere le mani lontane dalla forgia.

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Garantisco per Jan.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //D'accordo. Può usare la fucina. Naturalmente, dovrà anche rifornire i miei uomini di spade.
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	MIS_JanBecomesSmith = LOG_SUCCESS; 
	B_GivePlayerXP (XP_Ambient);
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

INSTANCE DIA_Garond_KAP5_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP5_EXIT_Condition;
	information	= DIA_Garond_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm5
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_PERM5		(C_INFO)
{
	npc		 = 	PAL_250_Garond;
	nr		 = 	59;
	condition	 = 	DIA_Garond_PERM5_Condition;
	information	 = 	DIA_Garond_PERM5_Info;
	permanent	 = 	TRUE;

	description	 = 	"Come vanno le cose?";
};

func int DIA_Garond_PERM5_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Garond_PERM5_Info ()
{
	AI_Output			(other, self, "DIA_Garond_PERM5_15_00"); //Come vanno le cose?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //Un dannato casino! Qualche bastardo ha lasciato aperto il cancello principale. Ora siamo poco più che carne per i lupi.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Quando metterò le mani sul traditore...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Moriremo tutti come mosche se Hagen non arriverà al più presto.
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


INSTANCE DIA_Garond_KAP6_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP6_EXIT_Condition;
	information	= DIA_Garond_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
































