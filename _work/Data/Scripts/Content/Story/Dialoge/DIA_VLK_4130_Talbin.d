///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talbin_EXIT   (C_INFO)
{
	npc         = VLK_4130_Talbin;
	nr          = 999;
	condition   = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talbin_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Talbin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
var int Talbin_Runs;
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_HALLO		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 5;
	condition	 = 	DIA_Talbin_HALLO_Condition;
	information	 = 	DIA_Talbin_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Talbin_HALLO_Condition ()
{
	if (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Talbin_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_00"); //Halt! Bleib stehen, wo du bist!
	AI_Output			(other, self, "DIA_Talbin_HALLO_15_01"); //Äh! Kein Problem!
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_02"); //Ach! Noch jemand, der sich hier verirrt hat, was? Ich hatte dich erst für einen dieser üblen Typen gehalten, die in dieser Gegend 'rumgeistern.
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_03"); //Wie ich sehe, gehörst du wohl nicht zu denen. Du siehst viel zu harmlos aus!
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachtIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASMACHTIHR		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 6;
	condition	 = 	DIA_Talbin_WASMACHTIHR_Condition;
	information	 = 	DIA_Talbin_WASMACHTIHR_Info;

	description	 = 	"Du siehst aus wie ein Jäger, der nicht weiß, wohin mit seiner Zeit! ";
};

func int DIA_Talbin_WASMACHTIHR_Condition ()
{
	if (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WASMACHTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_15_00"); //Du siehst aus wie ein Jäger, der nicht weiß, wohin mit seiner Zeit!
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_01"); //Haha. Ja! Hast wohl recht. Aber was will man machen, ich komme nicht mehr über den Pass!
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_02"); //Also bleibe ich hier und tu das, was ich am besten kann.

	if ((Npc_IsDead(Engrom)) == FALSE)
	{
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_03"); //Tut mir nur Leid um meinen Kumpel Engrom.
	};

	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_04"); //Komm an mein Feuer und wärm dich ein bisschen.
	
	Info_ClearChoices	(DIA_Talbin_WASMACHTIHR);
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, DIALOG_BACK, DIA_Talbin_WASMACHTIHR_back );
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, "Dir geht´s aber offensichtlich recht gut.", DIA_Talbin_WASMACHTIHR_gut );
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, "Bist du ein ehemaliger Gefangener der Barriere?", DIA_Talbin_WASMACHTIHR_strf );

};
func void DIA_Talbin_WASMACHTIHR_back ()
{
	Info_ClearChoices	(DIA_Talbin_WASMACHTIHR);
};

func void DIA_Talbin_WASMACHTIHR_strf ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_00"); //Bist du ein ehemaliger Gefangener der Barriere?
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_01"); //Nein, nein! Wo denkst du hin? Ich wollte das Geschäft meines Lebens hier draußen machen.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_02"); //Irgendeiner von hier hat mir erzählt, dass es hier draußen die besten Jagdgebiete geben soll.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_03"); //Fette Beute, wenn du verstehst, was ich meine.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_04"); //Das einzige, was es gibt, seit die Orks hier eingefallen sind, ist auf die Fresse, wenn du dich zu weit raus traust!
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_05"); //Ich hab mir von dem Idioten einen Floh ins Ohr setzen lassen.
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_06"); //Ich kenne diese Spaßvögel!
};

func void DIA_Talbin_WASMACHTIHR_gut ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_gut_15_00"); //Dir geht's aber offensichtlich recht gut.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_01"); //Na ja! Beschweren kann man sich nicht. Die Flussgebiete sind trotz der verdammten Orks noch am ungefährlichsten.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_02"); //Die trauen sich scheinbar nicht ans Wasser. Mmh. Vielleicht auch nur Zufall.
};


///////////////////////////////////////////////////////////////////////
//	Info SorryForEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_SORRYFORENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 7;
	condition	 = 	DIA_Talbin_SORRYFORENGROM_Condition;
	information	 = 	DIA_Talbin_SORRYFORENGROM_Info;

	description	 = 	"Warum tut's dir um Engrom leid? ";
};

