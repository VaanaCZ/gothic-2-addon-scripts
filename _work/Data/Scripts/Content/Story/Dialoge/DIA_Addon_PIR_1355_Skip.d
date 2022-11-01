// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //A kogóż to stary Skip znowu widzi!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //Ja cię znam!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //Zatoka koło miasta, pamiętasz?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip? To ty?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //Jak widać, trudno mnie zapomnieć.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Ale wydaje mi się, że jeszcze gdzieś cię widziałem...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //A, no tak!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //Rysownik się nie popisał, ale to byłeś ty.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Ale nie ma o czym gadać. Na swoim liście gończym też wyglądam dość szpetnie.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "Mam dla ciebie paczkę od Baltrama.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //Mam dla ciebie paczkę od Baltrama.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //Chyba naprawdę potrzebuje rumu, bo po co wysyłałby towar w taki sposób?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Oto dwie butelki rumu. Niestety, trzecią opróżniłem, czekając tu na niego.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "Co tu robisz?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //Co tu robisz?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Wróciłem z Khorinis i czekam na powrót kapitana Grega.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "Widziałem Grega w Khorinis.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //Widziałem Grega w Khorinis.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //Naprawdę? Niech to diabli! Coś musiało pójść naprawdę źle!
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //Powinien już dawno wrócić z naszym statkiem.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //Najlepiej będzie, jeśli wrócę do Khorinis i poczekam tam na niego...
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //Ale nie dzisiaj. Dopiero co wróciłem.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "Możesz mnie zabrać do Khorinis?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //Możesz mnie zabrać do Khorinis?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //Nie. Wyruszam później. Najpierw muszę odpocząć i napić się grogu.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Zwariowałeś? Straciliśmy nasz statek, rozumiesz?
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //Nie mam zamiaru używać naszej ostatniej łodzi, aby przewieźć kogoś, komu nie chce się ruszyć tyłka!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Ile razy mam powtarzać? Nie!
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "Co możesz mi powiedzieć o bandytach?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //Co możesz mi powiedzieć o bandytach?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //Bandytach? Napadają nas, ot co!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Niby po co wznosimy tę palisadę?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //To my ich tu przywieźliśmy.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //Nawet z nimi handlowaliśmy. Żebyś wiedział, ile oni mają złota! Całe krocie, mówię ci!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Byli gotowi płacić każdą cenę za beczkę rumu.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Ale to już należy do przeszłości. Teraz trwa wojna!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //Co się stało?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Ci dranie nie zapłacili nam za ostatnią dostawę.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //A więc poszedłem do nich, żeby dostać swoje złoto.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //Kiedy tylko wszedłem na bagna, ci obwiesie rzucili się na mnie!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //Co gorsza, załatwili Angusa i Hanka - dwóch naszych najlepszych żeglarzy!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Nie zapuszczaj się na bagna, mówię ci.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Atakują każdego, kto wygląda inaczej niż oni!
	
	
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "Potrzebny mi pancerz bandytów.";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //Potrzebny mi pancerz bandytów.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //Chcesz tam iść? Odbiło ci do reszty. 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Kiedy bandyci odkryją, że nie jesteś jednym z nich, nakarmią tobą węże błotne.
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //Wiesz, gdzie mógłbym znaleźć taki pancerz?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //Nigdy się nie poddajesz, co? Dobrze więc. Kiedyś mieliśmy jeden taki.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Może wciąż leży gdzieś w chacie Grega.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Może ci go da, jeśli tylko wróci...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip podejrzewa, że zbroja jest w chacie Grega."); 
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "A jak się dostać do chaty?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //A jak się dostać do chaty?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Spokojnie, chłopcze!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //Chcesz podwędzić coś, co należy do Grega?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //Kiedy kapitan opuszczał nasz obóz, polecił Francisowi pilnować, aby nikt nie wchodził do jego chaty.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis ma klucz do chaty Grega, ale nie wpuści nikogo do środka."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "Co możesz mi powiedzieć o Francisie?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //Co możesz mi powiedzieć o Francisie?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //To nasz skarbnik.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //Kapitan mu bardzo ufa. To dlatego powierzył mu zastępstwo.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //Chociaż reszta chłopaków nie szanuje go zbytnio.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Jeśli chcesz wiedzieć więcej, pogadaj z Samuelem.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Siedzi w małej jaskini, na północ stąd.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //Samuel wie prawie wszystko o prawie wszystkich.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Powinienem porozmawiać z Samuelem. Może będzie mógł mi dać jakieś wskazówki."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Spotkałeś kiedyś Kruka?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Spotkałeś kiedyś Kruka?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Pewnie. Stałem wtedy na straży z Henrym. Widzieliśmy, jak Kruk zostawia swoich ludzi w wieży stojącej kawałek na południe stąd.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //Skoro zostawił ich tak blisko, to na pewno mają nas szpiegować.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //Widziałem też, jak obchodzi się z ludźmi, którzy nie okazują posłuszeństwa.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //Kiedy ktoś pokaże choć cień niesubordynacji, może stracić głowę.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Uważaj na Kruka, dobrze ci radzę.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Opowiedz mi coś więcej o Angusie i Hanku.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Opowiedz mi coś więcej o Angusie i Hanku.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus i Hank mieli spotkać się z bandytami poza obozem.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Mieli ze sobą wszystko, co tamci zamówili.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Kutą stal, wytrychy i inne takie rzeczy. 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Niestety, nie wrócili. Te sukinsyny musiały ich załatwić!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan i Bill szukali ich, ale bezskutecznie.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill był szczególnie smutny, bo Angus i Hank to jego bliscy przyjaciele.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //Jest młody i słabo znosi takie wydarzenia.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //Inni przyjęli to ze spokojem. Utrata dóbr nie jest niczym wielkim. Ale ten grog, który nieśli...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //Było tego ze 20 butelek!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip chce odzyskać 20 butelek grogu, które zabrali mu bandyci.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus i Hank mieli pohandlować z bandytami. Od tej pory ich nie widziano.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Poszukiwania Morgana i Billa nie przyniosły efektu...");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "Jeśli chodzi o Angusa i Hanka...";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //Jeśli chodzi o Angusa i Hanka...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //Tak?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Znalazłem ich.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Nie żyją.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //A więc jednak. Biedni dranie!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //Ale nie liczyłem na nic innego.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //Powinieneś zanieść te smutne wieści Billowi, jeśli dotąd tego nie zrobiłeś.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Ale nie wal prosto z mostu. Bill jest jeszcze młody.
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "Wiem, kto zamordował Angusa i Hanka.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //Wiem, kto zamordował Angusa i Hanka.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //No i dobrze. Ale to im nie zwróci życia.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //Zemsta to zły sposób na zdobycie łupów.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Najważniejsze, że odzyskałem swój grog.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //Morderca mnie nie obchodzi! Co z moim grogiem?
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "W sprawie grogu...";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //W sprawie grogu...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Oto twoje 20 flaszek.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Brakuje 20 butelek, tak?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Tak, do cholery! To był nasz cały zapas!
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Oto twoje 20 flaszek.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip odzyskał swoje 20 butelek grogu i jest zadowolony.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //Niech mnie kule biją! Tak za darmo?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //No cóż...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //Dobrze, zapłacę ci.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Masz może coś bardziej interesującego niż złoto?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Hmmm... Pomyślmy... O, mam pierścień.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //Wygrałem go wiele lat temu w kości w jednej z portowych tawern.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //Człowiek, który go przegrał, zapewniał, że pierścień jest magiczny. Ale nigdy nie miałem okazji sprawdzić, czy to prawda.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Chcesz pierścień czy złoto?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Wezmę pieniądze.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Daj mi pierścień.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Daj mi pierścień.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Proszę bardzo.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Wezmę pieniądze.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //Nie ma sprawy.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "Masz może coś do sprzedania?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Masz może coś do sprzedania?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Jeśli chcesz pohandlować, to pogadaj z Garrettem. On zajmuje się naszymi zapasami.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "Powinieneś mi pomóc.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //Powinieneś mi pomóc.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //Co jest grane?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //Kanion czeka.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Widzę, że zgromadziłeś chłopców. Dobra robota! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //Lepiej weź paru chłopaków!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //Kanion jest bardzo niebezpieczny.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Chodź ze mną.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Chodź ze mną.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Czekaj. Wróćmy do kanionu.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //No to w drogę!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "Nie potrzebuję już twojej pomocy.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //Nie potrzebuję już twojej pomocy.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //No to idę. Znajdziesz mnie w obozie, jakby co.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //To wystarczająco daleko!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //Jeśli naprawdę chcesz iść dalej, to bez nas.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //Jeśli naprawdę chcesz iść dalej, to beze mnie.
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Jeśli zostaniemy rozdzieleni, spotkamy się przy wodzie.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Idziemy!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Orkowie! Nienawidzę tych bestii!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Wygląda na to, że pozbyliśmy się brzytwiaków.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //Możemy trochę połazić po okolicy, jeśli chcesz.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Oczywiście musimy zostać w kanionie. 
	
	AI_StopProcessInfos (self); 
};


