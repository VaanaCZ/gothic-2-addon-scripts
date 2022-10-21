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
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Zamordowa³eœ moj¹ Grittê! Nigdy ci tego nie wybaczê! Precz, morderco!
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
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //Ach, nowa twarz! Nie jesteœ z Khorinis, prawda?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //Czasy nie s¹ dobre dla podró¿ników. Wszêdzie bandyci, nie ma pracy, a teraz jeszcze ch³opi siê buntuj¹.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //Jakie wiatry ciê tu przywia³y?
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
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //Jedyne co potrafiê zrobiæ z drewnem, to rozpaliæ ogieñ.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //A wiesz coœ o œlusarce?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //No có¿...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Wybacz, ale nie bêdê mia³ z ciebie po¿ytku, jeœli nic nie wiesz o moim rzemioœle.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //I nie mam pieniêdzy, ¿eby zap³aciæ czeladnikowi.
	
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
	description = "A co jeœli chcia³bym zostaæ czeladnikiem u jednego z pozosta³ych mistrzów?";
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
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //A co jeœli chcia³bym zostaæ czeladnikiem u jednego z pozosta³ych mistrzów?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //Dobrze, dam ci moj¹ zgodê.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Ale najpierw postaraj siê otrzymaæ b³ogos³awieñstwo bogów.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Powiedz, czy jesteœ cz³owiekiem wierz¹cym?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "Có¿, jeœli o to chodzi, to modlê siê regularnie...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Tak, jestem pokornym s³ug¹, Mistrzu Thorbenie.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Potem idŸ do Vatrasa, kap³ana Adanosa i poproœ go o b³ogos³awieñstwo.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //On ci powie, gdzie znajdziesz kap³ana Innosa. On te¿ niech ciê pob³ogos³awi.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Kiedy ju¿ otrzymasz b³ogos³awieñstwo bogów, zag³osujê na ciebie.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben udzieli mi swojego poparcia, jeœli otrzymam b³ogos³awieñstwo od kap³ana Adanosa i od kap³ana Innosa.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Tak, jestem pokornym s³ug¹, Mistrzu Thorbenie.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //Có¿, jeœli o to chodzi, to modlê siê regularnie...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //Rozumiem!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //Cz³owiek, który nie szczyci siê b³ogos³awieñstwem bogów, nigdy nie otrzyma mojej zgody.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Poproœ bogów o wybaczenie za twe wykroczenia.
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
	description = "Co z twoj¹ zgod¹ Mistrzu?";
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
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //Co z twoj¹ zgod¹ Mistrzu?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Czy Vatras da³ ci swoje b³ogos³awieñstwo?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Tak.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //A czy otrzyma³eœ równie¿ b³ogos³awieñstwo od kap³ana Innosa?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Tak.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //Wiêc otrzymasz tak¿e moje b³ogos³awieñstwo. Niezale¿nie od wybranej œcie¿ki b¹dŸ dumny z dobrze wykonywanej pracy, ch³opcze!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Thorben mo¿e mi pomóc zostaæ czeladnikiem u jednego z mistrzów.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //Nie. Jeszcze nie...
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Znasz moje warunki. Powinieneœ pracowaæ jedynie wtedy, gdy masz b³ogos³awieñstwo bogów.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Jeszcze nie...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //Wiêc nie rozumiem, czemu znowu mi przeszkadzasz. Znasz moje warunki.
	};
};

