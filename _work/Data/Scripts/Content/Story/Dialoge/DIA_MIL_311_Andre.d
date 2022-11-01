// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_EXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_EXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos (self);

};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_FIRSTEXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_FIRSTEXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_StartOtherRoutine (Wulfgar,"START"); 
};




// ************************************************************
// 	  				   		Steckbrief
// ************************************************************
var int Andre_Steckbrief; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_Steckbrief()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //Uno dei miei uomini mi ha detto che i briganti stanno distribuendo dei manifesti con sopra la tua faccia.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //Ha aggiunto anche che all'inzio avevi negato.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //Allora di che si tratta?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //Non so cosa vogliano da me quei tizi...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //Spero per il tuo bene che tu stia dicendo la verità.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //Non posso ammettere nessuno nella guardia cittadina che non abbia la fedina penale pulita.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //La maggior parte di questi briganti sono ex detenuti della colonia mineraria.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //Spero solo che tu non abbia avuto a che fare con quei tagliagole!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //Il mercante Canthar è stato qui. Ha detto che sei un criminale evaso dalla colonia penale della miniera.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //Non so se questa sia la verità e preferisco non saperlo, ma dovresti chiarire questa faccenda.
	
	B_RemoveNpc (Sarah);
	
			
	B_StartOtherRoutine (Canthar,"MARKTSTAND");
	AI_Teleport (Canthar,"NW_CITY_SARAH");
					
	if (Canthar_Sperre == FALSE)
	&& (Canthar_Pay == FALSE)
	{
		Canthar_Sperre = TRUE; 
	};
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
	
	Andre_CantharFalle = TRUE;
};

// ************************************************************
// 			Canthar Falle als INFO (niedrige Important)
// ************************************************************

INSTANCE DIA_Andre_CantharFalle (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 3;
	condition   = DIA_Andre_CantharFalle_Condition;
	information = DIA_Andre_CantharFalle_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_CantharFalle_Condition()
{
	if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	&& (Andre_CantharFalle == FALSE)
	{
		return TRUE;
	};
	
	if (Pablo_AndreMelden == TRUE)
	&& (!Npc_IsDead(Pablo))
	&& (Andre_Steckbrief == FALSE)
	{
		return TRUE;
	};
};

FUNC INT DIA_Andre_CantharFalle_Info()
{
	if (Andre_Steckbrief == FALSE)
	{
		B_Andre_Steckbrief();
	};
	
	if (Andre_CantharFalle == FALSE)
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	{
		B_Andre_CantharFalle();
	};
};

// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Andre_PMSchulden (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Andre_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Andre_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //Sei venuto qui per pagare la tua penale?

						
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};
						
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};

	if (B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //Mi chiedevo se avessi mai osato venire qui!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //Sembra che le accuse a tuo carico si siano moltiplicate!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //Ti avevo avvertito! Ora devi pagare una penale più salata!
			AI_Output (other, self, "DIA_Andre_PMAdd_15_00"); //Quanto vuoi?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Andre_LastPetzCounter);
		
			if (diff > 0)
			{
				Andre_Schulden = Andre_Schulden + (diff * 50);
			};
		
			if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Andre_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //Mi hai davvero deluso!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //Sono cambiate alcune cose.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //All'improvviso non c'è più nessuno che ti accusa di omicidio.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //Nessuno si ricorda più di averti visto rubare.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //Non ci sono più testimoni del tuo coinvolgimento in una rissa.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //Sembra che tutte le accuse nei tuoi confronti siano cadute.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //Non so come sia potuto succedere, ma ti avverto: non cercare di fare il furbo con me.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //In ogni caso, ho deciso di annullare i tuoi debiti.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //Vedi di non cacciarti più in altri guai.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //Voglio che sia chiara una cosa: dovrai comunque pagare tutta la tua penale.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //Che c'è?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Non ho abbastanza oro!",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Qual era il prezzo?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"Voglio pagare la penale!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //Qual era il prezzo?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Non ho abbastanza oro!",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Qual era il prezzo?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"Voglio pagare la penale!",DIA_Andre_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Andre_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Andre_PETZMASTER   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Andre_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_PETZMASTER_Info()
{
	Andre_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Andre noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //Tu devi essere quello nuovo che ha causato tutti quei danni qui in città.
	};
	
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};	
	
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};
	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //È bello che tu ti sia consegnato spontaneamente prima di peggiorare ulteriormente la tua situazione.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //L'omicidio è un crimine grave!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //Per non parlare delle altre cose che hai fatto.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //La vigilanza ha l'ordine di uccidere ogni assassino sul posto.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //E la maggior parte dei cittadini non tollereranno un assassino in città!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //Non ho intenzione di impiccarti. Siamo in guerra e abbiamo bisogno di ogni uomo abile e arruolabile.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //Ma non sarà facile convincere la gente a comportarsi meglio nei tuoi confronti.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //Potresti mostrare il tuo pentimento pagando una penale, naturalmente dovrebbe essere una cifra ragionevolmente elevata.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //Sono contento che tu sia venuto! Sei accusato di furto! Ci sono dei testimoni!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //Non riporterò le altre cose che ho sentito.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //Non tollererò una simile condotta all'interno della città!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //Devi pagare una penale per espiare il tuo crimine.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //Una cosa è scatenare una rissa con la feccia al porto...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //Ma quando attacchi i cittadini o le guardie reali, devo portarti dinanzi alla giustizia..
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //E quella faccenda della pecora, non era comunque necessaria.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //Se chiudo un occhio, presto tutti qui faranno come gli pare.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //Pagherai un'ammenda approriata e il problema sarà risolto.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //Ho sentito che stavi cercando di rubare le nostre pecore.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //Ti renderai certamente conto che non posso lasciarti andare.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //Devi pagare una penale per compensare i tuoi crimini!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //Quanto vuoi?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"Non ho abbastanza oro!",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"Voglio pagare la penale!",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //Voglio pagare la penale!
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //Bene! Darò la notizia a tutta popolazione: questo ti aiuterà a recuperare parte della tua reputazione.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //Non ho abbastanza oro.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //Allora vedi di ottenere l'oro il più in fretta possibile.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //E ti avverto: se ti macchi di altri reati, le cose per te peggioreranno ulteriormente.
	
	Andre_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// *********************************************************
