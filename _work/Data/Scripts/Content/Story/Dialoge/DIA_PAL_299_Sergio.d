///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sergio_EXIT   (C_INFO)
{
	npc         = PAL_299_Sergio;
	nr          = 999;
	condition   = DIA_Sergio_EXIT_Condition;
	information = DIA_Sergio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Sergio_EXIT_Info()
{
	if (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)  // Nur wenn Sergio in der Kapelle ist M.F.  
	{
		AI_Output (self, other,"DIA_Sergio_EXIT_04_00");//Niech Innos oœwietla œcie¿kê, po której kroczysz.
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WELCOME		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr 			 =  5;
	condition	 = 	DIA_Sergio_WELCOME_Condition;
	information	 = 	DIA_Sergio_WELCOME_Info;
	important	 = 	TRUE;
};

func int DIA_Sergio_WELCOME_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other, DIA_Sergio_Isgaroth) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Sergio_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Sergio_WELCOME_04_00"); //Innos z tob¹, s³ucham, co mogê dla ciebie zrobiæ?
};
///////////////////////////////////////////////////////////////////////
//	Info Isgaroth
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Isgaroth		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Isgaroth_Condition;
	information	 = 	DIA_Sergio_Isgaroth_Info;
	permanent	 =  FALSE;
	important	 =  TRUE;
};
func int DIA_Sergio_Isgaroth_Condition ()
{	
	if Npc_KnowsInfo (hero,PC_PrayShrine_Paladine)
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (Kapitel == 1)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Isgaroth_Info ()
{
	AI_Output (self, other, "DIA_Sergio_Isgaroth_04_00"); //Modli³eœ siê za mych braci. Serdecznie ci za to dziêkujê. Co mogê dla ciebie zrobiæ?
	
	Info_ClearChoices (DIA_Sergio_Isgaroth);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"Mo¿e ma³y datek?",DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"Podziel siê ze mn¹ swoim doœwiadczeniem i wiedz¹ na temat walki.",DIA_Sergio_Isgaroth_XP);
};	
FUNC VOID DIA_Sergio_Isgaroth_Spende()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_Spende_15_00"); //Mo¿e ma³y datek?
	AI_Output (self, other, "DIA_Sergio_Isgaroth_Spende_04_01"); //Niech to z³oto dobrze ci s³u¿y.
	
	B_GiveInvItems (self,other, ItMi_Gold,100);
	Info_ClearChoices (DIA_Sergio_Isgaroth);
};
FUNC VOID DIA_Sergio_Isgaroth_XP()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_XP_15_00"); //Podziel siê ze mn¹ swoim doœwiadczeniem i wiedz¹ na temat walki.
	AI_Output (self, other, "DIA_Sergio_Isgaroth_XP_04_01"); //Kiedy walczysz, zawsze pamiêtaj, by chroniæ siê przed atakiem z ty³u.
	
	other.HitChance[NPC_TALENT_2H] = (other.HitChance[NPC_TALENT_2H] + 2);
	PrintScreen	(PRINT_Learn2H, -1, -1, FONT_ScreenSmall, 2);
	Info_ClearChoices (DIA_Sergio_Isgaroth);
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Aufgabe		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_Aufgabe_Condition;
	information	 = 	DIA_Sergio_Aufgabe_Info;
	description	 = 	"Chcê skorzystaæ z biblioteki.";
};
func int DIA_Sergio_Aufgabe_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other,DIA_Sergio_Isgaroth))
	{	
		return TRUE;
	};
};
func void DIA_Sergio_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Aufgabe_15_00"); //Chcê skorzystaæ z biblioteki.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_01"); //Obawiam siê, ¿e to niemo¿liwe. Najpierw musisz wykonaæ przydzielone ci zadania.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_02"); //Mogê ci jednak pomóc. Udaj siê do Mistrza Isgarotha i porozmawiaj z nim. S³ysza³em, ¿e potrzebuje pomocy, sam mia³em siê tym zaj¹æ, ale chyba mogê ci zaufaæ.
	
	Sergio_Sends = TRUE;
	Wld_InsertNpc (BlackWolf,"NW_PATH_TO_MONASTER_AREA_01"); //ist richtig geschrieben! 
	
	Log_CreateTopic (Topic_IsgarothWolf,LOG_MISSION);
	Log_SetTopicStatus	 (Topic_IsgarothWolf,LOG_RUNNING);
	B_LogEntry (Topic_IsgarothWolf,"Mistrz Isgaroth potrzebuje pomocy w kaplicy. Powinienem siê z nim spotkaæ.");
};	

