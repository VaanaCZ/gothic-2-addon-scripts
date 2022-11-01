// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_3_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_3_EXIT_Condition;
	information	= DIA_NOV_3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_3_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_3_Fegen_Condition;
	information	= DIA_NOV_3_Fegen_Info;
	permanent	= TRUE;
	description = "J'ai besoin d'un coup de main pour balayer les chambres des novices.";
};                       
//------------------------------------
var int Feger1_Permanent; 
var int Feger2_Permanent;
//------------------------------------
FUNC INT DIA_NOV_3_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //J'ai besoin d'aide pour balayer les chambres des novices.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //Personne n'a accepté de vous aider pour l'instant ? Je vous aiderai si vous trouvez au moins une autre personne.
			
			B_LogEntry 	(Topic_ParlanFegen,"Le novice qui balaye la cave m'aidera si je trouve un autre novice disposé à participer au nettoyage des chambres.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //Suis-je le seul à vous aider ?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //Non, j'ai déjà de l'aide.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //Alors, d'accord.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Le novice de la cave va m'aider à balayer les chambres.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Hé mon frère ! Je vous aide déjà. Inutile de me convaincre.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Bien sûr que je vous aiderai. On doit se serrer les coudes entre novices.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Je n'ai besoin que de 50 pièces d'or car je dois encore payer Parlan.
			
			B_LogEntry 	(Topic_ParlanFegen,"Le novice dehors m'aidera si je lui donne 50 pièces d'or.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"Peut-être plus tard...",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"Très bien. Je paierai.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //Mais je vous l'ai déjà promis. Vous m'avez aidé et je vous aiderai.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Inutile d'insister je n'ai pas le temps. Cherchez quelqu'un d'autre.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Peut-être plus tard. Pour l'instant je ne peux pas me le permettre.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //Très bien, je paierai.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Très bien, je vais m'y mettre.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"Le novice dehors va m'aider à balayer les chambres.");
	
	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_3_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_3_Wurst_Condition;
	information	= DIA_NOV_3_Wurst_Info;
	permanent	= TRUE;
	description = "Aimeriez-vous une saucisse ?";
};                       

FUNC INT DIA_NOV_3_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Wurst_15_00"); //Voulez-vous une saucisse ?
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Bien sûr, donnez. On ne peut refuser une saucisse comme ça.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_3_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_3_JOIN_Condition;
	information	= DIA_NOV_3_JOIN_Info;
	permanent	= TRUE;
	description = "Je veux devenir magicien !";
};                       

FUNC INT DIA_NOV_3_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_JOIN_15_00"); //Je veux devenir magicien !
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //C'est ce que désirent de nombreux novices ! Mais seuls quelques-uns sont Elus et peuvent avoir l'occasion d'être acceptés au sein du Cercle de feu.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //Etre magicien du Cercle de feu est le plus grand honneur qui puisse vous être accordé dans notre ordre.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //Pour avoir une chance, vous allez devoir travailler dur.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_3_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_3_PEOPLE_Condition;
	information	= DIA_NOV_3_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui dirige ce monastère ?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_PEOPLE_15_00"); //Qui est le responsable du monastère ?
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //Nous autres novices, nous servons les magiciens du Cercle de feu. Ces derniers sont dirigés par le Haut Conseil qui est constitué des trois plus puissants magiciens.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Mais Parlan est responsable de tout ce qui concerne les novices. Il surveille en permanence leurs travaux dans la cour.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_3_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_3_LOCATION_Condition;
	information	= DIA_NOV_3_LOCATION_Info;
	permanent	= TRUE;
	description = "Que pouvez-vous me dire au sujet de ce monastère ?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //Que pouvez-vous me dire au sujet du monastère ?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //Nous produisons nous-mêmes nos modestes provisions. Nous élevons des moutons et nous faisons du vin.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Il y a une bibliothèque mais elle est réservée aux magiciens et à quelques novices.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //Nous autres novices, nous faisons en sorte que les magiciens du Cercle de feu n'aient besoin de rien.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_3_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_3_STANDARD_Condition;
	information	= DIA_NOV_3_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NOV_3_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //Vous ne manquez pas d'air de le demander ! Vous êtes le seul sujet de conversation des novices.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //Il est rare qu'un nouveau venu comme vous soit choisi pour le Cercle de feu.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //Le temps est de nouveau venu. Un des novices sera bientôt accepté au sein du Cercle de feu.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Les épreuves vont bientôt commencer.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //Notre ordre a été victime de Béliar ! Le Mal doit être puissant s'il peut trouver des alliés ici.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro était au monastère depuis des années. Je pense que tout le temps qu'il a passé à l'extérieur de ces murs a miné sa foi et l'a rendu vulnérable aux tentations de Béliar.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //Vous arrivez au bon moment. Innos lui-même n'aurait pu mieux choisir.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Vous entrerez dans les annales de notre monastère comme celui qui a sauvé l'Œil.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Les nouvelles provenant de la Vallée des mines sont inquiétantes. Je crois qu'Innos nous soumet à une épreuve très difficile.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //On raconte qu'il n'y a aucune nouvelle des paladins partis pour la Vallée des mines. Le Haut Conseil saura ce qu'il convient de faire
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //Ils disent que nous devrions détruire les dragons avec l'aide de notre Seigneur. La colère d'Innos détruira les créatures de Béliar.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Grâce soit rendue à Innos, il n'y a pas de nouvelle crise. Nous devons reprendre la voie de notre Seigneur car ce n'est qu'avec son aide que nous pourrons affronter le mal.

	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_3 (var c_NPC slf)
{
	DIA_NOV_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc					= Hlp_GetInstanceID(slf);
};
