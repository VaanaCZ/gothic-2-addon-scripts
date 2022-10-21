//***********************************************************************
//	Info EXIT 
//***********************************************************************
INSTANCE DIA_Babo_Kap1_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//***********************************************************************
//	Info Hello 
//***********************************************************************
INSTANCE DIA_Babo_Hello   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Babo_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (other.guild == GIL_NOV)
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Hello_Info()
{
	
	
	AI_Output (self ,other,"DIA_Babo_Hello_03_00"); //(timide) Bonjour. Vous êtes nouveau vous aussi, n'est-ce pas ?
	AI_Output (other,self ,"DIA_Babo_Hello_15_01"); //Oui. Depuis combien de temps êtes-vous ici ?
	AI_Output (self ,other,"DIA_Babo_Hello_03_02"); //Depuis quatre semaines. Vous avez déjà reçu votre bâton de combat ?
	AI_Output (other,self ,"DIA_Babo_Hello_15_03"); //Pas encore.
	AI_Output (self ,other,"DIA_Babo_Hello_03_04"); //Dans ce cas, prenez celui-ci. Nous autres novices, nous devons tous avoir un bâton pour montrer que nous sommes capables de nous défendre. Savez-vous vous battre ?
	AI_Output (other,self ,"DIA_Babo_Hello_15_05"); //Disons qu'il m'est arrivé de manier une arme ou deux dans le passé...
	AI_Output (self ,other,"DIA_Babo_Hello_03_06"); //Si vous le souhaitez, j'ai quelque chose à vous apprendre. Mais j'aurais également une requête à vous faire...

	B_GiveInvItems (self,other,ITMW_1h_NOV_Mace,1);
	AI_EquipBestMeleeWeapon (self);
	
};
//***********************************************************************
//	Info Anliegen
//***********************************************************************
INSTANCE DIA_Babo_Anliegen   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent   = FALSE;
	description	= "Et de quelle requête s'agit-il ?";
};
FUNC INT DIA_Babo_Anliegen_Condition()
{
	if  (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other, DIA_Babo_Hello))
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Anliegen_Info()
{
	AI_Output (other,self ,"DIA_Babo_Anliegen_15_00"); //De quoi s'agit-il ?
	AI_Output (self ,other,"DIA_Babo_Anliegen_03_01"); //Eh bien, l'un des paladins, un certain Sergio, se trouve actuellement au monastère.
	AI_Output (self ,other,"DIA_Babo_Anliegen_03_02"); //Je veux bien vous faire profiter de mon savoir si vous arrivez à le convaincre de s'entraîner avec moi.
	AI_Output (other,self ,"DIA_Babo_Anliegen_15_03"); //Je vais voir ce que je peux faire.
	
	Log_CreateTopic (Topic_BaboTrain,LOG_MISSION);
	Log_SetTopicStatus (Topic_BaboTrain,LOG_RUNNING);
	B_LogEntry (Topic_BaboTrain,"Si je peux convaincre le paladin Sergio de s'entraîner au combat avec Babo, il m'apprendra à me battre avec des armes à deux mains.");
	
};
//***********************************************************************
//	Info Sergio
//***********************************************************************
INSTANCE DIA_Babo_Sergio   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent   = FALSE;
	description	= "J'ai parlé à Sergio.";
};
FUNC INT DIA_Babo_Sergio_Condition()
{
	if Npc_KnowsInfo (other, DIA_Sergio_Babo)
	&& (other.guild == GIL_NOV)
	
	
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Sergio_Info()
{
	AI_Output (other,self ,"DIA_Babo_Sergio_15_00"); //J'ai parlé à Sergio. Il est d'accord pour s'entraîner avec vous tous les matins pendant deux heures, en commençant à cinq heures.
	AI_Output (self ,other,"DIA_Babo_Sergio_03_01"); //Merci. C'est un honneur pour moi !
	AI_Output (self ,other,"DIA_Babo_Sergio_03_02"); //Si vous le souhaitez, je veux bien vous montrer mes secrets de combat.
	
	Babo_TeachPlayer = TRUE;	
	Babo_Training = TRUE;
	B_GivePlayerXP ((XP_Ambient)*2);
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	B_LogEntry (Topic_KlosterTeacher,"Babo peut m'entraîner au combat à deux mains.");
};
//***************************************************************************************
//			Ich will trainieren
//***************************************************************************************
INSTANCE DIA_Babo_Teach(C_INFO)
{
	npc			= NOV_612_Babo;
	nr			= 100;
	condition	= DIA_Babo_Teach_Condition;
	information	= DIA_Babo_Teach_Info;
	permanent	= TRUE;
	description = "Je suis prêt à m'entraîner.";
};                       
//----------------------------------
var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;
//----------------------------------
FUNC INT DIA_Babo_Teach_Condition()
{
	if ((Babo_TeachPlayer == TRUE)
	&& (DIA_Babo_Teach_permanent == FALSE))
	|| (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
 
// -------------------------------
var int  babo_merk2h;
// -------------------------------
FUNC VOID DIA_Babo_Teach_Info()
{	
	babo_merk2h = other.HitChance [NPC_TALENT_2H]; 
	
	AI_Output (other,self ,"DIA_Babo_Teach_15_00"); //Je suis prêt.
	
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);

};
FUNC VOID DIA_Babo_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output (self,other,"DIA_DIA_Babo_Teach_Back_03_00"); //Vous avez appris tout ce que je suis capable de vous enseigner au sujet du combat avec une arme à deux mains.
		
		DIA_Babo_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Babo_Teach);
};

