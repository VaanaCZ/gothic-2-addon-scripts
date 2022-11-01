//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_EXIT   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 999;
	condition   = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Cassia_PICKME (C_INFO)
{
	npc			= VLK_447_Cassia;
	nr			= 900;
	condition	= DIA_Cassia_PICKME_Condition;
	information	= DIA_Cassia_PICKME_Info;
	permanent	= TRUE;
	description = Pickpocket_100_Female;
};                       

FUNC INT DIA_Cassia_PICKME_Condition()
{
	C_Beklauen (100, 400);
};
 
FUNC VOID DIA_Cassia_PICKME_Info()
{	
	Info_ClearChoices	(DIA_Cassia_PICKME);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_BACK 		,DIA_Cassia_PICKME_BACK);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_PICKPOCKET	,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cassia_PICKME);
};
	
func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices (DIA_Cassia_PICKME);
};
//////////////////////////////////////////////////////////////////////
//	Info Gilde
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Gilde   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Cassia_Gilde_Condition()
{	
	if (Cassia_Gildencheck == TRUE)
	&& (Join_Thiefs == TRUE)
	&& ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Gilde_Info()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Widzę, że stałeś się wojownikiem prawa i porządku.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//To że służysz Innosowi, nie ma znaczenia. Jesteś jednym z nas. Mam nadzieję, że ty też tak to postrzegasz.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//Należysz teraz do kościoła Innosa, ale wciąż jesteś jednym z nas - mam nadzieję, że o tym nie zapomnisz.
	};
	
	
	AI_StopProcessInfos (self);
	
};
//////////////////////////////////////////////////////////////////////
//	Info Frist abgelaufen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Abgelaufen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Cassia_Abgelaufen_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Cassia_Frist == TRUE)  
	&& (Cassia_Day < (B_GetDayPlus() -2))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Abgelaufen_Info()
{
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Termin minął. Trzeba było nie wracać.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0); 
};
//////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_News   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Cassia_News_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_News_Info()
{
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_News_16_00");//Widzę, że dostałeś nasz prezent. Jestem Cassia.
		AI_Output (other, self, "DIA_Cassia_News_15_01");//W porządku, powiedz mi, dlaczego tu jestem?
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Przyciągnąłeś naszą uwagę, zdobywając zaufanie naszych przyjaciół.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//Chcemy ci coś zaproponować. Możesz do nas dołączyć.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//Popatrzcie tylko, kto znalazł do nas drogę. Atylla cię nie docenił. Ja nie popełnię tego błędu.
		AI_Output (other, self, "DIA_Cassia_News_15_05");//Co się tu dzieje?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Chcieliśmy twojej śmierci za to, że doniosłeś na jednego z naszych przyjaciół. Dlatego wysłaliśmy Atyllę.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Jednak twoja obecność tutaj otwiera nową możliwość...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//...co chcesz mi zaproponować?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//Możesz do nas dołączyć.
	};
	if  (Npc_GetTrueGuild (other) == GIL_NONE)
	||  (Npc_GetTrueGuild (other) == GIL_NOV)
	{	
		Cassia_Gildencheck = TRUE;
	};
	
	DG_gefunden = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Erzähle mir mehr 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_mehr   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent   = FALSE;
	description = "Opowiedz mi więcej o waszej organizacji.";
};

FUNC INT DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_mehr_Info()
{
	AI_Output (other, self, "DIA_Cassia_mehr_15_00");//Opowiedz mi więcej o waszej organizacji.
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//Ludzie w mieście boją się nas, ale nikt nie zna naszej kryjówki.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Ta garstka ludzi, która wie o istnieniu kanałów, jest przekonana, że są zamknięte i nikt nie ma do nich dostępu.
	AI_Output (self, other, "DIA_Cassia_mehr_16_03");//Tak długo jak nas nie znajdą, możemy spokojnie pracować.
};

//////////////////////////////////////////////////////////////////////
//	Vermisste Leute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_MissingPeople   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent   = FALSE;
	description = "Możesz mi coś powiedzieć o zaginionych mieszkańcach miasta?";
};

FUNC INT DIA_Cassia_MissingPeople_Condition()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cassia_MissingPeople_Info()
{
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_00"); //Możesz mi coś powiedzieć o zaginionych mieszkańcach miasta?
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //Czemu niby chcesz się o tym czegoś dowiedzieć?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Interesuje mnie ich los.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Opuszczając kanał, popłyń w prawo wzdłuż wybrzeża.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_04"); //Tam znajdziesz odpowiedzi na swoje pytania.
};


