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
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//To naprawd� TY? Cz�owieku, jak si� ciesz�, �e ci� widz�!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "Czy my si� znamy?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lester! Sk�d si� tu wzi��e�?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lester! Sk�d si� tu wzi��e�?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//To ci dopiero niez�a historia! Po upadku Bariery przez d�ugi czas b��ka�em si� po okolicy, nie wiedz�c, co ze sob� zrobi�.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Przez kolejne kilka dni przedziera�em si� przez lasy, a� wreszcie znalaz�em t� kotlink�.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten i Gorn nadal s� w G�rniczej Dolinie. Tak mi si� w ka�dym razie wydaje.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//Czy my si� znamy?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Halo? Jest tam kto?! Nadstawia�em karku, �eby� m�g� dosta� ten sw�j dziwny kamie�.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Jeste� mi co� winny. To przynajmniej m�g�by� pami�ta�!
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//Pami�tasz chyba Diego, Miltena i Gorna?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten i KTO?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Jasne. Co si� z nimi dzieje?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasne. Co si� z nimi dzieje?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Je�li si� nie myl�, wszyscy trzej prze�yli upadek Bariery.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nie mam poj�cia, gdzie si� teraz podziewaj�. Pewnie s� nadal w G�rniczej Dolinie.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Gdyby� ich spotka�, daj mi zna�.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten i KTO?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nie m�w mi, �e o wszystkim zapomnia�e�?! Kamienie ogniskuj�ce? Troll? Kopiec rudy wodnych mag�w? Nic?!
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Sam ju� nie wiem.
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Kiedy� sobie przypomnisz. Ja te� potrzebowa�em troch� czasu, �eby doj�� do siebie.
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
	description = "Co si� sta�o?";
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
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//Co ci si� sta�o?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//Po upadku �ni�cego, ca�e Bractwo wpad�o w sza�.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Bez swojego pana nie wiedzieli, co maj� robi� dalej.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co z tob�?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//Ze mn� by�o podobnie. Mia�em koszmary... nawet halucynacje! Ale gdy tylko jako tako doszed�em do siebie, da�em nog�.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//Raz wydawa�o mi si� nawet, �e widz� wielki cie� rzucaj�cy si� na grup� uciekinier�w i spowijaj�cy ich w wielkiej chmurze ognia.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//Przez moment my�la�em, �e mam przed sob� smoka.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Widzia�e� co� jeszcze?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//Nie! Na wszelki wypadek wzi��em nogi za pas!
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
	description = "Jak d�ugo si� tutaj ukrywasz?";
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
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//Jak d�ugo si� tu ukrywasz?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//Nie wiem dok�adnie. Mo�e tydzie�. Ale jest jeszcze co�:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Kiedy tu przyby�em wieczorem, spojrza�em na szczyt tej g�ry, i by�o tam tylko kilka drzew.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//Ale jak si� obudzi�em nast�pnego dnia, sta�a tam wie�a. M�g�bym przysi�c, �e wcze�niej jej nie by�o! Od tamtej pory nie ruszam si� st�d na krok.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//Masz na my�li wie�� Xardasa? Wiedzia�em, �e jest pot�ny, ale stworzy� magicznie tak� wie��...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Xardas? Ten nekromanta? To on mieszka w tej wie�y? Nie wiem, czy mi si� to podoba...
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Spokojnie! To on wyci�gn�� mnie ze �wi�tyni �ni�cego. Jest po naszej stronie.
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
	description	 = 	"Musisz porozmawia� z Xardasem o tym cieniu...";
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
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Musisz porozmawia� z Xardasem o tym cieniu. To mo�e by� co� wa�nego.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //My�lisz, �e sobie tego nie ubzdura�em? My�lisz, �e naprawd� widzia�em...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //...smoka. Tak.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Znowu siedzisz w tym wszystkim po uszy, co?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Mo�e nie a� po uszy. W ka�dym razie - jeszcze nie.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //C�, w porz�dku. Je�li to takie wa�ne, p�jd� z nim pogada�. Ale jeszcze nie teraz!
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //Najpierw musz� troch� odpocz��. Ci�gle jestem wyczerpany po ucieczce z Kolonii.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //Widz�, �e zn�w co� kombinujesz. Spotkamy si� u Xardasa.
	
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

	description	 = 	"Zmierzam do Khorinis! Co wiesz o tym mie�cie?";
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
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //Zmierzam do Khorinis! Co wiesz o tym mie�cie?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Khorinis? Miasto jak miasto, tyle �e portowe. Nic specjalnego.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Czemu pytasz?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Musz� si� skontaktowa� z paladynami, kt�rzy podobno tam przebywaj�.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //Czy�by? Niesamowite. Tak jakby kto� taki by� w stanie w og�le dosta� si� do miasta, nie m�wi�c ju� o spotkaniu z paladynami...
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

	description	 = 	"Jakie� rady co do sposobu dostania si� do miasta?";
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
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //Jakie� rady co do sposobu dostania si� do miasta?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Owszem! Jaki� czas temu pracowa�em dla starego alchemika imieniem Constantino.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //Ma pewne wp�ywy we w�adzach miejskich i nakaza� stra�nikom przepuszcza� osoby, kt�re chc� mu sprzeda� rzadkie zio�a.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //Ca�a sprawa jest do�� prosta - nazbieraj okolicznego zielska i udaj, �e pracujesz dla Constantina. To powinno wystarczy�.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Pilnuj tylko, �eby zielsko nie by�o ca�kowicie przypadkow� kolekcj� - stra�nicy nie s� mo�e zbyt m�drzy i nie znaj� si� na alchemii...
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //Ale to, co przynosisz, musi dobrze wygl�da� - inaczej ci� nie przepuszcz�.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //Powinno do tego wystarczy� 10 sztuk jednej ro�liny.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Dzi�ki za rad�.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester s�dzi, �e stra�e miejskie mnie przepuszcz�, je�li poka�� im 10 ro�lin tego samego rodzaju. Mam udawa�, �e s� dla alchemika Constantina."); 
	
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

	description	 = 	"Pomys� z Constantinem by� dobry, stra�nicy mnie przepu�cili.";
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
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //Pomys� z Constantinem by� dobry, stra�nicy mnie przepu�cili.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //No, tak jak m�wi�em. S�uchanie moich rad mo�e ci tylko wyj�� na dobre, przyjacielu...
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
	description = "Co mo�esz mi powiedzie� o pobliskich terenach?";
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
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//Co mo�esz mi powiedzie� o pobliskich terenach?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Id�c w d� tamtej drogi, dojdziesz do farmy. Za ni� le�y miasto.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Tylko uwa�aj na siebie! W pobli�u czaj� si� gro�niejsze rzeczy ni� wilki i szczury. Jest tu sporo goblin�w i bandyt�w!
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
	description = "Ci�gle zm�czony?";
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
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Ci�gle zm�czony?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//I to jak! Powiedzia�em Xardasowi wszystko, co wiem. Teraz musz� si� troch� zdrzemn��. Jeden dzie� powinien wystarczy�...
	AI_Output	(self, other,"DIA_Lester_Sleep_13_02");	//No... g�ra dwa.
	
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
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //No, jeste� nareszcie! Id� lepiej od razu do Xardasa. Mamy problem!
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //W to akurat �atwo mi uwierzy�.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //Od twojej ostatniej wizyty rozp�ta�o si� prawdziwe piek�o.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Porozmawiaj z Xardasem. Czeka ju� na ciebie!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas kaza� mi przekaza� ci t� run�. Dzi�ki niej szybciej do niego wr�cisz. Spotkamy si� na miejscu.
	
	CreateInvItems 		(self,ItRu_TeleportXardas,1);
	B_GiveInvItems 		(self,other,ItRu_TeleportXardas,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");	//Joly: Lester geht wieder zur�ck in sein Tal!
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

	description	 = 	"Nie wygl�dasz najlepiej.";
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
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //Nie wygl�dasz najlepiej.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //I nie najlepiej si� czuj�. Jestem zupe�nie wycie�czony i ci�gle mam ten b�l g�owy.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Za ka�dym razem, gdy pojawi� si� tu te czarne kaptury, jest jeszcze gorzej!
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //Mog� ci nawet powiedzie�, dlaczego tak si� dzieje.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Tak? Chyba nie chc� tego wiedzie�...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Te czarne kaptury, czy Poszukiwacze, jak nazywaj� ich magowie, byli kiedy� wyznawcami pot�nego demona. M�wi ci to co�?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Mmm... No nie. Chyba �e chcesz powiedzie�...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //W�a�nie tak. Poszukiwacze byli kiedy� wyznawcami �ni�cego. Utworzyli w Kolonii w�asn� sekt�, osiedlaj�c si� na tamtejszych bagnach.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //To twoi dawni kompani, Lester. Dawne Bractwo �ni�cego. Co� zmieni�o ich w bezduszne narz�dzia Z�a.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Podejrzewa�em to, ale mia�em nadziej�, �e si� myl�. Czy to znaczy, �e ON powr�ci�? Czy �ni�cy zn�w jest w naszym �wiecie?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Dobre pytanie. Wiem tylko, �e trzeba za wszelk� cen� powstrzyma� Poszukiwaczy, nim stan� si� zbyt pot�ni.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //Nie podoba mi si� to wszystko, ale chyba masz racj�. Przepraszam... Mo�na przez to wszystko oszale�.
					B_LogEntry (TOPIC_DEMENTOREN,"Moje podejrzenia potwierdzi�y si�. Nawet Lester nie ma �adnych w�tpliwo�ci, �e Poszukiwacze i wyznawcy �ni�cego przychodz� ze starego obozowiska na mokrad�ach."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //G�owa ci�gle mi p�ka, ale miejmy nadziej�, �e ten problem wkr�tce si� rozwi��e.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //W ten, czy inny spos�b.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //B�l g�owy sta� si� nie do zniesienia. A na dodatek ci jaszczuroludzie bez przerwy mnie atakuj�. Zastanawiam si�, sk�d oni si� bior�.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //M�j b�l g�owy nie ust�puje nawet na chwil�. Szykuje si� co� du�ego!
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //Chyba musz� najpierw odpocz��.
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
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Znikn�� gdzie�, ale zostawi� na stra�y swoje demony.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Chyba nie chce, �eby kto� w��czy� si� po wie�y pod jego nieobecno��.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Dok�d si� uda�?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //Tego nie powiedzia�. Kaza� tylko przekaza� ci ten list.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //Przepraszam... Przeczyta�em go.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //I co?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //I nic. Nie zrozumia�em ani s�owa. Jedno jest pewne - zbyt pr�dko go nie zobaczymy.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //My�l�, �e zrobi�o si� tu dla niego za gor�co i postanowi� da� nog�.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas znikn��. Lester przekaza� mi od niego list."); 
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
	description	 = 	"Dowiedzia�em si�, gdzie szuka� naszego nieprzyjaciela.";
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
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //Dowiedzia�em si�, gdzie szuka� naszego nieprzyjaciela.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Nie wiem dlaczego, ale mam wra�enie, �e powinienem p�j�� z tob�.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //Co przez to rozumiesz?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //Nie potrafi� tego wyja�ni�, ale wydaje mi si�, �e odpowiedzi na moje pytania poznam, id�c z tob�.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Przykro mi, ale mam ju� pe�n� za�og�.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Mo�e tak jest... A mo�e m�j los nic nie znaczy wobec wydarze�, kt�re czekaj� nas w najbli�szej przysz�o�ci...
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //Wiesz, co nale�y zrobi�. Staw czo�a Z�u. O mnie si� nie martw.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //Ja nic nie znacz�.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Nie mog� ci� zabra� ze sob�.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Wi�c chod� ze mn� i poszukaj swoich odpowiedzi!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Wi�c chod� ze mn� i poszukaj swoich odpowiedzi!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Spotkamy si� w zatoce. Zejd� tam, gdy tylko b�d� got�w.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Spiesz si�! Mamy ma�o czasu.
	
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
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //Nie mog� ci� zabra� ze sob�.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Rozumiem. Pewnie i tak nie na wiele bym ci si� przyda�.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //Niewa�ne, kogo zabierasz ze sob�, tak d�ugo, jak mo�esz im zaufa�.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //Uwa�aj na siebie.

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
	description	 = 	"Jednak zabrak�o dla ciebie miejsca na statku.";
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
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Jednak zabrak�o dla ciebie miejsca na statku.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Rozumiem. Na twoim miejscu post�pi�bym pewnie tak samo.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Gdyby� mnie potrzebowa�, wiesz, gdzie mnie znale��.
	
	Lester_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_StillNeedYou_Condition;
	information	 = 	DIA_Lester_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Przyda�aby mi si� twoja pomoc.";
};
func int DIA_Lester_StillNeedYou_Condition ()
{	
	if ((Lester_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man nat�rlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lester_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //Przyda�aby mi si� twoja pomoc.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //Wiedzia�em! Zupe�nie jak za dawnych czas�w, co?
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Si�y z�a powinny si� mie� na baczno�ci. Wkr�tce b�d� mia�y do czynienia Z NAMI!
		
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
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Chyba lepiej b�dzie, je�li tu jednak zostan�. Powodzenia.
	
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




































