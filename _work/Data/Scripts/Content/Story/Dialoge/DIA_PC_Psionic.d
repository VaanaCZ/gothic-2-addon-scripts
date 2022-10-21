// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_EXIT_Condition;
	information	= DIA_Lester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_Hello (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Hello_Condition;
	information	= DIA_Lester_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       
FUNC INT DIA_Lester_Hello_Condition()
{	
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Hello_Info()
{	
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//Est-ce vraiment vous ? Bon sang, qu'est-ce que ça fait plaisir de vous voir !

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "Est-ce que je vous connais ?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lester ! Comment êtes-vous arrivé ici ?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lester ! Comment diable êtes-vous arrivé ici ?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//Mon évasion a été complètement folle. Après l'explosion de la Barrière, j'ai passé quelque temps à errer au hasard, en proie à la plus totale confusion.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Et puis, il m'a fallu quelques jours pour trouver la sortie de ses bois, et finalement arriver à cette vallée.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten et Gorn se trouvent toujours dans la Vallée des mines. Ou du moins, il me semble.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//Suis-je censé vous connaître ?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Ohé ! Il y a quelqu'un ? J'ai risqué ma peau pour que vous puissiez obtenir cette pierre étrange.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Vous me devez quelque chose. Cette fois-ci, vous devriez vous en rappeler.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//Vous vous souvenez de Diego, Milten et Gorn ?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten et QUI ?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Bien sûr. Et qu'en est-il d'eux ?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Bien sûr, pourquoi ?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Autant que je sache, ils ont dû survivre à la destruction de la Barrière.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Mais je n'ai pas la moindre idée de l'endroit où ils peuvent bien se trouver. Nul doute qu'ils sont encore dans la Vallée des mines.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Si vous les croisez, tenez-moi au courant.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten et qui ?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Ne me dites pas que vous avez tout oublié... les pierres de focalisation, le troll, l'énorme tas de minerai des Mages de l'eau...
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Je ne sais plus trop...
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Ça va revenir. Moi aussi il m'a fallu un peu de temps pour reprendre mes esprits.
};
// ************************************************************
// 		  				  Was ist passiert?		//E1
// ************************************************************
INSTANCE DIA_Lester_WhatHappened (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_WhatHappened_Condition;
	information	= DIA_Lester_WhatHappened_Info;
	permanent	= FALSE;
	description = "Que s'est-il passé ?";
};                       
FUNC INT DIA_Lester_WhatHappened_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_WhatHappened_Info()
{	
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//Que s'est-il passé ?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//A la mort du Dormeur, tous les membres de la confrérie ont perdu la raison.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Sans leur maître, ils sont devenus des coquilles vides.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//Et vous ?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//Ç'a été la même chose pour moi. J'ai souffert de cauchemars, et même d'hallucinations. Mais quand j'ai repris mes esprits, je suis parti en courant.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//A un moment, il m'a semblé voir une ombre immense s'abattre sur un groupe de fugitifs et les incinérer dans une grande gerbe de feu.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//A cet instant-là, j'ai bien cru que j'allais finir tué par un dragon !
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Avez-vous vu autre chose ?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//Non. J'ai filé sans demander mon reste.
};
// ************************************************************
// 		  				   Minental		 		//E1 
// ************************************************************
INSTANCE DIA_Lester_MineColony (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_MineColony_Condition;
	information	= DIA_Lester_MineColony_Info;
	permanent	= FALSE;
	description = "Depuis combien de temps vous cachez-vous dans cette vallée ?";
};                       
FUNC INT DIA_Lester_MineColony_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_MineColony_Info()
{	
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//Depuis combien de temps vous cachez-vous dans cette vallée ?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//Je ne sais pas au juste. Peut-être une semaine. Mais il y a autre chose que je dois vous dire...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Quand je suis arrivé ici, à la tombée de la nuit, j'ai longtemps observé la montagne. Il n'y avait rien d'autre que quelques arbres sur ses pentes.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//Et le lendemain matin, la tour était là. Pourtant, je suis prêt à jurer qu'elle ne s'y trouvait pas la veille ! Depuis, je n'ai pas quitté la vallée.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//La tour de Xardas, vous voulez dire ? Je savais qu'il était puissant, mais créer une tour de la sorte...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Xardas le nécromancien ? C'est lui qui réside dans cette tour ? On ne peut pas dire que la nouvelle me plaise.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Ne vous en faites pas, c'est lui qui m'a tiré du temple du Dormeur. Il est de notre côté.
};
///////////////////////////////////////////////////////////////////////
//	Info SEND_XARDAS
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_SEND_XARDAS		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_SEND_XARDAS_Condition;
	information	 = 	DIA_Lester_SEND_XARDAS_Info;
	permanent	 = 	FALSE;
	description	 = 	"Vous devez parler de l'ombre à Xardas...";
};
func int DIA_Lester_SEND_XARDAS_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Lester_WhatHappened)
	&& Npc_KnowsInfo (other,DIA_Lester_MineColony)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_SEND_XARDAS_Info ()
{
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Parlez de l'ombre à Xardas. C'est peut-être important.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //Vous ne croyez pas que j'ai halluciné ? Vous pensez que ce pourrait vraiment être un...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //Un dragon, oui.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Vous allez encore vous retrouver au beau milieu des ennuis, je me trompe ?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Je ne crois pas, non. Du moins, pas encore...
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //(soupire) Bon, d'accord. Si c'est si important que ça, j'irai le voir. Mais pas maintenant.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //Pour le moment, je vais me reposer. Je suis encore épuisé à cause de mon évasion de la colonie pénitentiaire.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //Je crois que vous avez de grandes ambitions. Je vous retrouve chez Xardas.
	
	AI_StopProcessInfos (self);
	
	//wird bei LOLO zu Xardas gebeamt
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_STADT		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_STADT_Condition;
	information	 = 	DIA_Addon_Lester_STADT_Info;

	description	 = 	"Je suis en route pour KHORINIS ! Que savez-vous de cette ville ?";
};

