// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Bosper_EXIT   (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 999;
	condition   = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 							Hallo
// ***********************************************************
instance DIA_Bosper_HALLO		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr			 =  2;
	condition	 = 	DIA_Bosper_HALLO_Condition;
	information	 = 	DIA_Bosper_HALLO_Info;
	permanent    =  FALSE;
	important    =  TRUE;
};
func int DIA_Bosper_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Bosper_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //Bienvenue dans ma boutique, �tranger.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Je me nomme Bosper. Je fabrique des arcs et je fais le commerce des fourrures.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Qu'est-ce qui vous am�ne � Khorinis�?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper fabrique des arcs et fait le commerce des peaux. Sa boutique est pr�s de la porte est du bas quartier.");
};

// ***********************************************************
// 						 	IntoOV		//e1
// ***********************************************************
instance DIA_Bosper_IntoOV		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 1;
	condition	= DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent   = FALSE;
	description = "Je dois acc�der au haut quartier.";
};
func int DIA_Bosper_IntoOV_Condition ()
{	
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Bosper_IntoOV_Info ()
{
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Il me faut acc�der au quartier sup�rieur.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //L� o� vivent les paladins�? N'y songez m�me pas.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Pour y parvenir, il faut �tre un citoyen respectable, ou au moins avoir un travail honn�te.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //En tant qu'�tranger, vous n'avez aucune chance d'y parvenir.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //C'est ce que j'avais cru comprendre...
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Pour acc�der au haut quartier je dois soit devenir un citoyen respectable, soit trouver du travail.");
};

// ***********************************************************
// 						 	SeekWork	//e1
// ***********************************************************
instance DIA_Bosper_SeekWork		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent   = FALSE;
	description = "Je cherche du travail.";
};
func int DIA_Bosper_SeekWork_Condition ()
{	
	return TRUE;
};
func void DIA_Bosper_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SeekWork_15_00"); //Je cherche du travail.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Hmm... c'est vrai que j'aurais bien besoin d'un nouvel apprenti...
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //Le dernier a d�missionn� il y a deux jours � peine.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //Vous vous y connaissez, pour ce qui est de la chasse�?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Euh...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Je pourrais vous enseigner � d�pecer les animaux...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Je vous r�mun�rerai g�n�reusement pour toutes les peaux que vous me ram�nerez.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Si c'est ce que vous voulez, je peux vous rapporter des peaux.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //Excellent�! Amenez-m'en autant que vous le pourrez. Je vous en offrirai un bon prix.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper recherche un nouvel apprenti. Je pourrai commencer � travailler avec lui.");	
 
};

// ***********************************************************
// 						 	LEHRLING	//e2 PERM
// ***********************************************************
// ----------------------
var int Bosper_HintToJob;
var int Bosper_StartGuild;
// ----------------------

