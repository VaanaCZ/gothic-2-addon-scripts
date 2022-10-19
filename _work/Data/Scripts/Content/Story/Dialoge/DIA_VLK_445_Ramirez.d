//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_EXIT   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 999;
	condition   = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ramirez_PICKPOCKET (C_INFO)
{
	npc			= VLK_445_Ramirez;
	nr			= 900;
	condition	= DIA_Ramirez_PICKPOCKET_Condition;
	information	= DIA_Ramirez_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Ramirez_PICKPOCKET_Condition()
{
	C_Beklauen (90, 300);
};
 
FUNC VOID DIA_Ramirez_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_BACK 		,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
	
func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Zeichen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Zeichen_Condition;
	information = DIA_Ramirez_Zeichen_Info;
	permanent   = FALSE;
	description = "(Faire le signe de reconnaissance des voleurs)";
};

FUNC INT DIA_Ramirez_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Ramirez_Zeichen_14_00");//Eh bien, eh bien... Vous connaissez le signe. (b�ille) Je suis impressionn�.
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Hallo   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent   = TRUE;
	important	= TRUE;
};
//----------------------------------
var int DIA_Ramirez_Hallo_permanent;
//----------------------------------
FUNC INT DIA_Ramirez_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Ramirez_Hallo_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Hallo_Info()
{
	if (self.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Join_Thiefs == FALSE) 
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_00");//Vous vous �tes �gar�? Je ne crois pas que cet endroit soit pour vous.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_01");//Si quelque chose vous arrive ici, personne ne viendra � votre secours. Alors prenez garde. (sourit de toutes ses dents)
	};
	if  (Join_Thiefs == TRUE)  
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_02");//Alors, comme �a, vous �tes des n�tres�? Dans ce cas, bonne chance... et prudence, quoi que vous fassiez.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_03");//Oh, une derni�re chose�: je me moque de qui vous �tes ou des gens avec qui vous travaillez � la surface...
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_04");//Mais quand vous descendez ici, vous devenez l'un des n�tres, ni plus, ni moins.
		DIA_Ramirez_Hallo_permanent = TRUE;
	};
	
	DG_gefunden = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Beute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Beute   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 3;
	condition   = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ramirez_Beute_Condition()
{
	if ((Mob_HasItems ("THIEF_CHEST_01",ItMi_Gold) < 50)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Gold) < 100)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Silvercup) == FALSE)
	|| (Mob_HasItems  ("THIEF_CHEST_03",ItMi_Gold) < 75))
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Beute_Info()
{
	AI_Output (self, other, "DIA_Ramirez_Beute_14_00");//Vous n'�tes pas s�rieux, si�? Vous prenez notre or... vous essayez de nous voler�?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_01");//Ne vous excitez pas pour une ou deux pi�ces d'or.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_02");//Ce qu'il y a l�, ce n'est quand m�me pas la totalit� de votre butin, si�? Vous n'allez pas me faire croire que la guilde des voleurs de Khorinis n'est pas plus riche que �a�!
	AI_Output (self, other, "DIA_Ramirez_Beute_14_03");//Qui a dit que notre butin �tait cach� ici�?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_04");//Je dois dire que je n'y croyais pas, en fait. Alors, o� l'avez-vous mis�?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_05");//En lieu s�r.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_06");//Je vois.
	AI_Output (self, other, "DIA_Ramirez_Beute_14_07");//D'accord, vous pouvez garder l'or. Mais je vous ai � l'�il, alors attention � ce que vous faites.
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Bezahlen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 9;
	condition   = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent   = TRUE;
	description	= "Pouvez-vous m'enseigner quelque chose ?";
};
//--------------------------------------
var int DIA_Ramirez_Bezahlen_permanent;
//--------------------------------------
FUNC INT DIA_Ramirez_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (DIA_Ramirez_Bezahlen_permanent == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Info()
{	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		Ramirez_Cost = 150;
	}
	else 
	{
		Ramirez_Cost = 300;
	};	
		
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_15_00");//Pouvez-vous m'apprendre quelque chose ?
	
	if (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_01");//Je n'ai rien � vous apprendre. Vous savez d�j� tout ce qu'il y a � savoir sur le crochetage des serrures.
		if (other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output (self, other, "DIA_Ramirez_Add_14_00"); //Il vous reste juste � am�liorer votre agilit�.
		};
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_02");//Je peux vous montrer comment crocheter une serrure pour la modique somme de...
		B_Say_Gold (self, other, Ramirez_Cost);
		
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"Peut-�tre plus tard... (RETOUR)",DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"D'accord, je paierai...",DIA_Ramirez_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Ramirez_Bezahlen);
};
FUNC VOID DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_00");//D'accord. Va pour...
	
	if B_GiveInvItems (other, self, ItMi_Gold, Ramirez_Cost)
	{
		AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_01");//Voici votre or.
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_02");//Excellent�! Je suis � votre service.
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_03");//Revenez quand vous aurez de quoi payer.
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	};

};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Teach   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 99;
	condition   = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent   = TRUE;
	description = "Apprenez-moi comment crocheter une serrure !";
};

