// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Vous avez tu� ma Gritta�! Je ne vous le pardonnerai jamais�! Hors de ma vue, assassin�!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //Ah, un nouveau visage�! Vous n'�tes pas de Khorinis, n'est-ce pas�?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //La p�riode n'est pas bonne pour les voyageurs. Les brigands sont partout, il n'y a plus de travail, et voil� que les fermiers se r�voltent maintenant.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //Quel bon vent vous am�ne par ici�?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "Je cherche du travail.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //Je cherche du travail.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //Savez-vous travailler le bois�?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //Le bois, je sais juste m'en servir pour allumer un feu.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //Et les serrures, vous connaissez�?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //Euh...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Je regrette, mais je ne peux pas vous proposer de travailler si vous ne connaissez rien � mon m�tier.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //Et je n'ai pas les moyens de me payer un apprenti.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben ne veut pas de moi comme apprenti.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "Et qu'en est-il si je veux devenir l'apprenti d'un autre ma�tre ?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //Et si je devenais l'apprenti de l'un des autres ma�tres�?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //Tr�s bien, je vous donne mon accord.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Mais je vous conseille de commencer par obtenir la b�n�diction des dieux.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Au fait, �tes-vous croyant�?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "Si vous voulez le savoir, je fais mes pri�res r�guli�rement...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Oui. Un serviteur des plus humbles, ma�tre Thorben.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Dans ce cas, allez voir Vatras, le pr�tre d'Adanos, et demandez-lui de vous donner sa b�n�diction.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //Il vous dira o� trouver un pr�tre d'Innos, et il serait bon que vous alliez lui demander de vous b�nir, � lui aussi.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Une fois cela fait, ma voix vous sera acquise.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben me donnera son accord si un pr�tre d'Adanos et un pr�tre d'Innos m'accordent leur b�n�diction.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Oui, mais je ne suis qu'un humble disciple, ma�tre Thorben...
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //Eh bien, si vous voulez savoir si je dis r�guli�rement mes pri�res...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //Je vois.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //Jamais je ne donnerai mon accord � un homme qui voudrait faire son m�tier sans la b�n�diction des dieux.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Allez demander aux dieux de vous pardonner vos transgressions.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "Et puis-je compter sur votre approbation, ma�tre ?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //Me donnez-vous votre accord, ma�tre�?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Vatras vous a-t-il donn� sa b�n�diction�?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Oui.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //Et avez-vous �galement re�u celle d'un pr�tre d'Innos�?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Oui.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //Dans ce cas, vous aurez �galement la mienne. Quelle que soit la voie que vous choisissez, faites au mieux et soyez fier de vous chaque fois que vous faites du bon travail.
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Thorben me donnera son accord si je veux commencer � travailler en tant qu'apprenti.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //Non, pas encore.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Vous savez ce que j'exige�: tout homme doit recevoir la b�n�diction des dieux pour pouvoir faire son travail dans les meilleures conditions.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Pas encore.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //Dans ce cas, je ne comprends pas pourquoi vous �tes revenu me voir. Vous savez pourtant ce que j'exige.
	};
};

