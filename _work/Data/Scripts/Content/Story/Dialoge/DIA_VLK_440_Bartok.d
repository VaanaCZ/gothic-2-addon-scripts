// ************************************************************
// 			  					EXIT
// ************************************************************
INSTANCE DIA_Bartok_EXIT   (C_INFO)
{
	npc         = VLK_440_Bartok;
	nr          = 999;
	condition   = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bartok_PICKPOCKET (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 900;
	condition	= DIA_Bartok_PICKPOCKET_Condition;
	information	= DIA_Bartok_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait facile de lui voler son carquois de flèches)";
};                       

FUNC INT DIA_Bartok_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItRw_Arrow) >= 40)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Bartok_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bartok_PICKPOCKET);
	Info_AddChoice		(DIA_Bartok_PICKPOCKET, DIALOG_BACK 		,DIA_Bartok_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bartok_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bartok_PICKPOCKET_DoIt);
};

func void DIA_Bartok_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItRw_Arrow, 40);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Bartok_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel(); 
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Bartok_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bartok_PICKPOCKET);
};

// *****************************************************
//						Hallo
// *****************************************************
INSTANCE DIA_Bartok_Hallo (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_Hallo_Condition;
	information	= DIA_Bartok_Hallo_Info;
	permanent	= FALSE;
	description = "Qu'y a-t-il?";
};                       
FUNC INT DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bartok_Hallo_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Hello_15_00"); //Comment ça se passe ?
	AI_Output (self ,other,"DIA_Bartok_Hello_04_01"); //Vous n'êtes pas d'ici, n'est-ce pas ? Ce n'est pas grave, remarquez... moi non plus.
	AI_Output (other ,self,"DIA_Bartok_Hello_15_02"); //Où étiez-vous auparavant ?
	AI_Output (self ,other,"DIA_Bartok_Hello_04_03"); //Dans les bois, où je traquais les charognards et les loups en compagnie d'un groupe de chasseurs.
	AI_Output (self ,other,"DIA_Bartok_Hello_04_04"); //Mais j'ai fini par laisser tomber. Nous vivons une époque dangereuse et il y a beaucoup de gens peu fréquentables par ici...
};
// *****************************************************
//						Jaeger
// *****************************************************
INSTANCE DIA_Bartok_Jaeger(C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 2;
	condition	= DIA_Bartok_Jaeger_Condition;
	information	= DIA_Bartok_Jaeger_Info;
	permanent	= FALSE;
	description	= "Où puis-je trouver les autres chasseurs ?";
};                       
FUNC INT DIA_Bartok_Jaeger_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Jaeger_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Jager_15_00"); //Où puis-je trouver les autres chasseurs ?
	AI_Output (self ,other,"DIA_Bartok_Jager_04_01"); //Nous campions à l'extérieur, près de la taverne qui se trouve à mi-chemin de la ferme d'Onar.
	AI_Output (self ,other,"DIA_Bartok_Jager_04_02"); //Mais j'ignore s'il reste encore quelqu'un au campement.
	
	AI_Output (self ,other,"DIA_Addon_Bartok_Jager_04_00"); //Nous n'étions que tous les deux en ville jusqu'à ces derniers jours.
	AI_Output (self ,other,"DIA_Addon_Bartok_Jager_04_01"); //Mon ami Trokar est un excellent chasseur.
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bartok_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_440_Bartok;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bartok_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bartok_MissingPeople_Info;

	description	 = 	"Où est votre ami Trokar maintenant ?";
};

func int DIA_Addon_Bartok_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Jaeger))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bartok_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bartok_MissingPeople_15_00"); //Où est votre ami Trokar maintenant ?
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_01"); //Et bien. C'est une curieuse histoire.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_02"); //Il y a à peine quelques jours, nous étions tous les deux accoudés au bar de la taverne de Coragon, discutant de chasse.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_03"); //Ne me demandez pas ce qui s'est passé après. J'avais déjà un peu bu.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_04"); //J'ai un vague souvenir de Trokar disant qu'il allait sortir chercher quelques joints d'herbe des marais. Il n'est jamais revenu.

	MIS_Bartok_MissingTrokar = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bartok_MissingPeople, "Ne l'avez-vous pas recherché ?", DIA_Addon_Bartok_MissingPeople_such );
	Info_AddChoice	(DIA_Addon_Bartok_MissingPeople, "Alors où puis-je me procurer des joints d'herbe des marais ?", DIA_Addon_Bartok_MissingPeople_wo );
};
func void DIA_Addon_Bartok_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Bartok_MissingPeople_wo_15_00"); //Où trouve-t-on les joints d'herbe des marais ?
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_wo_04_01"); //Quelque part dans le port, autant que je sache.
};
func void DIA_Addon_Bartok_MissingPeople_such ()
{
	AI_Output			(other, self, "DIA_Addon_Bartok_MissingPeople_such_15_00"); //Ne l'avez-vous pas recherché ?
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_01"); //Non. Mais je l'ai signalé à la milice.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_02"); //Mais ils n'ont pas été capable de le retrouver.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_03"); //J'espère qu'il n'a pas été attaqué par un loup ou pire.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_04"); //J'ai bien peur de tomber sur son corps un de ses jours en chassant.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_05"); //Je ne sais pas si je le supporterai.
};

