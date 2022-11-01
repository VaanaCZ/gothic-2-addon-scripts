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
		AI_Output (self, other,"DIA_Sergio_EXIT_04_00");//Niech Innos oświetla ścieżkę, po której kroczysz.
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
	AI_Output (self, other, "DIA_Sergio_WELCOME_04_00"); //Innos z tobą, słucham, co mogę dla ciebie zrobić?
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
	AI_Output (self, other, "DIA_Sergio_Isgaroth_04_00"); //Modliłeś się za mych braci. Serdecznie ci za to dziękuję. Co mogę dla ciebie zrobić?
	
	Info_ClearChoices (DIA_Sergio_Isgaroth);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"Może mały datek?",DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"Podziel się ze mną swoim doświadczeniem i wiedzą na temat walki.",DIA_Sergio_Isgaroth_XP);
};	
FUNC VOID DIA_Sergio_Isgaroth_Spende()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_Spende_15_00"); //Może mały datek?
	AI_Output (self, other, "DIA_Sergio_Isgaroth_Spende_04_01"); //Niech to złoto dobrze ci służy.
	
	B_GiveInvItems (self,other, ItMi_Gold,100);
	Info_ClearChoices (DIA_Sergio_Isgaroth);
};
FUNC VOID DIA_Sergio_Isgaroth_XP()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_XP_15_00"); //Podziel się ze mną swoim doświadczeniem i wiedzą na temat walki.
	AI_Output (self, other, "DIA_Sergio_Isgaroth_XP_04_01"); //Kiedy walczysz, zawsze pamiętaj, by chronić się przed atakiem z tyłu.
	
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
	description	 = 	"Chcę skorzystać z biblioteki.";
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
	AI_Output (other, self, "DIA_Sergio_Aufgabe_15_00"); //Chcę skorzystać z biblioteki.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_01"); //Obawiam się, że to niemożliwe. Najpierw musisz wykonać przydzielone ci zadania.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_02"); //Mogę ci jednak pomóc. Udaj się do Mistrza Isgarotha i porozmawiaj z nim. Słyszałem, że potrzebuje pomocy, sam miałem się tym zająć, ale chyba mogę ci zaufać.
	
	Sergio_Sends = TRUE;
	Wld_InsertNpc (BlackWolf,"NW_PATH_TO_MONASTER_AREA_01"); //ist richtig geschrieben! 
	
	Log_CreateTopic (Topic_IsgarothWolf,LOG_MISSION);
	Log_SetTopicStatus	 (Topic_IsgarothWolf,LOG_RUNNING);
	B_LogEntry (Topic_IsgarothWolf,"Mistrz Isgaroth potrzebuje pomocy w kaplicy. Powinienem się z nim spotkać.");
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
	AI_Output (self, other, "DIA_Sergio_WHAT_04_01"); //Modlę się do Innosa, by wzmocnił me ramię i wolę.
	AI_Output (self, other, "DIA_Sergio_WHAT_04_02"); //Dzięki temu, niestraszni mi wrogowie, pokonuję ich, oddając cześć Innosowi.
	AI_Output (other, self, "DIA_Sergio_WHAT_15_03"); //O jakich wrogach mówisz?
	AI_Output (self, other, "DIA_Sergio_WHAT_04_04"); //O wszystkich tych, którzy sprzeciwiają się woli Innosa. Nieważne czy są ludźmi, czy demonami z piekła rodem.
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
	description	 = 	"Mógłbyś poćwiczyć trochę z Babo?";
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
	AI_Output (other, self, "DIA_Sergio_Babo_15_00"); //Mógłbyś poćwiczyć trochę z Babo?
	AI_Output (self, other, "DIA_Sergio_Babo_04_01"); //Dlaczego sam nie przyjdzie i o to nie zapyta?
	AI_Output (other, self, "DIA_Sergio_Babo_15_02"); //Chyba jest nieśmiały.
	AI_Output (self, other, "DIA_Sergio_Babo_04_03"); //Rozumiem. Dobrze, skoro to tyle dla niego znaczy, będę go trenował, codziennie rano po dwie godziny. Przekaż mu, że zaczynamy o piątej.
	
	Npc_ExchangeRoutine (self, "TRAIN");
	B_StartOtherRoutine (Babo,"TRAIN");

	B_LogEntry (Topic_BaboTrain, "Sergio zgodził się trenować z Babo każdego dnia przez dwie godziny."); 
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
	description	 = 	"Dlaczego nie przebywasz z pozostałymi paladynami?";
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
	AI_Output (other, self, "DIA_Sergio_WHY_15_00"); //Dlaczego nie przebywasz z pozostałymi paladynami?
	AI_Output (self, other, "DIA_Sergio_WHY_04_01"); //To, że tu jestem, może się wydawać dziwne, jednak my, paladyni, służymy także magom, gdyż i oni, tak jak my, czczą Innosa.
	AI_Output (self, other, "DIA_Sergio_WHY_04_02"); //My, paladyni, walczymy w imię Innosa. Jego wola jest naszym prawem. W tej chwili oczekuję na rozkazy od magów.

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
	description	 = 	"Dostałeś już nowe rozkazy?";
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
	AI_Output (other, self, "DIA_Sergio_ORDERS_15_00"); //Dostałeś już nowe rozkazy?
	AI_Output (self, other, "DIA_Sergio_ORDERS_04_01"); //W tej chwili muszę się starać odnaleźć siłę w modlitwie.
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
	description	 = 	"Masz mnie eskortować do przełęczy.";
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
	AI_Output (other, self, "DIA_Sergio_Start_15_00"); //Masz mnie eskortować do przełęczy.
	AI_Output (self, other, "DIA_Sergio_Start_04_01"); //Dobrze, uczynię to. Znam drogę, chodź za mną.
	
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
	AI_Output (self, other, "DIA_Sergio_Guide_04_01"); //Zabiorę cię do przełęczy. Jednak niebezpieczna część podróży dopiero tam się rozpocznie.
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
	AI_Output (self, other, "DIA_Sergio_Ende_04_00"); //Jesteśmy na miejscu. Bez względu na to, co czeka na ciebie w Górniczej Dolinie, liczę, że cało powrócisz z tej wyprawy.
	AI_Output (other, self, "DIA_Sergio_Ende_15_01"); //Nie obawiaj się - wrócę.
	AI_Output (self, other, "DIA_Sergio_Ende_04_02"); //Niech Innos prowadzi cię i ochrania.
	
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
		AI_Output (self, other, "DIA_Sergio_Perm_04_00"); //Na Innosa, Bracie. Jeśli chcesz dowiedzieć się czegoś o Konsekracji Miecza, porozmawiaj z Mardukiem.
	}
	else
	{
		AI_Output (self, other, "DIA_Sergio_Perm_04_01"); //Słyszałem o tobie. Jesteś człowiekiem z farm, który powrócił z Górniczej Doliny. Przyjmij mój szacunek.
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




 