instance DIA_Bosper_LEHRLING		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent   = TRUE;
	description = "Je veux commencer en tant qu'apprenti !";
};
func int DIA_Bosper_LEHRLING_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //Je veux devenir votre apprenti.

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //(sourit) Excellent�! J'ai l'impression que vous connaissez d�j� les bases.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad pense que vous �tes quelqu'un de bien.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Mais Harad n'est pas convaincu que vous sachiez faire quoi que ce soit.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Mais Harad dit ne jamais vous avoir vu.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben vous a donn� sa b�n�diction. Je ne suis pas vraiment pieux, mais cela me va.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben ne vous donnera son accord que si vous recevez la b�n�diction des dieux.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben ignore qui vous �tes.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino dit que vous pouvez commencer quand vous voulez, cela ne le concerne pas.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino m'a dit que vous �tiez accus� d'un crime en ville. J'ose esp�rer qu'il s'agit de quelque chose de trivial...
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Veillez � ce que cette affaire soit r�gl�e dans les plus brefs d�lais.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino n'a jamais entendu parler de vous.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //Et Matt�o dit que vous valez de l'or.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //Matt�o a mentionn� une dette vous concernant. J'ignore ce qu'il voulait dire par l�, mais vous feriez mieux d'aller le voir.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matt�o dit qu'il ne vous a pas encore parl� � ce sujet.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matt�o dit qu'il ne vous a jamais vu.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //Cela signifie que vous avez l'accord de tous les ma�tres�!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Cela signifie que vous avez l'accord de quatre des ma�tres, �a suffit pour �tre accept� comme apprenti.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Vous pouvez commencer � travailler pour moi quand vous voudrez.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Bien, j'y r�fl�chirai.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "�a me va !", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Vous devez obtenir l'accord de quatre ma�tres au moins pour pouvoir �tre accept� comme apprenti dans le bas quartier.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //Cela signifie qu'il vous faut aller parler � ceux qui ne sont pas encore convaincus de vous laisser votre chance.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Avant de vous accepter, je dois m'assurer que vous n'�tes pas un bon � rien bien s�r.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Vous m'avez ramen� mon arc, mais cela ne signifie pas que vous soyez un bon chasseur...
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //Je suis partant�!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Vous ne le regretterez pas. Je pense que nous ferons du bon travail ensemble.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper m'accepte comme apprenti. J'ai d�sormais acc�s au haut quartier.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //D'accord, je vais y r�fl�chir.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Faites le bon choix. Je sais que vous serez un parfait apprenti pour moi.
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};
		
			
// ***********************************************************
// 						OtherMasters	 	//e2
// ***********************************************************
instance DIA_Bosper_OtherMasters (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent   = FALSE;
	description = "Et si je veux m'engager aupr�s des autres ma�tres ?";
};
func int DIA_Bosper_OtherMasters_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //Et si je pr�f�re devenir l'apprenti d'un autre ma�tre�?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //(bougon) Nom d'une pipe�!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad et Matt�o ont d�j� un apprenti.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Constantino, l'alchimiste, est un solitaire qui n'a plus pris d'apprenti depuis de nombreuses ann�es.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //Et quant � Thorben, tout le monde sait bien qu'il est fauch�. Il n'aurait probablement pas de quoi vous payer.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Moi, par contre, j'ai grand besoin d'un apprenti et je paye bien.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Mais quel que soit celui que vous choisirez, il vous faut l'approbation de tous les ma�tres du bas quartier.
	
	
	
};

// ***********************************************************
// 							Bartok	 	//e2
// ***********************************************************
instance DIA_Bosper_Bartok (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 4;
	condition	= DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent   = FALSE;
	description = "Pourquoi votre apprenti a-t-il rendu son tablier ?";
};
func int DIA_Bosper_Bartok_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};
func void DIA_Bosper_Bartok_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //Pourquoi votre apprenti a-t-il d�missionn�?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Tout ce qu'il m'a dit, c'est que la r�gion �tait devenue trop dangereuse.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Si cela vous int�resse, allez lui poser la question vous-m�me.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Il s'appelle Bartok et il doit tra�ner du c�t� du pub de Coragon.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Depuis la forge, empruntez le passage souterrain et vous serez dans la bonne direction.
};

// ***********************************************************
// 						ZUSTIMMUNG		 	//e3   PERM
// ***********************************************************

instance DIA_Bosper_ZUSTIMMUNG (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "Puis-je compter sur votre accord pour m'engager aupr�s d'un autre ma�tre ?";
};
func int DIA_Bosper_ZUSTIMMUNG_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info ()
{
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //Puis-je esp�rer avoir votre accord si je choisis un autre ma�tre�?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //(d��u) J'esp�rais que vous travailleriez pour moi...
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Mais si c'est ce que vous voulez...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //�a veut dire que j'aurai votre accord�?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Si aucun autre ma�tre n'est contre, alors oui.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //Vous m'avez ramen� mon arc apr�s tout.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Mais vous auriez fait un bon chasseur...
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Bosper me donnera son accord si je veux devenir l'apprenti d'un autre ma�tre.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //(soupire) Tr�s bien, je vous donne mon accord, mais � une condition.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Travaillez pour moi ne serait-ce que pour un temps.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //De cette mani�re, vous verrez bien si ma profession vous pla�t ou pas.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //Qui sait�? Peut-�tre resterez-vous avec moi au final�?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //Si vous �tes assez bon pour travailler pour moi, vous pouvez travailler pour n'importe lequel des autres ma�tres.
		Bosper_HintToJob = TRUE;
	};	
};