//							Hallo
// *********************************************************
instance DIA_Andre_Hallo		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Hallo_Condition;
	information	 = 	DIA_Andre_Hallo_Info;
	permanent 	 =  FALSE; 
	important    =  TRUE;
};
func int DIA_Andre_Hallo_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //Innos sia con te, straniero! Qual buon vento ti porta qui?
};



// *********************************************************
//					Nachricht für Lord Hagen
// *********************************************************
instance DIA_Andre_Message		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 1;
	condition	= DIA_Andre_Message_Condition;
	information	= DIA_Andre_Message_Info;
	permanent 	= FALSE; 
	description = "Ho un messaggio importante da parte di Lord Hagen.";
};
func int DIA_Andre_Message_Condition ()
{
	if (Kapitel < 3)
	&& ((hero.guild == GIL_NONE)
	|| (hero.guild == GIL_NOV))
	{
		return TRUE;
	};	
};
func void DIA_Andre_Message_Info ()
{
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //Ho un messaggio importante per Lord Hagen.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //Beh, ti trovi di fronte a uno dei suoi uomini. Di cosa si tratta?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "Questo lo dirò personalmente a Lord Hagen.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "Gli eserciti degli orchi sono guidati dai DRAGHI!", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "Si tratta di un artefatto sacro: l’Occhio di Innos.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Lord Hagen riceve solo i paladini o coloro che sono al loro servizio.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //Va contro la sua dignità sprecare il proprio tempo con la plebaglia.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //Si tratta di un artefatto sacro: l’Occhio di Innos.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //L'Occhio di Innos? Non l'ho mai sentito nominare. Ma questo non significa necessariamente qualcosa.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //Ad ogni modo, solo i membri più importanti del nostro ordine potrebbero essere a conoscenza di un artefatto del genere, ammesso che esista davvero.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //È per questo che devo parlare con Lord Hagen in persona.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //Gli eserciti degli orchi sono guidati dai DRA
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //(interrompendolo) Lo SO che gli eserciti degli orchi stanno diventando sempre più forti.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //Non vorrai dirmi che è questo che devi riferire a Lord Hagen?
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //Ti staccherebbe la testa dal collo se gli facessi perdere tempo con queste storie.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //E sono sicuro che sei abbastanza furbo da saperlo.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //Di che si tratta veramente?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //Questo lo dirò personalmente a Lord Hagen.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Fa' come ti pare. Ma sappi una cosa:
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_Paladine		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_Paladine_Condition;
	information	 = 	DIA_Andre_Paladine_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Perché voi paladini siete in città?";	
};
func int DIA_Andre_Paladine_Condition ()
{	
	if (other.guild != GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //Perché voi paladini siete in città?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //Gli obiettivi della nostra missione sono segreti.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //Posso solo dirti che non c'è pericolo per i cittadini qui.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //Non devi preoccuparti.
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_PaladineAgain		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_PaladineAgain_Condition;
	information	 = 	DIA_Andre_PaladineAgain_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Perché voi paladini siete in città?";	
};
func int DIA_Andre_PaladineAgain_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_PaladineAgain_Info ()
{
	if Npc_KnowsInfo (other,DIA_Andre_Paladine)
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //Mi dici allora cosa ci fate a Khorinis voi paladini?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //Perché voi paladini siete in città?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Ora fai parte della guardia cittadina, quindi anche tu sei alle dipendenze dei paladini.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //Ora posso svelarti qualche segreto.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //Siamo qui in missione per conto di re Rhobar. Dopo il crollo della Barriera, le consegne di metallo sono venute meno.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Perciò siamo venuti qui per prendere di persona il metallo e trasportarlo sul continente. Con esso forgeremo nuove armi e cacceremo gli orchi.
	
	KnowsPaladins_Ore = TRUE;
};
// *********************************************************
//						AskToJoin
// *********************************************************
instance DIA_Andre_AskToJoin		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_AskToJoin_Condition;
	information	= DIA_Andre_AskToJoin_Info;
	permanent 	= FALSE; 
	description = "Voglio prestare servizio al fianco dei paladini!";
};
func int DIA_Andre_AskToJoin_Condition ()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Andre_AskToJoin_Info ()
{
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //Voglio prestare servizio al fianco dei paladini!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Bene. Mi servirà ogni uomo disponibile, non mi importa per quale motivo si arruoli.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //Se ti metti al servizio dei paladini, ti aiuterò a ottenere udienza con Lord Hagen.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //Una richiesta onorevole!
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //Comunque ho l'ordine di accettare nella guardia solo i cittadini di qui.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //Il mio comandante teme che si possano inflitrare spie o sabotatori.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //In questo modo vuole limitare il rischio.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Dunque devi prima diventare un cittadino di qui, ci sarebbe da discutere sull'efficacia di questa legge, ma gli ordini sono ordini.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Prima di poter entrare a far parte delle guardie locali devo diventare un abitante della città.");
};

