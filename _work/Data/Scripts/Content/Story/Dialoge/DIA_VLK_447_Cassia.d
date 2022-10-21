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
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Widzê, ¿e sta³eœ siê wojownikiem prawa i porz¹dku.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//To ¿e s³u¿ysz Innosowi, nie ma znaczenia. Jesteœ jednym z nas. Mam nadziejê, ¿e ty te¿ tak to postrzegasz.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//Nale¿ysz teraz do koœcio³a Innosa, ale wci¹¿ jesteœ jednym z nas - mam nadziejê, ¿e o tym nie zapomnisz.
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
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Termin min¹³. Trzeba by³o nie wracaæ.
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
		AI_Output (self, other, "DIA_Cassia_News_16_00");//Widzê, ¿e dosta³eœ nasz prezent. Jestem Cassia.
		AI_Output (other, self, "DIA_Cassia_News_15_01");//W porz¹dku, powiedz mi, dlaczego tu jestem?
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Przyci¹gn¹³eœ nasz¹ uwagê, zdobywaj¹c zaufanie naszych przyjació³.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//Chcemy ci coœ zaproponowaæ. Mo¿esz do nas do³¹czyæ.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//Popatrzcie tylko, kto znalaz³ do nas drogê. Atylla ciê nie doceni³. Ja nie pope³niê tego b³êdu.
		AI_Output (other, self, "DIA_Cassia_News_15_05");//Co siê tu dzieje?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Chcieliœmy twojej œmierci za to, ¿e donios³eœ na jednego z naszych przyjació³. Dlatego wys³aliœmy Atyllê.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Jednak twoja obecnoœæ tutaj otwiera now¹ mo¿liwoœæ...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//...co chcesz mi zaproponowaæ?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//Mo¿esz do nas do³¹czyæ.
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
	description = "Opowiedz mi wiêcej o waszej organizacji.";
};

