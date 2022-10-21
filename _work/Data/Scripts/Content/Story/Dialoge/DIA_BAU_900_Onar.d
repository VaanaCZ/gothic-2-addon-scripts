// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Onar_EXIT   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 999;
	condition   = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Onar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				Hallo 
// ************************************************************
INSTANCE DIA_Onar_Hallo (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Onar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_Hallo_Info()
{
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //Chi ti ha fatto entrare?
	AI_Output (self, other, "DIA_Onar_Hallo_14_01"); //Cosa ci fai nella mia fattoria?
};

// ************************************************************
// 			  				PERM 
// ************************************************************
INSTANCE DIA_Onar_PERM (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent   = TRUE;
	description = "Tutto bene qui alla fattoria?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //Tutto bene qui alla fattoria?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //Non vedo come la cosa possa interessarti. Tu non sei di questa fattoria!
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //Spero proprio di sì! In fondo è per questo che vi pago!
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //Faresti meglio ad andare da Torlof a chiedergli se ha del lavoro per te.
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Sì, certo. Tu vai a cacciare i tuoi draghi.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //Voi bigotti bastardi del monastero non siete i benvenuti qui!
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //La nostra ospitalità non è estesa alle truppe del re.
	};
};

// ************************************************************
// 			  				Work 
// ************************************************************
INSTANCE DIA_Onar_Work (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent   = FALSE;
	description = "Voglio lavorare per te.";
};
FUNC INT DIA_Onar_Work_Condition()
{
	if (Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_Work_Info()
{
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //Voglio lavorare per te.
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //Non mi serve un bracciante per ora.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //I miei uomini provvedono a ogni cosa.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //Non hai nessun motivo per startene qua in casa, perciò vattene!
};


// ************************************************************
// 			  				WorkAsSld
// ************************************************************
INSTANCE DIA_Onar_WorkAsSld (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent   = FALSE;
	description = "Voglio lavorare qui come mercenario!";
};
FUNC INT DIA_Onar_WorkAsSld_Condition()
{
	if (Lee_SendToOnar == FALSE)
	&& (Onar_WegenSldWerden == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Onar_Work))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WorkAsSld_Info()
{
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //Voglio lavorare qui come mercenario!
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //Tu? Un mercenario? Ma non farmi ridere! Se fossi un buon mercenario, Lee mi avrebbe già parlato di te.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_02"); //Ora vattene di qui alla svelta!
	Onar_WegenSldWerden = TRUE;
};

// ************************************************************
// 			  				Aufstand
// ************************************************************
INSTANCE DIA_Onar_Aufstand (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 3;
	condition   = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent   = FALSE;
	description = "Ho sentito che sei in rivolta contro la città, o sbaglio?";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //Ho sentito che sei in rivolta contro la città, o sbaglio?
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //Ora ascolta. Ho ereditato questa fattoria e questa terra da mio padre.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //Lui l'aveva ereditata da SUO padre.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //Non permetterò a quell'avido imbecille di un re di portarmi via tutto questo solo per sfamare i suoi inutili eserciti.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //La guerra con gli orchi va avanti da sempre. E a che punto siamo? Sull'orlo del baratro.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //No, preferisco difendere la mia fattoria da solo! Con i soldi che risparmio in questo modo posso permettermi un esercito personale.
};

// ************************************************************
// 			  				WegenPepe
// ************************************************************
INSTANCE DIA_Onar_WegenPepe (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 4;
	condition   = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent   = FALSE;
	description = "Per colpa di Bullco, ti ritrovi con qualche pecora in meno.";
};
FUNC INT DIA_Onar_WegenPepe_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenPepe_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Per colpa di Bullco, ti ritrovi con qualche pecora in meno.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //Di che stai parlando? Chi è Bullco?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //Uno dei mercenari.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //Perché lo dici a me? Se ha ucciso le mie pecore dovrà risponderne a Lee.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //Perché dunque mi stai annoiando con questi inutili dettagli?
	Onar_WegenPepe = TRUE;
};

// ************************************************************
// 			  				WegenSekob
// ************************************************************
INSTANCE DIA_Onar_WegenSekob (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 5;
	condition   = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent   = FALSE;
	description = "Sono venuto per la pigione di Sekob...";
};
FUNC INT DIA_Onar_WegenSekob_Condition()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenSekob_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //Sono venuto per la pigione di Sekob...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //Cosa diavolo vuoi? Porta i soldi a Torlof.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //Che diavolo te ne importa?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //Voglio diventare un mercenario. Riscuotere l'affitto rappresenta la mia prova.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //Ma Sekob non ha soldi. L'ho anche picchiato.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //Dice che è per colpa del cattivo raccolto...
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //(urlando) Stupido imbecille! Credi che si porti dietro i soldi? Li avrà nascosti da qualche parte!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //Sai quanto piove qui? Cattivo raccolto un corno!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //Vai e fatti dare quei soldi in un modo o nell'altro.
	Onar_WegenSekob = TRUE;
};


