// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_EXIT_Condition;
	information	= DIA_Lester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_Hello (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Hello_Condition;
	information	= DIA_Lester_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       
FUNC INT DIA_Lester_Hello_Condition()
{	
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Hello_Info()
{	
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//To naprawdę TY? Człowieku, jak się cieszę, że cię widzę!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "Czy my się znamy?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lester! Skąd się tu wziąłeś?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lester! Skąd się tu wziąłeś?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//To ci dopiero niezła historia! Po upadku Bariery przez długi czas błąkałem się po okolicy, nie wiedząc, co ze sobą zrobić.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Przez kolejne kilka dni przedzierałem się przez lasy, aż wreszcie znalazłem tę kotlinkę.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten i Gorn nadal są w Górniczej Dolinie. Tak mi się w każdym razie wydaje.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//Czy my się znamy?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Halo? Jest tam kto?! Nadstawiałem karku, żebyś mógł dostać ten swój dziwny kamień.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Jesteś mi coś winny. To przynajmniej mógłbyś pamiętać!
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//Pamiętasz chyba Diego, Miltena i Gorna?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten i KTO?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Jasne. Co się z nimi dzieje?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasne. Co się z nimi dzieje?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Jeśli się nie mylę, wszyscy trzej przeżyli upadek Bariery.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nie mam pojęcia, gdzie się teraz podziewają. Pewnie są nadal w Górniczej Dolinie.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Gdybyś ich spotkał, daj mi znać.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten i KTO?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nie mów mi, że o wszystkim zapomniałeś?! Kamienie ogniskujące? Troll? Kopiec rudy wodnych magów? Nic?!
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Sam już nie wiem.
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Kiedyś sobie przypomnisz. Ja też potrzebowałem trochę czasu, żeby dojść do siebie.
};
// ************************************************************
// 		  				  Was ist passiert?		//E1
// ************************************************************
INSTANCE DIA_Lester_WhatHappened (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_WhatHappened_Condition;
	information	= DIA_Lester_WhatHappened_Info;
	permanent	= FALSE;
	description = "Co się stało?";
};                       
FUNC INT DIA_Lester_WhatHappened_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_WhatHappened_Info()
{	
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//Co ci się stało?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//Po upadku Śniącego, całe Bractwo wpadło w szał.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Bez swojego pana nie wiedzieli, co mają robić dalej.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co z tobą?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//Ze mną było podobnie. Miałem koszmary... nawet halucynacje! Ale gdy tylko jako tako doszedłem do siebie, dałem nogę.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//Raz wydawało mi się nawet, że widzę wielki cień rzucający się na grupę uciekinierów i spowijający ich w wielkiej chmurze ognia.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//Przez moment myślałem, że mam przed sobą smoka.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Widziałeś coś jeszcze?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//Nie! Na wszelki wypadek wziąłem nogi za pas!
};
// ************************************************************
// 		  				   Minental		 		//E1 
// ************************************************************
INSTANCE DIA_Lester_MineColony (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_MineColony_Condition;
	information	= DIA_Lester_MineColony_Info;
	permanent	= FALSE;
	description = "Jak długo się tutaj ukrywasz?";
};                       
FUNC INT DIA_Lester_MineColony_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_MineColony_Info()
{	
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//Jak długo się tu ukrywasz?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//Nie wiem dokładnie. Może tydzień. Ale jest jeszcze coś:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Kiedy tu przybyłem wieczorem, spojrzałem na szczyt tej góry, i było tam tylko kilka drzew.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//Ale jak się obudziłem następnego dnia, stała tam wieża. Mógłbym przysiąc, że wcześniej jej nie było! Od tamtej pory nie ruszam się stąd na krok.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//Masz na myśli wieżę Xardasa? Wiedziałem, że jest potężny, ale stworzyć magicznie taką wieżę...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Xardas? Ten nekromanta? To on mieszka w tej wieży? Nie wiem, czy mi się to podoba...
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Spokojnie! To on wyciągnął mnie ze świątyni Śniącego. Jest po naszej stronie.
};
///////////////////////////////////////////////////////////////////////
//	Info SEND_XARDAS
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_SEND_XARDAS		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_SEND_XARDAS_Condition;
	information	 = 	DIA_Lester_SEND_XARDAS_Info;
	permanent	 = 	FALSE;
	description	 = 	"Musisz porozmawiać z Xardasem o tym cieniu...";
};
func int DIA_Lester_SEND_XARDAS_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Lester_WhatHappened)
	&& Npc_KnowsInfo (other,DIA_Lester_MineColony)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_SEND_XARDAS_Info ()
{
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Musisz porozmawiać z Xardasem o tym cieniu. To może być coś ważnego.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //Myślisz, że sobie tego nie ubzdurałem? Myślisz, że naprawdę widziałem...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //...smoka. Tak.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Znowu siedzisz w tym wszystkim po uszy, co?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Może nie aż po uszy. W każdym razie - jeszcze nie.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //Cóż, w porządku. Jeśli to takie ważne, pójdę z nim pogadać. Ale jeszcze nie teraz!
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //Najpierw muszę trochę odpocząć. Ciągle jestem wyczerpany po ucieczce z Kolonii.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //Widzę, że znów coś kombinujesz. Spotkamy się u Xardasa.
	
	AI_StopProcessInfos (self);
	
	//wird bei LOLO zu Xardas gebeamt
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_STADT		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_STADT_Condition;
	information	 = 	DIA_Addon_Lester_STADT_Info;

	description	 = 	"Zmierzam do Khorinis! Co wiesz o tym mieście?";
};

