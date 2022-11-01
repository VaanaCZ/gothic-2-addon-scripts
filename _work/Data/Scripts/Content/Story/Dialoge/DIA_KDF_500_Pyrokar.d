///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pyrokar_EXIT   (C_INFO)
{
	npc         = KDF_500_Pyrokar;
	nr          = 999;
	condition   = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  2;
	condition	 = 	DIA_Pyrokar_WELCOME_Condition;
	information	 = 	DIA_Pyrokar_WELCOME_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_WELCOME_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //A więc to ty jesteś tym nowym nowicjuszem. Zakładam, że Mistrz Parlan przydzielił ci już jakieś zadanie.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //Wiesz przecież, że zgodnie z wolą Innosa każdy członek naszej społeczności musi wypełniać swoje obowiązki.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Hagen_Condition;
	information	 = 	DIA_Pyrokar_Hagen_Info;
	permanent	 =  FALSE;
	description	 =  "Muszę porozmawiać z paladynami. To bardzo ważne.";
};
func int DIA_Pyrokar_Hagen_Condition ()
{	
	if (other.guild  == GIL_NOV) //muss kommen
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //Muszę porozmawiać z paladynami. To bardzo ważne.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //Zechciej nam zatem powiedzieć, dlaczego tak ci śpieszno do rozmowy z nimi?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //Mam dla nich ważną wiadomość.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //W rzeczy samej? Cóż to za wiadomość?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //W Górniczej Dolinie zbierają się siły ciemności prowadzone przez potężne smoki. Musimy je powstrzymać, póki jeszcze czas.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Hmmm... Rozważymy twoje słowa, nowicjuszu. Gdy nadejdzie odpowiednia chwila, powiadomimy cię o naszej decyzji.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //W międzyczasie wypełniaj sumiennie swoje obowiązki.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //Nie chcemy cię tu dłużej zatrzymywać. Możesz już odejść.
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Auge_Condition;
	information	 = 	DIA_Pyrokar_Auge_Info;
	permanent	 =  FALSE;
	description	 =  "Poszukuję Oka Innosa.";
};
func int DIA_Pyrokar_Auge_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Auge_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //Szukam Oka Innosa.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Każdy, komu wydaje się, że może nie tylko odnaleźć, ale i założyć święty amulet, jest skończonym głupcem.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //To amulet wybiera swojego właściciela. Tylko taka osoba może go nosić.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Chciałbym spróbować szczęścia.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Nowicjuszowi przystoi raczej pokora, a nie chęć posiadania!
	
 	B_LogEntry (TOPIC_INNOSEYE, "Nie przypuszczałem, że będzie to takie trudne, jednak Pyrokar nie chce dobrowolnie oddać Oka Innosa.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //Nie chcemy cię tu dłużej zatrzymywać. Możesz już odejść.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Pyrokar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Pyrokar_MissingPeople_Info;

	description	 = 	"Kilku mieszkańców Khorinis zaginęło w dziwnych okolicznościach.";
};
func int DIA_Addon_Pyrokar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Pyrokar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Kilku mieszkańców Khorinis zaginęło w dziwnych okolicznościach.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //Przykro mi z tego powodu. Doszliśmy jednak do wniosku, że lepiej będzie, jeśli tą sprawą zajmą się Magowie Wody.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //To samo dotyczy badania dziwnych trzęsień ziemi w północno-wschodnim Khorinis.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Do tej pory nic nie sugeruje, aby konieczna była nasza interwencja, więc nie podejmiemy w tej sprawie żadnych kroków.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Tak, ale...
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //Nie ma żadnych ale! Będziemy postępować, jak uznamy za słuszne. Mam nadzieję, że zdołasz uszanować naszą decyzję.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Magowie Ognia żałują porwanych obywateli, ale mówią, że to zadanie dla Magów Wody. Lepiej nie oczekiwać od nich żadnej pomocy."); 

	if (other.guild  == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		AI_StopProcessInfos (self); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_GOAWAY_Condition;
	information	 = 	DIA_Pyrokar_GOAWAY_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_GOAWAY_Condition ()
{
	//ADDON>
	if (Npc_KnowsInfo (hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return FALSE;
		};
	//ADDON<

	if (Npc_IsInState (self, ZS_Talk)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Hagen)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //Posłuszeństwo jest cnotą, którą wkrótce posiądziesz. W ten czy inny sposób!
	
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 =  1;
	condition	 = 	DIA_Pyrokar_FIRE_Condition;
	information	 = 	DIA_Pyrokar_FIRE_Info;
	permanent	 =  FALSE;
	description	 = 	"Chcę się poddać Próbie Ognia.";
};
func int DIA_Pyrokar_FIRE_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild  == GIL_NOV)
	&&  Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_FIRE_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Poddajcie mnie Próbie Ognia.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //A więc wiesz o... Chcesz przejść Próbę Ognia, tak?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Tak, Prawo Ognia głosi, że...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //Znamy Prawo Ognia! Wiemy też, jak wielu nowicjuszy ginie podczas takiej próby. Lepiej dobrze przemyśl swoją prośbę.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //Podjąłem decyzję. Poddam się tej próbie.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //Jeśli naprawdę tego chcesz, Najwyższa Rada przychyli się do twojej prośby.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Nalegam, by poddano mnie Próbie Ognia.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //Niech więc tak się stanie! Gdy będziesz gotów, każdy członek Najwyższej Rady zleci ci jedno zadanie, które musisz wypełnić.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Niech Innos ulituje się nad twoją duszą.
	
	B_LogEntry (TOPIC_FireContest,"Zażądałem od Pyrokara Próby Ognia. Teraz muszę wypełnić trzy wyznaczone mi przez Najwyższą Radę zadania.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_TEST_Condition;
	information	 = 	DIA_Pyrokar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Mistrzu, jestem gotów poddać się Próbie.";
};
func int DIA_Pyrokar_TEST_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Chcę się zmierzyć się z twoim zadaniem, Mistrzu.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //Innos jeden wie, czy mu podołasz... Poddam cię tej samej próbie, którą przechodzą najlepsi z nowicjuszy.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //Będzie to Próba Magii. Jak zapewne wiesz, test ten może ukończyć pomyślnie tylko JEDEN nowicjusz.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //Rozumiem. Kim są moi rywale?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //W swej niezmierzonej mądrości, Innos wskazał trzech nowicjuszy, którzy wraz z tobą zostaną poddani próbie. Są to Agon, Igaraz i Ulf. Oni już rozpoczęli poszukiwania.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //Ale dość tej rozmowy! Wysłuchaj słów próby: 'Idź za znakami Innosa i przynieś to, co wierzący znajduje za ścieżką'.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Będziesz potrzebował tego klucza.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //To wszystko, co mamy ci do powiedzenia.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar przygotowuje dla mnie Próbę Magii. To ta sama próba, której zostali poddani nowicjusze Ulf, Igaraz i Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Mam podążać za znakami Innosa i przynieść 'to, co wierzący znajdzie za ścieżką'. Oprócz tej wskazówki dostałem również klucz.");
	
	CreateInvItems (self,ItKe_MagicChest,1);
	B_GiveInvItems (self,other,ItKe_MagicChest,1);
	
	//------------Igaraz klar machen------------------- 
	B_StartOtherRoutine (Igaraz,"CONTEST");
	AI_Teleport (Igaraz,"NW_TAVERNE_BIGFARM_05");	
	CreateInvItems (Igaraz, ItKe_MagicChest,1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;
	
	//---------Smalltalk Partner herbeirufen 
	B_StartOtherRoutine (NOV607,"EXCHANGE");
	
	//------------Agon klar machen-------------------
	B_StartOtherRoutine (Agon,"GOLEMDEAD");
	AI_Teleport (Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems (Agon, ItKe_MagicChest,1);		
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	//------------Ulf klar machen-------------------
	B_StartOtherRoutine (Ulf,"SUCHE");
	AI_Teleport (Ulf,"NW_TROLLAREA_PATH_42");	
	CreateInvItems (Ulf, ItKe_MagicChest,1);	
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	//-------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	20;
	condition	 = 	DIA_Pyrokar_RUNNING_Condition;
	information	 = 	DIA_Pyrokar_RUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Pyrokar_RUNNING_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&&  Npc_IsInState (self, ZS_Talk) 
	&& (other.guild  == GIL_NOV)
	&& (Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_RUNNING_Info ()
{
	var int randomizer;
	randomizer = Hlp_Random (3); 
	
	if  (randomizer == 0)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Dopóki próba nie dobiegnie końca, nie mamy ci nic więcej do powiedzenia.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //Na co jeszcze czekasz? Idź i zmierz się ze swoim zadaniem!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Nadszedł czas, by poprzeć wielkie słowa wielkimi czynami. Chyba się ze mną zgodzisz, nowicjuszu?
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SUCCESS_Condition;
	information	 = 	DIA_Pyrokar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Znalazłem ten kamień runiczny.";
};
func int DIA_Pyrokar_SUCCESS_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild  == GIL_NOV)
	&& (!Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	&& (( Npc_HasItems (other,itmi_runeblank) >= 1)
	|| ( Npc_HasItems (other,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SUCCESS_Info ()
{
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //Znalazłem ten kamień runiczny.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //Niesamowite... udało ci się! Poszedłeś za znakami i odnalazłeś ukryty portal...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //...pokonując przy okazji stado potworów, które planowały zjeść mnie na kolację, tak.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //A inni nowicjusze? Co z Agonem? Może wypełnili zadanie przed tobą?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Wszyscy zawiedli. Widać nie było im sądzone przejście tej próby.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Cóż, ogłaszamy zatem, że przeszedłeś test. Runiczny kamień możesz zachować dla siebie.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Prüfung erfolgreich und die anderen noch nicht. 
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Todo_Condition;
	information	 = 	DIA_Pyrokar_Todo_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Pyrokar_Todo_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (other.guild  == GIL_NOV)
	&& ((MIS_RUNE  != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)) 

	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Todo_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Wypełniłeś wyznaczone przeze mnie zadanie.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Ale...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //...musisz jeszcze przejść test Ulthara.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //...musisz jeszcze przejść test Serpentesa.
	};
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	3;
	condition	 = 	DIA_Pyrokar_MAGICAN_Condition;
	information	 = 	DIA_Pyrokar_MAGICAN_Info;
	permanent	 =  FALSE;
	description	 = 	"Czy zostanę teraz przyjęty do gildii magów?";
};

func int DIA_Pyrokar_MAGICAN_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE  		  == LOG_SUCCESS)
	&& (MIS_GOLEM 		  == LOG_SUCCESS)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_MAGICAN_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //Czy zostanę teraz przyjęty do gildii magów?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Gratuluję! Przeszedłeś pomyślnie Próbę Ognia. Od początku byliśmy pewni, że ci się powiedzie.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //Tak, jak teraz jesteśmy pewni, że dasz z siebie wszystko, by stać się GODNYM sługą Innosa.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Jeśli jesteś gotów złożyć Przysięgę Ognia, przyjmiemy cię teraz w nasze szeregi.
	
};
///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	1;
	condition	 = 	DIA_Pyrokar_OATH_Condition;
	information	 = 	DIA_Pyrokar_OATH_Info;
	permanent 	 =  FALSE;
	description	 = 	"Jestem gotów, by wstąpić do Kręgu Ognia.";
};
func int DIA_Pyrokar_OATH_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_OATH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Jestem gotów, by wstąpić do Kręgu Ognia.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Zatem wysłuchaj słów świętej Przysięgi Ognia.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //Czy przysięgasz przed Innosem wszechpotężnym, jego wiernymi sługami i Świętym Płomieniem...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //...że od teraz i na zawsze twoje życie będzie stanowić jedność z Ogniem...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //...póki twe ciało i dusza nie spoczną w jego świętym domu, gdy zgaśnie płomień twego życia?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Przysięgam.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Składając tę przysięgę, zawarłeś pakt ze Świętym Płomieniem.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Noś tę szatę jako symbol tej wieczystej więzi.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//fürs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Teraz, jako członek naszej organizacji, możesz porozmawiać z Lordem Hagenem, dowódcą paladynów.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Chętnie poznamy jego zdanie na temat całej tej sprawy. Jesteś wolny. Możesz się udać do Khorinis.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Wierzymy tylko, że niezwłocznie przyniesiesz nam jego odpowiedź.
};
///////////////////////////////////////////////////////////////////////
//	Info  Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Lernen_Condition;
	information	 = 	DIA_Pyrokar_Lernen_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Czego mogę się teraz nauczyć?";
};
func int DIA_Pyrokar_Lernen_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Lernen_Info ()
{
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Czego mogę się teraz nauczyć?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Przede wszystkim, masz prawo poznać wielką tajemnicę kręgów magii. Dzięki niej będziesz mógł wykorzystywać runy.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //Zgłębiając kolejne z sześciu kręgów magii, będziesz mógł posługiwać się coraz potężniejszymi zaklęciami.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Odpowiednie formuły poznasz od braci z naszego klasztoru. Każdy z nich specjalizuje się w pewnej dziedzinie.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Karras, na przykład, jest mistrzem przywoływania, a Hyglas może cię nauczyć tajników magii ognia.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Mistrzem w dziedzinie magii lodu i grzmotu jest Marduk. Parlan natomiast wprowadzi cię w pierwsze kręgi i pokaże kilka istotnych inkantacji.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Ale każdy z nich nauczy cię tylko magicznych formuł. Stworzeniem odpowiednich run musisz się zająć sam.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"Mistrz Parlan wprowadzi mnie do pierwszego Kręgu Magii.");
	
	B_LogEntry (Topic_KlosterTeacher,"Brat Karras naucza formuł inwokacji i przyzywania.");
	B_LogEntry (Topic_KlosterTeacher,"Brat Hyglas może przybliżyć mi tajemnice ognia.");
	B_LogEntry (Topic_KlosterTeacher,"Brat Marduk może opowiedzieć mi o mocy lodu i pioruna.");
	B_LogEntry (Topic_KlosterTeacher,"Brat Parlan naucza różnych innych formuł.");
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Wunsch_Condition;
	information	 = 	DIA_Pyrokar_Wunsch_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Mam jedno życzenie...";
};
func int DIA_Pyrokar_Wunsch_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Wunsch_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Mam jedno życzenie...
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Po przyjęciu w nasze szeregi każdy mag ma prawo domagać się spełnienia jednego swojego życzenia.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Czego więc sobie życzysz?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Niczego.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Niech Babo zostanie nowym ogrodnikiem klasztoru.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Chcę, by nowicjusz Opolos uzyskał dostęp do biblioteki.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Niech Dyrian pozostanie w klasztorze.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Niczego.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //Niech i tak będzie. Nowoprzyjęty mag rezygnuje ze swojego życzenia!
	
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	
	
};