func int DIA_Talbin_SORRYFORENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& ((Npc_IsDead(Engrom)) == FALSE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Kapitel <= 3)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_SORRYFORENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_SORRYFORENGROM_15_00"); //Warum tut's dir um Engrom leid?
	AI_Output			(self, other, "DIA_Talbin_SORRYFORENGROM_07_01"); //Weil er mir einfach gefolgt ist, ohne zu Fragen zu stellen.
	AI_Output			(self, other, "DIA_Talbin_SORRYFORENGROM_07_02"); //Und jetzt sitzen wir in diesem Schlamassel. Gier zahlt sich halt nicht aus.
};


///////////////////////////////////////////////////////////////////////
//	Info WasJagdIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASJAGDIHR		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 8;
	condition	 = 	DIA_Talbin_WASJAGDIHR_Condition;
	information	 = 	DIA_Talbin_WASJAGDIHR_Info;

	description	 = 	"Was jagst du hier am Fluss?";
};

func int DIA_Talbin_WASJAGDIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WASJAGDIHR_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WASJAGDIHR_15_00"); //Was jagst du hier am Fluss?
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_01"); //Was für 'ne Frage! Da brauchst du nur mal am Fluss entlang zu marschieren und du weißt, was ich hier jage. Lurker natürlich!
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_02"); //Die Viecher sind zwar nicht leicht zu kriegen, dafür schmecken sie aber um so besser.
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_03"); //Ab und zu läuft mir auch mal ein Scavenger über den Weg. Den schlage ich natürlich auch nicht aus!
};

///////////////////////////////////////////////////////////////////////
//	Info EngromAngry
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_ENGROMANGRY		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 9;
	condition	 = 	DIA_Talbin_ENGROMANGRY_Condition;
	information	 = 	DIA_Talbin_ENGROMANGRY_Info;

	description	 = 	"Ich glaube, dein Kumpel ist ein bisschen gereizt!";
};

func int DIA_Talbin_ENGROMANGRY_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
			&& (Npc_KnowsInfo(other, DIA_Talbin_SORRYFORENGROM))
			&& ((Npc_IsDead(Engrom)) == FALSE)
			&& (Talbin_FollowsThroughPass == 0)
			&& (Kapitel <= 3)
			&& (Talbin_Runs == FALSE)
		)
		{
				return TRUE;
		};
};

func void DIA_Talbin_ENGROMANGRY_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_ENGROMANGRY_15_00"); //Ich glaube, dein Kumpel ist ein bisschen gereizt!
	AI_Output			(self, other, "DIA_Talbin_ENGROMANGRY_07_01"); //Hör bloß auf. Provozier ihn nicht noch weiter, sonst reißt er mir noch den Kopf ab. Ich kann's jetzt auch nicht mehr ändern, dass wir hier sind.
	AI_Output			(self, other, "DIA_Talbin_ENGROMANGRY_07_02"); //Ich werd's irgendwann wieder gut machen!
};


// ************************************************************
// 			  			  ASK TEACHER 
// ************************************************************

INSTANCE DIA_Talbin_AskTeacher (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr          = 10;
	condition	= DIA_Talbin_AskTeacher_Condition;
	information	= DIA_Talbin_AskTeacher_Info;

	description = "Kannst du mir was über die Jagd beibringen?";
};                       

FUNC INT DIA_Talbin_AskTeacher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASJAGDIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
	{
				return TRUE;
		};
};

FUNC VOID DIA_Talbin_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00"); //Kannst du mir was über die Jagd beibringen?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01"); //Ach so! Jetzt bist du also auch auf den Geschmack gekommen. Na schön! Das kostet aber was!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02"); //Was willst du dafür haben?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03"); //Hast du irgendwas anderes zu essen als Lurkerfleisch? Vielleicht ein Stück Käse. Ja, ein Stück Käse. Ich würde sterben für ein Stück ...
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04"); //Mal sehen.
		
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Bei Talbin kann ich lernen wie man Tiere ausnimmt");
};


// ************************************************************
// 			  			  PAY TEACHER 
// ************************************************************

INSTANCE DIA_Talbin_PayTeacher (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr          = 11;
	condition	= DIA_Talbin_PayTeacher_Condition;
	information	= DIA_Talbin_PayTeacher_Info;
	permanent	= TRUE;
	description = "Hier hast du deinen Käse. Bringst du mir jetzt was bei?";
};                       