FUNC VOID DIA_Babo_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 75);
	
	if (other.HitChance [NPC_TALENT_2H]  >  babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_00"); //Battez-vous pour Innos car il est notre vie et c'est votre foi qui vous donnera la force.
		};
		if (Babo_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_01"); //Un serviteur d'Innos ne défie jamais son adversaire, il le surprend !
		};
		if (Babo_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_02"); //Où que vous alliez, n'oubliez jamais votre bâton.
		};
		if (Babo_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_03"); //Tout serviteur d'Innos se doit d'être prêt au combat à tout moment. Si vous n'avez pas de magie, votre bâton est votre meilleure défense.
		};
		
		Babo_Labercount = Babo_Labercount +1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;	
		};
	};
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);	
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);	
};

FUNC VOID DIA_Babo_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 75);
	
	if (other.HitChance [NPC_TALENT_2H]  >  babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_00"); //Les serviteurs d'Innos ne se battent pas qu'avec leur bâton, mais aussi avec leur cœur.
		};
		if (Babo_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_01"); //Vous devez apprendre à voir jusqu'à quel point il est possible de se replier.
		};
		if (Babo_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_02"); //N'oubliez jamais : vous aurez l'avantage tant que vous imposerez votre rythme à l'adversaire et que vous l'empêcherez de vous imposer le sien.
		};
		if (Babo_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_03"); //Et vous n'avez pas perdu tant que vous n'avez pas abandonné.
		};
		
		Babo_Labercount = Babo_Labercount +1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;	
		};
	};
	
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);	
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Babo_Wurst(C_INFO)
{
	npc         = NOV_612_Babo;
	nr			= 2;
	condition	= DIA_Babo_Wurst_Condition;
	information	= DIA_Babo_Wurst_Info;
	permanent	= FALSE;
	description = "Tenez, prenez une saucisse.";
};                       

