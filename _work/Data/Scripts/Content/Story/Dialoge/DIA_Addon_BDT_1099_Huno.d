//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //Cosa vuoi, ora? Sparisci!
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //Cosa aspetti? Vai al bar!
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "Sembra che tu sia un maestro nel tuo mestiere.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Sembra che tu sia un maestro nel tuo mestiere.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//Ne ho già sentito parlare… Hai portato l'acciaio?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//Acciaio? No, penso che tu mi confonda con
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Mhmm… hai qualcosa di familiare. Forse ci siamo incontrati da qualche altra parte?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Certo, nel Vecchio campo…",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Non saprei da dove.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno si occupa di attrezzatura per fabbri.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Certo, nel Vecchio campo
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//Il Vecchio campo… certo… tu sei quel tizio curioso che… Pensavo fossi morto.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//Sì, lo pensano tutti. Chi altro è sopravvissuto?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//Pochi. Alcuni sono scappati con Raven, come ho fatto io. Per molti altri, il Vecchio campo è diventato una tomba.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//Non saprei da dove.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Mhmm… il mio cervello è come un colapasta… qualsiasi cosa
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "Parlami della tua fuga.";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//Parlami della tua fuga.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//Il giorno in cui cadde la Barriera si scatenò il caos.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//Alcuni si nascosero, altri fuggirono… tutto venne saccheggiato.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//Che cosa hai fatto?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//Stavo per lasciare il campo quando improvvisamente tutto si illuminò e provai un dolore terribile alla pelle.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//Ero stato colpito da un maledetto fulmine! Mi sembra di sentirlo ancora
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//Più tardi qualcuno mi disse che Thorus mi aveva trovato è mi aveva portato con sé.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "Ho bisogno di un'armatura migliore.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Ho bisogno di un'armatura migliore.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //In tal caso puoi avere questa. Costa tanto per colpa di Esteban.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Quel cane maledetto si intasca la percentuale su ogni singola armatura che vendo.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Compra armat. pes. brigante (prot.: armi 45, frecce 45. Costo: 2100 m. oro)", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk dice che mi avresti fatto un buon prezzo.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //Hai detto Fisk? Ehm, beh, gli devo ancora un favore.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Compra armat. pes. brigante (prot.: armi 45, frecce 45. Costo: 1400 m. oro)", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Va bene, prenderò l'armatura.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Certamente.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Niente oro, niente armatura!
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "A proposito del tentato omicidio di Esteban…";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //(minaccioso) Che cosa vuoi da me?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Sto cercando il mandante dell'attacco
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //E perché sei venuto da me?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //Pensavo che forse sapevi qualcosa di questa faccenda.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //Io non so NIENTE.
};


//----------------------------------------------------------------------
//	Paar Dinge gehört
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //(sospira) Adesso ascolta! Porta le tue chiappe fuori di qui, se non vuoi che perda le staffe!
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "Ho saputo un paio di cose su di te...";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //Ho saputo un paio di cose su di te...
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //Allora?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //Ancora? (minaccioso) È meglio che questa volta sia una cosa importante
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //Ho sentito che non eri al tuo posto quando ha avuto luogo l'attacco!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //(minaccioso) E cos'altro?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul ha detto che odi Esteban.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //(minaccioso) E allora? Davvero? Che altro?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //Emilio ha fatto il tuo nome! Sicuramente sai qualcosa dell'attacco!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //(calmo) Hai fatto due chiacchiere con il vecchio Emilio, eh?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //E non è l'unico che sospetta di te!
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //Cosa vorresti dire, eh?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Voglio schierarmi con l'assalitore!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Se il mandante dell'attacco sei tu, la pagherai!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "A quanto pare tengo Huno per le palle.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //(minaccioso) Forse dovrei fare anch'io due chiacchiere con lui. Sono sicuro che DOPO dirà esattamente il contrario!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //Nient'altro
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //Se il mandante dell'attacco sei tu, la pagherai!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //(irritato) Sei solo un idiota! Pensi davvero di poterti arruffianare Esteban?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //Fuori da qui!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //Voglio schierarmi con l'assalitore!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //Contro Esteban? Davvero? Allora dimostralo!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //È troppo tempo che aspetto una consegna di acciaio dai pirati.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Sospetto che Esteban l'abbia confiscata per potermela rivendere più tardi a un prezzo maggiorato.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //Naturalmente, non lo avrà fatto di persona. Ha sul libro paga un paio di briganti della palude.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //Come fai a saperlo?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //I briganti ubriachi parlano troppo
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //Il brigante chiacchierone ha forse un nome?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //Il suo nome non è affar tuo. Ma il tizio che stai CERCANDO si chiama Juan. Comunque, è un pezzo che non lo vedo al campo.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //Dovrai cercarlo nella palude.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno aspetta una consegna di acciaio dai pirati. Pensa che un tizio di nome Juan l'abbia rubata per conto di Esteban e la nasconda da qualche parte nella palude.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Prima dimmi chi ha ordinato l'attacco!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Bene, me ne occuperò io al tuo posto.", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //Va bene, lo farò per te.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Bene. Vedremo se ci si può fidare di te.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //Prima dimmi chi è il mandante dell'attacco!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //No. Non mi fido di te.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Senti, la mia prossima conversazione sarà con il mandante dell'attacco o con Esteban.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //Scegli tu con chi devo parlare.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //(sospira) D'accordo. Ti farò incontrare con il colpevole. Ma decido io le modalità dell'incontro, capito?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //Vai al bar e parla con il barista. Lui ti dirà il resto.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno mi ha detto che dovrei parlare a Snaf.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "Ho l'acciaio.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//Ho l'acciaio.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //E allora? C'era anche Juan?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //C'era.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //Lo sapevo. C'era lo zampino di quel ratto di Esteban.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Hai proprio ragione. Per la verità, da te non me lo aspettavo.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Ecco, prendi questo come ricompensa.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //E ora che fine fa il nostro accordo?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //L'uomo con cui vuoi parlare ti sta aspettando al bar. Parla con il barista.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno mi ha detto che dovrei parlare a Snaf.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};