// ************************************************************
// 			  			Lee schickt mich 
// ************************************************************
INSTANCE DIA_Onar_LeeSentMe   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 6;
	condition   = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent   = FALSE;
	description = "Mi ha mandato Lee. Voglio lavorare qui come mercenario!";
};
FUNC INT DIA_Onar_LeeSentMe_Condition()
{
	if (Lee_SendToOnar == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_LeeSentMe_Info()
{
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Mi ha mandato Lee. Voglio lavorare qui come mercenario!
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //Mi ha già accennato qualcosa.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //Mi ero fatto una cattiva idea su di te già la prima volta che mi avevi chiesto di essere assunto.
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //Ma se Lee crede che tu possa farcela, allora ti darò una possibilità.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //Lui è l'unico responsabile per il tuo comportamento, per cui fai come ti pare.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //Ma non perdere tempo in sciocchezze! Lascia in pace i contadini e le cameriere, e soprattutto, non rubare nulla, intesi?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //Per tutto il resto, parla con Lee.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //Tutto quello di cui dobbiamo discutere ora è la tua paga.

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar mi ha dato la sua approvazione. Ora niente potrà impedirmi di unirmi ai mercenari.");
};



// ************************************************************
// 			  			Sold verhandeln
// ************************************************************
var int Onar_SOLD_Day;
var int Onar_SOLD_XP;
// -------------------

INSTANCE DIA_Onar_HowMuch   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 7;
	condition   = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent   = FALSE;
	description = "Quanto hai intenzione di pagarmi?";
};
FUNC INT DIA_Onar_HowMuch_Condition()
{
	if (Onar_Approved == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_HowMuch_Info()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //Quanto hai intenzione di pagarmi?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //Beh, vediamo...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //Non mi fido troppo di te.
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //Non sei la persona più sveglia del mondo. L'ho capito da come hai affrontato quella faccenda con Sekob.
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //Hai già causato ripetuti guai qui alla fattoria.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //E cerchi sempre di giustificarti con un mucchio di sciocchezze.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Fammi pensare...
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //Che ne dici?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "Accetto!", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "Non è un granché...", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "Al giorno?", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //Al giorno?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //Cosa credi? A settimana? Non sei certo troppo sveglio.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //Allora muovi le chiappe e vieni a prenderti i tuoi soldi.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //Non ho intenzione di pregarti.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //Non è un granché...
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Ovviamente puoi lavorare per me gratis.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //Ad ogni modo, è tutto ciò che sono disposto a darti!
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Posso ricevere la paga da Onar ogni giorno.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //Accetto!
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //Lo credo anch'io. Ora vai da Lee.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Posso ricevere la paga da Onar ogni giorno.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_CollectGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 8;
	condition   = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent   = TRUE;
	description = "Dammi quello che mi spetta!";
};
FUNC INT DIA_Onar_CollectGold_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_CollectGold_Info()
{
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //Dammi quanto mi spetta!
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //Io pago i mercenari, non i cacciatori di draghi.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //Non hai portato a termine gli incarichi che ti erano stati assegnati!
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //Ho chiesto a Torlof come te la stai cavando e mi ha detto che ti ci vuole un'eternità per completare un lavoro.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //Io non spreco soldi con uno sfaticato.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //Per ora lavorerai un paio di settimane senza paga! Forse allora imparerai la lezione.
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //Ho sentito che hai combinato un guaio. Vai da Lee e sistema la faccenda.
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //Sei impazzito?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //Prima lavora qui in prova per un giorno. Da domani inizierò a pagarti.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //Dove ti eri cacciato ieri?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //Dove sei stato negli ultimi giorni?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //Non ti sei mai fatto vedere.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //Chi lo sa dov'è che sei stato.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag später...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //(contrariato) Oh beh. Ecco la tua paga.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //Cosa? Non hai fatto niente per tutto il giorno, se non perdere tempo e dormire!
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //Non ti pagherò per questo!
		};
		
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_MariaGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 9;
	condition   = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent   = FALSE;
	description = "Maria pensa che non prendo abbastanza.";
};
FUNC INT DIA_Onar_MariaGold_Condition()
{
	if (Maria_MehrGold == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_MariaGold_Info()
{
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //Maria pensa che io non prenda abbastanza.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //Cosa?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //Mi ha detto che dovresti pagarmi meglio.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //(arrabbiato) Quella donna ha il vizio di ficcare il naso dappertutto.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //Ti ha detto anche quanto dovrei darti?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //No.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //D’accordo, a partire dalla prossima paga riceverai 10 monete d'oro extra.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //Ma non una moneta di più, intesi?
	
	SOLD = SOLD + 10;
};	


// ************************************************************
// 			  				WannaSheep
// ************************************************************
var int Onar_SellSheep;
// --------------------

instance DIA_Onar_WannaSheep	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_WannaSheep_Condition;
	information	 = 	DIA_Onar_WannaSheep_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voglio comprare una pecora!";
};
func int DIA_Onar_WannaSheep_Condition ()
{	
	if (Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Onar_WannaSheep_Info ()
{
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //Voglio comprare una pecora!
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //Allora perché sei qui? Vedi per caso una pecora da qualche parte?
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //Io...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //Se vuoi comprare una pecora, vai al pascolo. Si trova sulla destra della mia casa.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Fattene vendere una da Pepe.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Mi dispiace, ma Pepe è morto.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //Oh! In questo caso... lasciami 200 monete d'oro e vatti a scegliere una pecora dal pascolo.
		
		Onar_SellSheep = TRUE;
	};
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
instance DIA_Onar_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_BuyLiesel_Condition;
	information	 = 	DIA_Onar_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Eccoti 200 pezzi d’oro. Dammi una pecora.";
};
func int DIA_Onar_BuyLiesel_Condition ()
{	
	if (Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Onar_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Eccoti 200 monete d’oro. Dammi una pecora.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //Puoi prendertene una da solo dal pascolo.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //Una di quelle pecore ti seguirà. La maggior parte di esse si chiamano Betsy.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //Non hai nemmeno abbastanza oro. Non farmi perdere tempo.
	};
};