FUNC INT DIA_Babo_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Babo_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Babo_Wurst_15_00"); //Tenez, voici une saucisse pour vous.
	AI_Output (self, other, "DIA_Babo_Wurst_03_01"); //Oh, génial ! J'adore les saucisses d'agneau. Donnez-m'en une autre.
	AI_Output (other, self, "DIA_Babo_Wurst_15_02"); //Si je le fais, il n'en restera plus assez pour les autres.
	AI_Output (self, other, "DIA_Babo_Wurst_03_03"); //De toute façon, vous avez une saucisse de trop. Celle qui vous est réservée, la vôtre. Et ce serait trop bête de mettre un terme à une si belle amitié pour si peu, non ?
	AI_Output (self, other, "DIA_Babo_Wurst_03_04"); //Allez... je veux bien vous donner un parchemin de Flèche de feu en échange.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Babo_Wurst);
	Info_AddChoice (DIA_Babo_Wurst,"Très bien, prenez-en une autre.",DIA_Babo_Wurst_JA);
	Info_AddChoice (DIA_Babo_Wurst,"Non, je ne ferai pas ça.",DIA_Babo_Wurst_NEIN);
};
FUNC VOID DIA_Babo_Wurst_JA()
{
	AI_Output (other, self, "DIA_Babo_Wurst_JA_15_00"); //D'accord, prenez-la.
	AI_Output (self, other, "DIA_Babo_Wurst_JA_03_01"); //Merci. Tenez, voici votre parchemin.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	B_GiveInvItems (self, other, ItSC_Firebolt, 1);
	
	Info_ClearChoices (DIA_Babo_Wurst);
};
FUNC VOID DIA_Babo_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Babo_Wurst_NEIN_15_00"); //Non, c'est hors de question.
	AI_Output (self, other, "DIA_Babo_Wurst_NEIN_03_01"); //Ah, vous êtes du genre tâtillon, c'est ça ?
	Info_ClearChoices (DIA_Babo_Wurst);
};
//***********************************************************************
//	Was ist zwischen dir und Agon passiert? 
//***********************************************************************

INSTANCE DIA_Babo_YouAndAgon   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 3;
	condition   = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent   = FALSE;
	description	= "Que s'est-il passé entre vous et Agon ?";
};

