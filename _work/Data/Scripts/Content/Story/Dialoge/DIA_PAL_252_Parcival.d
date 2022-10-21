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
	description	 =	"Co mo¿esz mi powiedzieæ na temat kretów?";
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
	AI_Output (other, self, "DIA_Parcival_Schurfer_15_00"); //Co mo¿esz mi powiedzieæ na temat kretów?
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_01"); //Zebra³em trzy grupy.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_02"); //Marcos, Fajeth i Silvestro to paladyni nimi dowodz¹cy.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_03"); //Grupa Marcosa skierowa³a siê do starej kopalni, prowadzona przez starego kopacza - Grimesa.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_04"); //Dwie pozosta³e grupy wyruszy³y razem.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_05"); //Jergan, jeden ze zwiadowców, doniós³ mi, ¿e rozbili obóz niedaleko wielkiej wie¿y.
	
	B_LogEntry (TOPIC_ScoutMine,"Ekipami górników dowodz¹ trzej paladyni: Marcos, Fajeth i Silvestro.");
	B_LogEntry (TOPIC_ScoutMine,"Grupa Marcosa uda³a siê w stronê starej kopalni. Ich zwiadowc¹ jest kopacz Grimes."); 
	B_LogEntry (TOPIC_ScoutMine,"Pozosta³e dwie grupy wyruszy³y razem. Podobno za³o¿y³y obóz w pobli¿u wielkiej wie¿y."); 
	
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
	description	 =	"Z któr¹ grup¹ kretów poszed³ Diego?";
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
	AI_Output (other, self, "DIA_Parcival_Diego_15_00"); //Z któr¹ grup¹ kretów poszed³ Diego?
	AI_Output (self, other, "DIA_Parcival_Diego_13_01"); //Diego - ten skazaniec? Jest w grupie paladyna Silvestra.
	
	B_LogEntry (TOPIC_ScoutMine,"Diego wyruszy³ z ekip¹ prowadzon¹ przez paladyna Silvestra."); 
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
	description	 =	"Czy wiesz, jak mogê siê dostaæ na teren wydobycia?";
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
	AI_Output (other, self, "DIA_Parcival_Weg_15_00"); //Wiesz, jak mogê dostaæ siê na teren wydobycia?
	AI_Output (self, other, "DIA_Parcival_Weg_13_01"); //Nie ma ¿adnej bezpiecznej œcie¿ki prowadz¹cej do doliny. Droga g³ównym szlakiem wydaje siê jednak ma³o rozs¹dna.
	AI_Output (self, other, "DIA_Parcival_Weg_13_02"); //Trzymaj siê z dala od lasów i unikaj orków. Niech Innos ciê prowadzi.
	
	B_LogEntry (TOPIC_ScoutMine,"Chyba lepiej bêdzie, jeœli wybiorê inn¹ drogê ni¿ ekipy górnicze. W lasach a¿ roi siê od orków."); 
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
	description	 =	"Jak wygl¹da sytuacja?";
};
func int DIA_Parcival_DRAGON_Condition ()	
{
	return TRUE;
};
func void DIA_Parcival_DRAGON_Info ()
{
	AI_Output (other, self, "DIA_Parcival_DRAGON_15_00"); //Jak wygl¹da sytuacja?
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_01"); //Obóz jest otoczony przez orków. NieŸle siê okopali.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_02"); //Bardziej alarmuj¹ce s¹ jednak ataki smoków. Zniszczy³y ju¿ ca³y zewnêtrzny pierœcieñ.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_03"); //Kolejny atak smoków przyniesie ze sob¹ jeszcze dotkliwsze straty.
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
	description	 = 	"Ile jest tych smoków?";
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
	AI_Output (other, self, "DIA_Parcival_DRAGONS_15_00"); //Ile jest tych smoków?
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_01"); //Nie wiemy dok³adnie, ale pewne jest, ¿e wiêcej ni¿ jeden.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_02"); //To jednak nie wszystko. Ca³a Górnicza Dolina jest pe³na bestii, wspomagaj¹cych smoki.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_03"); //Nie oszukujmy siê - bez posi³ków z zewn¹trz, nasze szanse na prze¿ycie s¹ nik³e.
	 
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
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_00"); //Na razie panuje wzglêdny spokój. Ale ta sytuacja mo¿e siê bardzo szybko zmieniæ.
		};
		if randy == 1
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_01"); //Bêdziemy stawiaæ opór tak d³ugo, jak starczy nam si³.
		};
		if randy == 2
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_02"); //Innos nas poprowadzi. Jego œwiat³oœæ ogrzewa nasze serca.
		};
	
	}
	else 
	{
	AI_Output			(self, other, "DIA_Parcival_BRAVE_13_03"); //Hej, nie masz nic lepszego do roboty, ni¿ zawracanie mi g³owy? Wynoœ siê!
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

	description	 = 	"Wszystko w porz¹dku?";
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
	AI_Output			(other, self, "DIA_Parcival_ALLESKLAR_15_00"); //Wszystko w porz¹dku?

	if (DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_01"); //Jak na razie tak!
	}	
	else if (DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_02"); //Do diab³a, tak.
	}	
	else if (Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_03"); //Ach. Rozumiem, co masz na myœli. Nie, przyjacielu, nie tym razem.
	}
	else
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_04"); //Nie przeszkadzaj mi.
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

	description  =	"Czy sta³o siê coœ wa¿nego?";		
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
	AI_Output	(other,self ,"DIA_Parcival_AnyNews_15_00"); //Czy sta³o siê coœ wa¿nego?
	if (hero.guild == GIL_DJG)
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_01"); //Nale¿ysz do tych szumowin, które nazywaj¹ siê ³owcami smoków?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_02"); //Naprawdê, spodziewa³em siê po tobie troszkê wiêcej godnoœci, ty zaœ przy³¹czasz siê do takich ludzi.
	
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_03"); //Jestem zmartwiony, bardzo zmartwiony.
		AI_Output 	(other,self ,"DIA_Parcival_AnyNews_15_04"); //Dlaczego?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_05"); //Ostatnio pojawili siê tu ci ludzie. Chc¹, ¿eby ich nazywaæ ³owcami smoków.
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_06"); //Jeœli o mnie chodzi, to s¹ to tylko przestêpcy i obiboki.
	};
	AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_07"); //Gdyby to zale¿a³o ode mnie, wywali³bym ich z zamku. Niech orkowie dobior¹ im siê do skóry.

	Info_ClearChoices (DIA_Parcival_AnyNews);
	Info_AddChoice	(DIA_Parcival_AnyNews,"Ale oni, w przeciwieñstwie do Lorda Hagena, s¹ tutaj.",DIA_Parcival_AnyNews_LordHagen); 
	Info_AddChoice	(DIA_Parcival_AnyNews,"Powinieneœ daæ im szansê.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice	(DIA_Parcival_AnyNews,"Nie s¹dzisz, ¿e trochê przesadzasz?",DIA_Parcival_AnyNews_Overact);
	
};

