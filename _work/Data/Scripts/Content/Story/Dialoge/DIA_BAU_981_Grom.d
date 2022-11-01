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

	description	 = 	"Je všechno v poâádku?";
};

func int DIA_Grom_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_15_00"); //Je všechno v poâádku?
	AI_Output			(self, other, "DIA_Grom_HALLO_08_01"); //Á, nęjaký neznámý poutník. Mám moc práce, tak co chceš?

	Info_ClearChoices	(DIA_Grom_HALLO);
	Info_AddChoice	(DIA_Grom_HALLO, "Co je tu zajímavého k vidęní?", DIA_Grom_HALLO_waszusehen );
	Info_AddChoice	(DIA_Grom_HALLO, "Co tady dęláš?", DIA_Grom_HALLO_was );
};

func void DIA_Grom_HALLO_waszusehen ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_waszusehen_15_00"); //Co je tu zajímavého k vidęní?
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_01"); //Zajímavé je slabé slovo. Když se vydáš hloubęjš do lesa, narazíš na poâádnę odporný chlapíky.
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_02"); //Jsou okolo deseti stop vysoký, chlupatý a maj fakt špatnou náladu. Jestli na nę nejsi dost silný, tak tam radęji ani nechoë.
};

func void DIA_Grom_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_was_15_00"); //Co tady dęláš?
	AI_Output			(self, other, "DIA_Grom_HALLO_was_08_01"); //To, co dâevorubci a lovci obvykle dęlávají.
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

	description = "Můžeš mę naučit nęco o lovu?";
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
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00"); //Můžeš mę naučit nęco o lovu?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01"); //Jasnę. Ale nejdâív mi dej nęco poâádnýho na zub. Umírám tady hlady.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02"); //Dal bych si láhev mlíka, bochník chleba a tlustou šunku. Pak tę naučím, čemu budeš chtít.
	Log_CreateTopic (TOPIC_GromAskTeacher, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher, LOG_RUNNING);
	B_LogEntry (TOPIC_GromAskTeacher,"Lovec Grom se se mnou podęlí o své poznatky, pokud mu pâinesu láhev mléka, krajíc chleba a šunku."); 
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
 
 	description = "Tady máš jídlo, cos chtęl.";
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
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00"); //Tady máš jídlo, cos chtęl.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01"); //Výbornę. A teë?
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
	description	 = 	"Rád bych se naučil nęjakým loveckým technikám.";
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
	AI_Output			(other, self, "DIA_Grom_TEACHHUNTING_15_00"); //Rád bych se naučil nęjakým loveckým technikám.
		if 	(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			)
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_01"); //Co chceš vędęt?
		

			Info_AddChoice		(DIA_Grom_TEACHHUNTING, DIALOG_BACK, DIA_Grom_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Stažení z kůže",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Grom_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Vyjmutí zubů",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Grom_TEACHHUNTING_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Vyâíznutí srdce",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Grom_TEACHHUNTING_Heart);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Vyjmutí kusadel",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Grom_TEACHHUNTING_Mandibles	);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Roh stínové šelmy",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Grom_TEACHHUNTING_ShadowHorn	);
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_02"); //Nemůžu tę naučit nic, co bys ještę neznal.
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
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Fur_08_00"); //Veë âez kolem končetin tak, abys mohl stáhnout kůži. Dęlej to od hlavy k ocasu, ne naopak.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Teeth ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Teeth_08_00"); //Když chceš oddęlit zuby, musíš dávat dobrý pozor, aby se pâi odlamování od lebky nezlomily.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Heart ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Heart_08_00"); //Srdce získáš tak, že šikovnę âízneš do hrudi zvíâete. Ale obvykle to stojí za to jen v pâípadę, že se jedná zvíâe magického původu.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Mandibles_08_00"); //Kusadla důlních červů a polních škůdců lze získat jen za pomoci velmi silné kovové páky, protože jsou zaklínęny hluboko v pevných tkáních hlavy.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_ShadowHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_ShadowHorn_08_00"); //Abys získal roh stínové šelmy, opâi se vší silou o lebku a zároveŕ tahej za roh. Pak tu vęc tvrdou čepelí uâízni.
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