FUNC VOID DIA_Pyrokar_Wunsch_Dyrian ()
{
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //Pragnę, by nowicjusz Dyrian został w klasztorze.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Niech tak się stanie.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Nowicjusz zostanie w klasztorze. Może objąć posadę ogrodnika, która się właśnie zwolniła.
	
	B_GivePlayerXP (XP_HelpDyrian);
	
	B_StartOtherRoutine (Dyrian,"FAVOUR");
	
	MIS_HelpDyrian = LOG_SUCCESS;
	
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Babo ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //Pragnę, by przyklasztorne ogrody zostały powierzone pieczy nowicjusza Babo.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Niech tak się stanie.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //Od dziś odpowiedzialność za nasze ogrody przejmie nowicjusz Babo.
	
	B_GivePlayerXP (XP_HelpBabo);
	
	B_StartOtherRoutine (Babo,"FAVOUR");
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	MIS_HelpBabo = LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Opolos ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //Chcę, by nowicjusz Opolos uzyskał dostęp do biblioteki.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Niech tak się stanie.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //Od dziś nowicjusz Opolos może bez przeszkód studiować pisma Innosa.
	
	B_GivePlayerXP (XP_HelpOpolos);
	
	B_StartOtherRoutine (Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	
	MIS_HelpOpolos 	= LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};
///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Nachricht_Condition;
	information	 = 	DIA_Pyrokar_Nachricht_Info;
	permanent	 =  FALSE;
	description	 = 	"Przynoszę wieści dla Lorda Hagena...";
};
func int DIA_Pyrokar_Nachricht_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Nachricht_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //Przynoszę wieści od Lorda Hagena. Mam mu dostarczyć dowód na istnienie smoków.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //W tym celu muszę się udać do Górniczej Doliny.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Rozumiem. Musisz oczywiście wypełnić jego polecenie. Paladyn Sergio odprowadzi cię na przełęcz.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Niech Innos ma cię w swojej opiece.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Dlatego od razu udałem się do Górniczej Doliny.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Świetnie. Skoro znasz już drogę, nie będziesz zapewne potrzebował eskorty.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Wypełnij polecenie Lorda Hagena i niech Innos ma cię w swojej opiece.
	};

};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	4;
	condition	 = 	DIA_Pyrokar_TEACH_Condition;
	information	 = 	DIA_Pyrokar_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chcę poznać ostatni krąg magii.";
};
func int DIA_Pyrokar_TEACH_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5) 
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Chcę poznać ostatni krąg magii.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Dużo czasu minęło, odkąd zawarłeś związek ze Świętym Płomieniem. Wiele się od tamtej pory wydarzyło.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Jesteś Wybrańcem Innosa. By wypełnić czekające cię zadanie, będziesz potrzebował całej swojej siły.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Udzielę ci teraz błogosławieństwa. Niniejszym wkraczasz w szósty krąg magii. Obyś zawsze niósł światu światło i rozpraszał mrok.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Jeśli chcesz, mogę cię teraz nauczyć formuł ostatniego kręgu.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Ach, jeszcze coś. Na początku cię nie poznałem...
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //...ale to ja wręczyłem ci list, nim wrzucono cię za Barierę.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Tak, oszczędziłeś mi wtedy nadętej przemowy sędziego.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //A teraz jesteś Wybrańcem Innosa.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //Przyjmij moje błogosławieństwo, Wybrańcze.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innosie, odwieczny Panie światła i ognia, pobłogosław tego człowieka, swego umiłowanego sługę.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Dodaj mu odwagi, siły i mądrości, by mógł pewnie podążać ścieżką, którą dla niego wybrałeś.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Twój czas jeszcze nie nadszedł. Krocz dalej po ścieżce, którą wyznaczył ci Innos, a kiedyś udzielę ci ostatniej lekcji.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SPELLS_Condition;
	information	 = 	DIA_Pyrokar_SPELLS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ucz mnie (tworzenie run)";
};
func int DIA_Pyrokar_SPELLS_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SPELLS_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Podziel się ze mną swoją wiedzą.
	
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
	Info_AddChoice		(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //Nie mogę cię już niczego nauczyć.
	};
};
FUNC VOID DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
};
FUNC VOID DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};
///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_Parlan_Condition;
	information	 = 	DIA_Pyrokar_Parlan_Info;
	permanent	 = 	FALSE;
	description	 = 	"Przysyła mnie Parlan...";
};
func int DIA_Pyrokar_Parlan_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Parlan_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Przysyła mnie Parlan. Chciałbym zwiększyć swoje magiczne zdolności.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Wiele się już nauczyłeś, a twa moc wzrosła. Od tej pory będziesz pobierał nauki bezpośrednio u mnie.
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_TEACH_MANA_Condition;
	information	 = 	DIA_Pyrokar_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chcę zwiększyć moją magiczną moc.";
};
func int DIA_Pyrokar_TEACH_MANA_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo (hero,DIA_Pyrokar_Parlan)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Chcę zwiększyć swoje magiczne zdolności.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Czuję, że potęga magii wypełnia już każdy centymetr twojego ciała. Nawet ja nie jestem w stanie dalej podnieść twoich umiejętności.
	};
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	900;
	condition	 = 	DIA_Pyrokar_PERM_Condition;
	information	 = 	DIA_Pyrokar_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"(Błogosławieństwo)";
};
func int DIA_Pyrokar_PERM_Condition ()
{	
	if (Kapitel >= 2)	
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Pobłogosław mnie, Mistrzu.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //Możesz mnie pobłogosławić? Przydałaby mi się boska pomoc.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Niech twe ostatnie starcie z odwiecznym wrogiem zakończy się twoim zwycięstwem. Idź w łasce Innosa, mój synu.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Niech Innos broni cię od krzywdy i złej przygody na mrocznych ścieżkach, którymi przyszło ci kroczyć.
			};
};