FUNC INT DIA_Babo_YouAndAgon_Condition()
{
	if Npc_KnowsInfo (other,DIA_Opolos_Monastery)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Babo_YouAndAgon_Info()
{
	AI_Output (other,self ,"DIA_Babo_YouAndAgon_15_00"); //Que s'est-il passé entre Agon et vous ?
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_01"); //Oh, nous nous sommes querellés au sujet de la meilleure façon de s'occuper des orties de feu.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_02"); //Agon les avait tellement arrosées qu'elles ont pourri sur pied.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_03"); //Et quand cela s'est produit, Agon a rejeté la faute sur moi.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_04"); //Depuis, je suis condamné à balayer la cour tous les jours.
};
//***********************************************************************
//	Warum hat Agon das getan?
//***********************************************************************
INSTANCE DIA_Babo_WhyDidAgon  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 4;
	condition   = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent   = FALSE;
	description	= "Pourquoi Agon a-t-il fait ça ?";
};
FUNC INT DIA_Babo_WhyDidAgon_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_WhyDidAgon_Info()
{
	AI_Output (other,self ,"DIA_Babo_WhyDidAgon_15_00"); //Pourquoi Agon a-t-il fait ça ?
	AI_Output (self ,other,"DIA_Babo_WhyDidAgon_03_01"); //C'est à lui qu'il faudrait poser la question. Personnellement, je pense qu'il ne supporte pas que quelqu'un en sache plus que lui.
};
//***********************************************************************
//	Du hast wohl Ahnung von Pflanzen?
//***********************************************************************
INSTANCE DIA_Babo_PlantLore  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 5;
	condition   = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent   = FALSE;
	description	= "Vous semblez savoir une ou deux choses au sujet des plantes.";
};
FUNC INT DIA_Babo_PlantLore_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_PlantLore_Info()
{
	AI_Output (other,self ,"DIA_Babo_PlantLore_15_00"); //Vous sembler vous y connaître en jardinage...
	AI_Output (self ,other,"DIA_Babo_PlantLore_03_01"); //Nous avions un jardins d'herbes arômatiques à la maison et mon grand-père m'a tout appris.
	AI_Output (self ,other,"DIA_Babo_PlantLore_03_02"); //Je vous l'avoue, je préférerais de beaucoup recommencer à travailler au jardin.
	
	MIS_HelpBabo = LOG_RUNNING;
	Log_CreateTopic (Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus (Topic_BaboGaertner,LOG_RUNNING);
	B_LogEntry (Topic_BaboGaertner,"Babo préfère travailler dans le jardin plutôt que de balayer la cour.");
};
//***********************************************************************
//	Fegen
//***********************************************************************
INSTANCE DIA_Babo_Fegen  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent   = FALSE;
	description	= "Je suis censé balayer les chambres des novices.";
};
FUNC INT DIA_Babo_Fegen_Condition()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_Fegen_Info()
{
	AI_Output (other,self ,"DIA_Babo_Fegen_15_00"); //Je suis censé balayer les chambres des novices.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_01"); //Dans ce cas, vous allez avoir du travail. Vous savez quoi, je vais vous aider. Seul, vous n'y arriverez pas.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_02"); //Mais j'ai vraiment besoin d'un parchemin de Poing de vent. Vous savez, j'ai eu de la chance un jour, on m'a autorisé à lire un livre où se trouvait ce sort.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_03"); //Et depuis, j'ai envie de l'essayer, bien sûr. Obtenez-moi le parchemin et je vous aiderai.
	
	B_LogEntry 	(Topic_ParlanFegen,"Babo m'aidera à balayer les chambres des novices si je lui apporte un parchemin de Poing du vent.");
};
//***********************************************************************
//	Windfaust abgeben
//***********************************************************************
INSTANCE DIA_Babo_Windfaust  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 3;
	condition   = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent   = TRUE;
	description	= "Au sujet du parchemin de sort...(DONNER POING DE VENT)";
};
//---------------------------------
var int DIA_Babo_Windfaust_permanent;
//---------------------------------
FUNC INT DIA_Babo_Windfaust_Condition()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Babo_Fegen))
	&& (DIA_Babo_Windfaust_permanent == FALSE)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_Windfaust_Info()
{
	AI_Output (other,self ,"DIA_Babo_Windfaust_15_00"); //Au sujet du parchemin...
	AI_Output (self ,other,"DIA_Babo_Windfaust_03_01"); //Est-ce que vous avez le sort de Poing de vent que je vous avais demandé ?
	
	if B_GiveInvItems (other, self, ItSc_Windfist,1)
	{ 
		AI_Output (other,self ,"DIA_Babo_Windfaust_15_02"); //Voilà le parchemin que vous cherchiez.
		AI_Output (self ,other,"DIA_Babo_Windfaust_03_03"); //Parfait. Dans ce cas, je vais vous aider à balayer les chambres.
		
		NOV_Helfer = (NOV_Helfer +1);
		DIA_Babo_Windfaust_permanent = TRUE; 
		B_GivePlayerXP (XP_Feger);
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self,"FEGEN");
		
		B_LogEntry 	(Topic_ParlanFegen,"Babo va m'aider à balayer les chambres des novices.");
		
	}
	else
	{
		AI_Output (other,self ,"DIA_Babo_Windfaust_15_04"); //Non, pas encore.
		AI_Output (self ,other,"DIA_Babo_Windfaust_03_05"); //Dans ce cas, j'attends que vous me l'ameniez.
	};
	AI_StopProcessInfos (self);
};


