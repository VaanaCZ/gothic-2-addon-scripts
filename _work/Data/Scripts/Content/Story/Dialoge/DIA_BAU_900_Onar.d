// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Onar_EXIT   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 999;
	condition   = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Onar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				Hallo 
// ************************************************************
INSTANCE DIA_Onar_Hallo (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Onar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_Hallo_Info()
{
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //Qui vous a laiss� entrer ?
	AI_Output (self, other, "DIA_Onar_Hallo_14_01"); //Que faites-vous dans ma ferme ?!
};

// ************************************************************
// 			  				PERM 
// ************************************************************
INSTANCE DIA_Onar_PERM (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent   = TRUE;
	description = "Tout va bien � la ferme ?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //Tout va bien � la ferme ?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //Je ne vois pas en quoi cela vous concerne ? Vous ne faites pas partie de cette ferme !
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //J'esp�re bien ! C'est bien pour �a que je vous paie !
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //Vous feriez mieux d'aller voir Torlof pour lui demander s'il a du travail pour vous.
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Oui, c'est �a. Partez et allez chasser vos dragons.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //Vous autres, les culs b�nis du monast�re, n'�tes pas les bienvenus ici !
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //Notre hospitalit� ne s'applique pas aux troupes du roi.
	};
};

// ************************************************************
// 			  				Work 
// ************************************************************
INSTANCE DIA_Onar_Work (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent   = FALSE;
	description = "Je veux travailler pour vous !";
};
FUNC INT DIA_Onar_Work_Condition()
{
	if (Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_Work_Info()
{
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //Je veux travailler pour vous.
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //Je n'ai pas besoin d'ouvrier agricole pour l'instant.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //Mes gens s'occupent de tout.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //Vous n'avez rien � faire ici, alors sortez !
};


// ************************************************************
// 			  				WorkAsSld
// ************************************************************
INSTANCE DIA_Onar_WorkAsSld (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent   = FALSE;
	description = "Je veux travailler ici en tant que mercenaire !";
};
FUNC INT DIA_Onar_WorkAsSld_Condition()
{
	if (Lee_SendToOnar == FALSE)
	&& (Onar_WegenSldWerden == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Onar_Work))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WorkAsSld_Info()
{
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //Je veux travailler ici comme mercenaire !
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //Vous ? Un mercenaire ? Ne me faites pas rire ! Si vous valiez quelque chose en tant que mercenaire, Lee m'aurait parl� de vous.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_02"); //Maintenant, fichez le camp d'ici et vite !
	Onar_WegenSldWerden = TRUE;
};

// ************************************************************
// 			  				Aufstand
// ************************************************************
INSTANCE DIA_Onar_Aufstand (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 3;
	condition   = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent   = FALSE;
	description = "J'ai entendu dire que vous vous �tiez r�volt�s contre la ville ?";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //J'ai entendu dire que vous vous �tiez r�volt� contre la ville ?
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //Maintenant, �coutez moi bien. J'ai h�rit� de mon p�re cette ferme et cette terre.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //Qui les tenait de SON p�re.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //Je ne vais pas permettre � ce roi cupide et imb�cile de s'emparer de tout, juste pour nourrir son arm�e inutile.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //La guerre contre les orques dure depuis toujours. Et o� en sommes-nous arriv�s ? Nous sommes sur le point d'�tre vaincus.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //Non, je pr�f�re d�fendre ma ferme moi-m�me ! L'argent que j'�conomise ainsi me permet de payer ma propre arm�e.
};

// ************************************************************
// 			  				WegenPepe
// ************************************************************
INSTANCE DIA_Onar_WegenPepe (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 4;
	condition   = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent   = FALSE;
	description = "Gr�ce � Bullco, vous avez quelques moutons en moins.";
};
FUNC INT DIA_Onar_WegenPepe_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenPepe_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Gr�ce � Bullco, vous avez quelques moutons de moins.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //De quoi parlez-vous ? Qui est Bullco ?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //Un des mercenaires.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //Que vous voulez que �a me fasse ? S'il s'en est pris � mes moutons, il en r�pondra devant Lee.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //Alors pourquoi m'ennuyez-vous avec des d�tails aussi triviaux ?
	Onar_WegenPepe = TRUE;
};

// ************************************************************
// 			  				WegenSekob
// ************************************************************
INSTANCE DIA_Onar_WegenSekob (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 5;
	condition   = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent   = FALSE;
	description = "Je suis ici pour le loyer de S�kob...";
};
FUNC INT DIA_Onar_WegenSekob_Condition()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenSekob_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //Je viens au sujet du loyer de S�kob...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //Et qu'est-ce que vous fichez l� alors ? Apportez l'argent � Torlof.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //Et en quoi cela peut-il vous concerner ?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //Je veux devenir mercenaire. R�cup�rer le loyer est mon test.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //Mais S�kob n'a pas d'argent. Je l'ai m�me tabass�.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //Il a dit que c'�tait � cause d'une mauvaise r�colte...
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //(en hurlant) Imb�cile ! Vous pensiez vraiment qu'il l'aurait sur lui ? Il l'a cach� quelque part !
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //Savez-vous que nous ne manquons pas de pluie ici ? Une mauvaise r�colte... � d'autres !
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //Allez et d�brouillez-vous pour lui arracher son argent.
	Onar_WegenSekob = TRUE;
};