//##############################################################
//##
//##
//##							KAPITEL 3
//##
//##
//##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP3_EXIT_Condition;
	information	= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BACKFROMOW_Condition;
	information	 = 	DIA_Pyrokar_BACKFROMOW_Info;

	description	 = 	"Przybywam z Górniczej Doliny.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //Przybywam z Górniczej Doliny.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //Jakie wieści przynosisz?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //Zebrała się tam potężna armia orków i smoków.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //To już wiemy od Miltena. A co z ładunkiem rudy dla Króla?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //Niestety, ruda, którą wydobyli ludzie Garonda, nie zaspokoi raczej potrzeb królewskiej armii.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Zaiste, w mrocznych czasach przyszło nam żyć, skoro światło Słońca ustępuje dziś miejsca ciemności.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //Zaatakowały mnie tajemnicze postaci w czarnych szatach.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Tak, wiem. To Poszukiwacze - pomiot z otchłani Beliara. Strzeż się ich, bo spróbują zawładnąć twoją duszą.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Jeśli im ulegniesz, przestaniesz być sobą. Tylko w klasztorze znajdziesz wtedy pomoc, więc uważaj na siebie.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar opowiedział mi o Poszukiwaczach, odzianych w czarne szaty wysłannikach Beliara. Ostrzegł mnie, że jeśli któryś z nich mnie opęta, powinienem natychmiast wrócić do klasztoru."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Poprosiłem Karrasa, by przyjrzał się tej sprawie trochę bliżej. Miejmy nadzieję, że dzięki niemu znajdziemy jakieś rozwiązanie tego problemu.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras otrzymał od Pyrokara polecenie zlikwidowania zagrożenia ze strony Poszukiwaczy."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Weź to. Gdybyś potrzebował pomocy, ta runa przeniesie cię prosto do klasztoru.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Pamiętaj: od twojej silnej woli zależą teraz losy nas wszystkich.

};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	31;
	condition	 = 	DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_GIVEINNOSEYE_Info;

	description	 = 	"Przybywam po Oko Innosa.";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //Przybywam po Oko Innosa.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Widzę, że sam Lord Hagen upoważnił cię do zabrania świętego amuletu.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Niestety, muszę cię rozczarować. Padliśmy ofiarą niecnego spisku nieprzyjaciela.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //Oko Innosa zostało wykradzione ze świętych murów klasztoru!

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Kto się poważył na coś takiego, Mistrzu?!", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Kto to zrobił?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //Kto się poważył na coś takiego, Mistrzu?!
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //Kto to zrobił?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Siły zła cechuje niezwykła przebiegłość i skrytość, mój synu. Jego słudzy rzadko działają w świetle dnia.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //A jednak żyjemy w dziwnych czasach. Dziś nieprzyjaciel pokazuje się w biały dzień na ulicach i placach miast.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //Jasny to znak, że nie obawia się swych wrogów i w walce z nimi nie cofnie się przed niczym.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Jeden z naszych oddanych braci, kandydat do zaszczytnego tytułu Arcymaga Ognia, okazał się szpiegiem nieprzyjaciela. Mówię o Pedrze.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //Nieprzyjaciel zawładnął jego duszą i zaatakował z najmniej spodziewanej strony.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro wdarł się do najświętszych komnat klasztoru i wykradł z nich Oko.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Obawiam się, że zbyt długo przebywał sam poza murami klasztoru, pozbawiony naszej pomocy i narażony na kuszenie ze strony Złego.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschuß freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist für den SC nun als Traitor bekannt. Muß hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "Świetnie. Można się było tego spodziewać. Spóźniłem się - te tępaki z klasztoru pozwoliły, aby jakiś nowicjusz skradł im Oko. Pozostaje mi tylko udać się na poszukiwania Pedra i mieć nadzieję, że nie zdążył jeszcze sprzedać swojego łupu.");
 	B_LogEntry (TOPIC_TraitorPedro, "Zdrajca Pedro ukradł z klasztoru Oko Innosa. Założę się, że Magowie Ognia chętnie dostaliby go w swoje ręce.");
};



