// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //H�! On se conna�t�?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //C'est possible. J'�tais � la colonie moi aussi.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Ah, oui, c'est �a. Qu'est-ce que vous me voulez�?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "Comment �a se passe ?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //Comment �a va ?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Nous avons de gros ennuis en ce moment. Deux factions commencent � se dessiner au sein de notre groupe.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio et ses fid�les pensent que le plan de Lee n'est pas le bon.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "Comment se fait-il qu'il y ait deux factions ?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //Comment se fait-il qu'il y ait deux factions diff�rentes�?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //Pour la plupart, on vient de la colonie et on est sous les ordres de Lee depuis le d�but.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Mais certains nous ont rejoints par la suite.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Eux venaient du sud, o� ils avaient affront� les orques.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //Sans qu'on sache comment, ils ont entendu dire que Lee avait besoin d'hommes. Sylvio �tait � leur t�te.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //Il a accept� de laisser le commandement � Lee mais maintenant, il essaye de fomenter une r�bellion.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //La plupart des hommes de Lee pensent que ce n'est pas vraiment un probl�me, mais je connais les types comme Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Il est pr�t � tout pour r�aliser son ambition.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "Savez-vous ce que compte faire Lee ?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //Savez-vous ce que Lee compte faire�?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Il veut attendre que les paladins de la ville n'aient plus � manger.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Il a l'intention de nous faire quitter l'�le � tous. Et Innos m'en est t�moin, c'est vrai que �a ne me d�plairait pas le moins du monde.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //Je ne sais pas comment il compte proc�der, mais je lui fais confiance. Jusque-l�, on n'a pas eu � se plaindre de lui.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "Savez-vous ce que pr�pare Sylvio ?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //Savez-vous ce que Sylvio mijote�?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Il a d�couvert qu'une partie des paladins sont retourn�s � l'ancienne colonie.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //Selon lui, ceux qui restent n'oseront jamais nous attaquer ici et il souhaite tirer profit de la situation.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Son plan est simple�: piller les petits fermes, attaquer les patrouilles auxquelles la milice se livre en dehors de la ville, d�valiser les voyageurs, ce genre de choses.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Mais Lee pense que c'est ce que nous pourrions faire de pire compte tenu de la situation.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "Je veux devenir mercenaire !";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //Je veux devenir un mercenaire�!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //Je ne pense pas que ce soit une bonne id�e...
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //Quel est le probl�me�?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //Eh bien, il me faudrait voter pour ou contre vous.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //Et compte tenu de la situation, je ne pourrais voter pour vous que si j'avais la certitude que vous �tes du c�t� de Lee.
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "Alors que devrais-je faire ?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //Que faut-il que je fasse pour vous en convaincre�?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //C'est simple�: tabassez quelques types de Sylvio. De cette fa�on, les deux camps sauront � quoi s'en tenir avec vous.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //Et si vous respectez les r�gles des duels, vous gagnerez m�me le respect des autres.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis veut que je triomphe de quelques gars de Sylvio. Apr�s il me donnera son vote.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "Quelles sont les r�gles d'un duel ?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //Quelles sont les r�gles en vigueur au cours d'un duel�?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //Si �a vous int�resse, allez voir Torlof. Il vous expliquera tout �a.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //Et pour qu'il n'y ait pas de malentendu entre nous�: moi, je m'en moque, que vous respectiez les r�gles ou non. Tout ce que je vous demande, c'est que les types que vous choisirez finissent le nez dans la gadoue.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Et je n'ai m�me pas besoin de respecter les r�gles du duel...");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "Quels mercenaires sont les hommes de Sylvio ?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Qui sont les hommes de Sylvio�?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Ils sont six en tout. Il y a d'abord Sylvio lui-m�me et son bras droit, Bullco.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //Plus Rod, Sentenza, Fester et Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //Les autres sont soit neutres, soit du c�t� de Lee.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Les hommes de Sylvio sont Sylvio lui-m�me, son lieutenant Bullco, Rod, Sentenza, Fester et Raoul.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "Combien d'hommes de Sylvio dois-je vaincre ?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //Combien d'hommes de Sylvio dois-je battre ?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Faites mordre la poussi�re � trois d'entre eux et vous aurez prouv� dans quel camp vous �tes.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Choisissez ceux que vous voulez, �a ne me regarde pas.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Oh, juste un conseil�: il ne s'agit pas de faire la preuve de votre courage, alors, ne d�fiez surtout pas Sylvio. Il vous r�duirait en bouillie.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Si je triomphe de trois des hommes de Sylvio, cela suffira. Mais je ferais bien d'�viter de d�fier Sylvio.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "Combien reste-t-il d�hommes de Sylvio sur ma liste ?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //Il y a encore combien d'hommes de Sylvio sur ma liste�?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //J'ai battu Bullco.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //Il para�t. Pas mal.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod est mignon avec ses nouveaux bleus.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza a essay� de me racketter. C'�tait pas une bonne id�e.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //J'ai assomm� Sentenza.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester a voulu m'apprendre une danse. Grave erreur...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester n'a eu que ce qu'il m�ritait.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //Quant � Raoul...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Je suis all� voir Raoul.
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //Et ?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Il avait besoin d'une bonne racl�e pour se remettre les id�es en place.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //Vous n'avez pas encore cogn� le moindre homme de Sylvio.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Bien. Continuez comme �a.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //Je tiens � ce que vous en assommiez au moins trois.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //C'est bon, �a suffira.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Vous leur avez vraiment refait le portrait � tous, hein�?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //Tr�s impressionnant. Si Lee me demande mon avis, je voterai pour vous sans la moindre h�sitation.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Jarvis votera pour moi si je veux me joindre aux mercenaires.");
	};
};


// ###############################
// ##							##
// 			H�here Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "Des nouvelles ?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Des nouvelles ?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Vous �tes des n�tres d�sormais. C'est une bonne nouvelle.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Vous avez fait le mauvais choix. Vous auriez pu �tre des n�tres.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //La bande a Sylvio est nettement plus calme ces temps-ci. (rire sadique)
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Sylvio nous a enfin d�barrass� le plancher. Quand il a entendu parler des dragons, lui et plusieurs de ses hommes sont partis en direction de la colonie mini�re.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //Il croit sans doute qu'il pourra s'enrichir l�-bas.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Rien. Tout est calme pour le moment. Je me demande comment tout �a va se finir...
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





