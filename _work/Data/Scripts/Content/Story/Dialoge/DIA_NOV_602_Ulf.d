///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulf_EXIT   (C_INFO)
{
	npc         = NOV_602_Ulf;
	nr          = 999;
	condition   = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info YOU
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Hallo		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	2;
	condition	 = 	DIA_Ulf_Hallo_Condition;
	information	 = 	DIA_Ulf_Hallo_Info;
	permanent	 =  FALSE;
	description	 = 	"Co tu porabiasz?";
};

func int DIA_Ulf_Hallo_Condition ()
{
	if (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	&& (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};	
};
func void DIA_Ulf_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Hallo_15_00"); //Co tu porabiasz?
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_01"); //Staram się jak najlepiej wykonać zadania zlecone mi przez klasztor.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_02"); //Jestem nowicjuszem w klasztorze. Wykonuję zlecenia magów i pladynów.
		AI_Output (self, other, "DIA_Ulf_Hallo_03_03"); //Właśnie dostarczyłem trzem karczmarzom w mieście wino z klasztoru.
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Wirte
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Wirte		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Wirte_Condition;
	information	 = 	DIA_Ulf_Wirte_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kim są właściciele trzech knajp?";
};

func int DIA_Ulf_Wirte_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Wirte_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Wirte_15_00"); //Kim są ci trzej karczmarze?
	AI_Output (self, other, "DIA_Ulf_Wirte_03_01"); //Jednym z nich jest ten miły człowiek za barem.
	AI_Output (self, other, "DIA_Ulf_Wirte_03_02"); //Drugim jest Caragon, prowadzący tawernę na placu świątynnym, trzecim zaś Kardif, właściciel knajpy w dzielnicy portowej.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Kloster		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Kloster_Condition;
	information	 = 	DIA_Ulf_Kloster_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co możesz mi powiedzieć o klasztorze?";
};

func int DIA_Ulf_Kloster_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Kloster_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Kloster_15_00"); //Co możesz mi powiedzieć o klasztorze?
	AI_Output (self, other, "DIA_Ulf_Kloster_03_01"); //My, nowicjusze, poszukujemy oświecenia w modlitwie do Innosa, pod nadzorem magów przyswajamy też podstawy wiary.
	AI_Output (self, other, "DIA_Ulf_Kloster_03_02"); //Służymy im, by oni mogli służyć Innosowi. No i przygotowujemy się do zjednoczenia z Ogniem.
};
///////////////////////////////////////////////////////////////////////
//	bring mich zum Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Bringen	(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	4;
	condition	 = 	DIA_Ulf_Bringen_Condition;
	information	 = 	DIA_Ulf_Bringen_Info;
	permanent	 =  FALSE;
	description	 = 	"Zabierz mnie do klasztoru.";
};

func int DIA_Ulf_Bringen_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Bringen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Bringen_15_00"); //Zabierz mnie do klasztoru.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_01"); //Nie ma szans. Nie wiesz chyba, z iloma stworzeniami musiałem sobie poradzić, zanim tutaj dotarłem.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_02"); //Kiedy pomyślę o tych wszystkich krwiopijcach, wilkach i goblinach, to się cieszę, że nie muszę się stąd ruszać.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_03"); //Poza tym i tak nie wszedłbyś do klasztoru.
	AI_Output (other, self, "DIA_Ulf_Bringen_15_04"); //Dlaczego?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_05"); //Wejść tam mogą jedynie magowie, paladyni i nowicjusze.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Aufnahme		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Aufnahme_Condition;
	information	 = 	DIA_Ulf_Aufnahme_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jak mogę zostać nowicjuszem?";
};

func int DIA_Ulf_Aufnahme_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Bringen)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Aufnahme_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_00"); //Jak mogę zostać nowicjuszem?
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_01"); //Kiedy człowiek czuje głęboką wewnętrzną potrzebę...
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_02"); //Hej - powiedz mi tylko, jakie muszę spełnić warunki!
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_03"); //Potrzebujesz darów. Owcy i...
	B_Say_Gold (self, other, Summe_Kloster);
	
	Log_CreateTopic (Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
	B_LogEntry (Topic_Kloster,"Aby zostać nowicjuszem w klasztorze Innosa, będę potrzebował owcy i 1000 sztuk złota.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Gold		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	8;
	condition	 = 	DIA_Ulf_Gold_Condition;
	information	 = 	DIA_Ulf_Gold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Skąd mam wziąć tyle złota?";
};

func int DIA_Ulf_Gold_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Gold_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Gold_15_00"); //Skąd mam wziąć tyle złota?
	AI_Output (self, other, "DIA_Ulf_Gold_03_01"); //Jak mniemam, nie znasz nikogo, kto by za ciebie zapłacił. Zatem będziesz je musiał zarobić.
};
///////////////////////////////////////////////////////////////////////
//	Info Schaf
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Schaf		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Schaf_Condition;
	information	 = 	DIA_Ulf_Schaf_Info;
	permanent	 = 	FALSE;
	description	 = 	"Skąd mogę wziąć owcę?";
};