///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	34;
	
	condition	 = 	DIA_Pyrokar_NOVIZENCHASE_Condition;
	information	 = 	DIA_Pyrokar_NOVIZENCHASE_Info;

	description	 = 	"Udało wam się ustalić, dokąd zbiegł?";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition ()
{
	if (Kapitel == 3)
	   && (Pedro_Traitor == TRUE)	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //Udało wam się ustalić, dokąd zbiegł?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro powalił na ziemię kilku nowicjuszy, którzy próbowali go powstrzymać, po czym zniknął w porannej mgle.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //Wysłaliśmy za nim naszych braci, by za wszelką cenę odzyskali święty amulet.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Jeśli chcesz ich jeszcze dogonić, musisz się pośpieszyć. Wkrótce Pedro znajdzie się poza naszym zasięgiem.

	MIS_NovizenChase = LOG_RUNNING;	
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	35;
	condition	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Info;

	description	 = 	"Znalazłem Oko Innosa.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition ()
{
	if (Kapitel == 3)
		&& 	(MIS_NovizenChase == LOG_RUNNING)
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //Odzyskałem Oko Innosa. Obawiam się, że jest uszkodzone.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Ale... to niemożliwe! Co się stało?!
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Amulet wpadł w ręce plugawych istot. Przybyłem zbyt późno.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //W tych lasach jest pewne niezwykłe miejsce kultu, w kształcie półksiężyca. Nieprzyjaciele odprawiali tam nad nim jakiś tajemniczy rytuał.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Niech Innos ma nas w swojej opiece! Zbezcześcili nasz Słoneczny Krąg!
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //W najgorszych koszmarach nie przypuszczałem, że dysponują aż taką mocą.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Co możemy teraz zrobić?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Co możemy teraz zrobić?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //Nieprzyjaciel stał się niezwykle groźny, a mimo to ten prastary artefakt może jeszcze pokrzyżować jego plany.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Musimy czym prędzej naprawić Oko i przywrócić mu dawną moc. Czas działa na naszą niekorzyść.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Wolę nie myśleć, co się teraz z nami stanie. Bez ochronnej mocy amuletu jesteśmy bezbronni wobec sił ciemności.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Udaj się do miasta i odszukaj tam Maga Wody imieniem Vatras. W tej straszliwej sytuacji tylko on nas jeszcze może ocalić. Zanieś mu Oko. Śpiesz się!


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Dlaczego właśnie Vatras?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Co to za Słoneczny Krąg?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar chce, abym udał się do miasta i spytał Vatrasa, Maga Wody, co zrobić z uszkodzonym Okiem.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Dlaczego właśnie Vatras?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Przynależność do Magów Ognia nie pozwala ci kwestionować moich poleceń, Bracie.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras jest sługą Adanosa. Tylko pradawna mądrość Magów Wody może nam pomóc.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //To wszystko, co musisz wiedzieć.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Co to za Słoneczny Krąg?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Każdego roku wszyscy magowie i nowicjusze z klasztoru udają się tam w czas przesilenia, by uczcić początek nowego cyklu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //Dobroczynna moc Słońca jest w tym miejscu szczególnie silna.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //Nigdy nie przypuszczałem, że można ją wykorzystać do mrocznych celów, a przecież tak się właśnie stało!
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter ()
{
		Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
};


///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information	 = 	DIA_Pyrokar_SPOKETOVATRAS_Info;

	description	 = 	"Rozmawiałem z Vatrasem.";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //Rozmawiałem z Vatrasem.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //To świetnie! Gdzie on jest?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Zamierza odprawić w Słonecznym Kręgu rytuał, który przywróci dawną moc Oku Innosa.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Jeśli to prawda, może jest jeszcze dla nas nadzieja.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras potrzebuje pomocy. Twojej i... Xardasa.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //CO TAKIEGO?! Xardas też tam będzie?! Chyba nie mówisz poważnie.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //To nie był MÓJ pomysł. Vatras nalega, byście przybyli obydwaj.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Xardas! Ciągle ten Xardas. Czy nigdy się od niego nie uwolnię? Gorzej już chyba być nie mogło.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Skąd mam wiedzieć, że Xardas nie stoi po stronie nieprzyjaciela?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Nie zaufam temu nekromancie, niezależnie od tego, jak bardzo jest nam potrzebny.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Przykro mi, ale w tej sytuacji nie mogę pomóc Vatrasowi.
	B_GivePlayerXP (XP_Ambient);


};


///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Info;

	description	 = 	"Ale bez ciebie nie naprawimy amuletu!";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Ale bez ciebie nie naprawimy amuletu! Vatras nie będzie mógł odprawić rytuału!
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Musisz zaufać Xardasowi.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Ja nic nie muszę, zrozumiano? Skąd mam wiedzieć, że Xardas nie zwróci się nagle przeciw nam? Nie, nie zrobię tego.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //A gdybym dostarczył ci jakiś dowód?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //To raczej niemożliwe. Musiałbyś mi przynieść coś naprawdę ważnego.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //Jeśli chodzi o Xardasa, nie dam się tak łatwo przekonać.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar nie chce nawet słyszeć o Xardasie. Muszę porozmawiać z Xardasem, może wspólnie wymyślimy, jak nakłonić Pyrokara do stawienia się na rytuale w Słonecznym Kręgu.");
	
	Pyrokar_DeniesInnosEyeRitual = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BUCHZURUECK_Condition;
	information	 = 	DIA_Pyrokar_BUCHZURUECK_Info;

	description	 = 	"Xardas kazał mi wręczyć ci tę księgę.";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition ()
{
	if (Npc_HasItems (other,ItWr_XardasBookForPyrokar_Mis))
		 && (Kapitel == 3)
		 {
				return TRUE;
		 };
};

func void DIA_Pyrokar_BUCHZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //Xardas kazał mi wręczyć ci tę księgę.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //To dowód jego zaufania.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Pokaż.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //To niesamowite! Czy masz pojęcie, co mi właśnie przekazałeś?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Emmm.... Nie.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //To niezwykle stara księga, która zaginęła całe wieki temu.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Sądziliśmy, że została zniszczona, a teraz dowiaduję się, że była w posiadaniu Xardasa!
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Zatem zgodzisz się uczestniczyć w rytuale?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Tak, udam się do Słonecznego Kręgu... Ale bynajmniej nie dlatego, że uwierzyłem w dobre intencje Xardasa, o nie!
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //Wręcz przeciwnie! Zamierzam wydusić z tego starego szakala, dlaczego tak długo trzymał księgę w ukryciu! Tym razem posunął się zbyt daleko!
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Zobaczymy się przy Słonecznym Kręgu.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar zgodził się pójść do Słonecznego Kręgu.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_PRERITUAL_Condition;
	information	 = 	DIA_Pyrokar_PRERITUAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Myślisz, że uda się wam naprawić Oko?";
};

