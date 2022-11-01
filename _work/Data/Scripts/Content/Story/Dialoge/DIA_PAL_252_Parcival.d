///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parcival_EXIT   (C_INFO)
{
	npc         = PAL_252_Parcival;
	nr          = 999;
	condition   = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Parcival_EXIT_Condition()
{
	if (Kapitel < 3)
	{
			return TRUE;
	};
};

FUNC VOID DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Schürfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Schurfer		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  2;
	condition	 = 	DIA_Parcival_Schurfer_Condition;
	information	 = 	DIA_Parcival_Schurfer_Info;
	permanent 	 =  FALSE;
	description	 =	"Cosa mi dici dei minatori?";
};
func int DIA_Parcival_Schurfer_Condition ()	
{	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Schurfer_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Schurfer_15_00"); //Cosa mi dici dei minatori?
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_01"); //Ho riunito i tre gruppi.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_02"); //Marcos, Fajeth e Silvestro sono i paladini che guidano ciascun gruppo.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_03"); //Il gruppo di Marco è partito in direzione di una vecchia miniera, guidato da un vecchio minatore di nome Grimes.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_04"); //Gli altri due gruppi sono partiti insieme.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_05"); //Jergan, uno dei nostri esploratori, ci ha riferito che hanno stabilito un campo vicino a una grande torre.
	
	B_LogEntry (TOPIC_ScoutMine,"I gruppi di estrazione sono guidati ciascuno da un paladino. Marcos, Fajeth e Silvestro.");
	B_LogEntry (TOPIC_ScoutMine,"Il gruppo di Marcos è andato verso quella che era la vecchia miniera. Il loro esploratore è lo scavatore Grimes."); 
	B_LogEntry (TOPIC_ScoutMine,"Gli altri due gruppi erano insieme: hanno allestito in accampamento vicino a una grossa torre."); 
	
};
///////////////////////////////////////////////////////////////////////
//	Info Schürfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Diego		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  9;
	condition	 = 	DIA_Parcival_Diego_Condition;
	information	 = 	DIA_Parcival_Diego_Info;
	permanent 	 =  FALSE;
	description	 =	"Con quale gruppo di minatori è andato Diego?";
};
func int DIA_Parcival_Diego_Condition ()	
{	
	if (SearchForDiego == LOG_RUNNING)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Diego_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Diego_15_00"); //Con quale gruppo di minatori è andato Diego?
	AI_Output (self, other, "DIA_Parcival_Diego_13_01"); //Quel detenuto... Diego? È nel gruppo del paladino Silvestro.
	
	B_LogEntry (TOPIC_ScoutMine,"Diego è con gli estrattori guidati dal paladino Silvestro."); 
};
///////////////////////////////////////////////////////////////////////
//	Info Weg
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Weg		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  8;
	condition	 = 	DIA_Parcival_Weg_Condition;
	information	 = 	DIA_Parcival_Weg_Info;
	permanent 	 =  FALSE;
	description	 =	"Sai come arrivare ai siti minerari?";
};
func int DIA_Parcival_Weg_Condition ()	
{	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Weg_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Weg_15_00"); //Sai come arrivare ai siti minerari?
	AI_Output (self, other, "DIA_Parcival_Weg_13_01"); //Non c'è una strada sicura per quella valle. Ma mi sembra sensato non prendere la strada diretta.
	AI_Output (self, other, "DIA_Parcival_Weg_13_02"); //Tieniti alla larga dagli orchi e dai boschi... e possa Innos proteggerti.
	
	B_LogEntry (TOPIC_ScoutMine,"Sembrerebbe saggio non prendere una strada diretta per i minatori. Farei meglio a evitare i boschi e gli orchi."); 
};