FUNC INT DIA_Ramirez_Teach_Condition()
{	
	if (Ramirez_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Teach_Info()
{
	AI_Output (other,self, "DIA_Ramirez_Teach_15_00");//Montrez-moi comment crocheter une serrure.
	
	if (Ramirez_Zweimal == FALSE)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_06");//Le crochetage est l'art qui diff�rencie les grands voleurs des amateurs.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_01");//Il faut beaucoup de doigt� et d'intuition pour y arriver. Et de bons crochets bien s�r.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_02");//Quelques coffres sont toutefois �quip�s d'une serrure sp�ciale qui ne peut �tre ouverte qu'avec la cl� correspondante.
		Ramirez_Zweimal = TRUE;
	}
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_03");//Agenouillez-vous devant la serrure, introduisez votre crochet � l'int�rieur et tournez-le d�licatement vers la gauche et la droite.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_04");//Si vous �tes trop brusque, vous le casserez.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_05");//Plus vous en prendrez l'habitude, plus il vous sera facile d'utiliser votre crochet.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info oberes Viertel
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Viertel   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 8;
	condition   = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent   = FALSE;
	description = "O� cela vaut-il le coup d'entrer par effraction ?";
};
FUNC INT DIA_Ramirez_Viertel_Condition()
{
	if (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Viertel_Info()
{	
	AI_Output (other, self, "DIA_Ramirez_Viertel_15_00");//O� cela vaut-il la peine de s'introduire ill�galement�?
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_01");//Dans les maisons du haut quartier, bien s�r.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_02");//Mais si vous voulez vous introduire dans l'une d'elles, attendez la nuit que tout le monde dorme. Sauf les gardes, bien s�r.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_03");//Eux, ils patrouillent � la nuit tomb�e. Mais j'en connais un qui s'appelle Wambo. Tout ce qui l'int�resse, c'est l'or.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_04");//Il est cher, mais une fois qu'on l'a pay�, plus de souci � se faire.
};
///////////////////////////////////////////////////////////////////////
//	Info Sextant
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Sextant   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent   = FALSE;
	description = "Avez-vous du travail pour moi ?";
};

FUNC INT DIA_Ramirez_Sextant_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Sextant_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_00");//Vous avez du travail pour moi�?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_01");//Hmm... il y a bien un objet sur lequel j'aimerais mettre la main, mais je n'en ai encore jamais trouv�.
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_02");//De quoi s'agit-il�?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_03");//D'un sextant. Apportez-m'en un et je vous en offrirai un bon prix.
	
	Log_CreateTopic (Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus (Topic_RamirezSextant, LOG_RUNNING);
	B_LogEntry (Topic_RamirezSextant, "Ramirez veut que je lui rapporte un sextant.");
	
	MIS_RamirezSextant = LOG_RUNNING;
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Success   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent   = FALSE;
	description = "J'ai un sextant.";
};

FUNC INT DIA_Ramirez_Success_Condition()
{
	if Npc_KnowsInfo (other, DIA_Ramirez_Sextant)
	&& (Npc_HasItems (other, Itmi_Sextant ) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Success_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Success_15_00");//J'ai le sextant que vous vouliez.
	B_GiveInvItems (other, self, Itmi_Sextant,1);
	AI_Output (self, other, "DIA_Ramirez_Success_14_01");//Incroyable�! Vous avez r�ussi � en trouver un�?
	AI_Output (self, other, "DIA_Ramirez_Success_14_02");//Tenez, vous avez bien m�rit� votre argent.
	
	B_GiveInvItems (self, other, Itmi_Gold,Value_Sextant/2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP (XP_RamirezSextant);
};