var int DIA_Talbin_PayTeacher_noPerm;

FUNC INT DIA_Talbin_PayTeacher_Condition()
{
	if 	(
		(Npc_KnowsInfo (other, DIA_Talbin_AskTeacher))
		&& (DIA_Talbin_PayTeacher_noPerm == FALSE)
		&& (Talbin_FollowsThroughPass == 0)
		&& (Talbin_Runs == FALSE)
		)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Talbin_PayTeacher_Info()
{
	if (B_GiveInvItems (other, self, itfo_Cheese, 1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00"); //Hier hast du deinen Käse. Bringst du mir jetzt was bei?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01"); //Ehrlich, du hast was? Oh, Mann, wie lange habe ich das schon nicht mehr gegessen. Danke. Äh, wie war das ... ach ja. Sicher!
		Talbin_TeachAnimalTrophy = TRUE;
		DIA_Talbin_PayTeacher_noPerm = TRUE;
	}
	else	//SC hat keinen Käse
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02"); //Ich habe gerade keinen Käse dabei!
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03"); //Wär auch zu schön gewesen. Sag Bescheid, wenn du welchen hast.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_TEACHHUNTING		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 12;
	condition	 = 	DIA_Talbin_TEACHHUNTING_Condition;
	information	 = 	DIA_Talbin_TEACHHUNTING_Info;
	permanent	= TRUE;
	description	 = 	"Was kannst du mir beibringen?";
};

func int DIA_Talbin_TEACHHUNTING_Condition ()
{
	if (Talbin_TeachAnimalTrophy == TRUE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_TEACHHUNTING_15_00"); //Was kannst du mir beibringen?
		if 	(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			)
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_07_01"); //Was willst du wissen?
		

			Info_AddChoice		(DIA_Talbin_TEACHHUNTING, DIALOG_BACK, DIA_Talbin_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Talbin_TEACHHUNTING_Claws);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Talbin_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Horn des Schattenläufers",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Talbin_TEACHHUNTING_ShadowHorn);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Herz nehmen",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Talbin_TEACHHUNTING_Heart);
			};

		}
		else
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_07_02"); //Da muss ich dich enttäuschen. Du weißt schon alles, was ich dir beibringen könnte. Ich dank dir aber noch mal für den Käse!
		};
};

func void DIA_Talbin_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

// ------ Klauen hacken ------
func void DIA_Talbin_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_00"); //Klauen abzuhacken ist ganz einfach. Du greifst die Klaue direkt unten am Gelenk fest und drückst sie nach unten auf den Boden.
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_01"); //Jetzt nimmst du das Messer und schneidest vorsichtig die Klaue ab.
		};

		Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Talbin_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_00"); //Die Haut von einem Lurker kannst du am besten ab kriegen, wenn du die Bauchnaht entlang einmal anschneidest ...
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_01"); //... die Hinterläufe des Tieres anreißt und so das Fell in einem Stück von hinten nach vorne abziehst.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Shadowhorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00"); //Das Schattenläuferhorn ist sehr hart und lässt sich gut zur Herstellung von Statuen oder Werkzeugen verwenden.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};
func void DIA_Talbin_TEACHHUNTING_Heart ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Heart_07_00"); //Herzen von magischen Wesen sind sehr selten und schwer zu bekommen. Sei vorsichtig dabei, vor allem bei jeder Art von Golems.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
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

INSTANCE DIA_Talbin_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP3_EXIT_Condition;
	information	= DIA_Talbin_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Talbin_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP4_EXIT_Condition;
	information	= DIA_Talbin_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Kap4_Wasneues
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASNEUES		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 13;
	condition	 = 	DIA_Talbin_KAP4_WASNEUES_Condition;
	information	 = 	DIA_Talbin_KAP4_WASNEUES_Info;

	description  =  "Hast du hier jemanden vorbeikommen sehen?";
};

func int DIA_Talbin_KAP4_WASNEUES_Condition ()
{
	if 	(Kapitel >= 4)
		&& (Talbin_FollowsThroughPass == 0)
		&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_KAP4_WASNEUES_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_KAP4_WASNEUES_15_00"); //Hast du hier jemanden vorbeikommen sehen?
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASNEUES_07_01"); //Ja. Hier sind in letzter Zeit ganz schräge Vögel am Werk! Sie rennen in aufgemotzten Rüstungen rum und machen auf Wichtig!
};