func int DIA_Pyrokar_PRERITUAL_Condition ()
{
		if (Pyrokar_GoesToRitualInnosEye == TRUE)
			&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
			&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_PRERITUAL_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //Myślisz, że uda się wam naprawić Oko Innosa?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //Trudno powiedzieć. Wkrótce się przekonamy.
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_AUGEGEHEILT_Condition;
	information	 = 	DIA_Pyrokar_AUGEGEHEILT_Info;

	description	 = 	"Udało się wam! Oko Innosa znowu jest całe!";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Pyrokar_AUGEGEHEILT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Udało się wam! Oko Innosa znowu jest całe!
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Aż trudno uwierzyć, że się nam powiodło.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //To prawda, Mistrzu.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Już dawno udowodniłeś, że jesteś godzien, by należeć do najwyższych z Magów Ognia.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //Od dziś jesteś zatem członkiem Rady. Będziesz reprezentował klasztor na zewnątrz. Mianuję cię Arcymagiem Kręgu Ognia.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Noś tę szatę z godnością. Sław w świecie dobre imię klasztoru i pomnażaj jego bogactwa.
		
			CreateInvItem	(hero, ITAR_KDF_H);
			AI_EquipArmor	(hero, ITAR_KDF_H);	
			
			heroGIL_KDF2 = TRUE;
		};	
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_KAP3_READY_Condition;
	information	 = 	DIA_Pyrokar_KAP3_READY_Info;

	description	 = 	"Czy jest jeszcze coś, czym powinienem się zająć?";
};