//////////////////////////////////////////////////////////////////////
//	Info Was habe ich davon? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Vorteil   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent   = FALSE;
	description = "Jeśli do was dołączę, to co będę z tego miał?";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//Jeśli do was dołączę, to co będę z tego miał?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//Możesz się od nas nauczyć specjalnych zdolności, które pozwolą ci żyć w luksusie.
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_02");//Ale nie będę musiał ukrywać się tutaj na dole, prawda?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_03");//Nie. Musisz jedynie przestrzegać naszych zasad. To wszystko.
};
//////////////////////////////////////////////////////////////////////
//	Info Was kann ich bei euch lernen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Lernen  (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 4;
	condition   = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent   = FALSE;
	description = "Czego mogę się od was nauczyć?";
};

FUNC INT DIA_Cassia_Lernen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Lernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//Czego mogę się od was nauczyć?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper jest mistrzem skradania i ukrywania się. Pokaże ci, jak się bezszelestnie poruszać.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ramirez jest wyjątkowo zdolnym włamywaczem. Żaden zamek nie oprze się jego wytrychom.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//A ja mogę nauczyć cię kradzieży kieszonkowej.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Pomogę ci także stać się zręczniejszym. To podstawa twoich zdolności.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia może nauczyć mnie kradzieży kieszonkowej. Może mi również pokazać, jak stać się zręczniejszym.");
	B_LogEntry(Topic_CityTeacher,"Ramirez może mnie nauczyć, jak otwierać zamki.");
	B_LogEntry(Topic_CityTeacher,"Jesper może mnie nauczyć, jak się skradać.");
};
//////////////////////////////////////////////////////////////////////
//	Info Regeln 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Regeln   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent   = FALSE;
	description = "Jakie są wasze zasady?";
};

FUNC INT DIA_Cassia_Regeln_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Regeln_Info()
{
	AI_Output (other, self, "DIA_Cassia_Regeln_15_00");//Jakie są wasze zasady?
	//AI_Output (self, other, "DIA_Cassia_Regeln_16_01");//Wir richten uns nach drei Regeln.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_02");//Zasada pierwsza: ani słowa o nas. Nikomu. Nigdy.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_03");//Druga: nie daj się złapać.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Trzecia: jeżeli wyciągniesz tu broń, żeby kogoś zaatakować, zabijemy cię.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//I czwarta, ostatnia zasada: ci, którzy chcą do nas dołączyć, muszą udowodnić swoją wartość.
};
//////////////////////////////////////////////////////////////////////
//	Info Was passiert, wenn ich erwischt werde? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Erwischen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent   = FALSE;
	description = "Co się stanie, jak mnie złapią?";
};

FUNC INT DIA_Cassia_Erwischen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Erwischen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//Co się stanie, jak mnie złapią?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Po prostu nie daj się złapać, dobra?
};
//////////////////////////////////////////////////////////////////////
//	Info Wie muss ich mich beweisen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_beweisen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent   = TRUE;
	description = "Jak mam dowieść swojej wartości?";
};
//--------------------------------------
var int DIA_Cassia_beweisen_permanent;
//-------------------------------------
FUNC INT DIA_Cassia_beweisen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	&& (DIA_Cassia_beweisen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_beweisen_Info()
{
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//Jak mam dowieść swojej wartości?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Dołączysz do nas czy nie?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Ten uparty stary alchemik - Constantino - ma piękny pierścień.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Nie jest mu on potrzebny. Chcę, by przyozdobił moją dłoń.
		
		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;
		
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaRing,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaRing,"Cassia chce, abym przyniósł jej pierścień Constantina.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Beitreten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Beitreten   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent   = FALSE;
	description = "Dobra, niech będzie.";
};

FUNC INT DIA_Cassia_Beitreten_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Beitreten_Info()
{
	AI_Output (other, self, "DIA_Cassia_Beitreten_15_00");//Dobra, wchodzę w to.
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//Świetnie. Będziesz miał okazję dowieść swej wartości. Jeśli chcesz się od nas uczyć, to nie widzę ku temu żadnych przeszkód.
	
	Join_Thiefs = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Und wenn ich euch nicht beitrete...? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Ablehnen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 9;
	condition   = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent   = FALSE;
	description = "A co jeśli nie chcę do was dołączyć...?";
};

FUNC INT DIA_Cassia_Ablehnen_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//A co jeśli nie chcę do was dołączyć...?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Tracisz jedyną w swoim rodzaju szansę, ale możesz odejść.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//I nawet nie myśl o zdradzie. Gorzko byś tego pożałował.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Dobra, niech będzie.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Muszę się nad tym zastanowić.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//W takim razie zabiję cię.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Dobra, niech będzie.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"W takim razie spróbuj mnie zabić.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//Dobra, niech będzie.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//Podjąłeś mądrą decyzję. Jeżeli uda ci się dowieść swojej wartości, będziesz mógł wstąpić w nasze szeregi.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Jeżeli chcesz wcześniej opanować umiejętności złodziejskie, to nie krępuj się - na pewno ci się przydadzą.
	Join_Thiefs = TRUE; 
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};
FUNC VOID DIA_Cassia_Ablehnen_Kill()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Kill_15_00");//W takim razie spróbuj mnie zabić.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Kill_16_01");//Szkoda. Myślałam, że jesteś mądrzejszy.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Cassia_Ablehnen_Frist()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Muszę się nad tym zastanowić.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Zrób tak. Daję ci dwa dni na podjęcie decyzji. Potem nie będziesz tu mile widziany.
	
	Cassia_Day = B_GetDayPlus ();
	Cassia_Frist = TRUE;
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};