// ************************************************************
// 		Was weißt du über Schlösser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "A wiêc wiesz sporo o œlusarstwie?";
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
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //A wiêc wiesz sporo o œlusarstwie?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //Czym¿e by³aby piêkna skrzynia bez dobrego zamka?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Sam wyrabiam zamki. Dziêki temu mogê mieæ pewnoœæ, ¿e nie na darmo zrobi³em mocne skrzynie.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //le wykonany zamek mo¿na z ³atwoœci¹ zniszczyæ. A w Khorinis jest mnóstwo z³odziei. Szczególnie ostatnio!
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
	description = "Mam tutaj ksiêgê rachunkow¹ Lehmara...";
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
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //Mam tutaj ksiêgê rachunkow¹ Lehmara...
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //Sk¹d j¹ masz?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Powinno ciê raczej interesowaæ to, ¿e jest w niej twoje imiê.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Daj mi j¹!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //A co dostanê w zamian?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //Nie mam ¿adnych pieniêdzy i nie mogê ofiarowaæ ci nic wiêcej ni¿ moj¹ najszczersz¹ wdziêcznoœæ.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schlösser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "Mo¿esz mnie nauczyæ, jak otwieraæ zamki?";
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
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //Mo¿esz mnie nauczyæ, jak otwieraæ zamki?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Gdyby nie ty, do koñca ¿ycia sp³aca³bym Lehmara.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //Nauczê ciê tego, co chcesz wiedzieæ.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //Przynios³eœ mi 100 sztuk z³ota. To dobry uczynek z twojej strony.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //Jest mi bardzo g³upio, ale muszê poprosiæ ciê o wiêcej.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Jeœli szybko nie sp³acê swego d³ugu u Lehmara, naœle na mnie swoich zbirów.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Daj mi jeszcze 100 sztuk z³ota, a bêdê ciê uczy³.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Ile sobie liczysz?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrze, oto 100 sztuk z³ota.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Sp³aci³eœ d³ug Gritty u Mattea. Wygl¹da na to, ¿e porz¹dny z ciebie cz³owiek. Nauczê ciê tego, co chcesz wiedzieæ.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //Jednak nie mogê zrobiæ tego za darmo. Jestem zad³u¿ony po uszy i potrzebne mi s¹ pieni¹dze.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //Ile sobie liczysz?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 sztuk z³ota.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Mo¿e póŸniej...", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrze. Oto 200 sztuk z³ota.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Hmmm... Nie wiem, czy mo¿na ci zaufaæ.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Kto wie, mo¿esz byæ jednym z tych darmozjadów, którzy przychodz¹ do miasta tylko po to, ¿eby opró¿niaæ skrzynie uczciwych obywateli.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //Nie nauczê ciê niczego, dopóki nie przekonasz mnie, ¿e jesteœ uczciwym cz³owiekiem.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Dobrze. Oto 200 sztuk z³ota.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Te pieni¹dze naprawdê mi pomog¹. Mo¿emy zacz¹æ, gdy tylko bêdziesz gotów.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Wci¹¿ nie masz 200 sztuk z³ota. A ja potrzebujê tych pieniêdzy.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Dobrze, oto 100 sztuk z³ota.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //W takim wypadku mo¿emy zacz¹æ, kiedy tylko bêdziesz gotów.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Hej, ci¹gle trochê brakuje do 100.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Mo¿e póŸniej...

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schlösser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("Naucz mnie otwieraæ zamki!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
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
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Naucz mnie otwieraæ zamki!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Potrzebny jest ci jedynie wytrych. Jeœli bêdziesz porusza³ nim w zamku ostro¿nie w prawo i w lewo, mo¿esz odblokowaæ mechanizm.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Ale jeœli przesuniesz go za daleko lub za szybko w z³ym kierunku, to od razu siê z³amie.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //Im wiêcej masz doœwiadczenia, tym mniej wytrychów bêdziesz potrzebowaæ. To w³aœciwie wszystko.
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
	description = "Mo¿esz mi sprzedaæ parê wytrychów?";
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
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //Mo¿esz mi sprzedaæ parê wytrychów?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //Jeœli jakieœ mi zosta³y...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //No dobrze. Ale nie na wiele ci siê przydadz¹, jeœli nie wiesz, jak z nich korzystaæ.
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

	description	 = 	"Mia³eœ kiedyœ czeladnika?";
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
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //Mia³eœ kiedyœ czeladnika?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Owszem - i to ca³kiem niedawno.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //Co siê sta³o?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Nazywa siê Elvrich i jest moim siostrzeñcem.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //Dobrze pracowa³, ale nagle przesta³ siê pojawiaæ.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Znikn¹³ Elvrich, czeladnik stolarza Thorbena."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Stra¿ zosta³a o tym powiadomiona?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Jak dawno go ju¿ nie widzia³eœ?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Gdzie on jest teraz?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //Jak dawno ju¿ go nie widzia³eœ?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Pewnie ze dwa tygodnie...
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //Gdzie on jest teraz?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //A sk¹d ja mam wiedzieæ? Ca³y czas krêci³ siê przy tym plugawym burdelu w porcie.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //Nie zdziwi³bym siê, gdyby w tej chwili zabawia³ siê tam z jedn¹ z panienek.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //Stra¿ zosta³a o tym powiadomiona?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Jasne. Mieli go z³apaæ i zadbaæ, ¿eby ruszy³ ty³ek i zacz¹³ znowu pojawiaæ siê w pracy. Ju¿ tego ¿a³ujê...
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //A zreszt¹ - niech robi, co chce. Wczeœniej czy póŸniej zorientuje siê, ¿e w Khorinis bez uczciwego zajêcia trudno o cokolwiek.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //Czy¿by...
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

	description	 = 	"Elvrich wróci i bêdzie znów dla ciebie pracowaæ.";
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
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Elvrich wróci³ i bêdzie znów dla ciebie pracowaæ.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //Mam tylko nadziejê, ¿e nie ucieknie znowu, gdy tylko pojawi siê nastêpna kusa spódniczka...
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Przyjmij to z³oto - to dziêki tobie odzyska³em czeladnika.
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
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Od tego czasu przebywaj¹ w górnym mieœcie.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Nikt dok³adnie nie wie, dlaczego tu przybyli.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Wielu lêka siê ataku ze strony orków.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Wydaje mi siê jednak, ¿e przybyli, aby st³umiæ powstanie farmerów.
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
	description = "Wiesz coœ o tym ch³opskim buncie?";
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
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //Co wiesz o tym ch³opskim buncie?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Chodz¹ pog³oski, ¿e ziemianin Onar wynaj¹³ najemników, aby chronili go przed wojskami Króla.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Mia³ ju¿ pewnie doœæ oddawania swoich plonów i trzody paladynom i stra¿y miejskiej.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Skutkiem tego w mieœcie rosn¹ ceny ¿ywnoœci.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //Gospodarstwo Onara le¿y na wschód st¹d. Nie wiemy, czy tocz¹ siê tam jakieœ walki.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Jeœli chcesz wiedzieæ wiêcej, porozmawiaj z kupcami na targowisku. Podró¿uj¹ po wyspie wiêcej ode mnie.
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
	description = "Przyszed³em w sprawie Gritty...";
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
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //Przyszed³em w sprawie Gritty...
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //Mojej siostrzenicy? A jak¹ masz do niej sprawê? Chyba nie chodzi o pieni¹dze?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Kupiec Matteo twierdzi, ¿e jest mu winna 100 sztuk z³ota.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Powiedz, ¿e to nieprawda. Od kiedy siê do mnie wprowadzi³a, mam same k³opoty!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //Jest zad³u¿ona praktycznie u ka¿dego kupca w mieœcie.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //Musia³em po¿yczyæ 200 sztuk z³ota od lichwiarza Lehmara, ¿eby sp³aciæ jej d³ugi! A teraz jeszcze to!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta powinna byæ w domu.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //No idŸ, zapytaj j¹. Ale mogê powiedzieæ ci jedno - nie ma z³amanego grosza przy duszy.
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
	description = "Twoja siostrzenica mia³a 100 sztuk z³ota.";
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
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Twoja siostrzenica mia³a 100 sztuk z³ota.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //CO! A to bezwstydna, ma³a ¿mija - to by³o MOJE z³oto! Zabra³a je z mojej skrzyni.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Oddaj mi je! Muszê najpierw sp³aciæ Lehmara. Matteo mo¿e dostaæ pieni¹dze póŸniej.

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Matteo dosta³ ju¿ pieni¹dze ode mnie!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Nie. Matteo dostanie ode mnie swoje pieni¹dze.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Oto twoje z³oto.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //Z tego co wiem o tej ma³ej ¿mii, to pobiegnie prosto do stra¿y miejskiej i oskar¿y ciê.
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Dopilnujê, ¿eby ta sprawa zosta³a za³atwiona.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //Matteo dosta³ ju¿ pieni¹dze ode mnie!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //A niech to! Có¿, d³ug to d³ug. Przynajmniej nie zatrzyma³eœ pieniêdzy dla siebie. Chyba powinienem ci za to podziêkowaæ.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //Nie. Matteo dostanie ode mnie swoje pieni¹dze.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //Œci¹gasz na mnie spore k³opoty. Lehmar nie jest zbytnio wielkoduszny, jeœli chodzi o d³ugi.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Ale przynajmniej chcesz sp³aciæ d³ugi mojej siostrzenicy. Chyba powinienem ci za to podziêkowaæ.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Oto twoje z³oto.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //Dziêkujê! Teraz mam przynajmniej czêœæ pieniêdzy, które jestem winien Lehmarowi.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //Nie mogê wprost uwierzyæ, ¿e oœmieli³a siê zabraæ moje z³oto!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