func int DIA_Addon_Lester_STADT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_STADT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //Zmierzam do Khorinis! Co wiesz o tym mieście?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Khorinis? Miasto jak miasto, tyle że portowe. Nic specjalnego.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Czemu pytasz?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Muszę się skontaktować z paladynami, którzy podobno tam przebywają.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //Czyżby? Niesamowite. Tak jakby ktoś taki był w stanie w ogóle dostać się do miasta, nie mówiąc już o spotkaniu z paladynami...
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_Vorschlag		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_Vorschlag_Condition;
	information	 = 	DIA_Addon_Lester_Vorschlag_Info;

	description	 = 	"Jakieś rady co do sposobu dostania się do miasta?";
};

func int DIA_Addon_Lester_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lester_STADT))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //Jakieś rady co do sposobu dostania się do miasta?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Owszem! Jakiś czas temu pracowałem dla starego alchemika imieniem Constantino.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //Ma pewne wpływy we władzach miejskich i nakazał strażnikom przepuszczać osoby, które chcą mu sprzedać rzadkie zioła.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //Cała sprawa jest dość prosta - nazbieraj okolicznego zielska i udaj, że pracujesz dla Constantina. To powinno wystarczyć.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Pilnuj tylko, żeby zielsko nie było całkowicie przypadkową kolekcją - strażnicy nie są może zbyt mądrzy i nie znają się na alchemii...
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //Ale to, co przynosisz, musi dobrze wyglądać - inaczej cię nie przepuszczą.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //Powinno do tego wystarczyć 10 sztuk jednej rośliny.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Dzięki za radę.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester sądzi, że straże miejskie mnie przepuszczą, jeśli pokażę im 10 roślin tego samego rodzaju. Mam udawać, że są dla alchemika Constantina."); 
	
	MIS_Addon_Lester_PickForConstantino = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info PASSAGEPLANTSSUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;

	description	 = 	"Pomysł z Constantinem był dobry, strażnicy mnie przepuścili.";
};