//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_BevorLernen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 5;
	condition   = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent   = TRUE;
	description = "Możesz mnie przeszkolić?";
};
FUNC INT DIA_Cassia_BevorLernen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& ((Cassia_TeachPickpocket == FALSE)
	|| (Cassia_TeachDEX == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//Możesz mnie przeszkolić?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Pewnie, nie ma problemu. Daj mi tylko znać, jak będziesz gotów.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Pewnie. Szkolenie w zakresie kradzieży kieszonkowej i zręczności będzie cię kosztować 100 sztuk złota każde.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Może później... (POWRÓT)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chcę poznać zasady kradzieży kieszonkowej (zapłać 100 sztuk złota).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chcę się stać zręczniejszy (zapłać 100 sztuk złota).",DIA_Cassia_BevorLernen_DEX);
		};
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices (DIA_Cassia_BevorLernen);
};
FUNC VOID DIA_Cassia_BevorLernen_DEX()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Chcę być zręczniejszy. Tu masz złoto.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//Możemy zacząć, jak tylko będziesz gotowy.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");//Wróć, jak będziesz miał złoto.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
FUNC VOID DIA_Cassia_BevorLernen_Pickpocket()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Chcę się nauczyć kradzieży kieszonkowej. Oto złoto.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//Możemy zacząć, jak tylko będziesz gotowy.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02");//Wróć, jak będziesz miał złoto.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_447_Cassia;
	nr			 = 	12;
	condition	 = 	DIA_Cassia_TEACH_Condition;
	information	 = 	DIA_Cassia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chcę być zręczniejszy.";
};
func int DIA_Cassia_TEACH_Condition ()
{	
	if (Cassia_TeachDEX == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_Cassia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Cassia_TEACH_15_00"); //Chcę być zręczniejszy.
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
};
func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Cassia_TEACH);
};
func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Pickpocket   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent   = TRUE;
	description = "Pokaż mi, jak okradać innych (10 punktów nauki).";
};

