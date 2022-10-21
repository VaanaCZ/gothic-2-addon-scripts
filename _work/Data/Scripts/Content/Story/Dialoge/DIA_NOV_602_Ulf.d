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
		AI_Output (self, other, "DIA_Ulf_Hallo_03_01"); //Staram siê jak najlepiej wykonaæ zadania zlecone mi przez klasztor.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_02"); //Jestem nowicjuszem w klasztorze. Wykonujê zlecenia magów i pladynów.
		AI_Output (self, other, "DIA_Ulf_Hallo_03_03"); //W³aœnie dostarczy³em trzem karczmarzom w mieœcie wino z klasztoru.
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
	description	 = 	"Kim s¹ w³aœciciele trzech knajp?";
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
	AI_Output (other, self, "DIA_Ulf_Wirte_15_00"); //Kim s¹ ci trzej karczmarze?
	AI_Output (self, other, "DIA_Ulf_Wirte_03_01"); //Jednym z nich jest ten mi³y cz³owiek za barem.
	AI_Output (self, other, "DIA_Ulf_Wirte_03_02"); //Drugim jest Caragon, prowadz¹cy tawernê na placu œwi¹tynnym, trzecim zaœ Kardif, w³aœciciel knajpy w dzielnicy portowej.
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
	description	 = 	"Co mo¿esz mi powiedzieæ o klasztorze?";
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
	AI_Output (other, self, "DIA_Ulf_Kloster_15_00"); //Co mo¿esz mi powiedzieæ o klasztorze?
	AI_Output (self, other, "DIA_Ulf_Kloster_03_01"); //My, nowicjusze, poszukujemy oœwiecenia w modlitwie do Innosa, pod nadzorem magów przyswajamy te¿ podstawy wiary.
	AI_Output (self, other, "DIA_Ulf_Kloster_03_02"); //S³u¿ymy im, by oni mogli s³u¿yæ Innosowi. No i przygotowujemy siê do zjednoczenia z Ogniem.
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
	AI_Output (self, other, "DIA_Ulf_Bringen_03_01"); //Nie ma szans. Nie wiesz chyba, z iloma stworzeniami musia³em sobie poradziæ, zanim tutaj dotar³em.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_02"); //Kiedy pomyœlê o tych wszystkich krwiopijcach, wilkach i goblinach, to siê cieszê, ¿e nie muszê siê st¹d ruszaæ.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_03"); //Poza tym i tak nie wszed³byœ do klasztoru.
	AI_Output (other, self, "DIA_Ulf_Bringen_15_04"); //Dlaczego?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_05"); //Wejœæ tam mog¹ jedynie magowie, paladyni i nowicjusze.
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
	description	 = 	"Jak mogê zostaæ nowicjuszem?";
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
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_00"); //Jak mogê zostaæ nowicjuszem?
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_01"); //Kiedy cz³owiek czuje g³êbok¹ wewnêtrzn¹ potrzebê...
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_02"); //Hej - powiedz mi tylko, jakie muszê spe³niæ warunki!
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_03"); //Potrzebujesz darów. Owcy i...
	B_Say_Gold (self, other, Summe_Kloster);
	
	Log_CreateTopic (Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
	B_LogEntry (Topic_Kloster,"Aby zostaæ nowicjuszem w klasztorze Innosa, bêdê potrzebowa³ owcy i 1000 sztuk z³ota.");
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
	description	 = 	"Sk¹d mam wzi¹æ tyle z³ota?";
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
	AI_Output (other, self, "DIA_Ulf_Gold_15_00"); //Sk¹d mam wzi¹æ tyle z³ota?
	AI_Output (self, other, "DIA_Ulf_Gold_03_01"); //Jak mniemam, nie znasz nikogo, kto by za ciebie zap³aci³. Zatem bêdziesz je musia³ zarobiæ.
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
	description	 = 	"Sk¹d mogê wzi¹æ owcê?";
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
	AI_Output (other, self, "DIA_Ulf_Schaf_15_00"); //Sk¹d mogê wzi¹æ owcê?
	AI_Output (self, other, "DIA_Ulf_Schaf_03_01"); //Od farmerów, oczywiœcie. Nie dostaniesz jej jednak za darmo.
	
	B_LogEntry (Topic_Kloster,"Owcê mogê zdobyæ u farmerów.");
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
	AI_Output (self, other, "DIA_Ulf_Suche_03_00"); //Hej, nie zgadniesz, co siê sta³o.
	AI_Output (other, self, "DIA_Ulf_Suche_15_01"); //Zosta³eœ wybrañcem.
	AI_Output (self, other, "DIA_Ulf_Suche_03_02"); //Dok³adnie. W³aœnie mia³em napiæ siê zimnego piwa, kiedy zjawi³ siê Daron i oznajmi³, ¿e zosta³em wybrañcem.
	AI_Output (self, other, "DIA_Ulf_Suche_03_03"); //Kto by pomyœla³? Niezbadana jest wola Innosa. Co ciê tu sprowadza?
	AI_Output (other, self, "DIA_Ulf_Suche_15_04"); //Za¿¹da³em Próby Ognia.
	AI_Output (self, other, "DIA_Ulf_Suche_03_05"); //Niemo¿liwe?! Cz³owieku, nie brak ci odwagi. Czy to oznacza, ¿e ty równie¿ poszukujesz 'tego, co wierny znajdzie na koñcu œcie¿ki'?
	AI_Output (other, self, "DIA_Ulf_Suche_15_06"); //Na to wygl¹da.
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
	description  = "I co, znalaz³eœ ju¿ coœ?";
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
	AI_Output (other, self, "DIA_Ulf_Rausgefunden_15_00"); //I co, znalaz³eœ ju¿ coœ?
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_01"); //Có¿, œledzi³em Agona - ale w pewnym momencie znikn¹³ mi z oczu.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_02"); //Czekaj... Co oni tam jeszcze mówili? Pod¹¿aj za znakami Innosa. Nie rozumiem tylko tej czêœci o œcie¿kach...
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_03"); //Có¿ wiêc mi pozostaje, ci¹gle szukam.
	
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
	description  = "Hej, czy ty mnie œledzisz?";
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
	AI_Output (other, self, "DIA_Ulf_Folgen_15_00"); //Hej, czy ty mnie œledzisz?
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
	description  = "Przestañ za mn¹ ³aziæ.";
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
	AI_Output (other, self, "DIA_Ulf_Stop_15_00"); //Przestañ za mn¹ ³aziæ.
	AI_Output (self, other, "DIA_Ulf_Stop_03_01"); //Nie ³a¿ê za tob¹. Ale proszê, jeœli to ma ciê uspokoiæ, pójdê inn¹ œcie¿k¹.
	
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
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_00"); //Wiêc znowu siê spotykamy. Ostatnio sporo rozmyœla³em. Odczuwam siln¹ chêæ zostania magiem.
	AI_Output (other, self, "DIA_Ulf_Abrechnung_15_01"); //Cz³owieku - nie rób tego...
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_02"); //Nie mam wyboru. ¯ycie nowicjusza - to nie dla mnie.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_03"); //Muszê zostaæ magiem. Wtedy wszystko zacznie siê uk³adaæ. Teraz zaœ odbiorê to, co mi siê nale¿y.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_04"); //Masz jakieœ ostatnie ¿yczenie?
	
	Info_ClearChoices (DIA_Ulf_Abrechnung);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Daj spokój, nie chcê ciê zabijaæ.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Koniec gadania - muszê wracaæ do klasztoru.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Masz coœ do palenia?",DIA_Ulf_Abrechnung_Rauch);
};
FUNC VOID DIA_Ulf_Abrechnung_Lass()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //Daj spokój, nie chcê ciê zabijaæ.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //Gadaj zdrów. Zdajesz sobie chyba sprawê z tego, ¿e nie masz ze mn¹ szans.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //Koniec gadania - muszê wracaæ do klasztoru.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //Nigdzie nie pójdziesz!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //Masz coœ do palenia?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //Masz szczêœcie. Tak siê sk³ada, ¿e akurat mam coœ przy sobie.
	
	B_GiveInvItems (self, other, ITmi_Joint,1);
	B_UseItem (other, itmI_Joint);
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //Miejmy to ju¿ za sob¹.
	
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
	AI_Output (self, other, "DIA_Ulf_Troll_03_00"); //Hej, jesteœ pewien, ¿e idziemy we w³aœciwym kierunku? Podobno gdzieœ tam mieszka troll.
	AI_Output (self, other, "DIA_Ulf_Troll_03_01"); //Chyba lepiej udaæ siê w innym kierunku.
	
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