// *********************************************************
//						About Miliz
// *********************************************************
instance DIA_Andre_AboutMiliz (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	5;
	condition	 = 	DIA_Andre_AboutMiliz_Condition;
	information	 = 	DIA_Andre_AboutMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"Cosa dovrei aspettarmi dalla guardia cittadina?";
};

func int DIA_Andre_AboutMiliz_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_ABOUTMILIZ_Info ()
{
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //Cosa dovrei aspettarmi dalla guardia cittadina?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Lascia che metta in chiaro una cosa. Essere un soldato della guardia non significa solo andarsene in giro per la città con indosso un'uniforme.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //È un compito sporco e a volte crudele. Una volta che sarai uno di noi dovrai occuparti di una gran mole di lavoro.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //Ma ne vale la pena. A parte la paga, un giorno potrai avere l'opportunità di diventare un guerriero sacro di Innos.
};
			
///////////////////////////////////////////////////////////////////////
//	Info MartinEmpfehlung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MartinEmpfehlung		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information	 = 	DIA_Addon_Andre_MartinEmpfehlung_Info;

	description	 = 	"Ho questa lettera di raccomandazione del vostro furiere.";
};

func int DIA_Addon_Andre_MartinEmpfehlung_Condition ()
{
	if (Npc_HasItems (other,ItWr_Martin_MilizEmpfehlung_Addon))
	&& (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //Ho questa lettera di raccomandazione del vostro furiere.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //(incredulo) Cosa? Mostramela.
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //(colpito) Beh, che mi venisse...! Non dev'esserti stato facile averla. Martin non si presta spesso a questo tipo di cose.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //D'accordo, mi hai convinto. Se Martin garantisce per te, potrai unirti a noi. Fammi sapere quando sei pronto.
	Andre_Knows_MartinEmpfehlung = TRUE;
};

// *********************************************************
//						Alternative			//e2
// *********************************************************
instance DIA_Andre_Alternative (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_Alternative_Condition;
	information	= DIA_Andre_Alternative_Info;
	permanent 	= FALSE; 
	description = "C’è un modo più veloce per unirmi a voi?";
};
func int DIA_Andre_Alternative_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Alternative_Info ()
{
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //C’è un modo più veloce per unirmi a voi?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Mmmh... (si interrompe bruscamente) sei davvero determinato, vero?
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Bene, ascolta. Ho un problema. Se riuscirai a risolverlo farò in modo che tu sia accettato nella guardia cittadina.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //Ma la cosa più importante è non farne parola con nessuno!
	
	
};

// *********************************************************
//						GuildOfThieves			//e3
// *********************************************************
instance DIA_Andre_GuildOfThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_GuildOfThieves_Condition;
	information	= DIA_Andre_GuildOfThieves_Info;
	permanent 	= FALSE; 
	description = "Qual è il problema?";
};
func int DIA_Andre_GuildOfThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
};
func void DIA_Andre_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_GuildOfThieves_15_00"); //Qual è il problema?
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //Di recente sono avvenuti numerosi furti in città. Finora non siamo riusciti a catturare nessuno. I ladri sono dei veri esperti.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //Questi criminali conoscono il loro mestiere. Sono certo che abbiamo a che fare con una banda organizzata.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //Non mi sorprenderei se ci fosse una gilda dei ladri a Khorinis. Trova i capi della banda e uccidili.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //Dopo farò in modo che tu venga accettato nella guardia cittadina, indipendentemente dal fatto che tu ne abbia o meno i requisiti.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //Ma non devi dire niente a nessuno del nostro accordo!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"C'è un altro modo per essere accettato nelle guardie cittadine, e consiste nello scovare ed eliminare la gilda dei ladri a Khorinis.");
	
};

// *********************************************************
//						WhereThieves			//e4
// *********************************************************
instance DIA_Andre_WhereThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_WhereThieves_Condition;
	information	= DIA_Andre_WhereThieves_Info;
	permanent 	= FALSE; 
	description = "Qual è il primo luogo in cui cercare i ladri?";
};
func int DIA_Andre_WhereThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhereThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //Qual è il primo luogo in cui cercare i ladri?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //A saperlo me ne sarei occupato di persona!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //Posso dirti solo questo: di recente abbiamo rivoltato tutto il distretto del porto senza trovare assolutamente nulla.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //La gente non è molto disposta a collaborare, specialmente se indossi l'armatura di un paladino.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //Ma dato che tu non sei di qui, probabilmente non sospetteranno di te così alla svelta.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //Potresti cominciare dal porto, ma fai attenzione. Se la gente si accorge che stai lavorando per i paladini non ti dirà NIENTE!
	
	B_LogEntry (TOPIC_BecomeMIL,"Se voglio trovare la gilda dei ladri farò meglio a fare qualche domanda nel distretto del porto.");
};