///////////////////////////////////////////////////////////////////////
//	Info WHAT
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHAT		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_WHAT_Condition;
	information	 = 	DIA_Sergio_WHAT_Info;
	description	 = 	"Co tu porabiasz?";
};
func int DIA_Sergio_WHAT_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	{	
		return TRUE;
	};
};
func void DIA_Sergio_WHAT_Info ()
{
	AI_Output (other, self, "DIA_Sergio_WHAT_15_00"); //Co porabiasz?
	AI_Output (self, other, "DIA_Sergio_WHAT_04_01"); //Modlê siê do Innosa, by wzmocni³ me ramiê i wolê.
	AI_Output (self, other, "DIA_Sergio_WHAT_04_02"); //Dziêki temu, niestraszni mi wrogowie, pokonujê ich, oddaj¹c czeœæ Innosowi.
	AI_Output (other, self, "DIA_Sergio_WHAT_15_03"); //O jakich wrogach mówisz?
	AI_Output (self, other, "DIA_Sergio_WHAT_04_04"); //O wszystkich tych, którzy sprzeciwiaj¹ siê woli Innosa. Niewa¿ne czy s¹ ludŸmi, czy demonami z piek³a rodem.
};
///////////////////////////////////////////////////////////////////////
//	Info Babo
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Babo		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_Babo_Condition;
	information	 = 	DIA_Sergio_Babo_Info;
	description	 = 	"Móg³byœ poæwiczyæ trochê z Babo?";
};
func int DIA_Sergio_Babo_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other, DIA_Babo_Anliegen)
	{	
		return TRUE;
	};
};
func void DIA_Sergio_Babo_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Babo_15_00"); //Móg³byœ poæwiczyæ trochê z Babo?
	AI_Output (self, other, "DIA_Sergio_Babo_04_01"); //Dlaczego sam nie przyjdzie i o to nie zapyta?
	AI_Output (other, self, "DIA_Sergio_Babo_15_02"); //Chyba jest nieœmia³y.
	AI_Output (self, other, "DIA_Sergio_Babo_04_03"); //Rozumiem. Dobrze, skoro to tyle dla niego znaczy, bêdê go trenowa³, codziennie rano po dwie godziny. Przeka¿ mu, ¿e zaczynamy o pi¹tej.
	
	Npc_ExchangeRoutine (self, "TRAIN");
	B_StartOtherRoutine (Babo,"TRAIN");

	B_LogEntry (Topic_BaboTrain, "Sergio zgodzi³ siê trenowaæ z Babo ka¿dego dnia przez dwie godziny."); 
};
///////////////////////////////////////////////////////////////////////
//	Info WHY
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHY		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  4;
	condition	 = 	DIA_Sergio_WHY_Condition;
	information	 = 	DIA_Sergio_WHY_Info;
	description	 = 	"Dlaczego nie przebywasz z pozosta³ymi paladynami?";
};
func int DIA_Sergio_WHY_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Sergio_WELCOME)
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		return TRUE;
	};
};
func void DIA_Sergio_WHY_Info ()
{
	AI_Output (other, self, "DIA_Sergio_WHY_15_00"); //Dlaczego nie przebywasz z pozosta³ymi paladynami?
	AI_Output (self, other, "DIA_Sergio_WHY_04_01"); //To, ¿e tu jestem, mo¿e siê wydawaæ dziwne, jednak my, paladyni, s³u¿ymy tak¿e magom, gdy¿ i oni, tak jak my, czcz¹ Innosa.
	AI_Output (self, other, "DIA_Sergio_WHY_04_02"); //My, paladyni, walczymy w imiê Innosa. Jego wola jest naszym prawem. W tej chwili oczekujê na rozkazy od magów.

};
///////////////////////////////////////////////////////////////////////
//	Info ORDERS
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_ORDERS		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_ORDERS_Condition;
	information	 = 	DIA_Sergio_ORDERS_Info;
	permanent	 =  TRUE;
	description	 = 	"Dosta³eœ ju¿ nowe rozkazy?";
};
func int DIA_Sergio_ORDERS_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Sergio_WHY)
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE) 
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		return TRUE;
	};
};
func void DIA_Sergio_ORDERS_Info ()
{
	AI_Output (other, self, "DIA_Sergio_ORDERS_15_00"); //Dosta³eœ ju¿ nowe rozkazy?
	AI_Output (self, other, "DIA_Sergio_ORDERS_04_01"); //W tej chwili muszê siê staraæ odnaleŸæ si³ê w modlitwie.
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Start
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Start		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_Start_Condition;
	information	 = 	DIA_Sergio_Start_Info;
	permanent	 =  FALSE;
	description	 = 	"Masz mnie eskortowaæ do prze³êczy.";
};
func int DIA_Sergio_Start_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&&	(Sergio_Follow == TRUE)
	&&  (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Start_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Start_15_00"); //Masz mnie eskortowaæ do prze³êczy.
	AI_Output (self, other, "DIA_Sergio_Start_04_01"); //Dobrze, uczyniê to. Znam drogê, chodŸ za mn¹.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;  
	self.npctype = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine (self,"GUIDE"); 
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Guide		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_Guide_Condition;
	information	 = 	DIA_Sergio_Guide_Info;
	permanent	 =  TRUE;
	description	 = 	"Idziemy?";
};
func int DIA_Sergio_Guide_Condition ()
{	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE) 
	&& (Npc_GetDistToWP (self,"NW_TO_PASS_01") > 1000)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Guide_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Guide_15_00"); //Jak leci?
	AI_Output (self, other, "DIA_Sergio_Guide_04_01"); //Zabiorê ciê do prze³êczy. Jednak niebezpieczna czêœæ podró¿y dopiero tam siê rozpocznie.
	AI_Output (self, other, "DIA_Sergio_Guide_04_02"); //Nie marnujmy jednak czasu.
	
	AI_StopProcessInfos (self);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Ende
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Ende		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Ende_Condition;
	information	 = 	DIA_Sergio_Ende_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Sergio_Ende_Condition ()
{	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE) 
	&& (Npc_GetDistToWP (self,"NW_TO_PASS_01") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Ende_Info ()
{
	AI_Output (self, other, "DIA_Sergio_Ende_04_00"); //Jesteœmy na miejscu. Bez wzglêdu na to, co czeka na ciebie w Górniczej Dolinie, liczê, ¿e ca³o powrócisz z tej wyprawy.
	AI_Output (other, self, "DIA_Sergio_Ende_15_01"); //Nie obawiaj siê - wrócê.
	AI_Output (self, other, "DIA_Sergio_Ende_04_02"); //Niech Innos prowadzi ciê i ochrania.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE; 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START"); 
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Perm		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Perm_Condition;
	information	 = 	DIA_Sergio_Perm_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Sergio_Perm_Condition ()
{	
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Perm_Info ()
{
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Sergio_Perm_04_00"); //Na Innosa, Bracie. Jeœli chcesz dowiedzieæ siê czegoœ o Konsekracji Miecza, porozmawiaj z Mardukiem.
	}
	else
	{
		AI_Output (self, other, "DIA_Sergio_Perm_04_01"); //S³ysza³em o tobie. Jesteœ cz³owiekiem z farm, który powróci³ z Górniczej Doliny. Przyjmij mój szacunek.
	};
	AI_StopProcessInfos (self);
	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sergio_PICKPOCKET (C_INFO)
{
	npc			= PAL_299_Sergio;
	nr			= 900;
	condition	= DIA_Sergio_PICKPOCKET_Condition;
	information	= DIA_Sergio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Sergio_PICKPOCKET_Condition()
{
	C_Beklauen (78, 85);
};
 
FUNC VOID DIA_Sergio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sergio_PICKPOCKET);
	Info_AddChoice		(DIA_Sergio_PICKPOCKET, DIALOG_BACK 		,DIA_Sergio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sergio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sergio_PICKPOCKET_DoIt);
};

func void DIA_Sergio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sergio_PICKPOCKET);
};
	
func void DIA_Sergio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sergio_PICKPOCKET);
};




 