///////////////////////////////////////////////////////////////////////
//	Info WaswolltenDJG
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASWOLLTENDJG		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 14;
	condition	 = 	DIA_Talbin_KAP4_WASWOLLTENDJG_Condition;
	information	 = 	DIA_Talbin_KAP4_WASWOLLTENDJG_Info;

	description	 = 	"Was wollten die 'schrägen Vögel' hier? ";
};

func int DIA_Talbin_KAP4_WASWOLLTENDJG_Condition ()
{
if 	(Npc_KnowsInfo(other, DIA_Talbin_KAP4_WASNEUES))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASWOLLTENDJG_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_KAP4_WASWOLLTENDJG_15_00"); //Was wollten die 'schrägen Vögel' hier?
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_01"); //Sie fragten mich nach Proviant und Ausrüstung! Mann, ich habe selbst kaum was!
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_02"); //Erzählten was von Drachen töten und so'n Zeug. Wer weiß, wo die Jungs herkommen, aber besonders vertrauenserweckend sahen sie nicht aus!

	if (Kapitel == 4)
	{
		B_LogEntry (TOPIC_Dragonhunter,"Einige Drachenjäger sind bei Talbin dem Jäger vorbei gekommen."); 
	};
};



///////////////////////////////////////////////////////////////////////
//	Info woEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_WOENGROM_Condition;
	information	 = 	DIA_Talbin_WOENGROM_Info;

	description	 = 	"Bist du momentan alleine hier?";
};

func int DIA_Talbin_WOENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (EngromIsGone == TRUE)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WOENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WOENGROM_15_00"); //Bist du momentan alleine hier?
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_01"); //Ja. Mein Kumpel Engrom hat sich vom Acker gemacht. Gestern noch meinte er, er hätte eine Vision. Jemand soll ganz leise zu ihm gesprochen haben.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_02"); //Ich habe gar nichts gehört. Ich dachte noch so bei mir, der spinnt wohl ...
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_03"); //...und dann war er auf einmal verschwunden. Ich hab keine Ahnung, wohin.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_04"); //Wenn du Engrom irgendwo sehen solltest, dann sag ihm mal, dass er mir noch 'ne Lurkerhaut schuldet, der Mistkerl.

	if (Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
		{
	AI_Output			(other, self, "DIA_Talbin_WOENGROM_15_05"); //Ich hatte eher den Eindruck, dass er gar nicht mehr von hier weg wollte, bis die Orks wieder abgezogen sind.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_06"); //Ich sag ja. Irgendwas stimmt nicht mit ihm.
		};
	MIS_Tabin_LookForEngrom = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FoundEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_FOUNDENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	16;
	condition	 = 	DIA_Talbin_FOUNDENGROM_Condition;
	information	 = 	DIA_Talbin_FOUNDENGROM_Info;

	description	 = 	"Ich habe deinen Kumpel Engrom gefunden.";
};

func int DIA_Talbin_FOUNDENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WOENGROM))
	&& ((NpcObsessedByDMT_Engrom == TRUE)||(Npc_HasItems (other,ItAt_TalbinsLurkerSkin)) ) 
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_FOUNDENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_00"); //Ich habe deinen Kumpel Engrom gefunden.
	AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_01"); //Ja? Wo ist er?


	if (Npc_IsDead(Engrom))
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_02"); //Er ist tot.
	}
	else	
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_03"); //Ich denke nicht, dass du ihn jemals wiedersehen wirst.
	};

	if (B_GiveInvItems (other, self, ItAt_TalbinsLurkerSkin,1))
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_04"); //Hier. Ich habe deine Lurkerhaut bei ihm gefunden.
	};	

	if (hero.guild ==GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_05"); //Die Suchenden haben sich seiner bemächtigt.
		AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_06"); //Die Suchenden? Wer soll das sein?
		AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_07"); //Schergen der Unterwelt. Sie sind die wahren Anführer der Orks.
	};	

	AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_08"); //Bei Innos. Ich muss hier raus und wenn ich dabei drauf gehe. Jetzt oder nie!
	AI_StopProcessInfos (self);	

	Log_CreateTopic (TOPIC_Talbin_Runs, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Talbin_Runs, LOG_RUNNING);
	B_LogEntry (TOPIC_Talbin_Runs,"Talbin, der Jäger aus dem Minental, rannte, wie von der Blutfliege gestochen zum Pass. Ich glaube, er will nach Khorinis."); 

	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"FleePass");
	Wld_InsertNpc	(Snapper, "START");
	Talbin_Runs = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOHIN		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	17;
	condition	 = 	DIA_Talbin_WOHIN_Condition;
	information	 = 	DIA_Talbin_WOHIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wo willst du hin?";
};