// ***********************************************************
// 							Job		 	//e3
// ***********************************************************
instance DIA_Bosper_Job (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent   = FALSE;
	description = "Que voulez-vous que je fasse ?";
};
func int DIA_Bosper_Job_Condition ()
{	
	if (Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Job_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Que faut-il que je fasse pour vous�?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Je vais vous apprendre � d�pecer un animal, apr�s quoi vous me ram�nerez... disons, une demi-douzaine de peaux de loups.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper peut m'apprendre � �corcher les animaux.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Amenez-moi une demi-douzaine de peaux de loups.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //A ce moment-l�, j'aurai la certitude que vous connaissez le m�tier.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Si cela ne vous prend pas une �ternit� et si les peaux sont en bon �tat, je vous prendrai comme apprenti, � condition que vous le souhaitiez bien s�r.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Ou... (soupire) vous pourrez aller travailler pour un autre ma�tre, si c'est ce que vous voulez vraiment.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Je dois apporter � Bosper six peaux de loup. Je pourrais alors soit travailler pour lui soit obtenir son approbation pour travailler pour un autre ma�tre.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Je devrais lui demander de m'apprendre comment �corcher un animal.");
	};
};

// ***********************************************************
// 					Ich hab deine Felle	 	//e4
// ***********************************************************
instance DIA_Bosper_BringFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 102;
	condition	= DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent   = TRUE;
	description = "A propos des peaux de loup...";
};
func int DIA_Bosper_BringFur_Condition ()
{	
	if (MIS_Bosper_WolfFurs == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BringFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //Au sujet des peaux de loups...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //Vous �tes d�sormais l'apprenti d'un autre ma�tre. Je vous paierai donc ces peaux le prix normal.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Je les ai ici-m�me.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Excellent�! Je savais bien que vous �tiez fait pour ce m�tier.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //Voici l'argent que je vous avais promis.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //Alors, qu'en dites-vous�? C'est quand m�me mieux que de passer son temps � marteler des bouts de ferraille ou � remplir des bouteilles dans une pi�ce poussi�reuse, non�?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper m'acceptera comme apprenti, si les autres ma�tres donnent leur approbation.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Nous nous �tions mis d'accord sur une demi-douzaine, mais vous avez encore le temps. Allez me chercher celles qui manquent.
	};

};

// ***********************************************************
// 							TeachFUR		 	//e4
// ***********************************************************
instance DIA_Bosper_TeachFUR (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent   = TRUE;
	description = "Apprenez-moi � �corcher un animal ! (5 PA)";
};
func int DIA_Bosper_TeachFUR_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_Job))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_TeachFUR_Info ()
{
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Apprenez-moi � d�pecer les animaux.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //D'accord. Ecoutez-moi bien et vous verrez que c'est tr�s simple...
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Munissez-vous d'un couteau ou d'une autre lame bien tranchante et ouvrez le ventre de l'animal. Cela fait, il suffit de petites incisions � l'int�rieur des pattes pour pouvoir retirer la peau.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Ramenez-moi les peaux de loups et nous verrons.
			B_LogEntry (TOPIC_BosperWolf,"Bosper m'a appris � �corcher les animaux.");
		};
	};
};

// **************************************************************
// 							TRADE
// **************************************************************
instance DIA_Bosper_Trade		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  700;
	condition	 = 	DIA_Bosper_Trade_Condition;
	information	 = 	DIA_Bosper_Trade_Info;
	permanent	 = 	TRUE;
	description	 = 	"Montrez-moi vos marchandises.";
};
func int DIA_Bosper_Trade_Condition ()
{
	if (MIS_Bosper_WolfFurs != LOG_RUNNING)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	
	return TRUE;
};
func void DIA_Bosper_Trade_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Montrez-moi vos marchandises.
	
	if (DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv (self);
		//Joly: Mc ArrowBolt
		//////////////////////////////////////////////////////////////////////////////////////
		Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
		var int McBolzenAmount;
		McBolzenAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
		Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
		var int McArrowAmount;
		McArrowAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
		//////////////////////////////////////////////////////////////////////////////////////
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Vous n'�tes pas ici pour inspecter ma marchandise. Je vous rappelle que vous �tes cens� me rapporter des peaux de loups.
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //Alors, mettez-vous au travail�!
	};
};