//***********************************************************************
//	 Wie ist das Leben hier im Kloster?
//***********************************************************************
INSTANCE DIA_Babo_Life   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 10;
	condition   = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent   = TRUE;
	description	= "Comment est la vie au monastère ?";
};
FUNC INT DIA_Babo_Life_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Life_Info()
{
	AI_Output (other,self ,"DIA_Babo_Life_15_00"); //Comment vit-on au monastère ?
	AI_Output (self ,other,"DIA_Babo_Life_03_01"); //Je ne suis pas du genre à me plaindre, mais je n'aurais jamais cru que la vie y était aussi stricte. Ceux qui ne respectent pas les règles à la lettre sont systématiquement punis.
	AI_Output (self ,other,"DIA_Babo_Life_03_02"); //Beaucoup de novices font tout leur possible pour étudier les enseignements d'Innos à la bibliothèque afin d'être prêts s'ils viennent à être choisis.
	AI_Output (self ,other,"DIA_Babo_Life_03_03"); //Mais je crois, moi, que la meilleure préparation à l'épreuve de magie consiste à s'acquitter de ses tâches quotidiennes.
	
	if (Npc_KnowsInfo (other,DIA_Igaranz_Choosen) == FALSE)
	{
		AI_Output (other,self ,"DIA_Babo_Life_15_04"); //Qu'est-ce que c'est que cette histoire d'épreuve et d'être choisi ?
		AI_Output (self ,other,"DIA_Babo_Life_03_05"); //Allez voir frère Igaraz. Il est intarissable sur le sujet.
	};
};
//*********************************************************************
//		Sc hat Babo den Gärtnerposten verschafft (Kap. 2)
//*********************************************************************
INSTANCE DIA_Babo_HowIsIt   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 1;
	condition   = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent   = TRUE;
	description	= "Comment ça va ?";
};
FUNC INT DIA_Babo_HowIsIt_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Kapitel < 3)
	{
		return TRUE;
	};	
};
//--------------------
var int Babo_XPgiven;
//--------------------
FUNC VOID DIA_Babo_HowIsIt_Info()
{
	AI_Output (other,self ,"DIA_Babo_HowIsIt_15_00"); //Comment allez-vous ?
	
	if (MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_01"); //(humblement) Je remercie les magiciens de la tâche qu'ils m'ont confiée.
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_02"); //J'aime le jardinage et j'espère que mon travail donne entière satisfaction aux magiciens, maître.
		
		if (Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP (XP_Ambient);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_03"); //(surpris) Je... bien, bien, maître.
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_04"); //Je... je travaille dur et je fais tout mon possible pour que les magiciens soient contents de moi.
	};
	
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 2
//##
//####################################################

INSTANCE DIA_Babo_Kap2_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap2_EXIT_Condition;
	information = DIA_Babo_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 3
//##
//####################################################

INSTANCE DIA_Babo_Kap3_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap3_EXIT_Condition;
	information = DIA_Babo_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



//******************************
// hallo!
//******************************

INSTANCE DIA_Babo_Kap3_Hello   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent   = FALSE;
	description = "Que faites-vous ici ?";
};
FUNC INT DIA_Babo_Kap3_Hello_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Hello_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Hello_15_00"); //Que faites-vous ici ?

	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Hello_03_01"); //(penaud) J'essaye d'accomplir les tâches qui m'ont été confiées afin de donner entière satisfaction à ma hiérarchie.
	}	
	else
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Hello_03_02"); //Je ne dois pas vous parler. Il nous est fortement déconseillé d'adresser la parole aux étrangers.
	}; 
};

//*********************************************
//	Kopf hoch!
//*********************************************

INSTANCE DIA_Babo_Kap3_KeepTheFaith   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent   = FALSE;
	description = "Vous ne devez jamais perdre la foi.";
};
FUNC INT DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_KeepTheFaith_15_00"); //Il ne faut jamais perdre la foi.
	AI_Output (self ,other,"DIA_Babo_Kap3_KeepTheFaith_03_01"); //(pris en défaut) Je... non ! Jamais je ne ferai une chose pareille ! Vraiment.
	AI_Output (other,self ,"DIA_Babo_Kap3_KeepTheFaith_15_02"); //La vie nous impose des épreuves sévères à tous.
	AI_Output (self ,other,"DIA_Babo_Kap3_KeepTheFaith_03_03"); //Oui, maître. Je tâcherai de m'en souvenir. Merci.
	
	B_GivePlayerXP (XP_Ambient); 
};

//*********************************************
//	Das klingt aber nicht sehr glücklich.
//*********************************************