func int DIA_Pyrokar_KAP3_READY_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_KAP3_READY_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Czy jest jeszcze coś, czym powinienem się zająć?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Nie traćmy czasu na drobiazgi. Rozpraw się raz na zawsze z tymi przeklętymi smokami. Proszę, oto Oko.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Pamiętaj, że nim zaatakujesz smoka, powinieneś z nim porozmawiać.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fügt ihnen auch unerträgliche Schmerzen zu, wenn du es bei dir trägst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Potęga Oka zmusi smoki do rozmowy z tobą i nie pozwoli im skłamać.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Tak długo, jak będziesz je nosił, będzie cię chronił przed smoczymi atakami.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Jego moc nie jest jednak nieskończona i musisz je co jakiś czas napełniać magiczną energią.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //W tym celu połącz na stole alchemicznym Oko Innosa i esencję ze smoczego serca.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Dopiero wtedy możesz stawić czoła kolejnemu gadowi.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Dzięki. Będę o tym pamiętał.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Masz już wszystko, czego potrzebujesz. Ruszaj w drogę. Zostało nam niewiele czasu!

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Jestem gotów stawić czoła smokom. Oko Innosa pozwoli mi odnieść zwycięstwo. Muszę jednak pamiętać, aby założyć je przed każdą bitwą z którymkolwiek ze smoków. Problem polega na tym, że muszę przemówić do każdej z tych bestii zanim je zaatakuję, a kiedy z nimi rozmawiam, Oko Innosa traci swą moc. Zanim stawię czoła kolejnego smokowi, powinienem połączyć kamień z amuletu z wywarem ze smoczego serca, używając do tego celu stołu alchemicznego i menzurki."); 

	MIS_ReadyforChapter4 = TRUE; //Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck (NEWWORLD_ZEN);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	39;
	condition	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Info;

	description	 = 	"Znalazłem pewien tajemniczy almanach.";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))		
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //Znalazłem pewien tajemniczy almanach.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //Tak? Jaki almanach?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Nie jestem pewien. Miałem nadzieję, że ty mi to powiesz.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //To rzeczywiście niepokojąca księga. Mądrze zrobiłeś, przynosząc ją do mnie.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Zakładam, że takich przeklętych ksiąg jest więcej. Musisz koniecznie odnaleźć je wszystkie.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Myślę, że Poszukiwacze czerpią z nich swoją ponurą moc.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Dzięki nim sprawują władzę nad zagubionymi duszami swoich ofiar.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Wygląda na to, że zapisują w nich imiona wszystkich ludzi, których zamierzają opętać.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Słuchaj. Dam ci ten magiczny list. Poznasz z niego imiona ofiar, które zapisano w księgach.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Odszukaj tych nieszczęśników i przynieś mi ich księgi, a ja spróbuję je zniszczyć.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Ale najpierw pokaż przynajmniej jedną z nich Karrasowi. To może pomóc w jego badaniach.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //Tylko pod żadnym pozorem nie próbuj sam niszczyć tych almanachów. Nie jesteś jeszcze gotów, by zmierzyć się z ich potęgą.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar chce unieszkodliwić Almanachy Opętanych. Dał mi listę wszystkich, których Poszukiwacze planują opętać. Niewykluczone, że będzie się ona wydłużać."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Nie zbliżaj się do Poszukiwaczy albo zawładną twoją duszą.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Gdybyś zaczął ulegać ich podszeptom, wróć czym prędzej do mnie.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //Tylko tutaj, w klasztorze, twoja dusza może zostać uratowana.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //Czy nie można jakoś zablokować ich mentalnych ataków?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //Hmmm. To możliwe. Może Karras coś na to poradzi.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"Karass ma mi pomóc w znalezieniu sposobu na odpieranie ataków Poszukiwaczy."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	70;
	condition	 = 	DIA_Pyrokar_SCOBSESSED_Condition;
	information	 = 	DIA_Pyrokar_SCOBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Leczenie z opętania)";
};

func int DIA_Pyrokar_SCOBSESSED_Condition ()
{
	if (SC_IsObsessed == TRUE)
		{
				return TRUE;
		};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info ()
{
	if ((Got_HealObsession_Day<=(Wld_GetDay()-2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems (other,ItPo_HealObsession_MIS) == FALSE)  
		{
			if (hero.guild == GIL_KDF)
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Pomóż mi, Mistrzu. Zło zawładnęło mym umysłem!
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //Weź tę miksturę! Ona uleczy cię z koszmarów.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Niech miłosierdzie Innosa będzie naszym zbawieniem.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Działaj w jego imieniu i strzeż się złego oka nieprzyjaciela.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Ale uważaj! Jeśli zbyt często będziesz wystawiał się na ataki wroga, może nie być dla ciebie ratunku. Pamiętaj o tym!
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Złe siły zawładnęły mym umysłem! Możesz mi pomóc?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //Mogę, jeśli okażesz wystarczającą wdzięczność klasztorowi Innosa. 300 sztuk złota powinno wystarczyć.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "To stanowczo za dużo!", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Dobrze. Oto pieniądze.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Przecież dopiero co dostałeś swoją miksturę! Nie zawracaj mi głowy bez potrzeby!
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Dobrze. Oto pieniądze.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Masz, wypij to. Niech miłosierdzie Innosa będzie twoim zbawieniem.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //Przynieś pieniądze, a ukoję twój ból.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //To stanowczo za dużo!
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Pyrokar_AlmanachBringen_Condition;
	information	 = 	DIA_Pyrokar_AlmanachBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dowiedziałem się czegoś więcej o tych opętanych duszach.";
};

func int DIA_Pyrokar_AlmanachBringen_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN))
		{
				return TRUE;
		};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Dowiedziałem się czegoś więcej o tych opętanych duszach.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Mów, Bracie.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold für einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //Znalazłem kolejny almanach.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //Przynoszę ci kolejne księgi Poszukiwaczy.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Dobrze się spisałeś, ale obawiam się, że to jeszcze nie wszystkie. Szukaj dalej.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Wiele już odnalazłeś, ale obawiam się, że to jeszcze nie wszystkie.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Przyniosłeś mi już bardzo dużo przeklętych ksiąg.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Zdziwiłbym się, gdybyśmy nie mieli już wszystkich.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Przyjmij od klasztoru ten dar. Pomoże ci on, gdy staniesz twarzą w twarz ze złem.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //I zaglądaj co jakiś czas do mojego magicznego listu!
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Wrogowie mogą zaatakować ludzi, których imion jeszcze nie poznaliśmy.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE; 
	};
	AlmanachGeld	= (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems (self, ItMi_Gold, AlmanachGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, AlmanachGeld);
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

INSTANCE DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP4_EXIT_Condition;
	information	= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP4_EXIT_Info()
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

INSTANCE DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP5_EXIT_Condition;
	information	= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DRACHENTOT_Condition;
	information	 = 	DIA_Pyrokar_DRACHENTOT_Info;

	description	 = 	"Wszystkie smoki nie żyją.";
};

func int DIA_Pyrokar_DRACHENTOT_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //Wszystkie smoki zostały pokonane.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //To dobra wiadomość, ale nasze położenie nadal jest beznadziejne.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Poszukiwacze nie zginęli wraz ze smokami. Wręcz przeciwnie - słyszę, że w ciągu ostatnich dni ich liczba jeszcze się zwiększyła.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Zabicie smoków z pewnością osłabiło przeciwnika, ale to wciąż za mało. Musimy uderzyć w samo serce Zła.

};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DERMEISTER_Condition;
	information	 = 	DIA_Pyrokar_DERMEISTER_Info;

	description	 = 	"Rozmawiałem ze smokami.";
};

