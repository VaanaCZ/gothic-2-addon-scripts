var int Edgor_Exiteinmal;

INSTANCE DIA_Addon_Edgor_EXIT   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 999;
	condition   = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_MIS2)
	&& (Edgor_Exiteinmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //Heureux de vous avoir connu...
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Edgor_PICKPOCKET (C_INFO)
{
	npc			= BDT_1074_Addon_Edgor;
	nr			= 900;
	condition	= DIA_Addon_Edgor_PICKPOCKET_Condition;
	information	= DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	C_Beklauen (10, 7);
};
 
FUNC VOID DIA_Addon_Edgor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	B_Say (self, self, "$AWAKE");
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
	
func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Hi   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent   = FALSE;
	description = "Comment ça se passe ?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //Comment ça va ?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Vous voulez savoir comment ça va ? Je vais vous dire comment ça va !
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //D'abord, des pirates me débarquent ici un soir de tempête. Mon gars, j'ai jamais autant vomi de toute ma vie !
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //Ensuite, Raven ferme l'accès à la mine parce que certains crétins sont trop assoiffés d'or.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //Et ensuite, Franco devient le chef des chasseurs et commence à tuer tous ceux qui se dressent contre lui !
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Je dirais que ça ne va pas super bien.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//---------------------------------------------------------------------
//	Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Franco (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent   = FALSE;
	description = "Comment Franco a-t-il pu devenir le leader ?";
};
FUNC INT DIA_Addon_Edgor_Franco_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Franco_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //Comment Franco a-t-il pu devenir le leader ?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Très simplement ! Il a tué Fletcher, qui était l'un des chefs des chasseurs.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Mais Fletcher était correct. Franco passe son temps à nous chercher des ennuis.
};	

//---------------------------------------------------------------------
//	Info MIS2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_MIS2   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent   = FALSE;
	description = "Franco m'envoie ici à propos de cette tablette de pierre...";
};
FUNC INT DIA_Addon_Edgor_MIS2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franco m'a envoyé ici à propos de cette tablette de pierre. Vous l'avez trouvée ?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //Franchement, je ne l'ai même pas encore cherchée. Tout ce que je sais, c'est qu'elle est censée être cachée dans un vieux bâtiment tout au fond du marais.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //Et ma voix intérieure me dit 'Edgor, ne t'approche pas des vieux bâtiments au fin fond d'un marais puant !'
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Hors de question que je risque ma vie pour ce goret de Franco !
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor ne partira jamais à la recherche de la tablette de pierre. Il dit qu'elle se trouve quelque part dans un vieux bâtiment au cœur du marais.");
};
//---------------------------------------------------------------------
//	Info Wegbeschreibung
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Weg   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent   = FALSE;
	description = "Où se trouve ce vieux bâtiment, au juste ?";
};
FUNC INT DIA_Addon_Edgor_Weg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Edgor_MIS2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Weg_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //Où se trouve ce vieux bâtiment, au juste ?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Passez devant le gros rocher, là-bas. Un peu plus loin, vous trouverez un autre gros rocher.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Quand vous atteignez celui-la, il faut prendre à droite ou gauche - je ne me rappelle plus, ça fait bien trop longtemps !
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Les ruines du bâtiment devraient se trouver en hauteur. Elles sont sûrement recouvertes de végétation, maintenant...
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Peut-être que vous aurez de la chance et que vous ne la trouverez pas...
};
//---------------------------------------------------------------------
//	Info Found
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Found   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent   = FALSE;
	description = "J'ai trouvé la tablette de pierre !";
};
FUNC INT DIA_Addon_Edgor_Found_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04) >= 1)
	&& !Npc_IsDead (Franco)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Found_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//(content) J'ai trouvé la tablette de pierre !
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//(blasé) Vraiment ? Vous devez être un type très courageux
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//(blasé) Ça vous vaudra certainement le droit d'entrer dans le camp. (baille)
};
//---------------------------------------------------------------------
//	Info Teach
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Teach   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent   = FALSE;
	description = "Pouvez-vous m'enseigner quelque chose ?";
};
FUNC INT DIA_Addon_Edgor_Teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//Pouvez-vous m'apprendre quelque chose ?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//Je sais bien des choses sur les mouches sanguines. Je hais ces saletés de bestioles encore plus que je hais Franco !
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Mais je sais comment arracher les dards et les ailes de leurs cadavres. (délirant) Ouais, leur arracher...
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//En plus, je sais comment extraire les secrétions de leur dard.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Si vous voulez, je peux vous enseigner tous ces trucs.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Bien sûr, aucun service n'est gratuit, dans le coin...
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor sait bien des choses sur les mouches sanguines et leurs trophées.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Allez me chercher l'or. Je veux des pièces, pas des pépites.
};
//---------------------------------------------------------------------
//	Info Train (Bloodflys)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_TrainStart   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent   = TRUE;
	description = "A propos de ces mouches sanguines...";
};
FUNC INT DIA_Addon_Edgor_Start_Condition()
{	
	if (Edgor_Teach == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Start_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//A propos des mouches sanguines...
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Que voulez-vous savoir ?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Extraire les dards des mouches sanguines (Coût : 5 PA, 100 pièces d'or)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Arracher les ailes des mouches sanguines (Coût : 5 PA, 100 pièces d'or)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Extraire les secrétions du dard (Coût : 1 PA, 100 pièces d'or)",DIA_Addon_Edgor_TrainStart_GIFT);
	};
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Sting()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Comment puis-je arracher les dards des mouches sanguines ?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Vous posez la bestiole sur le ventre, et vous l'ouvrez dans le sens de la largeur. Vous attrapez ses entrailles, puis vous entaillez tout les tissus jusqu'au niveau du dos.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//Alors, vous pourrez retirer le dard en tirant dessus d'un coup sec.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Wing()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//Comment puis-je en arracher les ailes ?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//Vous prenez une aile dans une main. Avec l'autre, vous la découpez au niveau de la couche supérieure de la carapace.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_GIFT()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if (other.lp >= 1)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Comment puis-je extraire les secrétions du dard des mouches sanguines ?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Entaillez la couche supérieure du dard dans le sens de la longueur - ensuite, la sécrétion médicinale commencera à couler.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//Si vous faites comme ça, il n'y a aucun risque à aspirer les secrétions d'un dard - vous pouvez aussi les utiliser dans des potions.
			
			other.lp = (other.lp - 1);
			Knows_Bloodfly = TRUE; 
			PrintScreen (PRINT_ADDON_KNOWSBF, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};		


