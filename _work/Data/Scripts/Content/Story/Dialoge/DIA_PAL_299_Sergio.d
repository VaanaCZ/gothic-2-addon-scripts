///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sergio_EXIT   (C_INFO)
{
	npc         = PAL_299_Sergio;
	nr          = 999;
	condition   = DIA_Sergio_EXIT_Condition;
	information = DIA_Sergio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Sergio_EXIT_Info()
{
	if (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)  // Nur wenn Sergio in der Kapelle ist M.F.  
	{
		AI_Output (self, other,"DIA_Sergio_EXIT_04_00");//Puisse Innos éclairer votre chemin.
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WELCOME		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr 			 =  5;
	condition	 = 	DIA_Sergio_WELCOME_Condition;
	information	 = 	DIA_Sergio_WELCOME_Info;
	important	 = 	TRUE;
};

func int DIA_Sergio_WELCOME_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other, DIA_Sergio_Isgaroth) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Sergio_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Sergio_WELCOME_04_00"); //Innos soit avec vous. Que puis-je pour vous ?
};
///////////////////////////////////////////////////////////////////////
//	Info Isgaroth
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Isgaroth		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Isgaroth_Condition;
	information	 = 	DIA_Sergio_Isgaroth_Info;
	permanent	 =  FALSE;
	important	 =  TRUE;
};
func int DIA_Sergio_Isgaroth_Condition ()
{	
	if Npc_KnowsInfo (hero,PC_PrayShrine_Paladine)
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (Kapitel == 1)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Isgaroth_Info ()
{
	AI_Output (self, other, "DIA_Sergio_Isgaroth_04_00"); //Vous avez prié pour mes frères et je tiens à vous en remercier. Dites-moi ce que je peux faire pour vous.
	
	Info_ClearChoices (DIA_Sergio_Isgaroth);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"Et pour un petit don ?",DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"Partagez avec moi votre expérience du combat.",DIA_Sergio_Isgaroth_XP);
};	
FUNC VOID DIA_Sergio_Isgaroth_Spende()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_Spende_15_00"); //Une petite donation serait fort appréciée...
	AI_Output (self, other, "DIA_Sergio_Isgaroth_Spende_04_01"); //J'espère que cet or vous sera utile.
	
	B_GiveInvItems (self,other, ItMi_Gold,100);
	Info_ClearChoices (DIA_Sergio_Isgaroth);
};
FUNC VOID DIA_Sergio_Isgaroth_XP()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_XP_15_00"); //Faites-moi part de votre expérience du combat.
	AI_Output (self, other, "DIA_Sergio_Isgaroth_XP_04_01"); //Si vous devez vous battre, veillez à ce que nul ne puisse vous prendre à revers.
	
	other.HitChance[NPC_TALENT_2H] = (other.HitChance[NPC_TALENT_2H] + 2);
	PrintScreen	(PRINT_Learn2H, -1, -1, FONT_ScreenSmall, 2);
	Info_ClearChoices (DIA_Sergio_Isgaroth);
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Aufgabe		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_Aufgabe_Condition;
	information	 = 	DIA_Sergio_Aufgabe_Info;
	description	 = 	"J'ai besoin d'avoir accès à la bibliothèque.";
};
func int DIA_Sergio_Aufgabe_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other,DIA_Sergio_Isgaroth))
	{	
		return TRUE;
	};
};
func void DIA_Sergio_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Aufgabe_15_00"); //J'ai besoin d'accéder à la bibliothèque.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_01"); //Je ne peux pas vous autoriser à y entrer. Il faut pour cela que vous vous acquittiez de vos tâches.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_02"); //Mais je peux tout de même vous être utile. Allez parler à maître Isgaroth, j'ai entendu dire qu'il avait besoin d'aide. J'irais bien lui proposer mon assistance, mais vous pouvez le faire à ma place.
	
	Sergio_Sends = TRUE;
	Wld_InsertNpc (BlackWolf,"NW_PATH_TO_MONASTER_AREA_01"); //ist richtig geschrieben! 
	
	Log_CreateTopic (Topic_IsgarothWolf,LOG_MISSION);
	Log_SetTopicStatus	 (Topic_IsgarothWolf,LOG_RUNNING);
	B_LogEntry (Topic_IsgarothWolf,"Maître Isgaroth a besoin d'aide au sanctuaire. Je devrais l'y rejoindre.");
};	