// **************************************************************
// 						Von Bogen geh�rt
// **************************************************************
instance DIA_Bosper_BogenRunning (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  5;
	condition	 = 	DIA_Bosper_BogenRunning_Condition;
	information	 = 	DIA_Bosper_BogenRunning_Info;
	permanent	 = 	FALSE;
	description	 = "J'ai entendu dire qu'on vous avait vol�.";
};
func int DIA_Bosper_BogenRunning_Condition ()
{	
	if (MIS_Bosper_Bogen == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenRunning_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //Je me suis laiss� dire que quelqu'un vous avait vol�...
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //Qui vous en a parl�? Bartok, j'imagine�? Il n'avait rien de plus int�ressant � vous dire�? Bah...
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //Je vais vous dire... si je retrouve le sale type qui m'a fait ce coup-l�, il pourra faire ses pri�res�!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //J'ai d� m'absenter de ma boutique l'espace de quelques instants et, quand je suis revenu, j'ai vu ce type filer... avec mon arc en bandouli�re�!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //J'ai tout de suite appel� les gardes, mais ils l'ont perdu au port.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //Je les ai trait�s de tous les noms et ils ont fouill� le quartier de fond en comble, mais sans rien trouver.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //Quelle bande de nuls�!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //Je parie que mon arc est encore en ville. J'ai inform� les gardes des deux portes et ils n'ont vu personne sortir avec.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //Quand je mettrai la main sur ce b�tard...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"On a vol� un arc � Bosper. Le voleur s'est r�fugi� dans le port. La milice a fouill� le secteur mais elle n'a rien trouv�. Cependant, l'arc devrait �tre encore en ville.");
};

// **************************************************************
// 						Bogen gefunden
// **************************************************************
instance DIA_Bosper_BogenSuccess (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  6;
	condition	 = 	DIA_Bosper_BogenSuccess_Condition;
	information	 = 	DIA_Bosper_BogenSuccess_Info;
	permanent	 = 	FALSE;
	description	 = "Je crois que cet arc vous appartient...";
};
func int DIA_Bosper_BogenSuccess_Condition ()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenSuccess_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //Il me semble que cet arc est � vous...
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //Mon arc�! O� l'avez-vous trouv�?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //Dans un trou obscur plein de rats.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //J'esp�re que vous n'avez pas eu d'ennuis.
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //Ne vous inqui�tez pas, j'ai l'habitude.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //Hmm... merci quand m�me. J'ai une dette envers vous.
	 
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems (self, ItRw_Bow_L_03_MIS,1); 
	
};

// **************************************************************
// 							PERM
// **************************************************************
//------------------------
	var int Bosper_Island;