// *****************************************************
//						Bosper
// *****************************************************
INSTANCE DIA_Bartok_Bosper (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 3;
	condition	= DIA_Bartok_Bosper_Condition;
	information	= DIA_Bartok_Bosper_Info;
	permanent	= FALSE;
	description	= "Bosper a dit que vous aviez l'habitude de travailler pour lui...";
};                       
FUNC INT DIA_Bartok_Bosper_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bosper_Bartok))
	&& (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Bosper_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Bosper_15_00"); //Bosper m'a dit que vous avez travaillé pour lui.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_01"); //Oui, c'est vrai, mais une seule chose l'intéressait : ses satanées peaux !
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_02"); //Je lui ai dit que la région était devenue extrêmement dangereuse, mais il ne m'a pas vraiment écouté.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_03"); //Bah. Au moins, il payait bien, je le lui accorde.
	AI_Output (other ,self,"DIA_Bartok_Bosper_15_04"); //Que pouvez-vous me dire d'autre à son sujet ?
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_05"); //(éclate de rire) Il s'est fait voler un arc il y a peu. Et en plein jour en plus !
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_06"); //Un inconnu est entré dans sa boutique et en est ressorti après s'être servi.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_07"); //Les voleurs sont de plus en plus audacieux de nos jours !
	
	if (MIS_Bosper_Bogen != LOG_SUCCESS) 
	{    
		MIS_Bosper_Bogen = LOG_RUNNING;
	};   
};
	
// *****************************************************
//						WannaLearn
// *****************************************************
INSTANCE DIA_Bartok_WannaLearn (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_WannaLearn_Condition;
	information	= DIA_Bartok_WannaLearn_Info;
	permanent	= FALSE;
	description	= "Pouvez-vous m'apprendre des choses sur la chasse ?";
};                       
FUNC INT DIA_Bartok_WannaLearn_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_WannaLearn_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_WannaLearn_15_00"); //Pouvez-vous m'apprendre l'art de la chasse ?
	AI_Output (self ,other,"DIA_Bartok_WannaLearn_04_01"); //Je peux vous apprendre à vous déplacer discrètement et à vous servir d'un arc.
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self ,other,"DIA_Bartok_WannaLearn_04_02"); //Si vous voulez apprendre à dépecer un animal, adressez-vous à Bosper. C'est lui qui m'a tout appris à ce sujet.
	};
	
	Bartok_TeachPlayer = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Bartok peut m'enseigner l'archerie et la discrétion.");
};

// *****************************************************
//						TeachSneak
// *****************************************************
INSTANCE DIA_Bartok_TeachSneak (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_TeachSneak_Condition;
	information	= DIA_Bartok_TeachSneak_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString ("Apprenez-moi comment être discret !", B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1));
};                       
FUNC INT DIA_Bartok_TeachSneak_Condition()
{
	if (Bartok_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_TeachSneak_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_TeachSneak_15_00"); //Apprenez-moi à me déplacer discrètement.
	
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
	{
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_01"); //D'accord. Pour commencer, vous devez prendre garde à toujours être en équilibre.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_02"); //Pour ce faire, pliez les genoux et posez toujours le talon avant la pointe du pied.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_03"); //Gardez bien votre poids sur le pied d'appui tant que le pied que vous venez d'avancer n'est pas bien posé par terre.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_04"); //Il vous sera impossible d'approcher de la majorité des créatures sans vous faire repérer sauf si elles dorment. En effet, la plupart sont capables de vous sentir.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_05"); //Alors, ouvrez toujours l'œil en extérieur.
	};
};