func int DIA_Addon_Lester_STADT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_STADT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //Je vais vers Khorinis ! Que savez-vous sur cette ville ?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Khorinis ? Et bien, c'est une ville portuaire, pas grand-chose à en dire de plus.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Pourquoi demandez-vous ?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Je dois aller voir les paladins qui, d'après ce qu'on dit, sont en ville.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //(rit) Vraiment ? Ah on ne vous laissera même pas rentrer en ville et encore moins aller là où se trouvent les paladins.
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_Vorschlag		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_Vorschlag_Condition;
	information	 = 	DIA_Addon_Lester_Vorschlag_Info;

	description	 = 	"Pouvez-vous me dire comment je peux rentrer dans la ville ?";
};

func int DIA_Addon_Lester_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lester_STADT))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //Pouvez-vous me dire comment je peux rentrer dans la ville ?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Certainement. J'ai travaillé un certain temps pour un vieil alchimiste du nom de Constantino.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //C'est un homme influent dans cette ville, et il a donné des instructions aux gardes à la porte pour qu'ils laissent entrer quiconque peut lui vendre des herbes rares.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //C'est vraiment très facile. Vous ramassez une grosse poignée de plantes qui poussent un peu partout et vous prétendez travailler pour Constantino et vous voilà dans la place.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Cependant ne ramassez pas seulement un peu de ci et de ça. Les gardes sont loin d'être fûtés et ils ne connaissent à rien à l'alchimie.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //Mais la brassée doit avoir bel aspect si vous voulez passer.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //Je pense qu'une dizaine de spécimens d'une même sorte de plantes fera l'affaire.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Merci pour l'astuce.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester m'a dit que les gardes de la ville me laisseront passer avec 10 plantes d'un même type, si je leur dis que les plantes sont destinées au vieil alchimiste Constantino."); 
	
	MIS_Addon_Lester_PickForConstantino = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info PASSAGEPLANTSSUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;

	description	 = 	"Le prétexte des plantes pour Constantino a fonctionné à merveille.";
};

