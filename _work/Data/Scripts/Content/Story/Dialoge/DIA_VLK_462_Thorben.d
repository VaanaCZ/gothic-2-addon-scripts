// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Zamordowa�e� moj� Gritt�! Nigdy ci tego nie wybacz�! Precz, morderco!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //Ach, nowa twarz! Nie jeste� z Khorinis, prawda?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //Czasy nie s� dobre dla podr�nik�w. Wsz�dzie bandyci, nie ma pracy, a teraz jeszcze ch�opi si� buntuj�.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //Jakie wiatry ci� tu przywia�y?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "Szukam pracy.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //Szukam pracy.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //Wiesz cokolwiek na temat stolarki?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //Jedyne co potrafi� zrobi� z drewnem, to rozpali� ogie�.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //A wiesz co� o �lusarce?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //No c�...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Wybacz, ale nie b�d� mia� z ciebie po�ytku, je�li nic nie wiesz o moim rzemio�le.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //I nie mam pieni�dzy, �eby zap�aci� czeladnikowi.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben nie chce mnie na czeladnika.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "A co je�li chcia�bym zosta� czeladnikiem u jednego z pozosta�ych mistrz�w?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //A co je�li chcia�bym zosta� czeladnikiem u jednego z pozosta�ych mistrz�w?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //Dobrze, dam ci moj� zgod�.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Ale najpierw postaraj si� otrzyma� b�ogos�awie�stwo bog�w.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Powiedz, czy jeste� cz�owiekiem wierz�cym?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "C�, je�li o to chodzi, to modl� si� regularnie...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Tak, jestem pokornym s�ug�, Mistrzu Thorbenie.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Potem id� do Vatrasa, kap�ana Adanosa i popro� go o b�ogos�awie�stwo.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //On ci powie, gdzie znajdziesz kap�ana Innosa. On te� niech ci� pob�ogos�awi.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Kiedy ju� otrzymasz b�ogos�awie�stwo bog�w, zag�osuj� na ciebie.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben udzieli mi swojego poparcia, je�li otrzymam b�ogos�awie�stwo od kap�ana Adanosa i od kap�ana Innosa.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Tak, jestem pokornym s�ug�, Mistrzu Thorbenie.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //C�, je�li o to chodzi, to modl� si� regularnie...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //Rozumiem!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //Cz�owiek, kt�ry nie szczyci si� b�ogos�awie�stwem bog�w, nigdy nie otrzyma mojej zgody.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Popro� bog�w o wybaczenie za twe wykroczenia.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "Co z twoj� zgod� Mistrzu?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //Co z twoj� zgod� Mistrzu?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Czy Vatras da� ci swoje b�ogos�awie�stwo?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Tak.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //A czy otrzyma�e� r�wnie� b�ogos�awie�stwo od kap�ana Innosa?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Tak.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //Wi�c otrzymasz tak�e moje b�ogos�awie�stwo. Niezale�nie od wybranej �cie�ki b�d� dumny z dobrze wykonywanej pracy, ch�opcze!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Thorben mo�e mi pom�c zosta� czeladnikiem u jednego z mistrz�w.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //Nie. Jeszcze nie...
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Znasz moje warunki. Powiniene� pracowa� jedynie wtedy, gdy masz b�ogos�awie�stwo bog�w.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Jeszcze nie...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //Wi�c nie rozumiem, czemu znowu mi przeszkadzasz. Znasz moje warunki.
	};
};