func int DIA_Talbin_WOHIN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_FOUNDENGROM))
	&& (Talbin_FollowsThroughPass == 0)
		
		{
				return TRUE;
		};
};

func void DIA_Talbin_WOHIN_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_15_00"); //Wo willst du hin?

		if (Npc_GetDistToWP(self,"START")<1000) 
		{
			AI_Output			(self, other, "DIA_Talbin_WOHIN_07_01"); //Bring mich über den Pass. Bitte!!
		
			Info_ClearChoices	(DIA_Talbin_WOHIN);
			Info_AddChoice	(DIA_Talbin_WOHIN, "Ich hab´ für dich keine Zeit.", DIA_Talbin_WOHIN_ );
			Info_AddChoice	(DIA_Talbin_WOHIN, "Geh doch einfach durch.", DIA_Talbin_WOHIN_durch );
			Info_AddChoice	(DIA_Talbin_WOHIN, "In Ordnung.", DIA_Talbin_WOHIN_ok );
		}
		else
		{
		AI_Output			(self, other, "DIA_Talbin_WOHIN_07_02"); //Nix wie raus hier über den Pass. Geh mir aus dem Weg.
		AI_StopProcessInfos (self);
		};


};
func void DIA_Talbin_WOHIN_ok ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_ok_15_00"); //In Ordnung.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_ok_07_01"); //Ich danke dir. Wenn du rüber gehst, folge ich dir einfach.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"IntoPass");
	Talbin_FollowsThroughPass = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;	//Joly: eh nur so lange, bis der SC durch den Levelchange geht!

};

func void DIA_Talbin_WOHIN_durch ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_durch_15_00"); //Geh doch einfach durch.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_durch_07_01"); //Da drin ist es so dunkel. Ich geh da auf keinen Fall alleine rein.

};

func void DIA_Talbin_WOHIN_ ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_schwein_15_00"); //Ich hab für dich keine Zeit.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_schwein_07_01"); //Lässt mich hier einfach verrecken. Dafür wirst du in der Hölle schmoren.
	Talbin_FollowsThroughPass = LOG_OBSOLETE;
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_VERSCHWINDE		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_VERSCHWINDE_Condition;
	information	 = 	DIA_Talbin_VERSCHWINDE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Hey.";
};

func int DIA_Talbin_VERSCHWINDE_Condition ()
{
	if (Talbin_FollowsThroughPass == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_VERSCHWINDE_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_VERSCHWINDE_15_00"); //Hey.
	AI_Output			(self, other, "DIA_Talbin_VERSCHWINDE_07_01"); //Verschwinde. Ich komm auch ohne dich klar, du Mistkerl.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Talbin_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP5_EXIT_Condition;
	information	= DIA_Talbin_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Talbin_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP6_EXIT_Condition;
	information	= DIA_Talbin_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Talbin_PICKPOCKET (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 900;
	condition	= DIA_Talbin_PICKPOCKET_Condition;
	information	= DIA_Talbin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Talbin_PICKPOCKET_Condition()
{
	C_Beklauen (40, 25);
};
 
FUNC VOID DIA_Talbin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Talbin_PICKPOCKET);
	Info_AddChoice		(DIA_Talbin_PICKPOCKET, DIALOG_BACK 		,DIA_Talbin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Talbin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Talbin_PICKPOCKET_DoIt);
};

func void DIA_Talbin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Talbin_PICKPOCKET);
};
	
func void DIA_Talbin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Talbin_PICKPOCKET);
};


