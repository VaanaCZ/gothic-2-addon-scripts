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

	description	 = 	"Alles klar?";
};

func int DIA_Grom_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_15_00"); //Alles klar?
	AI_Output			(self, other, "DIA_Grom_HALLO_08_01"); //Ah, ein fremder Wanderer. Ich bin sehr beschäftigt, also, was willst du?

	Info_ClearChoices	(DIA_Grom_HALLO);
	Info_AddChoice	(DIA_Grom_HALLO, "Was gibt es hier interssantes zu sehen?", DIA_Grom_HALLO_waszusehen );
	Info_AddChoice	(DIA_Grom_HALLO, "Was machst du hier?", DIA_Grom_HALLO_was );
};

func void DIA_Grom_HALLO_waszusehen ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_waszusehen_15_00"); //Was gibt es hier Interessantes zu sehen?
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_01"); //Interessant ist gut gesagt. Wenn du hier weiter in den Wald hineingehst, dann wirst du auf ganz üble Gesellen treffen.
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_02"); //Sie sind etwa drei Meter groß, haarig und ziemlich schlecht gelaunt. Also geh da nicht hin, wenn du nicht stark genug für sie bist.
};

func void DIA_Grom_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_was_15_00"); //Was machst du hier?
	AI_Output			(self, other, "DIA_Grom_HALLO_was_08_01"); //Na, was so ein Holzfäller und Jäger eben so macht.
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

	description = "Kannst du mir was über die Jagd beibringen?";
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
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00"); //Kannst du mir was über die Jagd beibringen?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01"); //Klar. Aber erst besorgst du mir was Anständiges zu Essen. Ich sterbe vor Hunger hier draußen.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02"); //Ich will eine Flasche Milch, ein Brot und einen fetten Schinken, dann bring ich dir bei, was du willst.
	Log_CreateTopic (TOPIC_GromAskTeacher, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher, LOG_RUNNING);
	B_LogEntry (TOPIC_GromAskTeacher,"Grom der Jäger wird mir sein Geschick beibringen, wenn ich ihm eine Flasche Milch, ein Brot und einen Schinken bringe."); 
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
 
 	description = "Hier hast du dein bestelltes Essen.";
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
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00"); //Hier hast du dein bestelltes Essen.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01"); //Prima. Und nun?
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
	description	 = 	"Bring mir das Jagen bei.";
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
	AI_Output			(other, self, "DIA_Grom_TEACHHUNTING_15_00"); //Bring mir das Jagen bei.
		if 	(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			)
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_01"); //Was willst du lernen?
		

			Info_AddChoice		(DIA_Grom_TEACHHUNTING, DIALOG_BACK, DIA_Grom_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Grom_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Grom_TEACHHUNTING_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Herzen nehmen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Grom_TEACHHUNTING_Heart);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Zangen rausschneiden",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Grom_TEACHHUNTING_Mandibles	);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Horn des Schattenläufers",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Grom_TEACHHUNTING_ShadowHorn	);
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_02"); //Ich kann dir nichts beibringen, was du nicht ohnehin schon kannst.
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
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Fur_08_00"); //Schneide in die Läufe des Tieres einen Ansatz, an dem du das Fell abziehen kannst. Mach es aber von vorne nach hinten, nicht umgekehrt.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Teeth ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Teeth_08_00"); //Beim Entfernen der Zähne musst du vornehmlich darauf achten, dass das Gebiss beim Lösen vom Schädel nicht zerbricht.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Heart ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Heart_08_00"); //Ein Herz entfernst du dem Tier mit einem gekonnten Schnitt in die Brust. Lohnt sich aber häufig nur bei besonderen Tieren oder magischen Wesen.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Mandibles_08_00"); //Die Zangen von Minecrawlern oder Feldräubern musst du den Tieren mit einem sehr starken Metallhebel herauslösen. Sie sitzen sehr tief im Schädel der Tiere.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_ShadowHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_ShadowHorn_08_00"); //Ein Schattenläuferhorn bekommst du ab, wenn du dich mit aller Kraft gegen den Schädel stemmst, am Horn ziehst und das Ding mit einer harten Klinge heraustrennst.
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