func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition ()
{
	if (MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //Cette astuce avec les plantes pour Constantino marche comme un charme. Cela m'a permis de passer les gardes de la ville.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //Comme je viens de le dire. Vous devriez m'écouter de temps en temps, mon ami.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 		  		Perm	
// ************************************************************
INSTANCE DIA_Lester_Perm (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Perm_Condition;
	information	= DIA_Lester_Perm_Info;
	permanent	= TRUE;
	description = "Que savez-vous à propos de ce secteur ?";
};                       
FUNC INT DIA_Lester_Perm_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_LESTER") <= 2000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Perm_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//Que savez-vous au sujet des environs ?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Si vous continuez par là, vous arriverez à une ferme. La ville commence peu après.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Mais méfiez-vous, car il n'y a pas que des loups et des rats dans la région. On y trouve également des gobelins et des brigands.
};
// ************************************************************
// 		  		Sleep
// ************************************************************
INSTANCE DIA_Lester_Sleep (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Sleep_Condition;
	information	= DIA_Lester_Sleep_Info;
	permanent	= TRUE;
	description = "Etes-vous toujours épuisé ?";
};                       
FUNC INT DIA_Lester_Sleep_Condition()
{
	if  (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_IN1_31") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Sleep_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Vous êtes toujours épuisé ?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//Et comment ! (bâille) J'ai tout raconté à Xardas. Et maintenant, je vais dormir pendant un jour...
	AI_Output	(self, other,"DIA_Lester_Sleep_13_02");	//... Ou deux... ou davantage...
	
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Lester_KAP3_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP3_EXIT_Condition;
	information	= DIA_Lester_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BACKINTOWN
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_BACKINTOWN		(C_INFO) 
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_BACKINTOWN_Condition;
	information	 = 	DIA_Lester_BACKINTOWN_Info;
	important	 = 	TRUE;
};
func int DIA_Lester_BACKINTOWN_Condition ()
{	
	if (Npc_GetDistToWP (self, "LEVELCHANGE") <= 500) 
		&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_BACKINTOWN_Info ()
{
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //Ah, vous revoilà ! Il vous faut aller voir Xardas sans attendre, il y a un problème...
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //Ça, je veux bien le croire.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //C'est la panique la plus totale, depuis que vous êtes parti.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Allez parler à Xardas, il vous attend.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas m'a remis cette rune à votre intention. Elle vous aidera à le rejoindre plus rapidement. Je vous retrouverai chez lui.
	
	CreateInvItems 		(self,ItRu_TeleportXardas,1);
	B_GiveInvItems 		(self,other,ItRu_TeleportXardas,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");	//Joly: Lester geht wieder zurück in sein Tal!
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_PERM3		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	900;
	condition	 = 	DIA_Lester_PERM3_Condition;
	information	 = 	DIA_Lester_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous n'avez pas l'air très bien.";
};

func int DIA_Lester_PERM3_Condition ()
{
	if (Kapitel >= 3)
	&& (Lester_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

var int DIA_Lester_PERM3_OneTime;
func void DIA_Lester_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //Vous n'avez pas l'air en forme.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //Je ne le suis pas. En fait, je suis totalement épuisé et j'ai de terribles migraines.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Et c'est de pire en pire chaque fois que je vois un de ces types en capuchon noir.
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //Je sais exactement pourquoi.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Ah, bon ? Je ne suis pas sûr de vouloir être mis au courant...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Ces hommes en capuchon noir ou Traqueurs, comme les magiciens les appellent, étaient autrefois les fidèles serviteurs d'un puissant archidémon. Cela vous dit quelque chose ?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Hmm... non. A moins que vous ne soyez en train d'essayer de me faire comprendre que...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //Exactement. Les Traqueurs étaient les disciples du Dormeur. Ils faisaient partie de la secte de dingues du camp des marais.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //Ce sont vos anciens compagnons, Lester. Les membres de la confrérie du Dormeur. Ils sont désormais devenus des créatures malfaisantes, incapables de penser par elles-mêmes.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Il m'est venu une idée, mais j'espère qu'elle n'est pas fondée. Pensez-vous qu'il soit de retour ? Le Dormeur, je veux dire... est-il revenu ?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Bonne question. Tout ce que je sais, c'est qu'il me faut arrêter les Traqueurs avant qu'ils ne deviennent trop puissants.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //Ça ne me plaît pas, mais j'imagine que vous avez raison. Pardon, mais toute cette histoire me monte à la tête.
					B_LogEntry (TOPIC_DEMENTOREN,"Mes soupçons sont confirmés. Même Lester est convaincu que les Traqueurs sont au service des Dormeurs du camp du vieux marais."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //Les migraines sont toujours là mais, avec un peu de chance, le problème sera bientôt réglé...
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //D'une manière ou d'une autre...
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //Mes migraines deviennent presque insupportables. Et maintenant les hommes-lézards m'attaquent sans cesse. Je me demande d'où ils viennent.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //Ces migraines ne s'arrêtent pas. Quelque chose se prépare...
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //(soupire) Je crois que je vais d'abord aller me reposer.
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

INSTANCE DIA_Lester_KAP4_EXIT(C_INFO)
{
	npc		= PC_Psionic;
	nr		= 999;
	condition	= DIA_Lester_KAP4_EXIT_Condition;
	information	= DIA_Lester_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP4_EXIT_Info()
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

INSTANCE DIA_Lester_KAP5_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP5_EXIT_Condition;
	information	= DIA_Lester_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info XardasWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_XARDASWEG		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_XARDASWEG_Condition;
	information	 = 	DIA_Lester_XARDASWEG_Info;

	description	 = 	"Où est Xardas ?";
};

func int DIA_Lester_XARDASWEG_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_00"); //Où est Xardas ?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Il est parti en laissant ces êtres démoniaques à l'intérieur de sa tour.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Je pense qu'il ne veut pas que qui que ce soit y entre en son absence.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Où est-il allé ?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //Il ne l'a pas dit. Il m'a juste demandé de vous remettre cette lettre de sa part.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //Je l'ai lue. Pardon, mais la curiosité a été la plus forte.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //Et ?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //Très honnêtement, je n'en ai pas compris un traître mot. Mais une chose est claire à mes yeux : on ne le reverra pas de sitôt.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //Je pense que la situation est devenue trop dangereuse pour lui et qu'il est parti pour les collines.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas a disparu. Lester m'a remis une lettre que Xardas a laissée pour moi."); 
};


///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lester_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"J'ai découvert où l'ennemi se cachait.";
};
func int DIA_Lester_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lester_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lester_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //J'ai découvert où l'ennemi se cache.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Ne me demandez pas pourquoi, mais j'ai la sensation qu'il serait bon que je vienne avec vous.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //Qu'entendez-vous par là ?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //Je ne peux vous l'expliquer, mais je sais que je n'aurai les réponses à mes questions que si je vous accompagne.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Je regrette, mais mon équipage est déjà au complet.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Peut-être ma destinée n'a-t-elle pas la moindre importance comparée aux événements qui se préparent...
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //Vous savez ce que vous avez à faire. Luttez contre le mal et ne vous préoccupez pas de moi.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //Je ne compte pas.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Je ne peux pas vous emmener avec moi.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Alors venez avec moi pour trouver les réponses à vos questions.",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Alors, accompagnez-moi et vous aurez vos réponses !
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Je vous rejoindrai au port. J'irai dès que je serai prêt.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Faites vite, le temps nous est compté.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};

FUNC VOID DIA_Lester_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //Je ne peux pas vous emmener avec moi.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Je comprends. Je ne vous serais probablement d'aucune aide.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //Mais qui que vous emmeniez avec vous, assurez-vous bien qu'il s'agit de gens de confiance.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //Et prenez bien soin de vous.

	Lester_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_LeaveMyShip_Condition;
	information	 = 	DIA_Lester_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"En fait, je n'ai plus de place pour vous.";
};
func int DIA_Lester_LeaveMyShip_Condition ()
{	
	if (Lester_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lester_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Finalement, je n'ai pas assez de place pour vous emmener.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Je vous comprends. Je prendrais sans doute la même décision si j'étais à votre place.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Si vous avez besoin de moi, je vous aiderai. Vous savez où me trouver.
	
	Lester_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_StillNeedYou_Condition;
	information	 = 	DIA_Lester_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"J'ai besoin d'un ami pour m'aider.";
};
func int DIA_Lester_StillNeedYou_Condition ()
{	
	if ((Lester_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lester_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //J'ai besoin d'un ami qui accepte de m'aider.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //Je le savais ! Nous allons faire cela ensemble, comme autrefois !
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Les forces du mal ont intérêt à prendre garde, car nous allons leur tomber dessus !
		
		self.flags 		 = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Finalement, je pense qu'il vaut mieux que je reste ici. Au revoir.
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6 //auf der Dracheninsel ->Neue Instanz!!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lester_KAP6_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP6_EXIT_Condition;
	information	= DIA_Lester_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_PC_Psionic_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 900;
	condition	= DIA_PC_Psionic_PICKPOCKET_Condition;
	information	= DIA_PC_Psionic_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_PC_Psionic_PICKPOCKET_Condition()
{
	C_Beklauen (76, 20);
};
 
FUNC VOID DIA_PC_Psionic_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_BACK 		,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};
	
func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};




