INSTANCE DIA_Babo_Kap3_Unhappy   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent   = FALSE;
	description = "Cela n'a pas l'air très joyeux.";
};
FUNC INT DIA_Babo_Kap3_Unhappy_Condition()
{
	if (Kapitel >= 3)
	&& (hero.guild != GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_15_00"); //Vous n'avez guère l'air heureux.
	AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_03_01"); //(pris en défaut) Euh... eh bien, non, tout va bien, vraiment.
	AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_03_02"); //C'est juste que... oh, mais je ne voudrais pas avoir l'air de me plaindre.

	Info_ClearChoices	(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice	(DIA_Babo_Kap3_Unhappy,"Alors, cessez de vous lamenter.",DIA_Babo_Kap3_Unhappy_Lament); 
	Info_AddChoice	(DIA_Babo_Kap3_Unhappy,"Allez, vous pouvez me le dire.",DIA_Babo_Kap3_Unhappy_TellMe);
};

	FUNC VOID DIA_Babo_Kap3_Unhappy_Lament ()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Lament_15_00"); //Dans ce cas, cessez de geindre.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01"); //(inquiet) Je... ne le dites pas aux magiciens, je vous en prie.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02"); //Je ne voudrais pas être de nouveau puni.
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Lament_15_03"); //Je vais y réfléchir.
		
		Info_ClearChoices	(DIA_Babo_Kap3_Unhappy);
	};
	
	FUNC VOID DIA_Babo_Kap3_Unhappy_TellMe ()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_00"); //Allez, vous pouvez bien me le dire...
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01"); //Vous n'en parlerez pas aux magiciens, c'est sûr ?
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_02"); //Ai-je l'air d'un délateur ?
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03"); //D'accord. L'un des novices me cause des ennuis. Il me fait chanter.
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_04"); //Bon, vous allez me le dire, oui ou non ?
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05"); //Igaraz, c'est son nom, a trouvé des documents qui m'appartiennent... des papiers de nature privée.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06"); //Il m'a menacé de les remettre aux magiciens si je ne faisais pas tout ce qu'il me dit.
		
		MIS_BabosDocs = LOG_RUNNING; 
		
		Log_CreateTopic (Topic_BabosDocs,LOG_MISSION);
		Log_SetTopicStatus (Topic_BabosDocs,LOG_RUNNING);
		B_LogEntry (Topic_BabosDocs,"Igaraz fait chanter le novice Babo à propos de certains documents.");
		
		Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Je crois que c'est un peu trop personnel.",DIA_Babo_Kap3_Unhappy_Privat);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Qu'êtes-vous censé faire pour lui ?",DIA_Babo_Kap3_Unhappy_ShouldDo);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Quel genre de documents est-ce ?",DIA_Babo_Kap3_Unhappy_Documents); 
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Peut-être puis-je vous aider ?",DIA_Babo_Kap3_Unhappy_CanHelpYou);
	};

		FUNC VOID DIA_Babo_Kap3_Unhappy_Privat ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Privat_15_00"); //Cette histoire ne me regarde pas.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01"); //Je comprends... vous ne voulez pas d'ennuis. Il va me falloir régler cela moi-même.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Privat_15_02"); //Je suis sûr que vous y arriverez.
		
			Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_ShouldDo ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00"); //Qu'êtes-vous censé faire pour lui ?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01"); //Je n'aime pas en parler. Mais ce qui est sûr, c'est que cela ne doit pas plaire à Innos.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02"); //Et je préfère ne pas penser à ce qui risque de m'arriver si cela se sait un jour...
		
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_Documents ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_00"); //De quel genre de documents s'agit-il ?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01"); //(hésitant) Euh... cela ne regarde personne... personne d'autre que moi.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_02"); //Allons, vous pouvez bien me le dire...
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03"); //Ce sont des documents... euh, tout ce qu'il y a de plus normal. Ils n'ont rien de spécial.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_04"); //Très bien, je ne vous interrogerai plus à ce sujet.
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_CanHelpYou ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00"); //Je peux peut-être vous aider...
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01"); //Vous accepteriez de le faire ?
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02"); //Ça dépend...
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03"); //(précipitamment) Je vous paierai, bien sûr.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04"); //Combien ?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05"); //Je n'ai pas beaucoup d'argent, mais je peux vous donner un parchemin contenant un sort de guérison.
			
			Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Je préfère ne pas m'en mêler.",DIA_Babo_Kap3_Unhappy_No);
			Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Je vais voir ce que je peux faire.",DIA_Babo_Kap3_Unhappy_Yes);
		};

			FUNC VOID DIA_Babo_Kap3_Unhappy_No ()
			{
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_No_15_00"); //Je préfère ne pas me mêler de cette affaire.
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_No_03_01"); //Dans ce cas, je n'ai pas le choix. Il va me falloir faire ce qu'il dit.
			
				Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			};
			
			FUNC VOID DIA_Babo_Kap3_Unhappy_Yes ()
			{
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Yes_15_00"); //Je verrai ce que je peux faire.
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01"); //(fou de joie) Ça marchera, j'en suis sûr ! Il le faut !
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02"); //Il vous suffit de découvrir où Igaraz les a rangés et de les lui reprendre. Vous voyez, c'est enfantin.
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Yes_15_03"); //Détendez-vous et continuez à vivre normalement. Je me charge de tout.
				
				Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			};