// ************************************************************
// 			  			Lee schickt mich 
// ************************************************************
INSTANCE DIA_Onar_LeeSentMe   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 6;
	condition   = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent   = FALSE;
	description = "Lee m'envoie. Je veux travailler ici en tant que mercenaire !";
};
FUNC INT DIA_Onar_LeeSentMe_Condition()
{
	if (Lee_SendToOnar == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_LeeSentMe_Info()
{
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Lee m'envoie. Je veux travailler ici en tant que mercenaire !
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //Il m'en a d�j� parl�.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //Je ne pense rien de bon de vous depuis la premi�re fois o� on s'est parl�.
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //Mais si Lee pense que vous ferez l'affaire, je veux bien vous donner une chance.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //C'est lui qui est responsable de vous. Alors faites comme vous voudrez !
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //Mais pas d'idioties ici ! Laissez les fermiers et les femmes tranquilles et surtout, ne chapardez rien, capisce ?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //Pour tout le reste, allez parler � Lee.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //Tout ce dont nous avons besoin de discuter pour l'instant, c'est de votre paie.

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar m'a donn� son accord. Rien ne peut m'emp�cher de me joindre aux mercenaires.");
};



// ************************************************************
// 			  			Sold verhandeln
// ************************************************************
var int Onar_SOLD_Day;
var int Onar_SOLD_XP;
// -------------------

INSTANCE DIA_Onar_HowMuch   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 7;
	condition   = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent   = FALSE;
	description = "Et en ce qui concerne ma paie ?";
};
FUNC INT DIA_Onar_HowMuch_Condition()
{
	if (Onar_Approved == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_HowMuch_Info()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //Et alors, en ce qui concerne ma paie ?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //Voyons voir...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //Je ne pense rien de bon de vous...
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //Vous ne m'avez pas l'air d'�tre tr�s d�gourdi. J'en veux pour preuve cette affaire avec S�kob...
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //Ce n'est pas la premi�re fois que vous provoquez des probl�mes � la ferme.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //Et vous ne cessez de me harceler avec des idioties.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Laissez-moi r�fl�chir...
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //Qu'en pensez-vous ?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "Cela me semble parfait !", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "Cela ne fait pas beaucoup...", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "Par jour ?", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //Par jour ?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //A quoi vous attendiez-vous ? Par semaine peut-�tre ? Vous n'�tes vraiment pas tr�s malin.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //Alors bougez vos fesses et allez prendre votre argent.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //Je ne vais tout de m�me pas le garder pour vous.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //�a ne fait pas beaucoup...
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Ecoutez, si vous le voulez, vous pouvez travailler pour moi gratuitement.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //C'est pourtant tout ce que vous aurez !
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Chaque jour, je peux aller chercher ma paye aupr�s d'Onar.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //Cela me para�t raisonnable !
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //C'est ce que je pense aussi. Maintenant, allez voir Lee.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Chaque jour, je peux aller chercher ma paye aupr�s d'Onar.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_CollectGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 8;
	condition   = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent   = TRUE;
	description = "Versez-moi mon salaire !";
};
FUNC INT DIA_Onar_CollectGold_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_CollectGold_Info()
{
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //Payez-moi mon d� !
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //Je paie les mercenaires, pas les chasseurs de dragons.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //Vous ne vous souciez pas des missions que l'on vous confie !
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //J'ai demand� � Torlof comment vous vous en tiriez et il a dit qu'il vous fallait une �ternit� pour terminer un travail.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //Je ne g�che pas d'argent avec les fain�ants.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //A partir de maintenant, vous passerez quelques semaines sans salaire ! Ainsi, vous retiendrez peut-�tre la le�on.
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //J'ai entendu dire que vous aviez tout g�ch�. Allez d'abord voir Lee pour r�gler cette affaire.
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //Avez-vous perdu l'esprit ?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //Travaillez d'abord pour moi pendant une journ�e. Donc vous toucherez votre prochain salaire demain.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //O� �tiez-vous hier ?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //O� �tiez-vous pass� ces deux derniers jours ?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //Vous n'�tes jamais venu ici.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //Qui sait o� vous �tes all� tra�ner ?
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag sp�ter...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //(d'un air contrit) Ah oui ! Voici votre argent.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //Quoi ? Vous n'avez rien fait d'autre que de tra�ner toute la journ�e et encore, quand vous ne dormiez pas !
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //Je refuse de vous payer pour �a.
		};
		
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_MariaGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 9;
	condition   = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent   = FALSE;
	description = "Maria pense que je n'en ai pas assez.";
};
FUNC INT DIA_Onar_MariaGold_Condition()
{
	if (Maria_MehrGold == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_MariaGold_Info()
{
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //Maria pense que je ne touche pas assez.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //Quoi ?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //Elle dit que vous devriez me payer mieux.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //(en ronchonnant) Cette femme ne peut pas s'emp�cher de fourrer son nez partout.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //A-t-elle dit combien ?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //Non.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //Tr�s bien, � partir de votre prochaine paie, vous toucherez 10 pi�ces d'or en plus.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //Mais pas un sou de plus, compris ?
	
	SOLD = SOLD + 10;
};	


// ************************************************************
// 			  				WannaSheep
// ************************************************************
var int Onar_SellSheep;
// --------------------

instance DIA_Onar_WannaSheep	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_WannaSheep_Condition;
	information	 = 	DIA_Onar_WannaSheep_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux acheter un mouton !";
};
func int DIA_Onar_WannaSheep_Condition ()
{	
	if (Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Onar_WannaSheep_Info ()
{
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //Je veux acheter un mouton !
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //Alors que faites-vous ici ? Vous voyez un mouton dans le coin ?
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //Je...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //Si vous voulez acheter un mouton, allez aux p�turages. C'est � droite de la maison.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Demandez � Pepe de vous en vendre un.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Je crains que Pepe ne soit mort.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //Oh ! Dans ce cas... donnez-moi 200 pi�ces d'or et allez vous chercher un mouton aux p�turages.
		
		Onar_SellSheep = TRUE;
	};
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
instance DIA_Onar_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_BuyLiesel_Condition;
	information	 = 	DIA_Onar_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tenez, 200 pi�ces d'or. Donnez-moi un mouton.";
};
func int DIA_Onar_BuyLiesel_Condition ()
{	
	if (Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Onar_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Voici vos 200 pi�ces d'or. Donnez-moi le mouton.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //Allez en chercher un vous-m�me aux p�turages.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //Il y a bien un de ces moutons qui vous suivra. La plupart d'entre eux r�pondent au nom de Betsy.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //Vous n'avez m�me pas assez d'argent. Ne me faites pas perdre mon temps.
	};
};