FUNC VOID DIA_Parcival_AnyNews_LordHagen ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_LordHagen_15_00"); //Ale oni, w przeciwieñstwie do Lorda Hagena, s¹ tutaj.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_01"); //Tak, mamy tylko ich.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_02"); //Innos poddaje nas straszliwej próbie.
	
	Info_ClearChoices (DIA_Parcival_AnyNews);
};

FUNC VOID DIA_Parcival_AnyNews_Chance ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Chance_15_00"); //Powinieneœ daæ im szansê.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_01"); //Dostali j¹. Niestety.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_02"); //Garond jest przekonany, ¿e bêd¹ mogli nam pomóc.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_03"); //Ja jednak nie spuszczam z nich oka. Mamy dostateczne du¿o k³opotów z orkami. Nie potrzebujemy dodatkowych zmartwieñ.
	
	Info_ClearChoices (DIA_Parcival_AnyNews);  
};

FUNC VOID DIA_Parcival_AnyNews_Overact ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Overact_15_00"); //Nie s¹dzisz, ¿e trochê przesadzasz?
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_01"); //Zdecydowanie nie. Brakuje nam ludzi, którzy mogliby stanowiæ inspiruj¹cy przyk³ad.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_02"); //Wojowników, którzy rozpaliliby ogieñ Innosa w sercach walcz¹cych.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_03"); //Tymczasem, mamy tylko grupkê szumowin, os³abiaj¹c¹ morale ¿o³nierzy.
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
	description  =	"Muszê porozmawiaæ z tob¹ o Janie.";		
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
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_00"); //Muszê porozmawiaæ z tob¹ o Janie.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_01"); //Jan. Kto to taki?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_02"); //£owca smoków. Jest kowalem.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_03"); //Ach tak, pamiêtam. O co chodzi?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_04"); //Chcia³by pracowaæ w kuŸni.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_05"); //To wykluczone. Nie jest jednym z nas, nie ufam mu.
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
	description  =	"Proszê, rozwa¿ jeszcze sprawê Jana.";		
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
	AI_Output	(other,self ,"DIA_Parcival_ThinkAgain_15_00"); //Proszê, rozwa¿ jeszcze sprawê Jana.
	AI_Output 	(self ,other,"DIA_Parcival_ThinkAgain_13_01"); //Moja decyzja jest ostateczna.
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

	description  =	"Garond chce, by Jan przej¹³ kuŸniê.";		
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
	AI_Output	(other,self ,"DIA_Parcival_TalkedGarond_15_00"); //Garond chce, by Jan przej¹³ kuŸniê.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_01"); //Hmmm. Skoro tak, to niech j¹ sobie bierze.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_02"); //Mimo to uwa¿am, ¿e ufanie Janowi to wielki b³¹d.
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

	description	 = 	"Coœ jeszcze?";
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
	AI_Output			(other, self, "DIA_Parcival_PERMKAP4_15_00"); //Coœ jeszcze?
	AI_Output			(self, other, "DIA_Parcival_PERMKAP4_13_01"); //Ach, zostaw mnie w spokoju.

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
	
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_00"); //Zdrajca! Wiem dobrze, ¿e to TY otworzy³eœ bramê.
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_01"); //Zap³acisz mi za to.
	
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


















































		
																				
	
	
	
	
	
	
	
	
	
	
	
	