// *********************************************************
//						WhatToDo			//e4
// *********************************************************
instance DIA_Andre_WhatToDo (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 3;
	condition	= DIA_Andre_WhatToDo_Condition;
	information	= DIA_Andre_WhatToDo_Info;
	permanent 	= FALSE; 
	description = "Cosa devo fare dopo aver trovato uno dei ladri?";
};
func int DIA_Andre_WhatToDo_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhatToDo_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //Cosa devo fare dopo aver trovato uno dei ladri?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //Se dovessi imbatterti in un servitore, un tirapiedi o in qualche altro pesce piccolo, sarebbe meglio evitare lo scontro diretto.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //Piuttosto vieni da me a riferirmelo e farò in modo che quella persona finisca dietro le sbarre.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //La guardia cittadina potrebbe intervenire nel caso scoppiasse una rissa e tu non avresti modo di spiegare loro cosa sta succedendo.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //Inoltre, c'è una taglia su ogni mela marcia che manderai dietro le sbarre.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //Tuttavia, se trovi il nascondiglio dei capi... beh, probabilmente non potrai fare a meno di combattere.
	
	B_LogEntry (TOPIC_BecomeMIL,"Se dovessi trovare un membro della gilda dei ladri dovrò subito condurlo da Lord Andre. Per eliminare la gilda dei ladri devo trovare il loro nascondiglio.");
};

// *********************************************************
//					Verbrecher ausliefern		//e4
// *********************************************************
	
instance DIA_Andre_Auslieferung		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	200;
	condition	 = 	DIA_Andre_Auslieferung_Condition;
	information	 = 	DIA_Andre_Auslieferung_Info;
	permanent    =  TRUE;
	description	 = 	"Sono qui per recuperare il bottino per un criminale.";
};

func int DIA_Andre_Auslieferung_Condition ()
{	
	if (Rengaru_Ausgeliefert == FALSE)
	|| (Halvor_Ausgeliefert == FALSE)
	|| (Nagur_Ausgeliefert == FALSE)
	|| (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};	
};

