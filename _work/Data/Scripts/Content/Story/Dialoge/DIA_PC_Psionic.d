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
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//To naprawdê TY? Cz³owieku, jak siê cieszê, ¿e ciê widzê!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "Czy my siê znamy?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lester! Sk¹d siê tu wzi¹³eœ?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lester! Sk¹d siê tu wzi¹³eœ?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//To ci dopiero niez³a historia! Po upadku Bariery przez d³ugi czas b³¹ka³em siê po okolicy, nie wiedz¹c, co ze sob¹ zrobiæ.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Przez kolejne kilka dni przedziera³em siê przez lasy, a¿ wreszcie znalaz³em tê kotlinkê.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten i Gorn nadal s¹ w Górniczej Dolinie. Tak mi siê w ka¿dym razie wydaje.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//Czy my siê znamy?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Halo? Jest tam kto?! Nadstawia³em karku, ¿ebyœ móg³ dostaæ ten swój dziwny kamieñ.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Jesteœ mi coœ winny. To przynajmniej móg³byœ pamiêtaæ!
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//Pamiêtasz chyba Diego, Miltena i Gorna?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten i KTO?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Jasne. Co siê z nimi dzieje?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasne. Co siê z nimi dzieje?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Jeœli siê nie mylê, wszyscy trzej prze¿yli upadek Bariery.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nie mam pojêcia, gdzie siê teraz podziewaj¹. Pewnie s¹ nadal w Górniczej Dolinie.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Gdybyœ ich spotka³, daj mi znaæ.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten i KTO?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nie mów mi, ¿e o wszystkim zapomnia³eœ?! Kamienie ogniskuj¹ce? Troll? Kopiec rudy wodnych magów? Nic?!
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Sam ju¿ nie wiem.
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Kiedyœ sobie przypomnisz. Ja te¿ potrzebowa³em trochê czasu, ¿eby dojœæ do siebie.
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
	description = "Co siê sta³o?";
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
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//Co ci siê sta³o?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//Po upadku Œni¹cego, ca³e Bractwo wpad³o w sza³.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Bez swojego pana nie wiedzieli, co maj¹ robiæ dalej.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co z tob¹?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//Ze mn¹ by³o podobnie. Mia³em koszmary... nawet halucynacje! Ale gdy tylko jako tako doszed³em do siebie, da³em nogê.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//Raz wydawa³o mi siê nawet, ¿e widzê wielki cieñ rzucaj¹cy siê na grupê uciekinierów i spowijaj¹cy ich w wielkiej chmurze ognia.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//Przez moment myœla³em, ¿e mam przed sob¹ smoka.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Widzia³eœ coœ jeszcze?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//Nie! Na wszelki wypadek wzi¹³em nogi za pas!
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
	description = "Jak d³ugo siê tutaj ukrywasz?";
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
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//Jak d³ugo siê tu ukrywasz?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//Nie wiem dok³adnie. Mo¿e tydzieñ. Ale jest jeszcze coœ:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Kiedy tu przyby³em wieczorem, spojrza³em na szczyt tej góry, i by³o tam tylko kilka drzew.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//Ale jak siê obudzi³em nastêpnego dnia, sta³a tam wie¿a. Móg³bym przysi¹c, ¿e wczeœniej jej nie by³o! Od tamtej pory nie ruszam siê st¹d na krok.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//Masz na myœli wie¿ê Xardasa? Wiedzia³em, ¿e jest potê¿ny, ale stworzyæ magicznie tak¹ wie¿ê...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Xardas? Ten nekromanta? To on mieszka w tej wie¿y? Nie wiem, czy mi siê to podoba...
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Spokojnie! To on wyci¹gn¹³ mnie ze œwi¹tyni Œni¹cego. Jest po naszej stronie.
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
	description	 = 	"Musisz porozmawiaæ z Xardasem o tym cieniu...";
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
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Musisz porozmawiaæ z Xardasem o tym cieniu. To mo¿e byæ coœ wa¿nego.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //Myœlisz, ¿e sobie tego nie ubzdura³em? Myœlisz, ¿e naprawdê widzia³em...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //...smoka. Tak.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Znowu siedzisz w tym wszystkim po uszy, co?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Mo¿e nie a¿ po uszy. W ka¿dym razie - jeszcze nie.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //Có¿, w porz¹dku. Jeœli to takie wa¿ne, pójdê z nim pogadaæ. Ale jeszcze nie teraz!
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //Najpierw muszê trochê odpocz¹æ. Ci¹gle jestem wyczerpany po ucieczce z Kolonii.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //Widzê, ¿e znów coœ kombinujesz. Spotkamy siê u Xardasa.
	
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

	description	 = 	"Zmierzam do Khorinis! Co wiesz o tym mieœcie?";
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
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //Zmierzam do Khorinis! Co wiesz o tym mieœcie?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Khorinis? Miasto jak miasto, tyle ¿e portowe. Nic specjalnego.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Czemu pytasz?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Muszê siê skontaktowaæ z paladynami, którzy podobno tam przebywaj¹.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //Czy¿by? Niesamowite. Tak jakby ktoœ taki by³ w stanie w ogóle dostaæ siê do miasta, nie mówi¹c ju¿ o spotkaniu z paladynami...
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

	description	 = 	"Jakieœ rady co do sposobu dostania siê do miasta?";
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
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //Jakieœ rady co do sposobu dostania siê do miasta?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Owszem! Jakiœ czas temu pracowa³em dla starego alchemika imieniem Constantino.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //Ma pewne wp³ywy we w³adzach miejskich i nakaza³ stra¿nikom przepuszczaæ osoby, które chc¹ mu sprzedaæ rzadkie zio³a.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //Ca³a sprawa jest doœæ prosta - nazbieraj okolicznego zielska i udaj, ¿e pracujesz dla Constantina. To powinno wystarczyæ.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Pilnuj tylko, ¿eby zielsko nie by³o ca³kowicie przypadkow¹ kolekcj¹ - stra¿nicy nie s¹ mo¿e zbyt m¹drzy i nie znaj¹ siê na alchemii...
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //Ale to, co przynosisz, musi dobrze wygl¹daæ - inaczej ciê nie przepuszcz¹.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //Powinno do tego wystarczyæ 10 sztuk jednej roœliny.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Dziêki za radê.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester s¹dzi, ¿e stra¿e miejskie mnie przepuszcz¹, jeœli poka¿ê im 10 roœlin tego samego rodzaju. Mam udawaæ, ¿e s¹ dla alchemika Constantina."); 
	
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

	description	 = 	"Pomys³ z Constantinem by³ dobry, stra¿nicy mnie przepuœcili.";
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
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //Pomys³ z Constantinem by³ dobry, stra¿nicy mnie przepuœcili.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //No, tak jak mówi³em. S³uchanie moich rad mo¿e ci tylko wyjœæ na dobre, przyjacielu...
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
	description = "Co mo¿esz mi powiedzieæ o pobliskich terenach?";
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
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//Co mo¿esz mi powiedzieæ o pobliskich terenach?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Id¹c w dó³ tamtej drogi, dojdziesz do farmy. Za ni¹ le¿y miasto.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Tylko uwa¿aj na siebie! W pobli¿u czaj¹ siê groŸniejsze rzeczy ni¿ wilki i szczury. Jest tu sporo goblinów i bandytów!
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
	description = "Ci¹gle zmêczony?";
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
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Ci¹gle zmêczony?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//I to jak! Powiedzia³em Xardasowi wszystko, co wiem. Teraz muszê siê trochê zdrzemn¹æ. Jeden dzieñ powinien wystarczyæ...
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
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //No, jesteœ nareszcie! IdŸ lepiej od razu do Xardasa. Mamy problem!
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //W to akurat ³atwo mi uwierzyæ.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //Od twojej ostatniej wizyty rozpêta³o siê prawdziwe piek³o.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Porozmawiaj z Xardasem. Czeka ju¿ na ciebie!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas kaza³ mi przekazaæ ci tê runê. Dziêki niej szybciej do niego wrócisz. Spotkamy siê na miejscu.
	
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

	description	 = 	"Nie wygl¹dasz najlepiej.";
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
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //Nie wygl¹dasz najlepiej.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //I nie najlepiej siê czujê. Jestem zupe³nie wycieñczony i ci¹gle mam ten ból g³owy.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Za ka¿dym razem, gdy pojawi¹ siê tu te czarne kaptury, jest jeszcze gorzej!
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //Mogê ci nawet powiedzieæ, dlaczego tak siê dzieje.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Tak? Chyba nie chcê tego wiedzieæ...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Te czarne kaptury, czy Poszukiwacze, jak nazywaj¹ ich magowie, byli kiedyœ wyznawcami potê¿nego demona. Mówi ci to coœ?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Mmm... No nie. Chyba ¿e chcesz powiedzieæ...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //W³aœnie tak. Poszukiwacze byli kiedyœ wyznawcami Œni¹cego. Utworzyli w Kolonii w³asn¹ sektê, osiedlaj¹c siê na tamtejszych bagnach.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //To twoi dawni kompani, Lester. Dawne Bractwo Œni¹cego. Coœ zmieni³o ich w bezduszne narzêdzia Z³a.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Podejrzewa³em to, ale mia³em nadziejê, ¿e siê mylê. Czy to znaczy, ¿e ON powróci³? Czy Œni¹cy znów jest w naszym œwiecie?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Dobre pytanie. Wiem tylko, ¿e trzeba za wszelk¹ cenê powstrzymaæ Poszukiwaczy, nim stan¹ siê zbyt potê¿ni.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //Nie podoba mi siê to wszystko, ale chyba masz racjê. Przepraszam... Mo¿na przez to wszystko oszaleæ.
					B_LogEntry (TOPIC_DEMENTOREN,"Moje podejrzenia potwierdzi³y siê. Nawet Lester nie ma ¿adnych w¹tpliwoœci, ¿e Poszukiwacze i wyznawcy œni¹cego przychodz¹ ze starego obozowiska na mokrad³ach."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //G³owa ci¹gle mi pêka, ale miejmy nadziejê, ¿e ten problem wkrótce siê rozwi¹¿e.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //W ten, czy inny sposób.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //Ból g³owy sta³ siê nie do zniesienia. A na dodatek ci jaszczuroludzie bez przerwy mnie atakuj¹. Zastanawiam siê, sk¹d oni siê bior¹.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //Mój ból g³owy nie ustêpuje nawet na chwilê. Szykuje siê coœ du¿ego!
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //Chyba muszê najpierw odpocz¹æ.
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
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Znikn¹³ gdzieœ, ale zostawi³ na stra¿y swoje demony.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Chyba nie chce, ¿eby ktoœ w³óczy³ siê po wie¿y pod jego nieobecnoœæ.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Dok¹d siê uda³?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //Tego nie powiedzia³. Kaza³ tylko przekazaæ ci ten list.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //Przepraszam... Przeczyta³em go.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //I co?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //I nic. Nie zrozumia³em ani s³owa. Jedno jest pewne - zbyt prêdko go nie zobaczymy.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //Myœlê, ¿e zrobi³o siê tu dla niego za gor¹co i postanowi³ daæ nogê.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas znikn¹³. Lester przekaza³ mi od niego list."); 
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
	description	 = 	"Dowiedzia³em siê, gdzie szukaæ naszego nieprzyjaciela.";
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
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //Dowiedzia³em siê, gdzie szukaæ naszego nieprzyjaciela.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Nie wiem dlaczego, ale mam wra¿enie, ¿e powinienem pójœæ z tob¹.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //Co przez to rozumiesz?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //Nie potrafiê tego wyjaœniæ, ale wydaje mi siê, ¿e odpowiedzi na moje pytania poznam, id¹c z tob¹.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Przykro mi, ale mam ju¿ pe³n¹ za³ogê.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Mo¿e tak jest... A mo¿e mój los nic nie znaczy wobec wydarzeñ, które czekaj¹ nas w najbli¿szej przysz³oœci...
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //Wiesz, co nale¿y zrobiæ. Staw czo³a Z³u. O mnie siê nie martw.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //Ja nic nie znaczê.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Nie mogê ciê zabraæ ze sob¹.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Wiêc chodŸ ze mn¹ i poszukaj swoich odpowiedzi!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Wiêc chodŸ ze mn¹ i poszukaj swoich odpowiedzi!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Spotkamy siê w zatoce. Zejdê tam, gdy tylko bêdê gotów.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Spiesz siê! Mamy ma³o czasu.
	
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
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //Nie mogê ciê zabraæ ze sob¹.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Rozumiem. Pewnie i tak nie na wiele bym ci siê przyda³.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //Niewa¿ne, kogo zabierasz ze sob¹, tak d³ugo, jak mo¿esz im zaufaæ.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //Uwa¿aj na siebie.

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
	description	 = 	"Jednak zabrak³o dla ciebie miejsca na statku.";
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
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Jednak zabrak³o dla ciebie miejsca na statku.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Rozumiem. Na twoim miejscu post¹pi³bym pewnie tak samo.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Gdybyœ mnie potrzebowa³, wiesz, gdzie mnie znaleŸæ.
	
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
	description	 = 	"Przyda³aby mi siê twoja pomoc.";
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
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //Przyda³aby mi siê twoja pomoc.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //Wiedzia³em! Zupe³nie jak za dawnych czasów, co?
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Si³y z³a powinny siê mieæ na bacznoœci. Wkrótce bêd¹ mia³y do czynienia Z NAMI!
		
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
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Chyba lepiej bêdzie, jeœli tu jednak zostanê. Powodzenia.
	
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




































