// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_8_EXIT_Condition;
	information	= DIA_NOV_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_8_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_8_Fegen_Condition;
	information	= DIA_NOV_8_Fegen_Info;
	permanent	= TRUE;
	description = "J'ai besoin d'un coup de main pour balayer les chambres des novices.";
};                       

FUNC INT DIA_NOV_8_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};
//-------------------------------
var int Feger3_Permanent;
//-------------------------------
FUNC VOID DIA_NOV_8_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //J'ai besoin d'aide pour balayer les chambres des novices.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //Oh ! Vous venez d'arriver et vous les laissez déjà vous affecter à la corvée de nettoyage ?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //Si cela peut vous consoler, ça a été la même chose pour moi quand je suis arrivé ici. Et c'est pour ça que je vais vous aider. Ce serait dommage qu'on ne puisse régler cette affaire.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"J'ai trouvé un novice prêt à m'aider pour balayer les chambres.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //Frère, je sais dans quelle situation vous vous trouvez. Et je vous ai déjà dit que je vous aiderai. C'est d'ailleurs ce que je suis en train de faire.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //J'aimerais bien, mais je suis très occupé.
	};
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_8_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_8_Wurst_Condition;
	information	= DIA_NOV_8_Wurst_Info;
	permanent	= TRUE;
	description = "Que diriez-vous d'une délicieuse saucisse d'agneau ?";
};                       

FUNC INT DIA_NOV_8_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //Que diriez-vous d'une délicieuse saucisse ?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //Je ne dirais pas non, c'est exactement ce dont j'avais besoin.
	
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
INSTANCE DIA_NOV_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_8_JOIN_Condition;
	information	= DIA_NOV_8_JOIN_Info;
	permanent	= TRUE;
	description = "Que dois-je faire pour devenir magicien ?";
};                       

FUNC INT DIA_NOV_8_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //Que dois-je faire pour devenir magicien ?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //Vous ne deviendrez Elu d'Innos que lorsque les Hauts Magiciens du feu l'auront décidé.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //En tant que novices, il nous est interdit d'étudier les runes magiques. Et nous n'avons le droit d'étudier les vieilles écritures qu'avec la permission des magiciens.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_8_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_8_PEOPLE_Condition;
	information	= DIA_NOV_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui est le responsable dans ce monastère ?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_PEOPLE_15_00"); //Qui est le responsable du monastère ?
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //C'est le Haut Conseil. Il est constitué des trois plus puissants magiciens de notre ordre. Chaque jour ils se réunissent à l'église.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //Les Elus d'Innos sont tous des magiciens. Innos leur a accordé un don pour qu'ils puissent accomplir sa volonté sur terre.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_8_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_8_LOCATION_Condition;
	information	= DIA_NOV_8_LOCATION_Info;
	permanent	= TRUE;
	description = "Parlez-moi de ce monastère.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //Parlez-moi de ce monastère.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //Il est très vieux. Il a été construit avant l'époque de Rhobar Premier.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_02"); //Sous le monastère s'étendent les catacombes. Elles s'enfoncent au plus profond des montagnes.
	//AI_Output (self, other, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die höchsten Geweihten Innos' Zutritt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_8_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_8_STANDARD_Condition;
	information	= DIA_NOV_8_STANDARD_Info;
	permanent	= TRUE;
	description = "Y a-t-il du neuf ?";
};
                       
func INT DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //Y a-t-il quelque chose de nouveau ?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //C'est le moins qu'on puisse dire. Cela fait au moins un siècle qu'un novice n'a pas été accepté aussi rapidement au sein du Cercle de feu.
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //J'espère que cet honneur me sera également accordé un jour. Je vais travailler dur pour ça.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //Les paladins sont arrivés récemment à Khorinis. L'un d'eux est au monastère pour prier.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //Je n'arrive toujours pas à y croire. L'un de nous a trahi le monastère et a volé l'Œil d'Innos.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //Notre devoir était de bâtir une communauté mais nous avons été trop faibles. C'est la seule raison pour laquelle Béliar a pu entraîner l'un des nôtres dans son camp.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //Qu'Innos soit loué, nous avons réussi à récupérer l'Œil.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //Votre courage est un exemple pour ceux qui désespèrent. Il les aide à affronter ces temps tourmentés.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //J'ai entendu parler de dragons et d'une armée maléfique. Qu'Innos nous vienne en aide !
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //Le Haut Conseil est très inquiet de la situation dans laquelle se trouvent les paladins. Cela fait quelques temps que nous n'avons aucune nouvelle de la Vallée des mines.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //Non. Et j'en remercie notre Seigneur. Avec l'Œil d'Innos, nous pourrons vaincre les dragons !
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //Oui. Nous avons remporté la victoire sur les dragons ! Innos nous a montré qu'il ne fallait jamais renoncer.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //Pourtant nombreuses sont les ombres qui demeurent et il nous faudra allumer de nombreux feux pour toutes les disperser.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_8 (var c_NPC slf)
{
	DIA_NOV_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc					= Hlp_GetInstanceID(slf);
};