//********************************
//Ich hab deine Dokumente
//********************************

INSTANCE DIA_Babo_Kap3_HaveYourDocs   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent   = FALSE;
	description = "J'ai vos documents.";
};
FUNC INT DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if ((MIS_BabosDocs == LOG_RUNNING				)
	&&   (Npc_HasItems (other,ItWr_BabosDocs_MIS) 	>= 1)
	||  ((Npc_HasItems (other,ItWr_BabosPinUp_MIS) 	>= 1)
	&&   (Npc_HasItems (other,ItWr_BabosLetter_MIS) >= 1)))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_15_00"); //J'ai vos documents.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_03_01"); //C'est vrai ? Vous me sauvez la vie ! Je ne sais comment vous remercier.
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_15_02"); //Oui, oui... calmez-vous, d'accord ?
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_03_03"); //(nerveux) Ce sont vraiment les miens ? Vous en êtes sûr ? Montrez-les moi.
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Je vais les garder encore un peu.",DIA_Babo_Kap3_HaveYourDocs_KeepThem);
	
	if (BaboSDocsOpen == TRUE)
	{
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Le fait est que le prix a augmenté.",DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};
	
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Les voici.",DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00"); //Je préfère les conserver quelque temps encore...
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01"); //(stupéfait) Quoi ? Qu'est-ce que cela signifie ? Qu'est-ce que vous mijotez ?
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Je plaisantais.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Ce sont mes affaires.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
	
	if (Igaraz_IsPartner == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Igaraz et moi-même sommes associés.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner);
	};
};

	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00"); //Je plaisantais, c'est tout.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01"); //(acerbe) Ha, ha ! Excusez-moi, mais ce n'est vraiment pas drôle. Où sont-ils ?
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02"); //Tenez.
		
		if (Npc_HasItems (other,ItWr_BabosDocs_MIS) >= 1)
		{
			B_GiveInvItems (other,self,ItWr_BabosDocs_MIS,1);	
		}
		else
		{
			B_GiveInvItems (other,self,ItWr_BabosPinUp_MIS,1);
			B_GiveInvItems (other,self,ItWr_BabosLetter_MIS,1);
		};
		
		B_UseFakeScroll ();
		
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03"); //Je ne voulais pas vous insulter, mais toute cette affaire me rend très nerveux.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04"); //Ce n'est pas grave. Reprenez vos documents et amusez-vous bien.
		
		MIS_BabosDocs = LOG_SUCCESS;
		B_GivePlayerXP (XP_BabosDocs);
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00"); //Ça ne regarde que moi.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01"); //Ces documents m'appartiennent. Vous n'avez pas le droit de vous les approprier.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02"); //A la prochaine.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00"); //Igaraz et moi sommes associés désormais.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01"); //(stupéfait) Quoi ? Vous ne pouvez pas me faire ça !
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02"); //On dirait bien que si. Je conserve ces papiers et la situation reste en l'état.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03"); //Je vais régler la question financière avec Igaraz.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04"); //Prenez bien soin des plantes.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05"); //Honte à vous ! Vous êtes infâme ! Innos vous punira !
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,Dialog_Ende,DIA_Babo_Kap3_HaveYourDocs_End);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Surveillez votre langage.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"N'avez-vous rien à faire ?",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo);
	};
	
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_End ()
		{
			AI_StopProcessInfos (self);
		};
		
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00"); //Attention à ce que vous dites.
			AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01"); //Comme toujours, je suis trop gentil.
			
			AI_StopProcessInfos (self); 
		};
						
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00"); //Vous n'avez rien à faire ?
			AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01"); //Je comprends parfaitement, mais cela ne s'arrêtera pas là, vous pouvez m'en croire.
			
			AI_StopProcessInfos (self); 
		};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00"); //Le prix a augmenté, en accord avec les faits.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01"); //Vous ne valez pas mieux que les autres. Qu'est-ce que vous voulez ?
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02"); //Qu'est-ce que vous avez à m'offrir ?
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03"); //Je peux vous donner 121 pièces d'or. C'est tout ce que j'ai.
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Cela ne suffira pas.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"D'accord.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00"); //Ce n'est pas assez.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01"); //Mais je n'ai pas davantage d'argent. Si j'avais su cela, je ne serais jamais entré au monastère.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00"); //D'accord.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01"); //Voici l'argent et le parchemin.
		
		CreateInvItems (self ,ItSc_MediumHeal,1);
		CreateInvItems (self ,ItMi_Gold,121);
		B_GiveInvItems (self,other,ItSc_MediumHeal,1);
		B_GiveInvItems (self ,other,ItMi_Gold,121);
		
		MIS_BabosDocs = LOG_SUCCESS;
		B_GivePlayerXP (XP_BabosDocs); 
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00"); //Tenez.
	
	if (Npc_HasItems (other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems (other,self,ItWr_BabosDocs_MIS,1);	
	}
	else
	{
		B_GiveInvItems (other,self,ItWr_BabosPinUp_MIS,1);
		B_GiveInvItems (other,self,ItWr_BabosLetter_MIS,1);
	};
	
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01"); //Oui, tout est bien là.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02"); //Vous les avez lus ?
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03"); //Est-ce que cela changerait quoi que ce soit ?
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04"); //Non, du moment que je les ai récupérés.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05"); //J'espère que je vais pouvoir retrouver le sommeil désormais.
	
	CreateInvItems (self ,ItSc_MediumHeal,1);
	B_GiveInvItems (self,other,ItSc_MediumHeal,1);
	
	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP (XP_BabosDocs);
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
};