FUNC INT DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_mehr_Info()
{
	AI_Output (other, self, "DIA_Cassia_mehr_15_00");//Opowiedz mi wiêcej o waszej organizacji.
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//Ludzie w mieœcie boj¹ siê nas, ale nikt nie zna naszej kryjówki.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Ta garstka ludzi, która wie o istnieniu kana³ów, jest przekonana, ¿e s¹ zamkniête i nikt nie ma do nich dostêpu.
	AI_Output (self, other, "DIA_Cassia_mehr_16_03");//Tak d³ugo jak nas nie znajd¹, mo¿emy spokojnie pracowaæ.
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
	description = "Mo¿esz mi coœ powiedzieæ o zaginionych mieszkañcach miasta?";
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
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_00"); //Mo¿esz mi coœ powiedzieæ o zaginionych mieszkañcach miasta?
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //Czemu niby chcesz siê o tym czegoœ dowiedzieæ?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Interesuje mnie ich los.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Opuszczaj¹c kana³, pop³yñ w prawo wzd³u¿ wybrze¿a.
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
	description = "Jeœli do was do³¹czê, to co bêdê z tego mia³?";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//Jeœli do was do³¹czê, to co bêdê z tego mia³?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//Mo¿esz siê od nas nauczyæ specjalnych zdolnoœci, które pozwol¹ ci ¿yæ w luksusie.
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_02");//Ale nie bêdê musia³ ukrywaæ siê tutaj na dole, prawda?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_03");//Nie. Musisz jedynie przestrzegaæ naszych zasad. To wszystko.
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
	description = "Czego mogê siê od was nauczyæ?";
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
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//Czego mogê siê od was nauczyæ?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper jest mistrzem skradania i ukrywania siê. Poka¿e ci, jak siê bezszelestnie poruszaæ.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ramirez jest wyj¹tkowo zdolnym w³amywaczem. ¯aden zamek nie oprze siê jego wytrychom.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//A ja mogê nauczyæ ciê kradzie¿y kieszonkowej.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Pomogê ci tak¿e staæ siê zrêczniejszym. To podstawa twoich zdolnoœci.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia mo¿e nauczyæ mnie kradzie¿y kieszonkowej. Mo¿e mi równie¿ pokazaæ, jak staæ siê zrêczniejszym.");
	B_LogEntry(Topic_CityTeacher,"Ramirez mo¿e mnie nauczyæ, jak otwieraæ zamki.");
	B_LogEntry(Topic_CityTeacher,"Jesper mo¿e mnie nauczyæ, jak siê skradaæ.");
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
	description = "Jakie s¹ wasze zasady?";
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
	AI_Output (other, self, "DIA_Cassia_Regeln_15_00");//Jakie s¹ wasze zasady?
	//AI_Output (self, other, "DIA_Cassia_Regeln_16_01");//Wir richten uns nach drei Regeln.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_02");//Zasada pierwsza: ani s³owa o nas. Nikomu. Nigdy.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_03");//Druga: nie daj siê z³apaæ.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Trzecia: je¿eli wyci¹gniesz tu broñ, ¿eby kogoœ zaatakowaæ, zabijemy ciê.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//I czwarta, ostatnia zasada: ci, którzy chc¹ do nas do³¹czyæ, musz¹ udowodniæ swoj¹ wartoœæ.
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
	description = "Co siê stanie, jak mnie z³api¹?";
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
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//Co siê stanie, jak mnie z³api¹?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Po prostu nie daj siê z³apaæ, dobra?
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
	description = "Jak mam dowieœæ swojej wartoœci?";
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
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//Jak mam dowieœæ swojej wartoœci?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Do³¹czysz do nas czy nie?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Ten uparty stary alchemik - Constantino - ma piêkny pierœcieñ.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Nie jest mu on potrzebny. Chcê, by przyozdobi³ moj¹ d³oñ.
		
		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;
		
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaRing,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaRing,"Cassia chce, abym przyniós³ jej pierœcieñ Constantina.");
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
	description = "Dobra, niech bêdzie.";
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
	AI_Output (other, self, "DIA_Cassia_Beitreten_15_00");//Dobra, wchodzê w to.
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//Œwietnie. Bêdziesz mia³ okazjê dowieœæ swej wartoœci. Jeœli chcesz siê od nas uczyæ, to nie widzê ku temu ¿adnych przeszkód.
	
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
	description = "A co jeœli nie chcê do was do³¹czyæ...?";
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
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//A co jeœli nie chcê do was do³¹czyæ...?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Tracisz jedyn¹ w swoim rodzaju szansê, ale mo¿esz odejœæ.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//I nawet nie myœl o zdradzie. Gorzko byœ tego po¿a³owa³.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Dobra, niech bêdzie.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Muszê siê nad tym zastanowiæ.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//W takim razie zabijê ciê.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Dobra, niech bêdzie.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"W takim razie spróbuj mnie zabiæ.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//Dobra, niech bêdzie.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//Podj¹³eœ m¹dr¹ decyzjê. Je¿eli uda ci siê dowieœæ swojej wartoœci, bêdziesz móg³ wst¹piæ w nasze szeregi.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Je¿eli chcesz wczeœniej opanowaæ umiejêtnoœci z³odziejskie, to nie krêpuj siê - na pewno ci siê przydadz¹.
	Join_Thiefs = TRUE; 
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};
FUNC VOID DIA_Cassia_Ablehnen_Kill()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Kill_15_00");//W takim razie spróbuj mnie zabiæ.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Kill_16_01");//Szkoda. Myœla³am, ¿e jesteœ m¹drzejszy.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Cassia_Ablehnen_Frist()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Muszê siê nad tym zastanowiæ.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Zrób tak. Dajê ci dwa dni na podjêcie decyzji. Potem nie bêdziesz tu mile widziany.
	
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
	description = "Mo¿esz mnie przeszkoliæ?";
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
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//Mo¿esz mnie przeszkoliæ?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Pewnie, nie ma problemu. Daj mi tylko znaæ, jak bêdziesz gotów.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Pewnie. Szkolenie w zakresie kradzie¿y kieszonkowej i zrêcznoœci bêdzie ciê kosztowaæ 100 sztuk z³ota ka¿de.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Mo¿e póŸniej... (POWRÓT)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chcê poznaæ zasady kradzie¿y kieszonkowej (zap³aæ 100 sztuk z³ota).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chcê siê staæ zrêczniejszy (zap³aæ 100 sztuk z³ota).",DIA_Cassia_BevorLernen_DEX);
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
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Chcê byæ zrêczniejszy. Tu masz z³oto.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//Mo¿emy zacz¹æ, jak tylko bêdziesz gotowy.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");//Wróæ, jak bêdziesz mia³ z³oto.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
FUNC VOID DIA_Cassia_BevorLernen_Pickpocket()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Chcê siê nauczyæ kradzie¿y kieszonkowej. Oto z³oto.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//Mo¿emy zacz¹æ, jak tylko bêdziesz gotowy.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02");//Wróæ, jak bêdziesz mia³ z³oto.
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
	description	 = 	"Chcê byæ zrêczniejszy.";
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
	AI_Output (other, self, "DIA_Cassia_TEACH_15_00"); //Chcê byæ zrêczniejszy.
	
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
	description = "Poka¿ mi, jak okradaæ innych (10 punktów nauki).";
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
	AI_Output (other, self, "DIA_Cassia_Pickpocket_15_00");//Poka¿ mi, jak opró¿niæ czyjeœ kieszenie.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET)
	{
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Je¿eli chcesz opró¿niæ czyjeœ kieszenie, musisz odci¹gn¹æ uwagê ofiary. Zacznij z ni¹ gawêdziæ.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Podczas rozmowy postaraj siê oceniæ, z kim masz do czynienia. Zwróæ uwagê na wypchane kieszenie albo bi¿uteriê. Ale przede wszystkim oceñ, jak czujny jest klient.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Pamiêtaj, ¿e okradanie pijanego robotnika to nie to samo co skubanie czujnego kupca.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Jak bêdziesz niezgrabny, to klient siê skapuje. Tak wiêc musisz byæ opanowany.
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
	description = "Mam pierœcieñ Constantina.";
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
	AI_Output (other, self, "DIA_Cassia_Aufnahme_15_00");//Mam pierœcieñ Constantina.
	B_GiveInvItems (other, self,ItRi_Prot_Point_01_MIS,1);
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//Gratulacje. Przeszed³eœ inicjacjê. Teraz jesteœ jednym z nas.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//WeŸ ten klucz. Otwiera drzwi do gospody. Nie bêdziesz musia³ taplaæ siê w wodzie za ka¿dym razem.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//Co wiêcej, musisz wiedzieæ, ¿e mamy tajny znak. Charakterystyczne kiwniêcie g³ow¹.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//W³aœnie tak. Kiedy bêdziesz z kimœ rozmawiaæ i zrobisz ten znak, jasne bêdzie, ¿e jesteœ jednym z nas.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Zosta³em przyjêty do gildii z³odziei."); 
	B_LogEntry (Topic_Diebesgilde,"Pozna³em tajny znak z³odziei. Jeœli poka¿ê go innemu z³odziejowi, bêdzie wiedzia³, ¿e ja równie¿ jestem cz³onkiem gildii.");
	 
	
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
	description = "Gdzie ukrywacie swoje ³upy?";
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
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//Gdzie ukrywacie swoje ³upy?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Daj spokój, nie myœla³eœ chyba, ¿e ci to powiem?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_02");//Bêdziesz mia³ doœæ okazji, ¿eby po³o¿yæ ³apki na maj¹tku innych ludzi - zbyt chciwi koñcz¹ z pustymi rêkami.
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
	description = "Masz dla mnie jak¹œ robotê?";
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
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//Masz dla mnie jak¹œ robotê?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//Nie, jeœli w mieœcie jesteœ œcigany za kradzie¿e.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//Za³atw to - zap³aæ grzywnê albo pozb¹dŸ siê œwiadków. Nie obchodzi mnie jak, ale masz to zrobiæ.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//Tak. Jest zestaw kielichów - szeœciu.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//Król Rhobar zdoby³ je podczas jednej z kampanii - ale poœwiêci³ wtedy wielu ludzi. Dlatego s¹ nazywane Krwawymi Kielichami.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//Pojedynczo nie s¹ zbyt cenne - ale razem s¹ warte okr¹g³¹ sumkê.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//Gdzie znajduj¹ siê te kielichy?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Nale¿¹ do bogatych kupców w górnym mieœcie.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//Przynieœ mi je. Ja tymczasem postaram siê znaleŸæ na nie kupca.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//Co za to dostanê?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//Po³owê zysku albo bêdziesz móg³ wybraæ z mojego ³upu jakiœ specjalny przedmiot.
 		
 		MIS_CassiaKelche = LOG_RUNNING;
 		Log_CreateTopic(Topic_Cassiakelche,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaKelche,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaKelche,"Cassia chce, abym przyniós³ jej szeœæ Krwawych Kielichów. Wszystkie znajduj¹ siê w mieœcie.");
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
	description = "Jeœli chodzi o te Krwawe Kielichy...";
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
	AI_Output (other, self, "DIA_Cassia_abgeben_15_00");//Je¿eli chodzi o te Krwawe Kielichy...
	
	if B_GiveInvItems (other, self, ItMi_BloodCup_MIS,6)
	{
		AI_Output (other, self, "DIA_Cassia_abgeben_15_01");//Mam wszystkie szeœæ kielichów.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Dobra robota. W miêdzyczasie uda³o mi siê znaleŸæ na nie kupca.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//Mo¿esz odebraæ swoj¹ nagrodê. Dziêkujê, ¿e to dla mnie zrobi³eœ.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//Nie muszê dla ciebie robiæ nic wiêcej - ale w ka¿dej chwili mo¿esz przyjœæ do mnie na naukê. A poza tym na tej wyspie jest doœæ ³upów dla ka¿dego.
		    
		
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP (XP_CassiaBlutkelche);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_abgeben_16_05");//Mogê sprzedaæ te kielichy w komplecie. Przynieœ mi wszystkie szeœæ.
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
	description = "Przyszed³em odebraæ swoj¹ nagrodê.";
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
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//Przyszed³em odebraæ swoj¹ nagrodê.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//Co wybierasz?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 sztuk z³ota.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice (DIA_Cassia_Belohnung,"4 eliksiry lecznicze",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice (DIA_Cassia_Belohnung, NAME_ADDON_CASSIASBELOHNUNGSRING ,DIA_Cassia_Belohnung_Ring);
	
};
FUNC VOID DIA_Cassia_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_02");//Daj mi z³oto.
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
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_04");//Daj mi pierœcieñ.
	B_GiveInvItems (self, other, ItRi_Hp_01,1);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