///////////////////////////////////////////////////////////////////////
//	Info DRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGON		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  2;
	condition	 = 	DIA_Parcival_DRAGON_Condition;
	information	 = 	DIA_Parcival_DRAGON_Info;
	description	 =	"Come vanno le cose?";
};
func int DIA_Parcival_DRAGON_Condition ()	
{
	return TRUE;
};
func void DIA_Parcival_DRAGON_Info ()
{
	AI_Output (other, self, "DIA_Parcival_DRAGON_15_00"); //Come vanno le cose?
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_01"); //Il campo è circondato dagli orchi. Si sono trincerati veramente bene.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_02"); //Ma ancora più temibili sono gli attacchi dei draghi. Hanno già distrutto l'intera cerchia esterna.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_03"); //Un altro attacco di drago, e subiremo pesanti perdite.
};
///////////////////////////////////////////////////////////////////////
//	Info DRAGONS
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGONS		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr		 	 = 	2;
	condition	 = 	DIA_Parcival_DRAGONS_Condition;
	information	 = 	DIA_Parcival_DRAGONS_Info;
	description	 = 	"Quanti draghi ci sono?";
};

func int DIA_Parcival_DRAGONS_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Parcival_DRAGON)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Parcival_DRAGONS_Info ()
{
	AI_Output (other, self, "DIA_Parcival_DRAGONS_15_00"); //Quanti draghi ci sono?
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_01"); //Non sappiamo quanti siano in tutto, ma sono più di uno.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_02"); //Ma non è tutto. L'intera Valle delle Miniere è piena di creature malvagie che appoggiano i draghi.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_03"); //Non illudiamoci, senza dei rinforzi dall'esterno, le nostre probabilità di uscirne vivi sono molto scarse.
	 
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info BRAVE
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_BRAVE		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	8;
	condition	 = 	DIA_Parcival_BRAVE_Condition;
	information	 = 	DIA_Parcival_BRAVE_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Parcival_BRAVE_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& Npc_KnowsInfo (hero,DIA_Parcival_DRAGONS)
	&& (Kapitel < 3)
	&& (Parcival_BRAVE_LaberCount <= 6)
	{
		return TRUE;
	};
};

var int Parcival_BRAVE_LaberCount;
func void DIA_Parcival_BRAVE_Info ()
{
	if (Parcival_BRAVE_LaberCount < 6)
	{
		var int randy;
		randy = Hlp_Random (3);
		
		if randy == 0
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_00"); //Tutto è ancora tranquillo, ma potrebbe cambiare presto.
		};
		if randy == 1
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_01"); //Resisteremo fino a quando saremo in grado.
		};
		if randy == 2
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_02"); //Innos ci aiuterà. La sua luce rischiara i nostri cuori!
		};
	
	}
	else 
	{
	AI_Output			(self, other, "DIA_Parcival_BRAVE_13_03"); //Ehi! Non hai niente di meglio da fare che venire sempre a chiacchierare con me? Aria!
	B_GivePlayerXP (XP_Ambient);
	};
	
	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
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

INSTANCE DIA_Parcival_KAP3_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP3_EXIT_Condition;
	information	= DIA_Parcival_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info AllesKlar
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_ALLESKLAR		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	nr		 = 	31;
	condition	 = 	DIA_Parcival_ALLESKLAR_Condition;
	information	 = 	DIA_Parcival_ALLESKLAR_Info;
	permanent	 = 	TRUE;

	description	 = 	"Va tutto bene?";
};

func int DIA_Parcival_ALLESKLAR_Condition ()
{
	if (Kapitel == 3)
		&& 	(DIA_Parcival_ALLESKLAR_NervCounter < 3)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
		{
				return TRUE;
		};
};
var int DIA_Parcival_ALLESKLAR_NervCounter;
func void DIA_Parcival_ALLESKLAR_Info ()
{
	AI_Output			(other, self, "DIA_Parcival_ALLESKLAR_15_00"); //Va tutto bene?

	if (DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_01"); //Finora sì!
	}	
	else if (DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_02"); //Sì, dannazione.
	}	
	else if (Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_03"); //(ride) Ah, ora capisco cos'hai in mente. No, amico mio, non questa volta.
	}
	else
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_04"); //Non seccarmi.
	};

	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter + 1;
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

