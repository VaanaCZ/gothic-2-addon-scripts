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

	description	 = 	"Tout va bien ?";
};

func int DIA_Grom_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_15_00"); //Tout va bien ?
	AI_Output			(self, other, "DIA_Grom_HALLO_08_01"); //Ah ! Un vagabond que je ne connais pas. Je suis tr�s occup�, alors que voulez-vous ?

	Info_ClearChoices	(DIA_Grom_HALLO);
	Info_AddChoice	(DIA_Grom_HALLO, "Qu'y a-t-il d'int�ressant � voir ici ?", DIA_Grom_HALLO_waszusehen );
	Info_AddChoice	(DIA_Grom_HALLO, "Que faites-vous ici ?", DIA_Grom_HALLO_was );
};

func void DIA_Grom_HALLO_waszusehen ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_waszusehen_15_00"); //Qu'y a-t-il d'int�ressant � voir ici ?
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_01"); //Int�ressant est le mot. Si vous vous enfoncez dans les bois, vous allez rencontrer des types vraiment mal�fiques.
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_02"); //Ils font � peu pr�s trois m�tres de haut, pleins de poils et ont un tr�s mauvais caract�re. Alors n'y allez pas si vous n'�tes pas de taille.
};

func void DIA_Grom_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_was_15_00"); //Que faites-vous ici ?
	AI_Output			(self, other, "DIA_Grom_HALLO_was_08_01"); //Disons le genre de choses dont s'occupe un b�cheron et un chasseur.
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

	description = "Pouvez-vous m'apprendre des choses sur la chasse ?";
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
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00"); //Pouvez-vous m'apprendre l'art de la chasse ?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01"); //Bien s�r. Mais d'abord trouvez-moi quelque chose de correct � manger. Je meurs de faim.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02"); //Je veux une bouteille de lait, du pain et du jambon. Puis je vous enseignerai ce que vous voulez.
	Log_CreateTopic (TOPIC_GromAskTeacher, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher, LOG_RUNNING);
	B_LogEntry (TOPIC_GromAskTeacher,"Grom le chasseur m'apprendra ce qu'il sait si je lui apporte une bouteille de lait, du pain et du jambon."); 
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
 
 	description = "Voici la nourriture que vous vouliez.";
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
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00"); //Voici la nourriture que vous vouliez.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01"); //Fantastique. Et maintenant ?
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
	description	 = 	"Apprenez-moi � chasser.";
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
	AI_Output			(other, self, "DIA_Grom_TEACHHUNTING_15_00"); //Apprenez-moi � chasser.
		if 	(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			)
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_01"); //Que voulez-vous savoir ?
		

			Info_AddChoice		(DIA_Grom_TEACHHUNTING, DIALOG_BACK, DIA_Grom_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Ecorchage",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Grom_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Retirer les crocs",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Grom_TEACHHUNTING_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Retirer le c�ur",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Grom_TEACHHUNTING_Heart);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Retirer les mandibules",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Grom_TEACHHUNTING_Mandibles	);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Corne de b�te des ombres",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Grom_TEACHHUNTING_ShadowHorn	);
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_02"); //Je ne peux rien vous apprendre que vous ne sachiez d�j�.
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
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Fur_08_00"); //Faites une incision dans la jambe de l'animal pour pouvoir �ter sa peau. Tirez de l'avant vers l'arri�re. C'est le seul moyen.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Teeth ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Teeth_08_00"); //Quand vous retirez les crocs, vous devez faire particuli�rement attention � ce qu'ils ne se cassent pas quand ils se d�tachent de la m�choire.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Heart ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Heart_08_00"); //Vous retirez le c�ur de l'animal d'une adroite incision dans la poitrine. Mais cela ne vaut la peine qu'avec des animaux sp�ciaux ou des �tres enchant�s.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Mandibles_08_00"); //Les mandibules d'un foreur des mines ou d'un fl�au des champs doivent �tre retir�es avec un solide levier de m�tal. Elles sont profond�ment enfonc�es dans le cr�ne de l'animal.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_ShadowHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_ShadowHorn_08_00"); //Pour retirer la corne d'une b�te des ombres, prenez appui sur le cr�ne, tirez de toutes vos forces sur la corne et coupez-la avec une lame solide.
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