// *****************************************************
//						TEACH
// *****************************************************
var int Bosper_MerkeBow;
// ---------------------

INSTANCE DIA_Bartok_Teach (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_Teach_Condition;
	information	= DIA_Bartok_Teach_Info;
	permanent	= TRUE;
	Description = "Je veux savoir mieux me servir d'un arc !";
};                       
FUNC INT DIA_Bartok_Teach_Condition()
{
	if (Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Bartok_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Bartok_TeachBow_15_00"); //Je voudrais être plus efficace au tir à l'arc.
	AI_Output (self ,other,"DIA_Bartok_TeachBow_04_01"); //D'accord. Voyons si je peux vous apprendre quelque chose...
	
	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	
	Info_ClearChoices (DIA_Bartok_Teach);
	
	Info_AddChoice		(DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice		(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice		(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);
};

FUNC VOID DIA_Bartok_Teach_BACK()
{
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00"); //Cherchez quelqu'un qui en sait plus que moi sur le sujet.
	}
	else if (Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01"); //Bien. Vous êtes déjà plus précis.
	};
	
	Info_ClearChoices (DIA_Bartok_Teach);
};

FUNC VOID DIA_Bartok_Teach_Bow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 60);
	
	Info_ClearChoices (DIA_Bartok_Teach);
	Info_AddChoice	  (DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_Bow_1);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);
};
FUNC VOID DIA_Bartok_Teach_Bow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 60);

	Info_ClearChoices (DIA_Bartok_Teach);
	Info_AddChoice	  (DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_Bow_1);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);	
};

// *****************************************************
//						Zusammen
// *****************************************************
var int Bartok_Bereit; 
var int Bartok_Later;
// ---------------------------