// ************************************************************
// 		Was wei�t du �ber Schl�sser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "A wi�c wiesz sporo o �lusarstwie?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //A wi�c wiesz sporo o �lusarstwie?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //Czym�e by�aby pi�kna skrzynia bez dobrego zamka?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Sam wyrabiam zamki. Dzi�ki temu mog� mie� pewno��, �e nie na darmo zrobi�em mocne skrzynie.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //�le wykonany zamek mo�na z �atwo�ci� zniszczy�. A w Khorinis jest mn�stwo z�odziei. Szczeg�lnie ostatnio!
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "Mam tutaj ksi�g� rachunkow� Lehmara...";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //Mam tutaj ksi�g� rachunkow� Lehmara...
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //Sk�d j� masz?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Powinno ci� raczej interesowa� to, �e jest w niej twoje imi�.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Daj mi j�!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //A co dostan� w zamian?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //Nie mam �adnych pieni�dzy i nie mog� ofiarowa� ci nic wi�cej ni� moj� najszczersz� wdzi�czno��.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schl�sser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "Mo�esz mnie nauczy�, jak otwiera� zamki?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //Mo�esz mnie nauczy�, jak otwiera� zamki?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Gdyby nie ty, do ko�ca �ycia sp�aca�bym Lehmara.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //Naucz� ci� tego, co chcesz wiedzie�.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //Przynios�e� mi 100 sztuk z�ota. To dobry uczynek z twojej strony.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //Jest mi bardzo g�upio, ale musz� poprosi� ci� o wi�cej.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Je�li szybko nie sp�ac� swego d�ugu u Lehmara, na�le na mnie swoich zbir�w.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Daj mi jeszcze 100 sztuk z�ota, a b�d� ci� uczy�.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Ile sobie liczysz?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrze, oto 100 sztuk z�ota.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Sp�aci�e� d�ug Gritty u Mattea. Wygl�da na to, �e porz�dny z ciebie cz�owiek. Naucz� ci� tego, co chcesz wiedzie�.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //Jednak nie mog� zrobi� tego za darmo. Jestem zad�u�ony po uszy i potrzebne mi s� pieni�dze.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //Ile sobie liczysz?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 sztuk z�ota.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Mo�e p�niej...", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrze. Oto 200 sztuk z�ota.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Hmmm... Nie wiem, czy mo�na ci zaufa�.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Kto wie, mo�esz by� jednym z tych darmozjad�w, kt�rzy przychodz� do miasta tylko po to, �eby opr�nia� skrzynie uczciwych obywateli.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //Nie naucz� ci� niczego, dop�ki nie przekonasz mnie, �e jeste� uczciwym cz�owiekiem.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Dobrze. Oto 200 sztuk z�ota.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Te pieni�dze naprawd� mi pomog�. Mo�emy zacz��, gdy tylko b�dziesz got�w.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Wci�� nie masz 200 sztuk z�ota. A ja potrzebuj� tych pieni�dzy.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Dobrze, oto 100 sztuk z�ota.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //W takim wypadku mo�emy zacz��, kiedy tylko b�dziesz got�w.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Hej, ci�gle troch� brakuje do 100.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Mo�e p�niej...

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schl�sser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("Naucz mnie otwiera� zamki!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Naucz mnie otwiera� zamki!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Potrzebny jest ci jedynie wytrych. Je�li b�dziesz porusza� nim w zamku ostro�nie w prawo i w lewo, mo�esz odblokowa� mechanizm.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Ale je�li przesuniesz go za daleko lub za szybko w z�ym kierunku, to od razu si� z�amie.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //Im wi�cej masz do�wiadczenia, tym mniej wytrych�w b�dziesz potrzebowa�. To w�a�ciwie wszystko.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "Mo�esz mi sprzeda� par� wytrych�w?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //Mo�esz mi sprzeda� par� wytrych�w?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //Je�li jakie� mi zosta�y...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //No dobrze. Ale nie na wiele ci si� przydadz�, je�li nie wiesz, jak z nich korzysta�.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Stolarz Thorben sprzedaje wytrychy."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"Mia�e� kiedy� czeladnika?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //Mia�e� kiedy� czeladnika?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Owszem - i to ca�kiem niedawno.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //Co si� sta�o?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Nazywa si� Elvrich i jest moim siostrze�cem.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //Dobrze pracowa�, ale nagle przesta� si� pojawia�.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Znikn�� Elvrich, czeladnik stolarza Thorbena."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Stra� zosta�a o tym powiadomiona?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Jak dawno go ju� nie widzia�e�?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Gdzie on jest teraz?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //Jak dawno ju� go nie widzia�e�?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Pewnie ze dwa tygodnie...
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //Gdzie on jest teraz?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //A sk�d ja mam wiedzie�? Ca�y czas kr�ci� si� przy tym plugawym burdelu w porcie.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //Nie zdziwi�bym si�, gdyby w tej chwili zabawia� si� tam z jedn� z panienek.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //Stra� zosta�a o tym powiadomiona?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Jasne. Mieli go z�apa� i zadba�, �eby ruszy� ty�ek i zacz�� znowu pojawia� si� w pracy. Ju� tego �a�uj�...
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //A zreszt� - niech robi, co chce. Wcze�niej czy p�niej zorientuje si�, �e w Khorinis bez uczciwego zaj�cia trudno o cokolwiek.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //Czy�by...
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"Elvrich wr�ci i b�dzie zn�w dla ciebie pracowa�.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Elvrich wr�ci� i b�dzie zn�w dla ciebie pracowa�.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //Mam tylko nadziej�, �e nie ucieknie znowu, gdy tylko pojawi si� nast�pna kusa sp�dniczka...
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Przyjmij to z�oto - to dzi�ki tobie odzyska�em czeladnika.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "Co wiesz o paladynach?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //Co wiesz o paladynach?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //Niewiele. Przybyli z kontynentu na statku dwa tygodnie temu.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Od tego czasu przebywaj� w g�rnym mie�cie.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Nikt dok�adnie nie wie, dlaczego tu przybyli.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Wielu l�ka si� ataku ze strony ork�w.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Wydaje mi si� jednak, �e przybyli, aby st�umi� powstanie farmer�w.
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Wiesz co� o tym ch�opskim buncie?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //Co wiesz o tym ch�opskim buncie?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Chodz� pog�oski, �e ziemianin Onar wynaj�� najemnik�w, aby chronili go przed wojskami Kr�la.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Mia� ju� pewnie do�� oddawania swoich plon�w i trzody paladynom i stra�y miejskiej.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Skutkiem tego w mie�cie rosn� ceny �ywno�ci.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //Gospodarstwo Onara le�y na wsch�d st�d. Nie wiemy, czy tocz� si� tam jakie� walki.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Je�li chcesz wiedzie� wi�cej, porozmawiaj z kupcami na targowisku. Podr�uj� po wyspie wi�cej ode mnie.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "Przyszed�em w sprawie Gritty...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //Przyszed�em w sprawie Gritty...
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //Mojej siostrzenicy? A jak� masz do niej spraw�? Chyba nie chodzi o pieni�dze?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Kupiec Matteo twierdzi, �e jest mu winna 100 sztuk z�ota.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Powiedz, �e to nieprawda. Od kiedy si� do mnie wprowadzi�a, mam same k�opoty!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //Jest zad�u�ona praktycznie u ka�dego kupca w mie�cie.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //Musia�em po�yczy� 200 sztuk z�ota od lichwiarza Lehmara, �eby sp�aci� jej d�ugi! A teraz jeszcze to!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta powinna by� w domu.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //No id�, zapytaj j�. Ale mog� powiedzie� ci jedno - nie ma z�amanego grosza przy duszy.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //Zobaczymy...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "Twoja siostrzenica mia�a 100 sztuk z�ota.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Twoja siostrzenica mia�a 100 sztuk z�ota.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //CO! A to bezwstydna, ma�a �mija - to by�o MOJE z�oto! Zabra�a je z mojej skrzyni.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Oddaj mi je! Musz� najpierw sp�aci� Lehmara. Matteo mo�e dosta� pieni�dze p�niej.

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Matteo dosta� ju� pieni�dze ode mnie!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Nie. Matteo dostanie ode mnie swoje pieni�dze.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Oto twoje z�oto.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //Z tego co wiem o tej ma�ej �mii, to pobiegnie prosto do stra�y miejskiej i oskar�y ci�.
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Dopilnuj�, �eby ta sprawa zosta�a za�atwiona.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //Matteo dosta� ju� pieni�dze ode mnie!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //A niech to! C�, d�ug to d�ug. Przynajmniej nie zatrzyma�e� pieni�dzy dla siebie. Chyba powinienem ci za to podzi�kowa�.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //Nie. Matteo dostanie ode mnie swoje pieni�dze.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //�ci�gasz na mnie spore k�opoty. Lehmar nie jest zbytnio wielkoduszny, je�li chodzi o d�ugi.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Ale przynajmniej chcesz sp�aci� d�ugi mojej siostrzenicy. Chyba powinienem ci za to podzi�kowa�.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Oto twoje z�oto.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //Dzi�kuj�! Teraz mam przynajmniej cz�� pieni�dzy, kt�re jestem winien Lehmarowi.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //Nie mog� wprost uwierzy�, �e o�mieli�a si� zabra� moje z�oto!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