// ************************************************************
// 		Was wei�t du �ber Schl�sser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "Ainsi vous en connaissez un rayon sur le crochetage de serrures ?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //Ainsi, vous vous y connaissez en serrures�?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //A quoi servirait un coffre bien solide sans une bonne serrure�?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Je fabrique moi-m�me mes propres serrures. De cette mani�re, je sais que le travail que je produis pour r�aliser mes coffres ne sera pas g�ch� par une serrure de pi�tre qualit�.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //Une serrure de mauvaise qualit� se brise facilement, et on ne compte plus les voleurs qui op�rent � Khorinis, surtout depuis quelque temps.
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "J'ai le grand livre de Lehmar...";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //J'ai le grand livre de Lehmar ici m�me...
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //(soup�onneux) Comment vous l'�tes-vous procur�?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Ce qui devrait vous int�resser, c'est que votre nom figure � l'int�rieur...
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Donnez-moi �a�!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //Que m'offrez-vous en �change�?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //Je n'ai pas d'argent. Je ne peux rien vous offrir d'autre que ma gratitude.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schl�sser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "Pouvez-vous m'apprendre � crocheter des serrures ?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //Accepteriez-vous de m'apprendre � crocheter les serrures�?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Sans vous, je serais condamn� � verser de l'argent � Lehmar jusqu'� la fin de mes jours.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //J'accepte de vous apprendre ce que vous voulez savoir.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //Vous m'avez apport� les 100 pi�ces d'or, ce qui est tr�s honn�te de votre part.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //Cela me g�ne, mais je vais encore devoir vous demander autre chose.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Si je ne rembourse pas rapidement l'argent que je dois � Lehmar, il va m'envoyer ses gorilles, c'est s�r.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Donnez-moi 100 pi�ces d'or de plus et j'accepte de vous transmettre mon savoir.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Combien demandez-vous ?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Tr�s bien. Voici 100 pi�ces d'or.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Vous avez r�gl� la dette que Gritta avait contract�e aupr�s de Matt�o. Vous me paraissez �tre un homme honn�te. Tr�s bien, j'accepte de vous enseigner ce que vous voulez savoir.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //Mais il m'est impossible de le faire gratuitement. J'ai encore �norm�ment de dettes et j'ai besoin de cet argent.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //Combien voulez-vous ?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 pi�ces d'or.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Combien demandez-vous ?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Tr�s bien. Voici 200 pi�ces d'or.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Hmm... je ne suis pas s�r de pouvoir vous faire confiance...
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Pour ce que j'en sais, vous �tes peut-�tre un de ces gredins qui viennent juste en ville pour vider les coffres des honn�tes gens.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //Je ne vous apprendrai rien tant que je n'aurai pas la conviction que vous �tes quelqu'un d'honn�te.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Tr�s bien, voil� 200 pi�ces d'or.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Cet argent me sera fort utile. Nous pouvons commencer d�s que vous serez pr�t.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Vous n'avez pas encore 200 pi�ces d'or et j'ai grand besoin de cet argent.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Tr�s bien, voil� 100 pi�ces d'or.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //Dans ce cas, nous pouvons commencer d�s que vous serez pr�t.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //H�, vous n'avez pas encore 100 pi�ces d'or�!
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Peut-�tre plus tard...

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schl�sser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("Apprenez-moi comment crocheter une serrure !", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Apprenez-moi � crocheter les serrures.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Vous avez juste besoin d'un crochet. Ins�rez-le dans la serrure et faites-le d�licatement tourner vers la gauche ou la droite, jusqu'� ce que vous sentiez le m�canisme c�der.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Mais attention, si vous �tes trop brusque ou si vous tournez le crochet dans le mauvais sens, il se cassera.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //Avec l'exp�rience, vous casserez de moins en moins de crochets. Voil�, c'est tout ce qu'il faut savoir.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "Pouvez-vous me vendre des crochets ?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //Pouvez-vous me vendre des crochets ?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //S'il m'en reste...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //D'accord, mais ils ne vous serviront pas � grand-chose tant que vous ne saurez pas comment vous en servir.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Le charpentier Thorben vend des crochets."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"Aviez-vous eu un apprenti avant ?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //Aviez-vous eu un apprenti avant ?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Oui et il n'y a pas si longtemps.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //Et ? Que s'est-il pass� ?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Son nom est Elvrich, c'est mon neveu.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //J'�tais vraiment tr�s satisfait de lui, mais un jour il ne s'est pas pr�sent� au travail.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich, l'apprenti du charpentier Thorben, a disparu."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "L'avez-vous signal� � la milice ?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Quand l'avez-vous vu pour la derni�re fois ?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "O� est Elvrich maintenant ?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //Quand l'avez-vous vu pour la derni�re fois ?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Je pense que �a doit faire deux semaines.
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //O� est Elvrich maintenant ?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //Comment le saurais-je ? il ne cesse de tra�ner autour de cet ignoble bordel pr�s du port.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //Je ne serais pas surpris qu'il soit encore en train de chauffer le lit d'une de ces catins l�-bas.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //L'avez-vous signal� � la milice ?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Bien s�r que je l'ai fait. Ils �taient cens� l'attraper et faire en sorte que ce fain�ant fasse son travail. Mais je le regrette d�j�.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //Qu'il fasse ce qu'il veut. Il r�alisera bien assez t�t qu'il n'ira nulle part dans Khorinis  sans un travail d�cent.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //(cynique) Vous croyez ?
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"Elvrich retravaillera pour vous � partir de maintenant.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Elvrich retravaillera pour vous � partir de maintenant.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //Je ne peux qu'esp�rer qu'il ne disparaisse pas � nouveau, au moindre jupon qu'il croisera.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Prenez cet or en r�compense pour m'avoir ramen� mon apprenti.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "Que savez-vous au sujet des paladins ?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //Que savez-vous au sujet des paladins ?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //Pas grand-chose. Ils sont arriv�s du continent par bateau il y a deux semaines de cela.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Depuis, ils se sont cantonn�s dans le haut quartier.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Nul ne sait vraiment pour quelle raison ils sont l�.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Beaucoup de gens craignent une attaque des orques.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Je pense que les paladins sont l� pour mater la r�volte des fermiers.
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Savez-vous quoi que ce soit au sujet de la r�volte des paysans ?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //Que savez-vous au sujet de la r�volte des paysans�?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //On raconte qu'Onar aurait engag� des mercenaires pour le prot�ger des soldats du roi.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Nul doute qu'il en avait assez d'envoyer ses b�tes et le produit de ses r�coltes aux paladins et � la milice.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Mais tout ce que les gens remarquent, c'est que le prix de la nourriture ne cesse d'augmenter.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //La ferme d'Onar se trouve loin d'ici, vers l'est. Trop loin en fait, pour que l'on sache s'il y a des combats l�-bas.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Si vous voulez en savoir plus, interrogez les marchands de la place du march�. Ils se d�placent bien plus que moi dans l'�le.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "Je viens au sujet de Gritta...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //Je viens au sujet de Gritta...
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //Ma ni�ce�? Qu'avez-vous � voir avec elle�? Ce n'est pas pour de l'argent, j'esp�re�?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Elle doit 100 pi�ces d'or � Matt�o, le marchand.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Oh, non�! Dites-moi que ce n'est pas vrai�! Je n'ai que des ennuis depuis qu'elle est venue habiter chez moi.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //Elle a d� contracter des dettes aupr�s de tous les marchands de la ville.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //Il m'a fallu emprunter 200 pi�ces d'or � Lehmar, le pr�teur sur gages, afin de r�gler les dettes de Gritta. Et voil� qu'elle recommence�!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Elle doit �tre � la maison.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //Allez-y, demandez-lui. Mais je peux d�j� vous dire qu'elle n'a pas du tout d'argent.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //Nous verrons bien...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "Votre ni�ce avait 100 pi�ces d'or.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Votre ni�ce avait 100 pi�ces d'or.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //QUOI�? La sale petite vip�re�! C'�tait MON argent�! Elle l'a pris dans mon coffre.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Rendez-le moi�! Il faut absolument que je rembourse Lehmar�! Matt�o peut bien attendre encore un peu�!

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "J'ai d�j� donn� son or � Matt�o !", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Non. Je vais rendre son argent � Matt�o.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Voici votre or.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //Je connais bien cette vip�re. Nul doute qu'elle va courir vous accuser aupr�s de la garde vous aussi.
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Je vais r�gler cette affaire une bonne fois pour toutes.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //J'ai d�j� rendu l'or � Matt�o.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //Mal�diction�! Bah, une dette est une dette. Je suppose que je devrais vous remercier de ne pas avoir gard� l'argent pour vous...
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //Non, je vais ramener cet or � Matt�o.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //Vous allez me faire avoir de s�rieux ennuis, vous savez�? Lehmar n'est pas connu pour sa g�n�rosit� quand il est question d'argent.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Mais, au moins, vous avez l'intention de rembourser les dettes de ma ni�ce. J'imagine que je devrais vous en �tre reconnaissant...
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Voici votre argent.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //Merci. Maintenant, j'ai au moins une partie de l'argent que je dois � Lehmar.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //Je ne peux pas croire qu'elle ait eu l'audace de me voler mon or�!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