INSTANCE DIA_Parcival_KAP4_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP4_EXIT_Condition;
	information	= DIA_Parcival_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Ist irgendwas wichtiges passiert?
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_AnyNews		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_AnyNews_Condition;
	information	 = 	DIA_Parcival_AnyNews_Info;

	description  =	"È successo qualcosa di importante?";		
};

func int DIA_Parcival_AnyNews_Condition ()
{	
	if (Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_AnyNews_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_AnyNews_15_00"); //È successo qualcosa di importante?
	if (hero.guild == GIL_DJG)
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_01"); //Sei con quella feccia che si fa chiamare cacciatori di draghi?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_02"); //Tsk, pensavo avessi più onore e invece sei andato a unirti a quella gente.
	
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_03"); //Sono preoccupato. Molto preoccupato.
		AI_Output 	(other,self ,"DIA_Parcival_AnyNews_15_04"); //Per cosa?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_05"); //Ultimamente sono comparsi questi tizi. Si fanno chiamare cacciatori di draghi.
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_06"); //Per quanto mi riguarda, non sono altro che fannulloni e criminali.
	};
	AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_07"); //Se fosse per me, li caccerei tutti fuori dal castello. Che se li prendano pure gli orchi!

	Info_ClearChoices (DIA_Parcival_AnyNews);
	Info_AddChoice	(DIA_Parcival_AnyNews,"A differenza di Lord Hagen, sono qui.",DIA_Parcival_AnyNews_LordHagen); 
	Info_AddChoice	(DIA_Parcival_AnyNews,"Dovresti dargli una possibilità.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice	(DIA_Parcival_AnyNews,"Non credi di esagerare?",DIA_Parcival_AnyNews_Overact);
	
};

FUNC VOID DIA_Parcival_AnyNews_LordHagen ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_LordHagen_15_00"); //A differenza di Lord Hagen, sono qui.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_01"); //(ride amaramente) Già, sfortunatamente sono tutto quello che abbiamo.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_02"); //Innos ci sta veramente mettendo a dura prova.
	
	Info_ClearChoices (DIA_Parcival_AnyNews);
};

FUNC VOID DIA_Parcival_AnyNews_Chance ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Chance_15_00"); //Dovresti dargli una possibilità.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_01"); //Ne hanno una. Purtroppo.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_02"); //Garond è convinto che potrebbero esserci d'aiuto.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_03"); //Ma io li terrò d'occhio. Abbiamo già abbastanza problemi con gli orchi, non ci servono altri guai.
	
	Info_ClearChoices (DIA_Parcival_AnyNews);  
};

FUNC VOID DIA_Parcival_AnyNews_Overact ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Overact_15_00"); //Non credi di esagerare?
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_01"); //Assolutamente no. In questa situazione abbiamo bisogno di uomini che siano d'esempio.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_02"); //Guerrieri che risveglino il fuoco di Innos nei cuori dei nostri soldati.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_03"); //Invece, questa feccia distrugge il morale dei miei uomini.
};
 
///////////////////////////////////////////////////////////////////////
//	Ich muss mit dir über Jan reden
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_Jan		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_Jan_Condition;
	information	 = 	DIA_Parcival_Jan_Info;
	permanent	 = 	FALSE;
	description  =	"Ho bisogno di parlarti a proposito di Jan.";		
};

func int DIA_Parcival_Jan_Condition ()
{	
	if (MIS_JanBecomesSmith == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_Jan_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_00"); //Ho bisogno di parlarti a proposito di Jan.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_01"); //Jan? Chi sarebbe?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_02"); //Un Cacciatore di Draghi. È un fabbro.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_03"); //Oh, sì, ricordo. Cosa vuole?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_04"); //Vorrebbe lavorare nella fucina.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_05"); //È fuori discussione. Non è uno di noi, e, personalmente, non mi fido di lui.
}; 
 
