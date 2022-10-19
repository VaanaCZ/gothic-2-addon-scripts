// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_3_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_3_EXIT_Condition;
	information	= DIA_NOV_3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_3_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_3_Fegen_Condition;
	information	= DIA_NOV_3_Fegen_Info;
	permanent	= TRUE;
	description = "Mi serve una mano per ripulire le camere dei novizi.";
};                       
//------------------------------------
var int Feger1_Permanent; 
var int Feger2_Permanent;
//------------------------------------
FUNC INT DIA_NOV_3_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //Mi serve una mano per ripulire le camere dei novizi.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //Nessuno si è ancora offerto di aiutarti? Lo farò io se troverai almeno un'altra persona disposta a darci una mano.
			
			B_LogEntry 	(Topic_ParlanFegen,"Il novizio che sta spazzando lo scantinato mi aiuterà se troverò un altro novizio disposto ad aiutarlo.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //Sono l'unico ad aiutarti?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //No, ho già trovato qualcuno.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //Affare fatto.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Il novizio nello scantinato mi aiuterà a spazzare le stanze adesso.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Ehi, fratello, ti sto già aiutando. Non hai bisogno di convincermi.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Certamente, ti aiuterò. Noi novizi dobbiamo aiutarci a vicenda.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Mi servono solo 50 monete d'oro perché devo ancora pagare Parlan.
			
			B_LogEntry 	(Topic_ParlanFegen,"Il novizio fuori dalla chiesa mi aiuterà se gli consegno 50 pezzi d'oro.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"Forse più tardi...",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"Va bene. Pagherò.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //Te l'ho promesso. Tu hai aiutato me e io aiuterò te.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Scordatelo, non ho tempo da perdere. Cerca qualcun altro disposto a darti una mano.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Magari dopo. Al momento non ho tutti questi soldi.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //Va bene. Pagherò.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Bene, allora possiamo cominciare.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"Il novizio fuori dalla chiesa mi aiuterà a spazzare le stanze adesso.");
	
	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_3_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_3_Wurst_Condition;
	information	= DIA_NOV_3_Wurst_Info;
	permanent	= TRUE;
	description = "Gradisci una salsiccia?";
};                       

FUNC INT DIA_NOV_3_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Wurst_15_00"); //Gradisci una salsiccia?
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Certo, dai qua. Una salsiccia come questa non si rifiuta mai.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_3_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_3_JOIN_Condition;
	information	= DIA_NOV_3_JOIN_Info;
	permanent	= TRUE;
	description = "Voglio diventare un mago!";
};                       

FUNC INT DIA_NOV_3_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_JOIN_15_00"); //Voglio diventare un mago!
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //È il desiderio di molti novizi. Ma solo pochi di loro saranno destinati come Eletti e avranno la possibilità di venire ammessi nel Circolo del Fuoco.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //Diventare un mago del Circolo del Fuoco è il massimo onore a cui può aspirare un membro del nostro ordine.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //Dovrai lavorare sodo per avere la tua opportunità.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_3_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_3_PEOPLE_Condition;
	information	= DIA_NOV_3_PEOPLE_Info;
	permanent	= TRUE;
	description = "Chi è il capo di questo monastero?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_PEOPLE_15_00"); //Chi è il capo di questo monastero?
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //Noi novizi serviamo i maghi del Circolo del Fuoco. Essi a loro volta sono comandati da un Alto Concilio, composto dai tre maghi più potenti.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Ma è Parlan il responsabile di tutti gli affari dei novizi. Egli è sempre nel cortile a tenere d'occhio i novizi mentre lavorano.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_3_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_3_LOCATION_Condition;
	information	= DIA_NOV_3_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa mi dici di questo monastero?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //Cosa mi dici di questo monastero?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //Ci procuriamo il nostro modesto cibo da soli. Alleviamo le pecore e facciamo il vino.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Questa è una biblioteca, ma il suo accesso è limitato ai maghi e ai novizi prescelti.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //Noi altri novizi ci preoccupiamo principalmente di assicurarci che ai maghi del Circolo del Fuoco non manchi nulla.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_3_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_3_STANDARD_Condition;
	information	= DIA_NOV_3_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NOV_3_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //Proprio tu me lo chiedi? I novizi non fanno altro che parlare di te.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //In effetti è raro che uno come te appena arrivato venga scelto per il Circolo del Fuoco.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //È di nuovo giunta l'ora. Uno dei novizi presto verrà ammesso nel Circolo del Fuoco.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Le prove inizieranno presto.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //Il nostro ordine è stato profanato da Beliar! Il male deve essere molto potente se è in grado di trovare degli alleati persino qui.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro è rimasto qui nel monastero per anni. Credo che tutto quel tempo trascorso fuori da queste mura abbia indebolito la sua fede e l'abbia reso vulnerabile alle tentazioni di Beliar.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //Sei arrivato al momento giusto. Lo stesso Innos non avrebbe potuto scegliere un'occasione migliore per la tua apparizione.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Entrerai negli annali del nostro monastero come il salvatore dell'Occhio.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Le notizie che ci giungono dalla Valle delle Miniere sono allarmanti. Credo che Innos ci stia mettendo a dura prova.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //Pare che non vi siano più notizie dei paladini che sono partiti per la Valle delle Miniere. L'Alto Concilio saprà senz'altro qual è la cosa migliore da fare.
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //Dicono che annienteremo i draghi con l'aiuto del nostro Signore. L'ira di Innos si abbatterà sulle creature di Beliar.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Grazie a Innos non ci sono nuove crisi. Dobbiamo seguire di nuovo la via del nostro Signore, perché solo con il suo aiuto possiamo affrontare il male.

	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_3 (var c_NPC slf)
{
	DIA_NOV_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc					= Hlp_GetInstanceID(slf);
};
