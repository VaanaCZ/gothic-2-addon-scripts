///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mortis_EXIT   (C_INFO)
{
	npc         = Mil_314_Mortis;
	nr          = 999;
	condition   = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Hallo		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Hallo_Condition;
	information	 = 	DIA_Mortis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Mortis_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Mortis_Hallo_13_00"); //Cosa vuoi? Peck non c'è, per cui non posso darti niente. Ripassa più tardi.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Waffe		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Waffe_Condition;
	information	 = 	DIA_Mortis_Waffe_Info;
	permanent    =  FALSE;
	description  =  "Dov'è Peck?";
};

func int DIA_Mortis_Waffe_Condition ()
{	
	if (MIS_Andre_Peck == LOG_RUNNING)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Waffe_15_00"); //Dov’è Peck?
	AI_Output (self, other, "DIA_Mortis_Waffe_13_01"); //Hai appena iniziato con noi, eh? Bene allora, benvenuto a bordo.
	AI_Output (self, other, "DIA_Mortis_Waffe_13_02"); //Peck non si vede in città da parecchio tempo. Scommetto che sta gironzolando intorno a Vanja alla Lanterna Rossa.
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Paket		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Paket_Condition;
	information	 = 	DIA_Mortis_Paket_Info;
	permanent    =  FALSE;
	description  =  "Cosa mi dici di quella confezione d’erba?";
};

func int DIA_Mortis_Paket_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Paket_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Paket_15_00"); //Cosa mi dici di quella confezione d’erba?
	AI_Output (self, other, "DIA_Mortis_Paket_13_01"); //Mmmh... l'ultima volta che sono stato alla taverna al porto ho sentito Kardif e un altro tizio che ne parlavano.
	AI_Output (other, self, "DIA_Mortis_Paket_15_02"); //Chi era l’altro tizio?
	AI_Output (self, other, "DIA_Mortis_Paket_13_03"); //Non ne ho idea. Ma ha detto di aver trovato il posto migliore per tenere le sue erbe, quindi i due sono scoppiati a ridere come due orchi ubriachi.
	
	B_LogEntry (TOPIC_WAREHOUSE,"Mortis ha sentito l'albergatore Kardif parlare con degli altri uomini a propostito di un pacco alla taverna del porto. Stavano discutendo dove conservarlo.");
};
///////////////////////////////////////////////////////////////////////
//	Info Redlight
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Redlight		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Redlight_Condition;
	information	 = 	DIA_Mortis_Redlight_Info;
	permanent    =  FALSE;
	description  =  "Cosa mi dici del distretto del porto?";
};

func int DIA_Mortis_Redlight_Condition ()
{	
	if (MIS_ANDRE_REDLIGHT == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Redlight_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Redlight_15_00"); //Cosa sai sul distretto del porto? Voglio trovare chi spaccia l'erba di palude.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_01"); //Beeeh, le persone laggiù non sono molto loquaci, soprattutto con una guardia cittadina.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_02"); //Se vuoi scoprire qualcosa laggiù, dovresti, anzi, DEVI, toglierti l'armatura.
	AI_Output (other, self, "DIA_Mortis_Redlight_15_03"); //Va bene, e poi?
	AI_Output (self, other, "DIA_Mortis_Redlight_13_04"); //La taverna e il bordello sono probabilmente i posti migliori dove rivolgersi se vuoi avere delle informazioni.
	
	B_LogEntry (TOPIC_REDLIGHT,"Mortis suggerisce che se volessi comprare dell'erba di palude al porto, farei meglio a non indossare alcuna armatura. Le taverne e i bordelli sono generalmente i posti più indicati dove cominciare la ricerca.");
};
///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_CanTeach		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  5;
	condition	 = 	DIA_Mortis_CanTeach_Condition;
	information	 = 	DIA_Mortis_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Voglio diventare più forte.";
};

func int DIA_Mortis_CanTeach_Condition ()
{	
	if (Mortis_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Mortis_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_CanTeach_15_00"); //Voglio diventare più forte.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_01"); //Ricevuto. Se hai accumulato abbastanza esperienza posso aiutarti nel tuo addestramento.
		Mortis_TeachSTR = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_02"); //Naturalmente. Ma fino a che non sarai uno di noi o un paladino, non posso aiutarti.
	};
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Mortis, la guardia cittadina, può aiutarmi a migliorare la forza.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Teach		(C_INFO)
{
	npc		  	 = 	Mil_314_Mortis;
	nr			 = 	100;
	condition	 = 	DIA_Mortis_Teach_Condition;
	information	 = 	DIA_Mortis_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voglio diventare più forte.";
};
func int DIA_Mortis_Teach_Condition ()
{	
	if (Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Mortis_Teach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Teach_15_00"); //Voglio diventare più forte.
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
};
func void DIA_Mortis_Teach_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output (self, other, "DIA_Mortis_Teach_13_00"); //Sei già abbastanza forte. Se vuoi allenarti ulteriormente, rivolgiti da qualche altra parte.
	};
	Info_ClearChoices (DIA_Mortis_TEACH);
};
func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_TEACH_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};
func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mortis_PICKPOCKET (C_INFO)
{
	npc			= Mil_314_Mortis;
	nr			= 900;
	condition	= DIA_Mortis_PICKPOCKET_Condition;
	information	= DIA_Mortis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Mortis_PICKPOCKET_Condition()
{
	C_Beklauen (38, 60);
};
 
FUNC VOID DIA_Mortis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mortis_PICKPOCKET);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_BACK 		,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};
	
func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};


