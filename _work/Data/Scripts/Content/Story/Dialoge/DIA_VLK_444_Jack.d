///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack;
	nr          = 999;
	condition   = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jack_PICKPOCKET (C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 900;
	condition	= DIA_Jack_PICKPOCKET_Condition;
	information	= DIA_Jack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jack_PICKPOCKET_Condition()
{
	C_Beklauen (50, 100);
};
 
FUNC VOID DIA_Jack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jack_PICKPOCKET);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_BACK 		,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
	
func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	4;
	condition	 = 	DIA_Jack_GREET_Condition;
	information	 = 	DIA_Jack_GREET_Info;
	important 	 =  TRUE; 

};

func int DIA_Jack_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Jack_GREET_Info ()
{
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //Ahoy, uomo di terraferma, sembra che tu sia bloccato qui.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //Sembri un po' pallido attorno alle branchie.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Non preoccuparti amico mio. Tutto ciò di cui hai bisogno è della buona aria di mare.
};


///////////////////////////////////////////////////////////////////////
//	Was machst Du hier
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Job		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	5;
	condition	 = 	DIA_Jack_Job_Condition;
	information	 = 	DIA_Jack_Job_Info;

	description	 = 	"Cosa stai facendo, qui?";
};

func int DIA_Jack_Job_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_GREET)
	{
		return TRUE;
	};
};
func void DIA_Jack_Job_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Cosa stai facendo qui?
	//AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Damals, als junger Mann, bin ich noch zur See gefahren und habe so manchen großen Sturm miterlebt.
	//AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Vor vielen Jahren hab ich mich dann hier nieder gelassen und war lange Zeit Leuchtturmwärter von Khorinis.
	//AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Keine aufregende Sache. Wirklich nicht. Aber dieser alte Turm kam dem, was man ein Zuhause nennt, am Nächsten.
	//AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Bin schon ziemlich lange nicht mehr oben gewesen.
	//AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Warum nicht?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Da quando quei vili mi hanno sottratto il faro, non ho avuto il coraggio di avvicinarmi a meno di venti passi. Veramente delle brutte canaglie...
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Sono dei criminali che vengono dalla Valle delle Miniere.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //C'è stata un'esplosione dall'altra parte delle montagne e si sono mossi come sciami di mosche per tutto il territorio. Ora si nascondono ovunque, persino nel mio faro.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //Penso che stiano facendo la posta a un'eventuale nave da razziare.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //Ah! Lasciali fare. Almeno se ne andranno via dalla mia torre.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Il vecchio lupo di mare Jack non può tornare al faro finché è occupato dai briganti."); 
	
	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
	
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	6;
	condition	 = 	DIA_Jack_City_Condition;
	information	 = 	DIA_Jack_City_Info;

	description	 = 	"Vieni spesso in città?";
};

func int DIA_Jack_City_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_Job)
	{
		return TRUE;
	};
};
func void DIA_Jack_City_Info ()
{
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //Vieni spesso in città?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Come dico sempre, una città è lo specchio del suo porto.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Un porto è un cancello sul mondo, il luogo dove tutti si incontrano e dove tutto ha inizio.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Una volta che il porto va in malora, il resto della città segue a ruota.
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über den Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Harbor		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	70;
	condition	 = 	DIA_Jack_Harbor_Condition;
	information	 = 	DIA_Jack_Harbor_Info;
	permanent	 =  TRUE;

	description	 = 	"Dimmi del porto.";
};

func int DIA_Jack_Harbor_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_City)
		&&	((Npc_GetDistToWP(self,"LIGHTHOUSE")< 3000) == FALSE)
		&& 	(JackIsCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jack_Harbor_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //Dimmi del porto.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Il porto di Khorinis non è più come una volta.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Non ci sono che canaglie in giro, le navi non attraccano più e il commercio è morto. Questo porto è destinato ad affondare.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Perché le navi non attraccano più?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Cosa intendi per gentaglia?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Allora perché non te ne vai?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Perché le navi non attraccano più?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //Dicono tutti che quando la guerra sarà finita, tutto tornerà a essere come una volta. Sono un sacco di discorsi insignificanti.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Ascoltami, un marinaio riesce sempre a vedere quando una città sta per andare in declino.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Un marinaio lo sente nel sangue, dimenticati di questo porto, i suoi giorni di splendore sono terminati.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Cosa intendi per gentaglia?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Guardali, queste pigre canaglie. La maggior parte di loro non sa nemmeno che cosa sia un lavoro. Tutto ciò che fanno è bere tutto il giorno e spendono l'ultima paga al bordello.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Ascoltami, sta' lontano da loro.
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Allora perché non te ne vai?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //Nessuno vuole un vecchio lupo di mare come me sulla sua nave, al giorno d'oggi.
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //La gente pensa che il Vecchio Jack abbia detto tutto quello che aveva da dire.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //E? Hanno ragione?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //Sciocchezze, quando sento delle assi sotto ai piedi, ritorno a essere un giovanotto arrogante.
};

///////////////////////////////////////////////////////////////////////
//	Info BanditenWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BANDITENWEG		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	7;
	condition	 = 	DIA_Jack_BANDITENWEG_Condition;
	information	 = 	DIA_Jack_BANDITENWEG_Info;

	description	 = 	"I briganti che occupavano il tuo faro non ci sono più.";
};