func void DIA_Andre_Auslieferung_Info ()
{
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //Sono qui per recuperare il bottino per un criminale.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"Tornerò più tardi (INDIETRO)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru ha derubato il mercante Jora.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Havlor vende merce rubata.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur ha ucciso il messaggero di Baltram.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Chantar sta cercando di sbarazzarsi di Sarah|",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sarah sta vendendo armi a Onar.",DIA_Andre_Auslieferung_Sarah);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{	
	//Rengaru in den Knast beamen
	AI_Teleport			(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengaru ha derubato il mercante Jora. Ha cercato di fuggire, ma l'ho preso.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Bene, i miei uomini l'hanno già preso sotto la loro custodia. Non deruberà più nessuno per un po' di tempo.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Ecco i tuoi soldi.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE; 
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	B_StartOtherRoutine (Rengaru,"PRISON");	
};

func void DIA_Andre_Auslieferung_Halvor()
{
	//Halvor in den Knast beamen
	AI_Teleport			(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor è un ricettatore. Egli rivende le merci che i briganti rubano ai mercanti.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //Allora c'è lui dietro tutto questo. I miei uomini lo imprigioneranno immediatamente.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //Non credo che causerà più altri problemi. Ti darò subito la sua taglia.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Halvor,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	//Nagur in den Knast beamen
	AI_Teleport			(Nagur,"NW_CITY_HABOUR_KASERN_NAGUR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur ha ucciso il messaggero di Baltram. Egli ha cercato di usare me come suo nuovo messaggero per sequestrare il carico di Akil.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //Il tizio riceverà la punizione che si merita. Lo farò imprigionare immediatamente.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Tieni, ecco la taglia che ti spetta.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE; 
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	//Canthar in den Knast beamen
	AI_Teleport			(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //Canthar il mercante sta cercando di sbarazzarsi di Sara!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //Sara? La venditrice di armi al mercato?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //Dovevo consegnare una lettera riguardante Sara nella quale c'era scritto che stava fornendo le armi a Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //Capisco. Ti consegnerò volentieri la taglia per quel bastardo. Si trova già dietro le sbarre.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Canthar,"KNAST"); 
	
	MIS_Canthars_KomproBrief  = LOG_FAILED;
	B_CheckLog ();
	
	Canthar_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};
func void DIA_Andre_Auslieferung_Sarah()
{
	//Sarah in den Knast beamen
	AI_Teleport			(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	//Canthar zum markt beamen
	AI_Teleport			(Canthar,"NW_CITY_SARAH"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sarah sta vendendo armi a Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //Sara? La venditrice di armi al mercato? Hai le prove di quello che dici?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //Ha una lettera in tasca nella quale sono riportati tutti i dettagli sulla consegna delle armi a Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //Non la passerà liscia. La farò arrestare.
	
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Sarah,"KNAST"); 
	
	B_StartOtherRoutine (Canthar,"MARKTSTAND"); 
	
	Sarah_Ausgeliefert = TRUE;
	
	MIS_Canthars_KomproBrief  = LOG_SUCCESS;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

// *********************************************************
//					Diebesgilde Running
// *********************************************************
	
instance DIA_Andre_DGRunning (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	4;
	condition	 = 	DIA_Andre_DGRunning_Condition;
	information	 = 	DIA_Andre_DGRunning_Info;
	permanent    =  TRUE;
	description	 = 	"Riguardo alla gilda dei ladri...";
};

func int DIA_Andre_DGRunning_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info ()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //Riguardo alla gilda dei ladri...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //Dimenticati del lavoro. Ho mandato un paio di uomini a indagare nelle fogne.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //La gilda dei ladri ora è solo un triste capitolo della storia di questa città.
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;
		
		if (MIS_CassiaKelche == LOG_RUNNING)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};
		if (MIS_RamirezSextant == LOG_RUNNING)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};
		return;
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_08_03"); //Sì?
	
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "Me ne sto occupando...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Li ho fatti fuori tutti!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Ho trovato il nascondiglio della gilda dei ladri!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //Me ne sto occupando...
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //D'accordo. Ti darò un altro po' di tempo per completare la missione.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //Bene! Tienimi informato!
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //Ho trovato il nascondiglio della gilda dei ladri!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //Dove?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //Nelle fogne sotto la città.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //Cosa? Avevamo chiuso le fogne...
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //Sembra che non sia stato sufficiente per impedire loro di continuare a proliferare laggiù.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //Hai catturato i criminali?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //Li ho fatti fuori tutti!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //Hai reso un grande servizio alla città.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //Fammi sapere se sei ancora interessato a entrare nella guardia cittadina.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //Hai completato il tuo compito, come è giusto che sia per un servo di Innos e una guardia reale.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //Ti sei guadagnato la taglia sui briganti. Ecco, prendi.
	B_GiveInvItems (self, other, itmi_gold, (Kopfgeld*3));
	
	Info_ClearChoices(DIA_Andre_DGRunning);
};
	
// *********************************************************
//						JOIN Miliz			
// *********************************************************
instance DIA_Andre_JOIN	(C_INFO) 
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	100;
	condition	 = 	DIA_Andre_JOIN_Condition;
	information	 = 	DIA_Andre_JOIN_Info;
	permanent    =  TRUE;
	description	 = 	"Sono pronto per unirmi alla guardia cittadina!";
};

func int DIA_Andre_JOIN_Condition ()
{
	if (hero.guild == GIL_NONE) 
	&& (Npc_KnowsInfo (other,  DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info ()
{
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //Sono pronto per unirmi alla guardia cittadina!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Martin, il furiere, garantisce per te e ti ha persino raccomandato. La sua parola è sufficiente per me.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //Rispetterò la mia parte dell'accordo e ti accetterò nella guardia cittadina, nonostante tu non abbia i requisiti necessari.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //Ma non andarlo a raccontare in giro! Meno persone sanno di questo strappo alla regola e meno dovrò giustificarmi.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //Dunque tu sei un cittadino di Khorinis?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //Il fabbro mi ha assunto come suo apprendista.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //Harad? Lo conosco. Lavora per noi. È una brava persona.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //Sono l'apprendista dell'alchimista!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //Non abbiamo molti studiosi nella guardia cittadina. Le tue capacità potrebbero rivelarsi di grande aiuto per noi.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //Non conosco bene l'alchimista, ma la gente dice che è una persona rispettabile.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //Bosper, il costruttore d'archi, mi ha assunto come suo apprendista.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //Allora sai anche qualcosa sulla vita allo stato brado? Mi fa piacere, perché le guardie cittadine devono assolvere dei compiti anche al di fuori delle mura della città.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //Le persone che conoscono come vivere nelle terre selvagge possono certamente tornarci utili.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //E il costruttore d'archi è una persona molto influente in città.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //Se egli è disposto a garantire per te, allora non c'è niente che possa impedirti di arruolarti nella guardia cittadina.
		
		// ------- Außerdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //Inoltre sei riuscito a smantellare la gilda dei ladri. Ti avrei comunque accettato anche solo per quello.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //Può essere, ma non sei ancora un cittadino di qui e io ho degli ordini da eseguire.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //Puoi unirti a noi se lo vuoi, ma la tua decisione sarà irrevocabile.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Una volta indossata l'uniforme della guardia cittadina, non potrai togliertela e andartene quando ti pare.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //Sei pronto a combattere al nostro fianco per Innos e per il re?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"Non sono ancora del tutto sicuro...",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"Sono pronto!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //Sono pronto!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //Allora benvenuto nella guardia cittadina.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Ecco la tua armatura.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //Portala con orgoglio e dignità.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //Non sono ancora del tutto sicuro...
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //Fino a quando avrai ancora dei dubbi sulla tua decisione, non posso accettarti nella guardia cittadina.
	
	Info_ClearChoices (DIA_Andre_JOIN);
};
	
// *********************************************************
//					Endlich zu Lord Hagen?
// *********************************************************

instance DIA_Andre_LORDHAGEN		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_LORDHAGEN_Condition;
	information	 = 	DIA_Andre_LORDHAGEN_Info;
	permanent	 = 	FALSE;
	description	 = 	"Posso finalmente vedere Lord Hagen, adesso?";
};
func int DIA_Andre_LORDHAGEN_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_LORDHAGEN_Info ()
{
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //Posso finalmente vedere Lord Hagen, adesso?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //Ora sei al servizio dei paladini. Loro ti faranno entrare, ma è meglio per te se hai qualcosa di importante da dire.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //Ce l'ho, non preoccuparti...
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //Ricordati che stai per incontrare il capo dei paladini. Comportati come si deve. Ora non rappresenti solo te stesso, ma l'intera guardia cittadina.
};
// *********************************************************
//				Waffe
// *********************************************************
instance DIA_Andre_Waffe		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Waffe_Condition;
	information	 = 	DIA_Andre_Waffe_Info;
	permanent	 = 	FALSE;
	description	 = 	"Avrò anche un’arma?";
};
func int DIA_Andre_Waffe_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //Avrò anche un’arma?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Certamente. Di solito se ne occupa Peck, ma ormai è da un po' di tempo che non lo vedo.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Scopri dove si è cacciato e conducilo qui. Quindi ti darà un'arma.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //E se vuoi riposare, puoi usare uno dei letti nella caserma.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck è da qualche parte in città. Se lo riporto alla caserma potrò ottenere un'arma da lui.");
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_PECK		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_PECK_Condition;
	information	 = 	DIA_Andre_FOUND_PECK_Info;
	permanent	 =  FALSE;
	description	 = 	"Sono riuscito a rintracciare Peck.";
};

func int DIA_Andre_FOUND_PECK_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Peck_FOUND_PECK)
	&& (MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_IsDead (Peck) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_PECK_Info ()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //Sono riuscito a rintracciare Peck.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Sì, è già tornato al suo posto e ha ripreso il suo lavoro. Dove l'hai trovato?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Ci siamo incrociati...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Nella 'Lanterna Rossa'…",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //L'ho incontrato in città.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //Bene, allora vai da lui e prenditi la tua arma.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //Si trovava alla 'Lanterna Rossa'.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //E così se la spassa con le ragazze invece di pensare a lavorare?
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //Credo che dovrei scambiarci due parole.
	
	B_GivePlayerXP 		(XP_FoundPeck*2);
	MIS_Andre_Peck = LOG_SUCCESS;
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};




// ################################################
// ###											###
// 				_NACH_  MILIZ-AUFNAHME
// ###											###
// ################################################

FUNC VOID B_AndreSold ()
{
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Ecco la tua paga.
	B_GiveInvItems (self, other, itmi_Gold, Andre_Sold); 
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIRSTMISSION		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIRSTMISSION_Condition;
	information	 = 	DIA_Andre_FIRSTMISSION_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Hai un compito da assegnarmi?";
};
func int DIA_Andre_FIRSTMISSION_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIRSTMISSION_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //Hai un compito da assegnarmi?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //Ultimamente c'è stato un incremento nella vendita di erba di palude in città.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //Non possiamo permettere che questa roba prenda piede.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //Altrimenti tutti quanti qui inizieranno a fumare e non saranno più in grado di lavorare e io rimarrò l'unico in grado di combattere.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //Soprattutto ora che siamo sotto il pericolo di un possibile attacco da parte degli orchi o dei mercenari.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //Ho il sospetto che ci siano i mercenari dietro tutto questo. Scommetto che sono loro a introdurre quella roba in citt
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //Che devo fare?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, uno dei nostri uomini, ha sentito dire nella taverna del porto che è stato consegnato un pacco di erba di palude da qualche parte nel distretto del porto.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Dai un'occhiata là intorno e portami il pacco.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"Un pacco di erba di palude è arrivato al porto. Mortis ne ha sentito parlare alla taverna locale. Devo trovare il pacco e portarlo a Lord Andre.");
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info FOUND_STUFF
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_STUFF		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_STUFF_Condition;
	information	 = 	DIA_Andre_FOUND_STUFF_Info;
	permanent	 =  TRUE;
	description	 = 	"Riguardo alla confezione...";
};
func int DIA_Andre_FOUND_STUFF_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_STUFF_Info ()
{
	
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_15_00"); //Riguardo al pacco...
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //L'hai trovato?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Sì, eccola.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"L’ho gettato nella darsena del porto.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output	(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //Non ancora.
	};
};
FUNC VOID DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //Sì, eccolo.
	B_GiveInvItems (other, self,ItMi_HerbPaket,1);
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Bel lavoro. Sorveglieremo l'erba con la massima attenzione.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //L’ho gettato nella darsena del porto.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //Davvero? Beh, ciò che conta è che non potrà cadere più in mani sbagliate.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP (XP_Warehouse_Super);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
};	
	