func int DIA_Pyrokar_DERMEISTER_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //Rozmawiałem ze smokami.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //I czego się od nich dowiedziałeś?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //Mówiły o potędze swojego pana, który ma mieszkać w Dworze Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Niech Innos ma nas w swojej opiece! A więc Czarna Świątynia odzyskała swą dawną potęgę i wysyła do naszego świata swoje sługi!

};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_WASISTIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_WASISTIRDORATH_Info;

	description	 = 	"Co do za Dwór Irdorath?";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //Co do za Dwór Irdorath?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //To wschodnia świątynia boga Beliara. W królestwie Myrtany były takie cztery. Ale ta jest z nich wszystkich najbardziej przerażająca.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Jakieś 40 lat temu, północna i zachodnia świątynia zostały zniszczone.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Mężni rycerze biorący udział w tym przedsięwzięciu dopilnowali, by nie pozostał z nich kamień na kamieniu.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //Wtedy hordy nieprzyjaciela nie miały żadnych szans w starciu z zastępami bohaterskich wojowników i paladynów.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Zniszczenie pozostałych dwóch miejsc sekty wydawało się tylko kwestią czasu. Zło mogło wreszcie ponieść ostateczną klęskę...
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //...ale gdy upadła druga świątynia, pozostałe po prostu zniknęły!
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //Zniknęły? Całe świątynie, tak? Jaaasne.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Nie drwij ze mnie! Sytuacja jest poważna. Jeśli Dwór Irdorath odzyskał swoją dawną potęgę, pokonanie nieprzyjaciela nie będzie takie proste.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Najpierw trzeba go bowiem odnaleźć. Będzie to twoje następne - i najtrudniejsze jak dotąd - zadanie.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Zrobię, co w mojej mocy.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Według Pyrokara Dwór Irdorath to zaginiona świątynia Beliara. Muszę ją odnaleźć."); 

};