FUNC INT DIA_Cassia_Pickpocket_Condition()
{	
	if (Cassia_TeachPickpocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Pickpocket_Info()
{
	AI_Output (other, self, "DIA_Cassia_Pickpocket_15_00");//Pokaż mi, jak opróżnić czyjeś kieszenie.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET)
	{
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Jeżeli chcesz opróżnić czyjeś kieszenie, musisz odciągnąć uwagę ofiary. Zacznij z nią gawędzić.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Podczas rozmowy postaraj się ocenić, z kim masz do czynienia. Zwróć uwagę na wypchane kieszenie albo biżuterię. Ale przede wszystkim oceń, jak czujny jest klient.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Pamiętaj, że okradanie pijanego robotnika to nie to samo co skubanie czujnego kupca.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Jak będziesz niezgrabny, to klient się skapuje. Tak więc musisz być opanowany.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Aufnahme
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Aufnahme   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent   = FALSE;
	description = "Mam pierścień Constantina.";
};

FUNC INT DIA_Cassia_Aufnahme_Condition()
{	
	if (MIS_CassiaRing == LOG_RUNNING)
	&& (Npc_HasItems (other, ItRi_Prot_Point_01_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Aufnahme_Info()
{
	AI_Output (other, self, "DIA_Cassia_Aufnahme_15_00");//Mam pierścień Constantina.
	B_GiveInvItems (other, self,ItRi_Prot_Point_01_MIS,1);
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//Gratulacje. Przeszedłeś inicjację. Teraz jesteś jednym z nas.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//Weź ten klucz. Otwiera drzwi do gospody. Nie będziesz musiał taplać się w wodzie za każdym razem.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//Co więcej, musisz wiedzieć, że mamy tajny znak. Charakterystyczne kiwnięcie głową.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//Właśnie tak. Kiedy będziesz z kimś rozmawiać i zrobisz ten znak, jasne będzie, że jesteś jednym z nas.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Zostałem przyjęty do gildii złodziei."); 
	B_LogEntry (Topic_Diebesgilde,"Poznałem tajny znak złodziei. Jeśli pokażę go innemu złodziejowi, będzie wiedział, że ja również jestem członkiem gildii.");
	 
	
};
//////////////////////////////////////////////////////////////////////
//	Info Versteck
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Versteck   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent   = FALSE;
	description = "Gdzie ukrywacie swoje łupy?";
};

FUNC INT DIA_Cassia_Versteck_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Ramirez_Beute)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Versteck_Info()
{
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//Gdzie ukrywacie swoje łupy?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Daj spokój, nie myślałeś chyba, że ci to powiem?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_02");//Będziesz miał dość okazji, żeby położyć łapki na majątku innych ludzi - zbyt chciwi kończą z pustymi rękami.
};
//////////////////////////////////////////////////////////////////////
//	Info Blutkelche
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Blutkelche   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent   = FALSE;
	description = "Masz dla mnie jakąś robotę?";
};

FUNC INT DIA_Cassia_Blutkelche_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (MIS_CassiaKelche != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Blutkelche_Info()
{
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//Masz dla mnie jakąś robotę?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//Nie, jeśli w mieście jesteś ścigany za kradzieże.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//Załatw to - zapłać grzywnę albo pozbądź się świadków. Nie obchodzi mnie jak, ale masz to zrobić.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//Tak. Jest zestaw kielichów - sześciu.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//Król Rhobar zdobył je podczas jednej z kampanii - ale poświęcił wtedy wielu ludzi. Dlatego są nazywane Krwawymi Kielichami.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//Pojedynczo nie są zbyt cenne - ale razem są warte okrągłą sumkę.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//Gdzie znajdują się te kielichy?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Należą do bogatych kupców w górnym mieście.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//Przynieś mi je. Ja tymczasem postaram się znaleźć na nie kupca.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//Co za to dostanę?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//Połowę zysku albo będziesz mógł wybrać z mojego łupu jakiś specjalny przedmiot.
 		
 		MIS_CassiaKelche = LOG_RUNNING;
 		Log_CreateTopic(Topic_Cassiakelche,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaKelche,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaKelche,"Cassia chce, abym przyniósł jej sześć Krwawych Kielichów. Wszystkie znajdują się w mieście.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Kelche abgeben
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_abgeben   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent   = TRUE;
	description = "Jeśli chodzi o te Krwawe Kielichy...";
};

FUNC INT DIA_Cassia_abgeben_Condition()
{	
	if (MIS_CassiaKelche == LOG_RUNNING)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_abgeben_Info()
{
	AI_Output (other, self, "DIA_Cassia_abgeben_15_00");//Jeżeli chodzi o te Krwawe Kielichy...
	
	if B_GiveInvItems (other, self, ItMi_BloodCup_MIS,6)
	{
		AI_Output (other, self, "DIA_Cassia_abgeben_15_01");//Mam wszystkie sześć kielichów.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Dobra robota. W międzyczasie udało mi się znaleźć na nie kupca.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//Możesz odebrać swoją nagrodę. Dziękuję, że to dla mnie zrobiłeś.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//Nie muszę dla ciebie robić nic więcej - ale w każdej chwili możesz przyjść do mnie na naukę. A poza tym na tej wyspie jest dość łupów dla każdego.
		    
		
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP (XP_CassiaBlutkelche);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_abgeben_16_05");//Mogę sprzedać te kielichy w komplecie. Przynieś mi wszystkie sześć.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Belohung
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Belohnung   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent   = FALSE;
	description = "Przyszedłem odebrać swoją nagrodę.";
};

FUNC INT DIA_Cassia_Belohnung_Condition()
{	
	if (MIS_CassiaKelche == LOG_SUCCESS)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Belohnung_Info()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//Przyszedłem odebrać swoją nagrodę.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//Co wybierasz?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 sztuk złota.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice (DIA_Cassia_Belohnung,"4 eliksiry lecznicze",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice (DIA_Cassia_Belohnung, NAME_ADDON_CASSIASBELOHNUNGSRING ,DIA_Cassia_Belohnung_Ring);
	
};
FUNC VOID DIA_Cassia_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_02");//Daj mi złoto.
	B_GiveInvItems (self, other, ItmI_Gold,400);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Trank()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_03");//Daj mi mikstury.
	B_GiveInvItems (self, other, ItPo_Health_03,4);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Ring()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_04");//Daj mi pierścień.
	B_GiveInvItems (self, other, ItRi_Hp_01,1);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