///////////////////////////////////////////////////////////////////////
//	Info FIND_DEALER
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIND_DEALER		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIND_DEALER_Condition;
	information	 = 	DIA_Andre_FIND_DEALER_Info;
	permanent	 =  FALSE;
	description	 = 	"Hai altro lavoro per me?";
};

func int DIA_Andre_FIND_DEALER_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	&& (Npc_IsDead (Borka)== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIND_DEALER_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_00"); //Hai altro lavoro per me?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //Hai tolto dalla circolazione il pacco con l'erba di palude, bravo.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //Ma vorrei scoprire chi è che sta spacciando quella roba fra la gente.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //Deve trattarsi di qualcuno nel distretto del porto.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //Se si fosse trattato di qualcuno che viene regolarmente da fuori, l'avremmo già preso da tempo.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //Cosa devo fare esattamente?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //Trova lo spacciatore e fatti vendere dell'erba. Non sarà un'impresa facile, ma è l'unico modo che abbiamo per arrestarlo.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Parla con Mortis. Lui conosce il distretto del porto e forse può aiutarti.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"Devo trovare il tizio che sta vendendo l'erba di palude nel distretto del porto. Devo fare in modo che mi venda qualche erba. Mortis può aiutarmi.");
};
///////////////////////////////////////////////////////////////////////
//	Info REDLIGHT_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_REDLIGHT_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information	 = 	DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent	 =  TRUE;
	description	 = 	"Riguardo all’erba...";
};
func int DIA_Andre_REDLIGHT_SUCCESS_Condition ()
{
	if  (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_REDLIGHT_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //Riguardo all’erba...
	
	if (Npc_IsDead (Borka) == TRUE)
	|| (Undercover_Failed == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //Non credo che scopriremo altro nel distretto del porto.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Non ora che quello spacciatore è morto.
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //Nadia, la ragazza della Lanterna Rossa, è morta. Deve essere successo qualche strano incidente.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //Non sei stato abbastanza prudente.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //So chi è che spaccia l'erba in città. È Borka, il portiere della Lanterna Rossa.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //Davvero? Hai le prove?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //Mi ha venduto dell'erba di palude.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //Bene, ci basta questo. Lo farò arrestare subito.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //...Ci sto ancora lavorando.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Bene, ricordati che devi convincere il tizio a fare affari con te.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info HilfBauerLobart
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_HILFBAUERLOBART		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 =  3;
	condition	 = 	DIA_Andre_HILFBAUERLOBART_Condition;
	information	 = 	DIA_Andre_HILFBAUERLOBART_Info;
	description	 = 	"Hai un altro compito da assegnarmi?";
};
func int DIA_Andre_HILFBAUERLOBART_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_HILFBAUERLOBART_Info ()
{
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //Hai un altro compito da assegnarmi?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Lobart, il coltivatore di rape, ha dei problemi nei suoi campi.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //Se lo aiutiamo, rafforzerà i suoi rapporti con la città. Vai da lui e vedi cosa c'è che non va.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andre mi ha inviato alla fattoria di Lobart. Devi aiutare Lobart a risistemare la fattoria."); 
	
	
	MIS_AndreHelpLobart = LOG_RUNNING;

	Wld_InsertNpc		(Lobarts_Giant_Bug1, 			"NW_FARM1_FIELD_06"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug2, 			"NW_FARM1_FIELD_06");
	
	Wld_InsertNpc		(Lobarts_Giant_Bug3, 			"NW_FARM1_FIELD_05"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug4, 			"NW_FARM1_FIELD_05"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug5, 			"NW_FARM1_FIELD_04"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug6, 			"NW_FARM1_FIELD_04"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug7, 			"NW_FARM1_FIELD_03"); 
	
	
	B_StartOtherRoutine (Vino,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer2,"BUGSTHERE");
	
	AI_StopProcessInfos (self);	
};

///////////////////////////////////////////////////////////////////////
//	Info LOBART_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_LOBART_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_LOBART_SUCCESS_Condition;
	information	 = 	DIA_Andre_LOBART_SUCCESS_Info;
	description	 = 	"Ho aiutato Lobart.";
};
func int DIA_Andre_LOBART_SUCCESS_Condition ()
{	
	if (MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_LOBART_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //Ho aiutato Lobart.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //Splendido. Se Lobart è contento, allora continuerà a vendere le sue rape alla città.
	B_GivePlayerXP (XP_LobartBugs);
	B_AndreSold ();
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople		(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople_Condition;
	information	= DIA_Addon_Andre_MissingPeople_Info;

	description	= "E cosa facciamo per quelle persone scomparse?";
};
func int DIA_Addon_Andre_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //E cosa facciamo per quelle persone scomparse?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //In che senso?
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //Non dovremmo cercarle?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Lord Hagen mi ha ordinato di proteggere la città e le fattorie circostanti.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //Dobbiamo tutelare la sicurezza delle persone che sono ancora QUI.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //La milizia pattuglia le strade di notte. Di più non posso fare.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //Quanto a TE, farai bene a fare quello che ti dico, intesi?
	
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople2	(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople2_Condition;
	information	= DIA_Addon_Andre_MissingPeople2_Info;

	description	= "A proposito delle persone scomparse…";
};
func int DIA_Addon_Andre_MissingPeople2_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild != GIL_MIL)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //E per quelle persone scomparse...
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //Non mi seccare più con QUELLA storia, ho da fare.
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_ReturnedMissingPeople		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Info;

	description	 = 	"Ho salvato alcune delle persone che erano scomparse.";
};

func int DIA_Addon_Andre_ReturnedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	&& (MIS_Addon_Andre_MissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //Ho salvato alcune delle persone che erano scomparse.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //E io che mi chiedevo che cavolo di fine avessi fatto!
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //Sei un miliziano! Nessuno ti ha ordinato di prendere una simile iniziativa!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //Ma...
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //Quanti uomini hai trovato?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //Tutti quelli che erano ancora vivi...
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //Tutti?! Io... ehm...
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //Sono fiero di te! E sono felice di averti con noi.
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //Un'impresa eroica!

	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Andre_MissingPeople);
};