func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition ()
{
	if (MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //Pomysł z Constantinem był dobry, strażnicy mnie przepuścili.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //No, tak jak mówiłem. Słuchanie moich rad może ci tylko wyjść na dobre, przyjacielu...
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 		  		Perm	
// ************************************************************
INSTANCE DIA_Lester_Perm (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Perm_Condition;
	information	= DIA_Lester_Perm_Info;
	permanent	= TRUE;
	description = "Co możesz mi powiedzieć o pobliskich terenach?";
};                       
FUNC INT DIA_Lester_Perm_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_LESTER") <= 2000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Perm_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//Co możesz mi powiedzieć o pobliskich terenach?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Idąc w dół tamtej drogi, dojdziesz do farmy. Za nią leży miasto.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Tylko uważaj na siebie! W pobliżu czają się groźniejsze rzeczy niż wilki i szczury. Jest tu sporo goblinów i bandytów!
};
// ************************************************************
// 		  		Sleep
// ************************************************************
INSTANCE DIA_Lester_Sleep (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Sleep_Condition;
	information	= DIA_Lester_Sleep_Info;
	permanent	= TRUE;
	description = "Ciągle zmęczony?";
};                       
FUNC INT DIA_Lester_Sleep_Condition()
{
	if  (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_IN1_31") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Sleep_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Ciągle zmęczony?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//I to jak! Powiedziałem Xardasowi wszystko, co wiem. Teraz muszę się trochę zdrzemnąć. Jeden dzień powinien wystarczyć...
	AI_Output	(self, other,"DIA_Lester_Sleep_13_02");	//No... góra dwa.
	
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Lester_KAP3_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP3_EXIT_Condition;
	information	= DIA_Lester_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BACKINTOWN
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_BACKINTOWN		(C_INFO) 
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_BACKINTOWN_Condition;
	information	 = 	DIA_Lester_BACKINTOWN_Info;
	important	 = 	TRUE;
};
func int DIA_Lester_BACKINTOWN_Condition ()
{	
	if (Npc_GetDistToWP (self, "LEVELCHANGE") <= 500) 
		&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_BACKINTOWN_Info ()
{
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //No, jesteś nareszcie! Idź lepiej od razu do Xardasa. Mamy problem!
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //W to akurat łatwo mi uwierzyć.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //Od twojej ostatniej wizyty rozpętało się prawdziwe piekło.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Porozmawiaj z Xardasem. Czeka już na ciebie!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas kazał mi przekazać ci tę runę. Dzięki niej szybciej do niego wrócisz. Spotkamy się na miejscu.
	
	CreateInvItems 		(self,ItRu_TeleportXardas,1);
	B_GiveInvItems 		(self,other,ItRu_TeleportXardas,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");	//Joly: Lester geht wieder zurück in sein Tal!
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_PERM3		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	900;
	condition	 = 	DIA_Lester_PERM3_Condition;
	information	 = 	DIA_Lester_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nie wyglądasz najlepiej.";
};

func int DIA_Lester_PERM3_Condition ()
{
	if (Kapitel >= 3)
	&& (Lester_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

var int DIA_Lester_PERM3_OneTime;
func void DIA_Lester_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //Nie wyglądasz najlepiej.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //I nie najlepiej się czuję. Jestem zupełnie wycieńczony i ciągle mam ten ból głowy.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Za każdym razem, gdy pojawią się tu te czarne kaptury, jest jeszcze gorzej!
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //Mogę ci nawet powiedzieć, dlaczego tak się dzieje.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Tak? Chyba nie chcę tego wiedzieć...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Te czarne kaptury, czy Poszukiwacze, jak nazywają ich magowie, byli kiedyś wyznawcami potężnego demona. Mówi ci to coś?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Mmm... No nie. Chyba że chcesz powiedzieć...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //Właśnie tak. Poszukiwacze byli kiedyś wyznawcami Śniącego. Utworzyli w Kolonii własną sektę, osiedlając się na tamtejszych bagnach.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //To twoi dawni kompani, Lester. Dawne Bractwo Śniącego. Coś zmieniło ich w bezduszne narzędzia Zła.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Podejrzewałem to, ale miałem nadzieję, że się mylę. Czy to znaczy, że ON powrócił? Czy Śniący znów jest w naszym świecie?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Dobre pytanie. Wiem tylko, że trzeba za wszelką cenę powstrzymać Poszukiwaczy, nim staną się zbyt potężni.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //Nie podoba mi się to wszystko, ale chyba masz rację. Przepraszam... Można przez to wszystko oszaleć.
					B_LogEntry (TOPIC_DEMENTOREN,"Moje podejrzenia potwierdziły się. Nawet Lester nie ma żadnych wątpliwości, że Poszukiwacze i wyznawcy śniącego przychodzą ze starego obozowiska na mokradłach."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //Głowa ciągle mi pęka, ale miejmy nadzieję, że ten problem wkrótce się rozwiąże.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //W ten, czy inny sposób.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //Ból głowy stał się nie do zniesienia. A na dodatek ci jaszczuroludzie bez przerwy mnie atakują. Zastanawiam się, skąd oni się biorą.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //Mój ból głowy nie ustępuje nawet na chwilę. Szykuje się coś dużego!
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //Chyba muszę najpierw odpocząć.
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

INSTANCE DIA_Lester_KAP4_EXIT(C_INFO)
{
	npc		= PC_Psionic;
	nr		= 999;
	condition	= DIA_Lester_KAP4_EXIT_Condition;
	information	= DIA_Lester_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP4_EXIT_Info()
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

INSTANCE DIA_Lester_KAP5_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP5_EXIT_Condition;
	information	= DIA_Lester_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info XardasWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_XARDASWEG		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_XARDASWEG_Condition;
	information	 = 	DIA_Lester_XARDASWEG_Info;

	description	 = 	"Gdzie jest Xardas?";
};

func int DIA_Lester_XARDASWEG_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_00"); //Gdzie jest Xardas?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Zniknął gdzieś, ale zostawił na straży swoje demony.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Chyba nie chce, żeby ktoś włóczył się po wieży pod jego nieobecność.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Dokąd się udał?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //Tego nie powiedział. Kazał tylko przekazać ci ten list.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //Przepraszam... Przeczytałem go.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //I co?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //I nic. Nie zrozumiałem ani słowa. Jedno jest pewne - zbyt prędko go nie zobaczymy.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //Myślę, że zrobiło się tu dla niego za gorąco i postanowił dać nogę.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas zniknął. Lester przekazał mi od niego list."); 
};


///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lester_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Dowiedziałem się, gdzie szukać naszego nieprzyjaciela.";
};
func int DIA_Lester_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lester_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lester_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //Dowiedziałem się, gdzie szukać naszego nieprzyjaciela.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Nie wiem dlaczego, ale mam wrażenie, że powinienem pójść z tobą.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //Co przez to rozumiesz?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //Nie potrafię tego wyjaśnić, ale wydaje mi się, że odpowiedzi na moje pytania poznam, idąc z tobą.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Przykro mi, ale mam już pełną załogę.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Może tak jest... A może mój los nic nie znaczy wobec wydarzeń, które czekają nas w najbliższej przyszłości...
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //Wiesz, co należy zrobić. Staw czoła Złu. O mnie się nie martw.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //Ja nic nie znaczę.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Nie mogę cię zabrać ze sobą.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Więc chodź ze mną i poszukaj swoich odpowiedzi!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Więc chodź ze mną i poszukaj swoich odpowiedzi!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Spotkamy się w zatoce. Zejdę tam, gdy tylko będę gotów.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Spiesz się! Mamy mało czasu.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};

FUNC VOID DIA_Lester_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //Nie mogę cię zabrać ze sobą.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Rozumiem. Pewnie i tak nie na wiele bym ci się przydał.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //Nieważne, kogo zabierasz ze sobą, tak długo, jak możesz im zaufać.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //Uważaj na siebie.

	Lester_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_LeaveMyShip_Condition;
	information	 = 	DIA_Lester_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Jednak zabrakło dla ciebie miejsca na statku.";
};
func int DIA_Lester_LeaveMyShip_Condition ()
{	
	if (Lester_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lester_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Jednak zabrakło dla ciebie miejsca na statku.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Rozumiem. Na twoim miejscu postąpiłbym pewnie tak samo.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Gdybyś mnie potrzebował, wiesz, gdzie mnie znaleźć.
	
	Lester_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_StillNeedYou_Condition;
	information	 = 	DIA_Lester_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Przydałaby mi się twoja pomoc.";
};
func int DIA_Lester_StillNeedYou_Condition ()
{	
	if ((Lester_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lester_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //Przydałaby mi się twoja pomoc.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //Wiedziałem! Zupełnie jak za dawnych czasów, co?
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Siły zła powinny się mieć na baczności. Wkrótce będą miały do czynienia Z NAMI!
		
		self.flags 		 = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Chyba lepiej będzie, jeśli tu jednak zostanę. Powodzenia.
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6 //auf der Dracheninsel ->Neue Instanz!!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lester_KAP6_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP6_EXIT_Condition;
	information	= DIA_Lester_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_PC_Psionic_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 900;
	condition	= DIA_PC_Psionic_PICKPOCKET_Condition;
	information	= DIA_PC_Psionic_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_PC_Psionic_PICKPOCKET_Condition()
{
	C_Beklauen (76, 20);
};
 
FUNC VOID DIA_PC_Psionic_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_BACK 		,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};
	
func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};




