func int DIA_Ulf_Schaf_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Schaf_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Schaf_15_00"); //Skąd mogę wziąć owcę?
	AI_Output (self, other, "DIA_Ulf_Schaf_03_01"); //Od farmerów, oczywiście. Nie dostaniesz jej jednak za darmo.
	
	B_LogEntry (Topic_Kloster,"Owcę mogę zdobyć u farmerów.");
};
///////////////////////////////////////////////////////////////////////
//	Info Suche
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Suche		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Suche_Condition;
	information	 = 	DIA_Ulf_Suche_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Ulf_Suche_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Suche_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Suche_03_00"); //Hej, nie zgadniesz, co się stało.
	AI_Output (other, self, "DIA_Ulf_Suche_15_01"); //Zostałeś wybrańcem.
	AI_Output (self, other, "DIA_Ulf_Suche_03_02"); //Dokładnie. Właśnie miałem napić się zimnego piwa, kiedy zjawił się Daron i oznajmił, że zostałem wybrańcem.
	AI_Output (self, other, "DIA_Ulf_Suche_03_03"); //Kto by pomyślał? Niezbadana jest wola Innosa. Co cię tu sprowadza?
	AI_Output (other, self, "DIA_Ulf_Suche_15_04"); //Zażądałem Próby Ognia.
	AI_Output (self, other, "DIA_Ulf_Suche_03_05"); //Niemożliwe?! Człowieku, nie brak ci odwagi. Czy to oznacza, że ty również poszukujesz 'tego, co wierny znajdzie na końcu ścieżki'?
	AI_Output (other, self, "DIA_Ulf_Suche_15_06"); //Na to wygląda.
};
///////////////////////////////////////////////////////////////////////
//	Info Rausgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Rausgefunden		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Rausgefunden_Condition;
	information	 = 	DIA_Ulf_Rausgefunden_Info;
	permanent	 = 	FALSE;
	description  = "I co, znalazłeś już coś?";
};
func int DIA_Ulf_Rausgefunden_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Rausgefunden_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Rausgefunden_15_00"); //I co, znalazłeś już coś?
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_01"); //Cóż, śledziłem Agona - ale w pewnym momencie zniknął mi z oczu.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_02"); //Czekaj... Co oni tam jeszcze mówili? Podążaj za znakami Innosa. Nie rozumiem tylko tej części o ścieżkach...
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_03"); //Cóż więc mi pozostaje, ciągle szukam.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "FOLLOW");
	
};
///////////////////////////////////////////////////////////////////////
//	Info Folgen
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Folgen		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Folgen_Condition;
	information	 = 	DIA_Ulf_Folgen_Info;
	permanent	 = 	FALSE;
	description  = "Hej, czy ty mnie śledzisz?";
};
func int DIA_Ulf_Folgen_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Folgen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Folgen_15_00"); //Hej, czy ty mnie śledzisz?
	AI_Output (self, other, "DIA_Ulf_Folgen_03_01"); //Nonsens. Zmierzam po prostu w tym samym kierunku.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Stop		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Stop_Condition;
	information	 = 	DIA_Ulf_Stop_Info;
	permanent	 = 	FALSE;
	description  = "Przestań za mną łazić.";
};
func int DIA_Ulf_Stop_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Folgen)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Stop_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Stop_15_00"); //Przestań za mną łazić.
	AI_Output (self, other, "DIA_Ulf_Stop_03_01"); //Nie łażę za tobą. Ale proszę, jeśli to ma cię uspokoić, pójdę inną ścieżką.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SUCHE");
};
///////////////////////////////////////////////////////////////////////
//	Info Abrechnung
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Abrechnung		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Abrechnung_Condition;
	information	 = 	DIA_Ulf_Abrechnung_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};	
func int DIA_Ulf_Abrechnung_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_HasItems (other, ItmI_RuneBlank) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Abrechnung_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_00"); //Więc znowu się spotykamy. Ostatnio sporo rozmyślałem. Odczuwam silną chęć zostania magiem.
	AI_Output (other, self, "DIA_Ulf_Abrechnung_15_01"); //Człowieku - nie rób tego...
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_02"); //Nie mam wyboru. Życie nowicjusza - to nie dla mnie.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_03"); //Muszę zostać magiem. Wtedy wszystko zacznie się układać. Teraz zaś odbiorę to, co mi się należy.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_04"); //Masz jakieś ostatnie życzenie?
	
	Info_ClearChoices (DIA_Ulf_Abrechnung);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Daj spokój, nie chcę cię zabijać.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Koniec gadania - muszę wracać do klasztoru.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Masz coś do palenia?",DIA_Ulf_Abrechnung_Rauch);
};
FUNC VOID DIA_Ulf_Abrechnung_Lass()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //Daj spokój, nie chcę cię zabijać.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //Gadaj zdrów. Zdajesz sobie chyba sprawę z tego, że nie masz ze mną szans.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //Koniec gadania - muszę wracać do klasztoru.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //Nigdzie nie pójdziesz!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //Masz coś do palenia?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //Masz szczęście. Tak się składa, że akurat mam coś przy sobie.
	
	B_GiveInvItems (self, other, ITmi_Joint,1);
	B_UseItem (other, itmI_Joint);
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //Miejmy to już za sobą.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Troll		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Troll_Condition;
	information	 = 	DIA_Ulf_Troll_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};
func int DIA_Ulf_Troll_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	&& ((Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_14") <= 1000)
	|| (Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_15") <= 1000))
	{
		return TRUE;
	};
};
func void DIA_Ulf_Troll_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Troll_03_00"); //Hej, jesteś pewien, że idziemy we właściwym kierunku? Podobno gdzieś tam mieszka troll.
	AI_Output (self, other, "DIA_Ulf_Troll_03_01"); //Chyba lepiej udać się w innym kierunku.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"WAIT");
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulf_PICKPOCKET (C_INFO)
{
	npc			= NOV_602_Ulf;
	nr			= 900;
	condition	= DIA_Ulf_PICKPOCKET_Condition;
	information	= DIA_Ulf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ulf_PICKPOCKET_Condition()
{
	C_Beklauen (34, 50);
};
 
FUNC VOID DIA_Ulf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulf_PICKPOCKET);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_BACK 		,DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};
	
func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};