//##########################################
//##
//##	Kapitel 3
//##
//##########################################


func void B_Andre_GotoLordHagen()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //Faresti meglio ad andare direttamente da lui.
};

// *********************************************************
// 						BerichtDrachen
// *********************************************************

instance DIA_Andre_BerichtDrachen		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachen_Condition;
	information	 = 	DIA_Andre_BerichtDrachen_Info;
	permanent	 =	FALSE;
	description	 = 	"Mi trovavo nella Valle delle Miniere e ho visto i draghi!";
};
func int DIA_Andre_BerichtDrachen_Condition ()
{	
	if (EnterOW_Kapitel2 == TRUE)
	&& (MIS_OLDWORLD != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachen_Info ()
{
	//AI_Output (other, self,"DIA_Andre_Add_15_12"); //Lord Hagen hat mich auf eine Mission ins Minental geschickt! Ich soll direkt aufbrechen.
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //Mi trovavo nella Valle delle Miniere e ho visto i draghi!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //Ho una lettera del comandante Garond che conferma tutto ciò che ho detto.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //Interesserà di certo a Lord Hagen!
	B_Andre_GotoLordHagen();
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_BennetInPrison		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_BennetInPrison_Condition;
	information	 = 	DIA_Andre_BennetInPrison_Info;
	permanent	 =	TRUE;
	description	 = 	"E che ne è stato del fabbro?";
};
func int DIA_Andre_BennetInPrison_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_BennetInPrison_Info ()
{
	AI_Output (other, self, "DIA_Andre_BennetInPrison_15_00"); //E che ne è stato del fabbro?
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //Ti riferisci al mercenario? Si trova in prigione come merita.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //Posso parlargli?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Certamente. Entra. Ma se provi a farlo fuggire, per te saranno guai.
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_Cornelius_Liar		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Cornelius_Liar_Condition;
	information	 = 	DIA_Andre_Cornelius_Liar_Info;
	permanent	 =	TRUE;
	description	 = 	"Credo che Cornelius stia mentendo.";
};
func int DIA_Andre_Cornelius_Liar_Condition ()
{	
	if (Cornelius_ThreatenByMilSC == TRUE)
	&& (CorneliusFlee != TRUE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Cornelius_Liar_Info ()
{
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //Credo che Cornelius stia mentendo.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //Ne sei certo?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"No.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Sì.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //No.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //Allora non dovresti urlare i tuoi sospetti ai quattro venti.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Cornelius è un uomo influente. Se vuole può renderti la vita un inferno.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //Non posso aiutarti fino a quando non mi porterai delle prove.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Sì.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //Che prove hai?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //Ho letto il suo diario! Lo hanno incastrato. Era tutto un mucchio di bugie.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //Se le cose stanno così, devi andare immediatamente da Lord Hagen.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Mostragli il diario. Egli si occuperà di tutto il resto.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Ehm, beh, credo che...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //Mi servono prove, non supposizioni. Portami le prove e poi potrò fare qualcosa per te.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //Fino ad allora, faresti meglio a misurare le parole.
	};
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

// ******************************************************
//						Als Paladin
// ******************************************************

instance DIA_Andre_Paladin		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Paladin_Condition;
	information	 = 	DIA_Andre_Paladin_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};
func int DIA_Andre_Paladin_Condition ()
{	
	if (other.guild == GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladin_Info ()
{
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //Dunque ora sei un paladino! Congratulazioni!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //Sapevo sin dall'inizio che non saresti rimasto a lungo nella guardia cittadina.
};

// ******************************************************
//						PERM
// ******************************************************

instance DIA_Andre_PERM		(C_INFO)
{
	npc			 = Mil_311_Andre;
	nr 			 = 100;
	condition	 = DIA_Andre_PERM_Condition;
	information	 = DIA_Andre_PERM_Info;
	permanent	 = TRUE;
	description	 = "Come vanno le cose in città?";
};
func int DIA_Andre_PERM_Condition ()
{	
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_PERM_Info ()
{
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //Come vanno le cose in città?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //È tutto sotto controllo.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Porta a termine i tuoi compiti.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //Da ora in poi riferirai direttamente a Lord Hagen. Vai a parlargli.
	};
};


// ###################
//		  Kap 5
// ###################

// *********************************************************
// 						BerichtDrachenTot
// *********************************************************

instance DIA_Andre_BerichtDrachenTot		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachenTot_Condition;
	information	 = 	DIA_Andre_BerichtDrachenTot_Info;
	permanent	 =	FALSE;
	description	 = 	"Ho ucciso tutti i draghi nella Valle delle Miniere!";
};
func int DIA_Andre_BerichtDrachenTot_Condition ()
{	
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachenTot_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //Ho ucciso tutti i draghi nella Valle delle Miniere!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //Se è la verità, devi dirlo a Lord Hagen.
	B_Andre_GotoLordHagen();
};

// *********************************************************
// 						BerichtTorAuf
// *********************************************************

instance DIA_Andre_BerichtTorAuf (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtTorAuf_Condition;
	information	 = 	DIA_Andre_BerichtTorAuf_Info;
	permanent	 =	FALSE;
	description	 = 	"Il castello nella Valle delle Miniere è stato devastato dagli orchi!";
};
func int DIA_Andre_BerichtTorAuf_Condition ()
{	
	if (Kapitel == 5)
	&& (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Andre_BerichtDrachenTot))
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtTorAuf_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //Il castello nella Valle delle Miniere è stato devastato dagli orchi!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //No! Lord Hagen deve esserne messo al corrente.
	B_Andre_GotoLordHagen();
};





