//------------------------
instance DIA_Bosper_PERM		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  10;
	condition	 = 	DIA_Bosper_PERM_Condition;
	information	 = 	DIA_Bosper_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Comment �a se passe en ville ?";
};
func int DIA_Bosper_PERM_Condition ()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};
func void DIA_Bosper_PERM_Info ()
{
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Comment �a se passe en ville�?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Si les orques viennent vraiment nous assi�ger, la situation va devenir tr�s d�plaisante.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Il n'y a qu'un seul navire et les paladins le gardent �troitement. Si vous voulez mon avis, ils ne comptent pas s'en servir pour sauver les habitants de la ville.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Il n'y a pas d'autre moyen de partir d'ici�?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //Non. Nul ne peut quitter l'�le sans bateau.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Il n'y a rien de neuf pour le moment. Revenez plus tard.
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Bosper_MILKommentar;
	var int Bosper_PALKommentar;
	var int Bosper_INNOSKommentar;
// ----------------------------------

instance DIA_Bosper_AlsLehrling (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 1;
	condition   = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Bosper_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Bosper)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bosper_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Bosper_StartGuild != GIL_MIL)
	&& (Bosper_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Vous avez int�gr� la milice, hein�?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Remarquez, �a ne me d�range pas, du moment que vous chassez quelques loups en plus des orques et des brigands. (sourit)
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Paladin du roi�? On dirait que votre carri�re a vraiment d�coll�!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //Quoi qu'il vous arrive maintenant, j'esp�re que vous n'oublierez pas votre vieux ma�tre.
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Vous �tes entr� au monast�re, hein�? J'esp�re que vous pourrez en sortir suffisamment souvent pour continuer � m'apporter des peaux.
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Qu'est-ce que vous avez fabriqu� pour �tre aussi long�?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Il me faut davantage de peaux. Vous m'en amenez�?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //Ah, vous revoil�...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};
	
// *******************************************************
//				 Aufgaben als Lehrling
// *******************************************************	
instance DIA_Bosper_Aufgaben (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 1;
	condition	= DIA_Bosper_Aufgaben_Condition;
	information	= DIA_Bosper_Aufgaben_Info;
	permanent	= FALSE;
	description	= "Que dois-je faire en tant qu'apprenti ?";
};
func int DIA_Bosper_Aufgaben_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //En quoi consiste le travail d'apprenti�?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //C'est simple�: ramenez-moi autant de peaux que vous pourrez.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Je vous en offrirai un meilleur prix que n'importe quel autre marchand.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Sinon, ce n'est pas la peine que vous veniez � la boutique. Je suis parfaitement capable de me d�brouiller par moi-m�me.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //O� suis-je cens� dormir�?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Je n'ai pas la place de vous loger, mais j'imagine que vous devriez pouvoir trouver un lit � l'h�tel de la place du march�.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper paiera un tr�s bon prix pour des peaux d'animaux.");
};

// *******************************************************
//				 		SellFur
// *******************************************************	
// -----------------------------
	var int Bosper_TrollFurSold;
// -----------------------------

instance DIA_Bosper_SellFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 600;
	condition	= DIA_Bosper_SellFur_Condition;
	information	= DIA_Bosper_SellFur_Info;
	permanent	= TRUE;
	description	= "J'ai des peaux pour vous...";
};
func int DIA_Bosper_SellFur_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_SellFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //J'ai quelques peaux pour vous.
	
	if (Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(other, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
	{
		
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait (self,3);
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur) );
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
		};
		
		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Une peau de mouton�? Il ne vous est quand m�me pas pass� par la t�te de vous en prendre � un troupeau de moutons, si�?
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //�a ne me viendrait jamais � l'id�e.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Une peau de loup... bien, �a...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //Une peau de warg�? Hmm... ces sales b�tes sont particuli�rement coriaces.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //Et m�me une peau de b�te des ombres�? Hmm... cela vaut cher.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //Mais qu'est-ce que c'est que �a�?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Elle provient d'un troll.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //Elle... elle doit valoir une petite fortune alors.
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Et encore une peau de troll�! Vous les traquez ou quoi�?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //Quand j'en rencontre un, je ne laisse pas passer l'occasion.
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //Et une peau de troll noir en plus�!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Beau travail�! Revenez me voir quand vous en aurez d'autres.
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Mais, vous savez, je ne m'int�resse qu'aux peaux de loups, b�tes des ombres et autres cr�atures de ce genre.
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Bosper_Minenanteil (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_Minenanteil_Condition;
	information	= DIA_Bosper_Minenanteil_Info;

	description = "Je vois que vous vendez des concessions mini�res.";
};   
                    
FUNC INT DIA_Bosper_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bosper_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Je vois que vous avez des concessions mini�res � vendre...
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Euh... je ne suis pas au courant. Prenez-les, si vous voulez.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bosper_PICKPOCKET (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 900;
	condition	= DIA_Bosper_PICKPOCKET_Condition;
	information	= DIA_Bosper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Bosper_PICKPOCKET_Condition()
{
	C_Beklauen (67, 120);
};
 
FUNC VOID DIA_Bosper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bosper_PICKPOCKET);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_BACK 		,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};
	
func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};