//*********************************************
//	Bist du zufrieden?
//*********************************************

INSTANCE DIA_Babo_Kap3_Perm   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 39;
	condition   = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent   = TRUE;
	description = "Etes-vous satisfait de votre tâche ?";
};
FUNC INT DIA_Babo_Kap3_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Perm_15_00"); //Est-ce que votre travail vous convient ?
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_01"); //(peu convainquant) Oui, bien sûr. Ma foi en la sagesse et la puissance d'Innos me donne la force nécessaire pour m'en acquitter.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_02"); //(cherche à s'esquiver) Je ne voudrais pas vous manquer de respect, mais j'ai fort à faire aujourd'hui.
		AI_Output (other,self ,"DIA_Babo_Kap3_Perm_15_03"); //Vous pouvez vaquer à vos occupations.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_04"); //(soulagé) Merci.
	}
	else
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_05"); //Ça va, mais il faut que je me remette au travail, sans quoi je n'aurai jamais fini aujourd'hui.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_06"); //Je ne tiens pas à passer une nouvelle fois la moitié de la nuit à travailler pour éviter les ennuis.
	};
	
	AI_StopProcessInfos (self); 
};



//####################################################
//##
//##	Kapitel 4
//##
//####################################################

INSTANCE DIA_Babo_Kap4_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap4_EXIT_Condition;
	information = DIA_Babo_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 5
//##
//####################################################

INSTANCE DIA_Babo_Kap5_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap5_EXIT_Condition;
	information = DIA_Babo_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Babo_PICKPOCKET (C_INFO)
{
	npc			= NOV_612_Babo;
	nr			= 900;
	condition	= DIA_Babo_PICKPOCKET_Condition;
	information	= DIA_Babo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Babo_PICKPOCKET_Condition()
{
	C_Beklauen (17, 25);
};
 
FUNC VOID DIA_Babo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Babo_PICKPOCKET);
	Info_AddChoice		(DIA_Babo_PICKPOCKET, DIALOG_BACK 		,DIA_Babo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Babo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Babo_PICKPOCKET_DoIt);
};

func void DIA_Babo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Babo_PICKPOCKET);
};
	
func void DIA_Babo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Babo_PICKPOCKET);
};