///////////////////////////////////////////////////////////////////////
//	Kannst du das mit Jan noch mal überdenken?
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_ThinkAgain		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_ThinkAgain_Condition;
	information	 = 	DIA_Parcival_ThinkAgain_Info;
	permanent	 = 	TRUE;
	description  =	"Non potresti riconsiderare la questione con Jan?";		
};

func int DIA_Parcival_ThinkAgain_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Parcival_Jan)) 
	&& (MIS_JanBecomesSmith == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Parcival_ThinkAgain_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_ThinkAgain_15_00"); //Non potresti riconsiderare la questione con Jan?
	AI_Output 	(self ,other,"DIA_Parcival_ThinkAgain_13_01"); //No, ho preso la mia decisione.
}; 
 
///////////////////////////////////////////////////////////////////////
//	Garond will, dass Jan die Schmiede übernimmt.
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_TalkedGarond		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_TalkedGarond_Condition;
	information	 = 	DIA_Parcival_TalkedGarond_Info;

	description  =	"Garond vuole che Jan rimpiazzi il fabbro.";		
};

func int DIA_Parcival_TalkedGarond_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Parcival_Jan))
	&& (MIS_JanBecomesSmith == LOG_SUCCESS)	 
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_TalkedGarond_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_TalkedGarond_15_00"); //Garond vuole che Jan rimpiazzi il fabbro.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_01"); //Mmmh. Se è così, allora per quanto mi riguarda può avere la fucina.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_02"); //Anche se penso che sia un errore fidarsi di questo Jan.
};  

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_PERMKAP4		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	nr		 = 	43;
	condition	 = 	DIA_Parcival_PERMKAP4_Condition;
	information	 = 	DIA_Parcival_PERMKAP4_Info;
	permanent	 = 	TRUE;

	description	 = 	"E a parte questo?";
};

func int DIA_Parcival_PERMKAP4_Condition ()
{
	if (Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Parcival_AnyNews))
		{
				return TRUE;
		};
};

func void DIA_Parcival_PERMKAP4_Info ()
{
	AI_Output			(other, self, "DIA_Parcival_PERMKAP4_15_00"); //E a parte questo?
	AI_Output			(self, other, "DIA_Parcival_PERMKAP4_13_01"); //Aah, lasciami in pace!

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

INSTANCE DIA_Parcival_KAP5_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP5_EXIT_Condition;
	information	= DIA_Parcival_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verraeter
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_VERRAETER		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	condition	 = 	DIA_Parcival_VERRAETER_Condition;
	information	 = 	DIA_Parcival_VERRAETER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Parcival_VERRAETER_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
		&& (MIS_OCGateOpen == TRUE)
		{
			return TRUE;		
		};
};

func void DIA_Parcival_VERRAETER_Info ()
{
	
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_00"); //Traditore! Sono sicuro che sei stato TU ad aprire il cancello.
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_01"); //Pagherai per questo.
	
	Npc_SetRefuseTalk (self,30);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
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


INSTANCE DIA_Parcival_KAP6_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP6_EXIT_Condition;
	information	= DIA_Parcival_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Parcival_PICKPOCKET (C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 900;
	condition	= DIA_Parcival_PICKPOCKET_Condition;
	information	= DIA_Parcival_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Parcival_PICKPOCKET_Condition()
{
	C_Beklauen (84, 460);
};
 
FUNC VOID DIA_Parcival_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Parcival_PICKPOCKET);
	Info_AddChoice		(DIA_Parcival_PICKPOCKET, DIALOG_BACK 		,DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Parcival_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Parcival_PICKPOCKET);
};
	
func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Parcival_PICKPOCKET);
};


















































		
																				
	
	
	
	
	
	
	
	
	
	
	
	