///////////////////////////////////////////////////////////////////////
//	Info WHAT
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHAT		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_WHAT_Condition;
	information	 = 	DIA_Sergio_WHAT_Info;
	description	 = 	"Que faites-vous ici ?";
};
func int DIA_Sergio_WHAT_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	{	
		return TRUE;
	};
};
func void DIA_Sergio_WHAT_Info ()
{
	AI_Output (other, self, "DIA_Sergio_WHAT_15_00"); //Que faites-vous ici ?
	AI_Output (self, other, "DIA_Sergio_WHAT_04_01"); //Je prie Innos pour qu'Il renforce mon bras et ma volonté.
	AI_Output (self, other, "DIA_Sergio_WHAT_04_02"); //Ainsi armé contre tous les périls, je pourrai vaincre tous Ses ennemis en Son honneur.
	AI_Output (other, self, "DIA_Sergio_WHAT_15_03"); //Quels ennemis ?
	AI_Output (self, other, "DIA_Sergio_WHAT_04_04"); //Tous ceux qui s'opposent à la volonté d'Innos, fussent-ils humains ou monstres.
};
///////////////////////////////////////////////////////////////////////
//	Info Babo
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Babo		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_Babo_Condition;
	information	 = 	DIA_Sergio_Babo_Info;
	description	 = 	"Pourriez-vous effectuer quelques exercices avec Babo ?";
};
func int DIA_Sergio_Babo_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other, DIA_Babo_Anliegen)
	{	
		return TRUE;
	};
};
func void DIA_Sergio_Babo_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Babo_15_00"); //Accepteriez-vous de vous entraîner avec Babo ?
	AI_Output (self, other, "DIA_Sergio_Babo_04_01"); //Pourquoi ne vient-il pas me le demander lui-même ?
	AI_Output (other, self, "DIA_Sergio_Babo_15_02"); //Je crois qu'il est timide.
	AI_Output (self, other, "DIA_Sergio_Babo_04_03"); //Je vois. Bien, si c'est si important pour lui, j'accepte de m'entraîner avec lui pendant deux heures par jour. Dites-lui que nous commencerons à cinq heures du matin.
	
	Npc_ExchangeRoutine (self, "TRAIN");
	B_StartOtherRoutine (Babo,"TRAIN");

	B_LogEntry (Topic_BaboTrain, "Sergio a accepté de s'entraîner avec Babo deux heures chaque matin à partir de maintenant."); 
};
///////////////////////////////////////////////////////////////////////
//	Info WHY
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHY		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  4;
	condition	 = 	DIA_Sergio_WHY_Condition;
	information	 = 	DIA_Sergio_WHY_Info;
	description	 = 	"Pourquoi n'êtes-vous pas avec les autres paladins ?";
};
func int DIA_Sergio_WHY_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Sergio_WELCOME)
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		return TRUE;
	};
};
func void DIA_Sergio_WHY_Info ()
{
	AI_Output (other, self, "DIA_Sergio_WHY_15_00"); //Pourquoi n'êtes-vous pas en compagnie des autres paladins ?
	AI_Output (self, other, "DIA_Sergio_WHY_04_01"); //Ma présence en ce lieu peut vous paraître étonnante, mais nous, les paladins, servons aussi les magiciens car ils prêchent la bonne parole d'Innos.
	AI_Output (self, other, "DIA_Sergio_WHY_04_02"); //Les paladins sont les guerriers d'Innos. Sa volonté est notre loi. En ce moment, j'attends les ordres des magiciens.

};
///////////////////////////////////////////////////////////////////////
//	Info ORDERS
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_ORDERS		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_ORDERS_Condition;
	information	 = 	DIA_Sergio_ORDERS_Info;
	permanent	 =  TRUE;
	description	 = 	"Et avez-vous déjà reçu de nouveaux ordres ?";
};
func int DIA_Sergio_ORDERS_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Sergio_WHY)
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE) 
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		return TRUE;
	};
};
func void DIA_Sergio_ORDERS_Info ()
{
	AI_Output (other, self, "DIA_Sergio_ORDERS_15_00"); //Et tant que vous n'avez pas de nouveaux ordres ?
	AI_Output (self, other, "DIA_Sergio_ORDERS_04_01"); //J'utilise mon temps à reprendre des forces par la prière.
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Start
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Start		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_Start_Condition;
	information	 = 	DIA_Sergio_Start_Info;
	permanent	 =  FALSE;
	description	 = 	"Vous devez m'escorter jusqu'à la passe.";
};
func int DIA_Sergio_Start_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&&	(Sergio_Follow == TRUE)
	&&  (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Start_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Start_15_00"); //Escortez-moi jusqu'au col.
	AI_Output (self, other, "DIA_Sergio_Start_04_01"); //Très bien. Suivez-moi, je connais le chemin.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;  
	self.npctype = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine (self,"GUIDE"); 
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Guide		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_Guide_Condition;
	information	 = 	DIA_Sergio_Guide_Info;
	permanent	 =  TRUE;
	description	 = 	"Qu'y a-t-il?";
};
func int DIA_Sergio_Guide_Condition ()
{	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE) 
	&& (Npc_GetDistToWP (self,"NW_TO_PASS_01") > 1000)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Guide_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Guide_15_00"); //Comment ça se passe ?
	AI_Output (self, other, "DIA_Sergio_Guide_04_01"); //Je vais vous amener jusqu'au col, mais c'est une fois que nous y serons que notre voyage deviendra vraiment dangereux.
	AI_Output (self, other, "DIA_Sergio_Guide_04_02"); //Mais ne perdons pas de temps. Il faut continuer.
	
	AI_StopProcessInfos (self);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Ende
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Ende		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Ende_Condition;
	information	 = 	DIA_Sergio_Ende_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Sergio_Ende_Condition ()
{	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE) 
	&& (Npc_GetDistToWP (self,"NW_TO_PASS_01") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Ende_Info ()
{
	AI_Output (self, other, "DIA_Sergio_Ende_04_00"); //Nous y sommes. J'ignore ce qui vous attend dans la Vallée des mines, mais j'espère que vous retrouverez votre chemin.
	AI_Output (other, self, "DIA_Sergio_Ende_15_01"); //Ne craignez rien, je reviendrai.
	AI_Output (self, other, "DIA_Sergio_Ende_04_02"); //Innos vous garde. Puisse sa protection vous suivre partout où vous irez.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE; 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START"); 
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Perm		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Perm_Condition;
	information	 = 	DIA_Sergio_Perm_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Sergio_Perm_Condition ()
{	
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Perm_Info ()
{
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Sergio_Perm_04_00"); //Pour Innos, frère. Si vous venez au sujet de la Consécration de l'épée, c'est à Marduk qu'il vous faut poser vos questions.
	}
	else
	{
		AI_Output (self, other, "DIA_Sergio_Perm_04_01"); //J'ai entendu parler de vous. C'est vous qui venez des fermes et qui êtes allé dans la Vallée des mines. Mes respects.
	};
	AI_StopProcessInfos (self);
	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sergio_PICKPOCKET (C_INFO)
{
	npc			= PAL_299_Sergio;
	nr			= 900;
	condition	= DIA_Sergio_PICKPOCKET_Condition;
	information	= DIA_Sergio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Sergio_PICKPOCKET_Condition()
{
	C_Beklauen (78, 85);
};
 
FUNC VOID DIA_Sergio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sergio_PICKPOCKET);
	Info_AddChoice		(DIA_Sergio_PICKPOCKET, DIALOG_BACK 		,DIA_Sergio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sergio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sergio_PICKPOCKET_DoIt);
};

func void DIA_Sergio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sergio_PICKPOCKET);
};
	
func void DIA_Sergio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sergio_PICKPOCKET);
};




 