INSTANCE DIA_Bartok_Zusammen (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 5;
	condition	= DIA_Bartok_Zusammen_Condition;
	information	= DIA_Bartok_Zusammen_Info;
	permanent	= TRUE;
	description	= "Pourquoi ne pas aller chasser ensemble ?";
};                       
FUNC INT DIA_Bartok_Zusammen_Condition()
{
	if (Bartok_Bereit == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Zusammen_Info()
{	
	if (Bartok_Later == FALSE)
	{
		AI_Output (other ,self,"DIA_Bartok_Zusammen_15_00"); //Et si nous allions chasser ensemble ?
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_01"); //Hmm... à deux, c'est moins dangereux, c'est vrai.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_02"); //Vous vous y connaissez, pour ce qui est de la chasse ?
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_03"); //Savez-vous comment dépecer un animal ?
	};
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if (Bartok_Later == TRUE)
		{
			AI_Output (self ,other,"DIA_Bartok_HuntNOW_04_01"); //Vous avez 50 pièces d'or ?
		}
		else
		{
			AI_Output (other ,self,"DIA_Bartok_Zusammen_15_04"); //Oui.
			AI_Output (self ,other,"DIA_Bartok_Zusammen_04_05"); //D'accord, mais je veux 50 pièces d'or, en échange de quoi vous pourrez conserver les peaux et aller les vendre à Bosper.
			AI_Output (self ,other,"DIA_Bartok_Zusammen_04_06"); //C'est honnête, non ?
		};
		
		Info_ClearChoices (DIA_Bartok_Zusammen);
		Info_AddChoice	  (DIA_Bartok_Zusammen, "Plus tard...", DIA_Bartok_Zusammen_Later);
		Info_AddChoice	  (DIA_Bartok_Zusammen, "Tenez...", DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output (other ,self,"DIA_Bartok_Zusammen_15_07"); //Non.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_08"); //Alors, ça ne vaut pas la peine pour moi.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_09"); //Revenez quand vous aurez appris quelque chose.
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output (other ,self,"DIA_Bartok_HuntNOW_Later_15_00"); //Plus tard.
	Bartok_Later = TRUE;
	Info_ClearChoices (DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	Info_ClearChoices (DIA_Bartok_Zusammen);
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (other ,self,"DIA_Bartok_HuntNOW_GO_15_00"); //Nous y voilà.
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_03"); //Où donc ? Vous n'avez pas l'argent.
	};
};


// *****************************************************
//						HuntNOW
// *****************************************************
var int Bartok_Los;
// ----------------------

INSTANCE DIA_Bartok_HuntNOW (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 5;
	condition	= DIA_Bartok_HuntNOW_Condition;
	information	= DIA_Bartok_HuntNOW_Info;
	permanent	= FALSE;
	description	= "Allons chasser !";
};                       
FUNC INT DIA_Bartok_HuntNOW_Condition()
{
	if (Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_HuntNOW_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_HuntNOW_15_00"); //Allons chasser !
	AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_01"); //D'accord, suivez-moi. Il y a un bois juste à l'extérieur de la porte sud, et nous devrions y trouver bien assez de sales bêtes à chasser.
	AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_02"); //(se parle tout seul) Probablement trop, même...
	Bartok_Los = TRUE;
		
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self, "GUIDEMITTE");
	
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02"); 
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02");
};

// *****************************************************
//						Im Wald
// *****************************************************
var int Bartok_OrkStillThere;
// ---------------------

INSTANCE DIA_Bartok_ImWald (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_ImWald_Condition;
	information	= DIA_Bartok_ImWald_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Bartok_ImWald_Condition()
{
	if (Bartok_Los == TRUE)
	&& (Npc_GetDistToWP (self, "NW_FARM1_CITYWALL_FOREST_03") < 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_ImWald_Info()
{	
	AI_Output (self ,other,"DIA_Bartok_ImWald_04_00"); //Alors, qu'en dites-vous ? Nous enfonçons-nous plus profond dans les bois ou non ?
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	Info_AddChoice	  (DIA_Bartok_ImWald, "Rentrons !", DIA_Bartok_ImWald_NachHause);
	Info_AddChoice	  (DIA_Bartok_ImWald, "Allons-y.", DIA_Bartok_ImWald_Weiter);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output (other ,self,"DIA_Bartok_ImWald_NachHause_15_00"); //Faisons demi-tour !
	AI_Output (self ,other,"DIA_Bartok_ImWald_NachHause_04_01"); //Je préfère moi aussi. Sinon, nous risquons de nous retrouver face à un orque.
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "START");
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output (other ,self,"DIA_Bartok_ImWald_Weiter_15_00"); //Continuons !
	AI_Output (self ,other,"DIA_Bartok_ImWald_Weiter_04_01"); //D'accord. (se parle tout seul) Espérons que ça ira...
	
	if (!Npc_IsDead(CityOrc))
	{
		Bartok_OrkStillThere = TRUE;
	};
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "GUIDEENDE");
};

// *****************************************************
//						Angekommen
// *****************************************************
var int Bartok_Ende;
// -------------------

INSTANCE DIA_Bartok_Angekommen (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_Angekommen_Condition;
	information	= DIA_Bartok_Angekommen_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Bartok_Angekommen_Condition()
{
	if (Bartok_Los == TRUE)
	&& (Npc_GetDistToWP (self, "NW_FARM1_CITYWALL_FOREST_07") < 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Angekommen_Info()
{	
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_00"); //Bon, cette fois-ci, ça suffit ! Je retourne en ville !
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_01"); //C'est trop dangereux ici, même à deux.
	
	if (Bartok_OrkStillThere == TRUE)
	//&& (Npc_IsDead (CityOrc))
	{
		B_Bartok_ShitAnOrc();
		
		Bartok_OrkGesagt = TRUE;
	};
	
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_03"); //A la prochaine !
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_04"); //Vous n'aurez qu'à vendre les peaux à Bosper.
	
	Bartok_Ende = TRUE;
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "START");
	
};

// *****************************************************
//							PERM
// *****************************************************
INSTANCE DIA_Bartok_PERM (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_PERM_Condition;
	information	= DIA_Bartok_PERM_Info;
	permanent	= TRUE;
	description = "Tout va bien ?";
};                       
FUNC INT DIA_Bartok_PERM_Condition()
{
	if (Bartok_Los == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_PERM_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_PERM_15_00"); //D'accord ?
	
	if (Bartok_Ende == TRUE)
	{		
		AI_Output (self ,other,"DIA_Bartok_PERM_04_01"); //Oui. Mais il est hors de question que je sorte de nouveau de la ville, du moins pas avant longtemps.
		if (Bartok_OrkGesagt == TRUE)
		{
			AI_Output (self ,other,"DIA_Bartok_PERM_04_02"); //Cet orque m'a tellement flanqué la frousse que mes genoux continuent de faire des castagnettes.
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Bartok_PERM_04_03"); //D'accord. Allons abattre ces bestioles !
	};
};