func int DIA_Jack_BANDITENWEG_Condition ()
{
	if (Npc_IsDead(LeuchtturmBandit_1021))
		&& (Npc_IsDead(LeuchtturmBandit_1022))
		&& (Npc_IsDead(LeuchtturmBandit_1023))
		&& (MIS_Jack_KillLighthouseBandits == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Jack_BANDITENWEG_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //I briganti che infestavano il tuo faro non ci sono più.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //Davvero? Finalmente posso tornare al lavoro.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //Vieni con me al faro, c'è un vista incredibile da lassù.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillLighthouseBandits);
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	8;
	condition	 = 	DIA_Jack_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"Hai proprio un bel faro.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"LIGHTHOUSE")<3000) 
		&& (MIS_SCKnowsWayToIrdorath == FALSE) 
		{
				return TRUE;
		};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //Hai proprio un bel faro.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Grazie. Vai in cima alle scale e goditi il panorama, amico mio. Fai come se fossi a casa tua.
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

INSTANCE DIA_Jack_KAP3_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP3_EXIT_Condition;
	information	= DIA_Jack_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Jack_KAP4_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP4_EXIT_Condition;
	information	= DIA_Jack_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Jack_KAP5_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP5_EXIT_Condition;
	information	= DIA_Jack_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	51;
	condition	 = 	DIA_Jack_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Non ti piacerebbe tornare in mare?";
};

func int DIA_Jack_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&& (MIS_Jack_NewLighthouseOfficer == 0)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Non ti piacerebbe andar per mare di nuovo?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Darei un braccio per tornare a bordo di una grossa goletta ancora una volta.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Ma per un vecchio lupo di mare come me non è così facile, amico mio. In ogni caso, chi si prenderebbe poi cura del faro?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Lascia perdere. Era solo un’idea.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Mi serve la tua esperienza come marinaio.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Mi serve la tua esperienza come marinaio.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //Mi vengono i brividi. Che progetti hai, amico? Non avrai mica intenzione di salire a bordo della galera da guerra del Re, vero?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Chi lo sa?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //(ride) Questa sarebbe una cosa eccezionale. Oh beh, però non posso abbandonare il mio faro così su due piedi, che cosa ne faremo?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Jack, il vecchio marinaio del porto, sarebbe un buon capitano. Ma prima devo trovare qualcuno che faccia la guardia al faro."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Lascia perdere. Era solo un’idea.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "E se ti portassi qualcuno...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //E se portassi qui qualcuno per prendersi cura del tuo faro nel frattempo?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //Non è una brutta idea, amico. E conosco la persona adatta.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Harad il fabbro lavora con un apprendista di nome Brian, col quale ho parlato spesso.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Vorrei affidare il mio faro a lui, penso che sia la persona giusta per questo lavoro.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Vai a parlargli, se siamo fortunati il ragazzo ci darà una mano.
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //Lascia perdere. Era solo un’idea.
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	52;
	condition	 = 	DIA_Jack_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN2_Info;

	description	 = 	"Riguardo a Brian...";
};

func int DIA_Jack_BEMYCAPTAIN2_Condition ()
{
	if 	((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		|| 	((MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	&& 	(Npc_IsDead(Brian))))
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN2_Info ()
{
	if (Npc_IsDead(Brian))
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //Brian è morto.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //Oh. Sono tempi terribili, era proprio un bravo ragazzo.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Brian si prenderà cura del tuo faro.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Speravo l'avresti detto.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Hai ancora bisogno di me?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Vediamo se il ragazzo può tornarci utile.
			AI_StopProcessInfos (self);
			};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	53;
	condition	 = 	DIA_Jack_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN3_Info;

	description	 = 	"TI nomino capitano della mia nave.";
};

func int DIA_Jack_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		&& (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Ti nomino capitano della mia nave.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //Ho viaggiato per i sette mari, amico mio, ma prima d'ora non sono mai stato capitano di una nave.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //Non so nulla sulla navigazione, dovrai farlo tu.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Farò del mio meglio.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Mostrami la nave e il tuo equipaggio. Sai dove siamo diretti? Voglio dire, abbiamo una cartina nautica?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Aspettami al porto, non preoccuparti del resto.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Se lo dici tu.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);        
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_LOSFAHREN_Condition;
	information	 = 	DIA_Jack_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Giusto, vecchio mio. Spieghiamo le vele.";
};

func int DIA_Jack_LOSFAHREN_Condition ()
{
	if (JackIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jack_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //Giusto, vecchio mio. Spieghiamo le vele.

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //Sembra tutto a posto, fammi vedere la cartina nautica.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //Sarà un viaggio incredibile, spero di ritornare tutto d'un pezzo.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //Hai davvero tutto quello che ci serve? Non torneremo indietro se ti sei dimenticato qualcosa.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Se sei sicuro di aver preso tutto, vai negli alloggi del capitano e fatti una dormita. Ne avrai bisogno.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Con calma amico mio, non ho ancora visto la bagnarola, non funziona così.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Prima devi avere un equipaggio completo di almeno cinque uomini, libero accesso a una nave e una cartina nautica. Altrimenti, scordatelo.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////

instance DIA_Jack_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Cosa si fa adesso?";
};

func int DIA_Jack_PERM5_NOTCAPTAIN_Condition ()
{
		if	((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JackIsCaptain == FALSE))
		|| 	(MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //Cosa si fa adesso?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //Ci ho pensato e ho deciso che dopotutto rimarrò qui a fare la guardia al faro.
	
	AI_StopProcessInfos (self);
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


INSTANCE DIA_Jack_KAP6_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP6_EXIT_Condition;
	information	= DIA_Jack_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};










































 





