///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	54;
	condition	 = 	DIA_Pyrokar_BUCHIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_BUCHIRDORATH_Info;

	description	 = 	"Co się stało z tą 'zaginioną' księgą Xardasa?";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (ItWr_HallsofIrdorathIsOpen  == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //Co się stało z tą 'zaginioną' księgą Xardasa?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Spodziewałem się, że o nią zapytasz, ale niewielki będziesz miał z niej pożytek.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Księgę zamknięto magiczną pieczęcią. Zabrałem ją do naszych pracowni, ale mimo wielu prób nie udało się nam jej otworzyć.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Ten przeklęty Xardas znowu z nas zadrwił.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //Mogę zobaczyć tę księgę?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Naturalnie. Śmiem jednak wątpić, by powiodło ci się tam, gdzie zawiedli najznamienitsi mistrzowie tego klasztoru.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Ale proszę, próbuj śmiało. Talamon nie będzie cię powstrzymywał.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Księga Xardasa pt. 'DWÓR IRDORATH' znajduje się w klasztornej krypcie. Strzeże jej Talamon. Magowie nie mogli jej otworzyć - ponoć została zamknięta przez Xardasa magiczną pieczęcią."); 
	
	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Info;

	description	 = 	"Udało mi się otworzyć księgę Xardasa.";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition ()
{
	if (ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //Udało mi się otworzyć księgę Xardasa.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Co takiego?! Jak tego dokonałeś? Bo ja, prawdę mówiąc, straciłem już nadzieję.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas powiedział mi, jak to zrobić.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Pewnie miałem szczęście, to wszystko.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Pewnie miałem szczęście, to wszystko.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Nie opowiadaj bzdur! Jakie tam szczęście.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Nawet ja nie byłem w stanie złamać tej przeklętej pieczęci! Aż tu nagle pojawia się ktoś taki jak ty i...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //...daje mi dużo do myślenia.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //W każdym razie, jako że to ty otworzyłeś księgę, pozwolę ci ją stąd zabrać. Przynajmniej dopóki cała ta sprawa nie znajdzie rozwiązania.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas powiedział mi, jak to zrobić.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Ach, więc to tak! Bardzo ciekawe. Mam tylko nadzieję, że wpływ Xardasa na ciebie nie okaże się zgubny w skutkach!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Ostrzegam cię! Nie daj się złapać na sztuczki tego starego diabła. Kiedyś możesz tego pożałować.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;

	description	 = 	"Ta księga wspomina o tajemnej bibliotece.";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition ()
{
	if 	(ItWr_SCReadsHallsofIrdorath == TRUE)
		&& (Kapitel == 5)	
		&& (MIS_SCKnowsWayToIrdorath == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
			{
					return TRUE;
			};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //Ta księga wspomina o tajemnej bibliotece.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //Nie wiem, o czym mówisz...
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //Mówię o bibliotece ukrytej pod tymi murami. Brzmi znajomo?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //Nie. Gdzie niby miałaby się znajdować ta 'tajemna biblioteka'?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Rozumiem. A więc nigdy o niej nie słyszałeś. Hmmm...
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar nic nie wie na temat sekretnej biblioteki. Wygląda na to, że dostęp do niej ma tylko Xardas."); 

};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;

	description	 = 	"Wiem już, gdzie szukać Dworu Irdorath.";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //Wiem już, gdzie szukać Dworu Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Świątynia leży na wyspie. Znalazłem mapę morską, która pokazuje jej położenie.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //To wspaniale. Zatem by wypełnić zadanie, potrzebujesz teraz statku i załogi.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Pamiętaj tylko, że do walki z Władcą Irdorath musisz się odpowiednio przygotować.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //Skąd wezmę odpowiednią załogę?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Twoja załoga musi składać się z ludzi, którym możesz bezgranicznie zaufać.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Porozmawiaj ze swoimi przyjaciółmi i zastanów się, którzy z nich mogliby ci pomóc na wyspie.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Przyda ci się też jakiś mag, ale niestety nie mogę w tej chwili poświęcić żadnego z braci.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Musisz poszukać jakiegoś maga poza murami klasztoru.

};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_SCWILLJORGEN_Condition;
	information	 = 	DIA_Pyrokar_SCWILLJORGEN_Info;

	description	 = 	"Jorgen jest doświadczonym żeglarzem.";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&(Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen jest doświadczonym żeglarzem. Mógłby mi pomóc dostać się na wyspę.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Obawiam się, że to nie takie proste.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Jest teraz członkiem naszego bractwa. Nie zapłacił jednak ani grosza ani nie przyprowadził nam owcy.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen musi najpierw odpracować swój dług. Potem możesz go ze sobą zabrać.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Jak długo to może potrwać?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Ten człowiek w ciągu jednego dnia pochłonął jadło, które zwykłemu nowicjuszowi starczyłoby na tydzień.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Nie puszczę go, póki nie odpracuje w naszych ogrodach przynajmniej trzech miesięcy.

};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_MACHDTFREI_Condition;
	information	 = 	DIA_Pyrokar_MACHDTFREI_Info;

	description	 = 	"To co mam zrobić, jeśli nie chcesz go zwolnić? Czekać trzy miesiące?";
};

func int DIA_Pyrokar_MACHDTFREI_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_MACHDTFREI_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //To co mam zrobić, jeśli nie chcesz go zwolnić? Czekać trzy miesiące?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Hmmm. W rzeczy samej, jest coś, co mógłbyś dla mnie zrobić. Twoja przyjaźń z Xardasem może się okazać przydatna.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //Doszły mnie słuchy, że od kilku dni wokół wieży nekromanty dzieją się tajemnicze rzeczy.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Mieszkańcy miasta widują w nocy dziwne światła. Słyszą też straszliwe wrzaski, dobiegające z tamtego kierunku.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Jakbyśmy i bez tego nie mieli dość kłopotów! Chcę, żebyś się tam udał i zajął się tą sprawą.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Potem będziesz mógł zabrać stąd Jorgena.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"W wieży Xardasa dzieją się dziwne rzeczy. Jorgen pomoże mi w rozwikłaniu tej tajemnicy.");
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_DTCLEARED_Condition;
	information	 = 	DIA_Pyrokar_DTCLEARED_Info;

	description	 = 	"Sprawa wieży Xardasa została rozwiązana.";
};

func int DIA_Pyrokar_DTCLEARED_Condition ()
{
	if (Npc_IsDead(Xardas_DT_Demon1)) 
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_DTCLEARED_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //Sprawa wieży Xardasa została rozwiązana.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //I co się tam działo?.. Nie, czekaj. Nawet nie chcę wiedzieć.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Jeśli nadal zależy ci na pomocy Jorgena, możesz go ze sobą zabrać.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Niech Innos ma cię w swojej opiece.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

//---------------------------------
var int Pyro_Gives_Aura;
//---------------------------------
instance DIA_Pyrokar_AmulettofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_AmulettofDeath_Condition;
	information	 = 	DIA_Pyrokar_AmulettofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Przepowiednia wspomina o świętej Aurze Innosa.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition ()
{
	if (PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //Przepowiednia wspomina o świętej Aurze Innosa.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //Aura Innosa to amulet, który mogą nosić tylko najpotężniejsi z magów.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Mogę go otrzymać?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Co to za amulet?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //Mogę go otrzymać?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //A co zamierzasz z nim uczynić?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Wykorzystać do walki ze smokiem.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Dobrze, dostaniesz ten amulet, ale obchodź się z nim ostrożnie.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Możesz być o to spokojny.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Nie chciałbym go później odkupywać od jakiegoś handlarza.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Używaj go z rozsądkiem. Niech Innos zawsze ma cię w swojej pieczy.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //Co to za amulet?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //Ponoć został wykuty przez samego Innosa, który dał go ludzkości w prezencie.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Jego właściciel jest nieczuły na wszelkie rany.
};


///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_PotionofDeath_Condition;
	information	 = 	DIA_Pyrokar_PotionofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Opowiedz mi o łzach Innosa.";
};

func int DIA_Pyrokar_PotionofDeath_Condition ()
{
	if (Npc_HasItems (other,ItPo_PotionOfDeath_01_MIS))
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info ()
{
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //Opowiedz mi o Łzach Innosa.
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Łzy Innosa to tylko stara bajka dla dzieci. Opowiada o walce, którą Innos stoczył z Beliarem na początku świata.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Rozumiem.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Znalazłem tę miksturę.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Ach tak?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //Zaczynam wątpić, czy w pełni zdajesz sobie sprawę z powagi sytuacji. Nie pokonasz nieprzyjaciela historyjką dla dzieci.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //Znalazłem tę miksturę.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //To niemożliwe! Nie wierzę!
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //Coś nie tak?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Jeśli to są w istocie Łzy Innosa, to...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //Śmiem wątpić.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //Nie przerywaj mi! Jeśli to są prawdziwe Łzy Innosa, dostaliśmy do ręki niezwykle potężną broń przeciw nieprzyjacielowi.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Więc czym są tak naprawdę te łzy Innosa?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Co masz na myśli, mówiąc 'broń'?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //Więc czym są tak naprawdę te Łzy Innosa?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Gdy Innos zrozumiał, że w obronie swojego dzieła przyjdzie mu stoczyć walkę z własnym bratem, bardzo się zasmucił.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Zaczął łkać, a jego łzy spadły do naszego świata. Było ich wiele, gdyż miłosierny bóg płakał przez całe 13 lat.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Przejdźmy do rzeczy.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Ludzie, którzy znaleźli jego łzy i skosztowali ich, zyskali nadnaturalną siłę i jasność umysłu. Ujrzeli dzieło Innosa w pełnej krasie i zaczęli mu służyć.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Byli to więc pierwsi członkowie Bractwa Ognia. Łzy dały im siłę, odwagę i mądrość. Ale to było bardzo dawno temu, a odkąd po raz ostatni widziano Łzy, minęło z górą 250 lat.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Jak to 'broń'?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //Legenda głosi, że dzięki Łzom wojownicy Innosa mogli dokonywać nadludzkich wręcz czynów.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Zdawali się niewrażliwi na zmęczenie i mieli siłę dwóch niedźwiedzi.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Najwspanialszych czynów dawnych dni dokonywano właśnie dzięki Łzom.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Rozumiem.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Ale Łzy Innosa mogą też nieść cierpienie i śmierć. Tylko członkowie naszego zakonu mogą ich skosztować.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Inni ludzie, nawet paladyni w służbie naszego pana, zginęliby w okrutnych męczarniach.

	Npc_RemoveInvItems 	(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems 		(hero,ItPo_PotionOfDeath_02_Mis,1);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc		= KDF_500_Pyrokar;
	nr		= 999;
	condition	= DIA_Pyrokar_KAP6_EXIT_Condition;
	information	= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pyrokar_PICKPOCKET (C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 900;
	condition	= DIA_Pyrokar_PICKPOCKET_Condition;
	information	= DIA_Pyrokar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen (108, 550);
};
 
FUNC VOID DIA_Pyrokar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK 		,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
	
func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};















































































































































