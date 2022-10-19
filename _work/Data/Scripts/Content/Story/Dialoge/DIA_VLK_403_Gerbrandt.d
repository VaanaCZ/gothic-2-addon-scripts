// ************************************************************
// 			  				   EXIT 
// ************************************************************

var int DIEGO_COMING;
// -------------------------

INSTANCE DIA_Gerbrandt_EXIT(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 999;
	condition	= DIA_Gerbrandt_EXIT_Condition;
	information	= DIA_Gerbrandt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gerbrandt_EXIT_Info()
{	
	if (DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc (PC_THIEF_NW);
				
		if ( Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine (DiegoNW,"GERBRANDT");
		};	
		//patch m.f. B_Startotherroutine raus und ersetzt durch Npc_exchange 
		
		Npc_ExchangeRoutine  (self,"NEWLIFE");
		B_StartOtherRoutine (GerbrandtsFrau,"NEWLIFE");
		
		DIEGO_COMING = 2; //Weder TRUE noch False
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gerbrandt_PICKPOCKET (C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 900;
	condition	= DIA_Gerbrandt_PICKPOCKET_Condition;
	information	= DIA_Gerbrandt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait simple de lui voler sa bourse.)";
};                       

FUNC INT DIA_Gerbrandt_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	&& (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gerbrandt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gerbrandt_PICKPOCKET);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_BACK 		,DIA_Gerbrandt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gerbrandt_PICKPOCKET_DoIt);
};

func void DIA_Gerbrandt_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Gerbrandt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
};
// ************************************************************
// 			  				  Hallo
// ************************************************************

INSTANCE DIA_Gerbrandt_Hello(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 5;
	condition	= DIA_Gerbrandt_Hello_Condition;
	information	= DIA_Gerbrandt_Hello_Info;
	permanent	= FALSE;
	description = "Que faites-vous ici ?";
};                       

FUNC INT DIA_Gerbrandt_Hello_Condition()
{
	if (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_PAL)
	&& (DIEGO_COMING == FALSE) //nur BEVOR Diego kommt
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_15_00"); //Que faites-vous ici ?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //Qui �tes-vous�? On dirait que vous venez d'arriver et que vous n'avez pas la moindre id�e de ce qui se passe par ici.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //On m'appelle Gerbrandt, mais pour vous, c'est Monsieur Gerbrandt, pig�?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Compris, Gerbrandt.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"J'ai compris, Monsieur Gerbrandt.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Pig�, Gerbrandt.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Attention � ce que vous dites. Montrez-moi un peu plus de respect que �a si vous ne voulez pas avoir de s�rieux ennuis.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //Ici, c'est moi qui donne les ordres. Les fauteurs de troubles doivent me rendre des comptes et ont int�r�t � quitter la ville sans attendre, parce qu'une fois que je me suis occup� d'eux, il ne leur reste plus que les yeux pour pleurer.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //La plupart des gens du port sont mes employ�s. Si vous cherchez du travail, vous avez int�r�t � ce que je vous aie � la bonne.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //C'est bien compris, monsieur Gerbrandt.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Au moins, vous avez vite compris d'o� souffle le vent.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //D�s que les affaires reprendront, je trouverai s�rement du travail pour un grand gaillard comme vous.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //Vous feriez un excellent responsable de d�p�t.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //Vous savez lire�?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Non.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Je ne veux pas de travail.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Naturellement.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //Non.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Sans importance. Au moins, vous pouvez porter les sacs.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Si vous me donnez enti�re satisfaction, je vous proposerai peut-�tre un poste fixe. Ce n'est pas le travail qui manque, par ici.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Bon. J'esp�re que vous serez l� quand les premiers bateaux arriveront � quai.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //Je ne suis pas � la recherche d'un emploi.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Vous vous croyez malin, hein�? Vous devriez faire attention. Ici, personne ne peut trouver de travail sans mon approbation.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Alors, si vous continuez � me parler comme �a, cherchez-vous tout de suite une paillasse infest�e de puces, parce que c'est tout ce que vous pourrez vous offrir.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Un jour, vous viendrez me supplier de vous offrir du travail.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Naturellement.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Bien, bien. Il est toujours difficile de trouver des employ�s qualifi�s.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //Vous avez des r�f�rences�?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //Des r�f�rences�?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //Tr�s bien. Je me souviendrai de vous. Revenez me voir quand les affaires reprendront. A ce moment-l�, j'aurai peut-�tre quelque chose pour vous.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //Qu'est-ce que c'est que cette histoire�? Vous vous moquez de moi�?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Vous et votre ami Diego m'avez d�j� pos� bien assez de probl�mes comme �a�!
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_02"); //Laissez-moi tranquille !
	
	//Patch m.f. Wenn diego kommt und er wird gefragt, geht er nicht los, weil losgehen steht in exit info und durch diesen Ai_Stop wird das umgangen
	if (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		AI_StopProcessInfos (self);
	};
};

INSTANCE DIA_Gerbrandt_Perm(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 800;
	condition	= DIA_Gerbrandt_Perm_Condition;
	information	= DIA_Gerbrandt_Perm_Info;
	permanent	= TRUE;
	description	= "Des nouvelles ?";
};                       

FUNC INT DIA_Gerbrandt_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Perm_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //Du nouveau�?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //Les gens tels que vous n'ont rien � faire l�. Ce sont les gens respectables qui vivent ici, pas les clochards et les mendiants.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Si jamais vous devenez un jour riche et respectable, peut-�tre serez-vous le bienvenu ici.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //Je n'ai pas � me plaindre, monsieur.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //Les gens comme vous, je les connais. Vous ne savez pas rester � votre place.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Je crois que je vais avoir une discussion avec le gouverneur au sujet des mesures de s�curit� � appliquer dans le haut quartier.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //Cela ne regarde que moi�! J'ai � faire�!
			};
		}
		else
		{
			B_Gerbrandt_PissOff ();
		};
	};
};

//################################
//##
//##	Kapitel 3
//##
//################################

INSTANCE DIA_Gerbrandt_GreetingsFromDiego(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 10;
	condition	= DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information	= DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent	= FALSE;
	description	= "Diego vous dit bonjour.";
};                       

FUNC INT DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	
	if (MIS_DiegosResidence == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_DiegosLetter_MIS) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //Vous avez le bonjour de Diego.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //(effray�) Quoi�? Qui�? Quel Diego�?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //Il m'a demand� de vous remettre cette lettre.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //(agit�) Ce n'est pas possible�! Je suis perdu�!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //(terrifi�) Il est en ville�?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //Qui ?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //Diego, bien s�r�!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Oui, et je vais d'ailleurs le rejoindre.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //(se parle tout seul) C'est la fin�! Tout est perdu�!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //Il faut que je parte sans perdre un instant. Vite�! S'il me trouve ici, je suis un homme mort�!
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
