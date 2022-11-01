///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Grom_EXIT   (C_INFO)
{
	npc         = BAU_981_Grom;
	nr          = 999;
	condition   = DIA_Grom_EXIT_Condition;
	information = DIA_Grom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Grom_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Grom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Grom_HALLO		(C_INFO)
{
	npc		 = 	BAU_981_Grom;
	nr		 = 	3;
	condition	 = 	DIA_Grom_HALLO_Condition;
	information	 = 	DIA_Grom_HALLO_Info;

	description	 = 	"Wszystko w porządku?";
};

func int DIA_Grom_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_15_00"); //Wszystko w porządku?
	AI_Output			(self, other, "DIA_Grom_HALLO_08_01"); //Ach, witaj nieznajomy wędrowcze. Jestem trochę zajęty, więc lepiej mów szybko, czego chcesz.

	Info_ClearChoices	(DIA_Grom_HALLO);
	Info_AddChoice	(DIA_Grom_HALLO, "Czy są tutaj jakieś interesujące rzeczy?", DIA_Grom_HALLO_waszusehen );
	Info_AddChoice	(DIA_Grom_HALLO, "Co tu porabiasz?", DIA_Grom_HALLO_was );
};

func void DIA_Grom_HALLO_waszusehen ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_waszusehen_15_00"); //Jest tu coś interesującego?
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_01"); //Interesującego, powiadasz... Tak, interesujący to dobre słowo. Jeśli wejdziesz nieco głębiej w te lasy, możesz mieć bardzo niemiłe spotkanie.
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_02"); //Mieszkają tam kudłate bestie potężnej postury i wzrostu. Więc jeśli nie czujesz się na siłach, żeby je pokonać, lepiej tam nie idź.
};

func void DIA_Grom_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_was_15_00"); //Co tutaj robisz?
	AI_Output			(self, other, "DIA_Grom_HALLO_was_08_01"); //Wszystko to, czym zwykle zajmują się myśliwi i drwale.
	Info_AddChoice	(DIA_Grom_HALLO, DIALOG_BACK, DIA_Grom_HALLO_BACK );
};

func void DIA_Grom_HALLO_BACK ()
{
	Info_ClearChoices	(DIA_Grom_HALLO);
};

// ************************************************************
// 			  			  ASK TEACHER 
// ************************************************************

INSTANCE DIA_Grom_AskTeacher (C_INFO)
{
	npc			= BAU_981_Grom;
	nr          = 10;
	condition	= DIA_Grom_AskTeacher_Condition;
	information	= DIA_Grom_AskTeacher_Info;

	description = "Możesz nauczyć mnie czegoś o polowaniu?";
};                       

FUNC INT DIA_Grom_AskTeacher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Grom_HALLO))
	{
				return TRUE;
		};
};

FUNC VOID DIA_Grom_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00"); //Możesz mnie nauczyć czegoś o polowaniu?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01"); //Jasne. Ale najpierw przynieś mi coś normalnego do jedzenia. Umieram tu z głodu.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02"); //Podzielę się z tobą swoją wiedzą, jeśli dostanę butelkę mleka, bochenek chleba i kawałek tłustej szynki.
	Log_CreateTopic (TOPIC_GromAskTeacher, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher, LOG_RUNNING);
	B_LogEntry (TOPIC_GromAskTeacher,"Myśliwy Grom nauczy mnie wszystkiego, co wie, jeśli przyniosę mu butelkę mleka, bochenek chleba i kawał szynki."); 
};


// ************************************************************
// 			  			  PAY TEACHER 
// ************************************************************

INSTANCE DIA_Grom_PayTeacher (C_INFO)
{
	npc			= BAU_981_Grom;
	nr          = 11;
	condition	= DIA_Grom_PayTeacher_Condition;
	information	= DIA_Grom_PayTeacher_Info;
 
 	description = "Oto jedzenie.";
};                       

FUNC INT DIA_Grom_PayTeacher_Condition()
{
	if	(Npc_KnowsInfo (other, DIA_Grom_AskTeacher))
		&& (Npc_HasItems (other,Itfo_Milk))
		&& (Npc_HasItems (other,Itfo_Bread))
		&& (Npc_HasItems (other,Itfo_Bacon))
			{
				return TRUE;
			};
};
FUNC VOID DIA_Grom_PayTeacher_Info()
{
	B_GiveInvItems (other, self, Itfo_Milk, 1);
	B_GiveInvItems (other, self, Itfo_Bread, 1);
	B_GiveInvItems (other, self, Itfo_Bacon, 1);
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00"); //Oto jedzenie.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01"); //Doskonale. Co teraz?
	Grom_TeachAnimalTrophy = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Grom_TEACHHUNTING		(C_INFO)
{
	npc		     = 	BAU_981_Grom;
	nr           =  12;
	condition	 = 	DIA_Grom_TEACHHUNTING_Condition;
	information	 = 	DIA_Grom_TEACHHUNTING_Info;
	permanent	 =  TRUE;
	description	 = 	"Naucz mnie, jak powinno się polować.";
};

func int DIA_Grom_TEACHHUNTING_Condition ()
{
	if (Grom_TeachAnimalTrophy == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Grom_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Grom_TEACHHUNTING_15_00"); //Naucz mnie, jak powinno się polować.
		if 	(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			)
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_01"); //Czego chciałbyś się nauczyć?
		

			Info_AddChoice		(DIA_Grom_TEACHHUNTING, DIALOG_BACK, DIA_Grom_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Obedrzyj ze skóry",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Grom_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Usuń kły",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Grom_TEACHHUNTING_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Usuń serce",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Grom_TEACHHUNTING_Heart);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Usuń żuwaczkę",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Grom_TEACHHUNTING_Mandibles	);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Róg cieniostwora",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Grom_TEACHHUNTING_ShadowHorn	);
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_02"); //Nie mogę cię nauczyć niczego, czego byś już nie wiedział.
		};
};

func void DIA_Grom_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Fur_08_00"); //Natnij nogi na tyle głęboko, żebyś mógł bez problemu zdjąć ze zwierzęcia skórę. Zaczynaj zawsze od przodu.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Teeth ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Teeth_08_00"); //Usuwając zęby, musisz bardzo uważać, żeby się nie połamały.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Heart ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Heart_08_00"); //Serce zwierzęcia możesz usunąć, wycinając je nożem z klatki piersiowej. Opłaca się to robić w przypadku niektórych niezwykłych lub magicznych zwierząt.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Mandibles_08_00"); //Żuwaczki pełzacza lub polnej bestii możesz usunąć, używając do tego celu jakiejś wytrzymałej, metalowej dźwigni. Są bardzo mocno przytwierdzone do czaszki.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_ShadowHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_ShadowHorn_08_00"); //Aby wyrwać róg cieniostwora, musisz zaprzeć się o czaszkę i ciągnąć z całej siły, pomagając sobie przy tym ostrym nożem.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Grom_PICKPOCKET (C_INFO)
{
	npc			= BAU_981_Grom;
	nr			= 900;
	condition	= DIA_Grom_PICKPOCKET_Condition;
	information	= DIA_Grom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Grom_PICKPOCKET_Condition()
{
	C_Beklauen (75, 40);
};
 
FUNC VOID DIA_Grom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Grom_PICKPOCKET);
	Info_AddChoice		(DIA_Grom_PICKPOCKET, DIALOG_BACK 		,DIA_Grom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Grom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Grom_PICKPOCKET_DoIt);
};

func void DIA_Grom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Grom_PICKPOCKET);
};
	
func void DIA_Grom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Grom_PICKPOCKET);
};











