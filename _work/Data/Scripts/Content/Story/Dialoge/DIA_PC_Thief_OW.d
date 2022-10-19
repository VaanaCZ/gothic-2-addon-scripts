// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_DiegoOw_EXIT(C_INFO)
{
	npc			= PC_ThiefOw;
	nr			= 999;
	condition	= DIA_DiegoOw_EXIT_Condition;
	information	= DIA_DiegoOw_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_DiegoOw_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//******************************************************************
//				Begr�ssung
//******************************************************************
INSTANCE DIA_DiegoOw_Hallo(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 1;
	condition	= DIA_DiegoOw_Hallo_Condition;
	information	= DIA_DiegoOw_Hallo_Info;

	Important	= TRUE;
};                       
FUNC INT DIA_DiegoOw_Hallo_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Hallo_Info()
{	
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_00");//H�! Je vous croyais mort.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_01");//C'est vrai, je l'�tais.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_02");//Mais me voil� de retour, et je cherche actuellement la preuve de la venue des dragons.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_03");//Qui vous a demand� �a�?
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_04");//Je travaille pour le seigneur Hagen. Avec l'aide des paladins, je pense qu'il est possible d'arr�ter les dragons.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_05");//Les paladins�? Laissez-moi vous dire quelque chose. Apr�s avoir r�ussi � fuir d'ici, je suis parti pour Khorinis.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_06");//Je voulais avertir les paladins de l'existence des dragons. Le ciel sait pourquoi j'ai essay�.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_07");//Ce pr�tentieux de Lothar ne m'a m�me pas �cout�. Et quand � obtenir une audience avec le seigneur Hagen, autant ne pas y songer.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_08");//Au lieu de �a, on m'a renvoy� ici avec l'exp�dition, alors, ne me parlez plus des paladins.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_09");//Ce qui compte, c'est d'arr�ter les dragons avant qu'il ne soit trop tard, peu importe de savoir qui nous aide.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_10");//Les arr�ter�? Ce que je dis, moi, c'est qu'il faudrait plut�t ficher le camp d'ici tant que c'est encore possible.
	
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_03");//Dites, comment avez-vous r�ussi � franchir le col�? Je croyais qu'il grouillait d'orques.
	AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_04");//Il existe un passage par la mine abandonn�e, et les orques ne l'occupent pas encore.
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_05");//C'est bon � savoir. Dans ce cas je partirai bient�t pour Khorinis. J'ai quelques comptes � r�gler l�-bas...
};	

//******************************************************************
//				Beweise
//******************************************************************
INSTANCE DIA_DiegoOw_Beweise(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 2;
	condition	= DIA_DiegoOw_Beweise_Condition;
	information	= DIA_DiegoOw_Beweise_Info;

	description	= "Ecoutez, j'ai besoin de cette preuve...";
};                       
FUNC INT DIA_DiegoOw_Beweise_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Beweise_Info()
{	
		//AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_00");//Was wei�t du von Silvestros Erz?
	
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_11"); //Ecoutez, j'ai besoin de cette preuve...
		
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_14");//D'accord, je vous aiderai si je le peux, mais ne vous attendez pas � ce que je prenne des risques... ni pour vous, ni pour personne.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_12");//Tr�s bien. Si vous voulez vraiment remplir votre mission, allez parler au commandant Garond.
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_13");//Si quelqu'un est bien plac� pour �tre au courant des attaques de dragons, ce sont les soldats du ch�teau.
	};
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_00");//Je suis ici � la demande de Garond. Il a besoin de savoir quelle quantit� de minerai a �t� extraite jusqu'� pr�sent.
		AI_Output (self ,other,"DIA_DiegoOw_Garond_11_01");//Et � ce moment l�, il vous donnera la preuve dont vous avez besoin�?
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_02");//Exactement. Alors, que pouvez-vous me dire � ce sujet�?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Garond_11_01"); //Et tant que vous �tes au ch�teau, profitez-en pour dire � Garond quelque chose qui devrait beaucoup l'int�resser :
	};
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") <= 1000)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_01"); //Il y a quatre coffres de minerai � l'arri�re de la grotte. Ce sont les hommes de Silvestro qui l'ont extrait.
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_02"); //Garond peut venir les chercher si �a lui chante, mais qu'il ne s'attende pas � me trouver ici quand il arrivera.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_01"); //Dans cette grotte pr�s de l'endroit o� je me suis cach�, il trouvera les quatre caisses de minerai. Ce sont les hommes de Silvestro qui l'ont extrait
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_02"); //Garond peut venir les chercher si �a lui chante � De toute fa�on, je n'en ai pas l'utilit�...
	};
	
	Silvestro_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Diego a emmen� en lieu s�r QUATRE caisses de minerai collect�s par les mineurs de Silvestro.");
};
//******************************************************************
//			Mine
//******************************************************************
INSTANCE DIA_DiegoOw_Mine(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 3;
	condition	= DIA_DiegoOw_Mine_Condition;
	information	= DIA_DiegoOw_Mine_Info;
	permanent	= FALSE;
	description = "Comment vous �tes-vous procur� ce minerai ?";
};                       

FUNC INT DIA_DiegoOw_Mine_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_DiegoOw_Beweise))
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoOw_Mine_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Mine_15_00");//Comment vous �tes-vous retrouv� en possession du minerai ?
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_01");//Je faisais partie du groupe de Silvestro. Nous prospections depuis plusieurs jours quand il est brusquement devenu nerveux.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_02");//Il nous a dit qu'il fallait mettre le minerai en lieu s�r.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_03");//Comme j'avais de toute fa�on l'intention de filer, je me suis port� volontaire.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_04");//Bien m'en a pris, parce que les mineurs ont crois� la route de plusieurs foreurs des mines et aucun d'eux n'a surv�cu.
};
//******************************************************************
//			Ritter
//******************************************************************
INSTANCE DIA_DiegoOw_Ritter(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 4;
	condition	= DIA_DiegoOw_Ritter_Condition;
	information	= DIA_DiegoOw_Ritter_Info;
	permanent	= FALSE;
	description = "Et en ce qui concerne les deux chevaliers morts ?";
};                       

FUNC INT DIA_DiegoOw_Ritter_Condition()
{	
	if (Npc_HasItems (PAL_Leiche4,ItMI_OldCoin) == 0)
	|| (Npc_HasItems (PAL_Leiche5,ItMI_OldCoin) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoOw_Ritter_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Ritter_15_00");//Que pouvez-vous me dire au sujet des deux chevaliers morts � l'entr�e de votre cachette�?
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_01");//Ils se sont fait tuer par un groupe de saurinides.
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_02");//La Vall�e des mines a ses propres r�gles. J'ai bien essay� de le leur faire comprendre mais ils ont fait la sourde oreille.
};
//******************************************************************
//			Perm
//******************************************************************
INSTANCE DIA_DiegoOw_Perm(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 5;
	condition	= DIA_DiegoOw_Perm_Condition;
	information	= DIA_DiegoOw_Perm_Info;
	permanent	= FALSE;
	description = "Que faut-il que je sache au sujet de la vall�e�?";
};                       
FUNC INT DIA_DiegoOw_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Perm_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Perm_15_00");//Que faut-il que je sache au sujet de la vall�e�?
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_01");//Plusieurs choses ont chang� depuis la destruction de la Barri�re. Les orques sont d�sormais les patrons.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_02");//Et les humains ne sont plus qu'une source de nourriture pour les v�ritables ma�tres des lieux, les dragons.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_03");//Si vous croisez une cr�ature qui a l'air plus forte que vous, �vitez-la. Et �vitez surtout tout ce qui ressemble de pr�s ou de loin � un dragon !
};

//******************************************************************
//			Gorn Freikaufen
//******************************************************************
INSTANCE DIA_DiegoOw_Gorn(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 6;
	condition	= DIA_DiegoOw_Gorn_Condition;
	information	= DIA_DiegoOw_Gorn_Info;
	permanent	= FALSE;
	description = "Je veux acheter la libert� de Gorn...";
};                       

FUNC INT DIA_DiegoOw_Gorn_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoOw_Gorn_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Gorn_15_00");//Je voudrais bien racheter la libert� de Gorn, mais Garond en exige 1�000 pi�ces d'or.
	AI_Output (self ,other,"DIA_DiegoOw_Gorn_11_01");//C'est une coquette somme. J'ai 300 pi�ces d'or sur moi, vous pouvez les prendre. Vous devrez r�unir le reste vous-m�me.
	
	B_GiveInvItems (self, other, ItmI_Gold, 300);
	
	B_LogEntry (TOPIC_RescueGorn,"Diego a pay� 300 pi�ces d'or pour la lib�ration de Gorn.");
};

//******************************************************************
//		Kannst du mir was beibringen?
//******************************************************************
var int Diego_MerkeDEX;
var int Diego_MerkeSTR;
// -----------------------------------------------------------------
instance DIA_DiegoOw_Teach(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 100;
	condition	= DIA_DiegoOw_Teach_Condition;
	information	= DIA_DiegoOw_Teach_Info;
	permanent	= TRUE;
	description = "Pouvez-vous m'enseigner quelque chose ?";
};                       
func INT DIA_DiegoOw_Teach_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_DiegoOw_Teach_info ()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Teach_15_00");//Pouvez-vous m'apprendre quelque chose ?
	AI_Output (self, other,"DIA_Addon_DiegoOw_Teach_11_01");//Bien, que voulez-vous savoir ?
		
	Diego_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Diego_MerkeSTR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_Teach, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACH_BACK()
{
	if (other.attribute[ATR_DEXTERITY] > Diego_MerkeDEX)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_02"); //Votre d�xt�rit� est d�j� meilleure qu'avant.
	};
	if (other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_03"); //(appr�ciateur) Bien. Vous avez augment� votre force.
	};
	
	Info_ClearChoices (DIA_DiegoOw_TEACH);
};
func void DIA_DiegoOw_TEACHDEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACHDEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACHSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACHSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_ThiefOW_PICKPOCKET (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 900;
	condition	= DIA_ThiefOW_PICKPOCKET_Condition;
	information	= DIA_ThiefOW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_ThiefOW_PICKPOCKET_Condition()
{
	C_Beklauen (120, 600);
};
 
FUNC VOID DIA_ThiefOW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_ThiefOW_PICKPOCKET);
	Info_AddChoice		(DIA_ThiefOW_PICKPOCKET, DIALOG_BACK 		,DIA_ThiefOW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_ThiefOW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_ThiefOW_PICKPOCKET_DoIt);
};

func void DIA_ThiefOW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_ThiefOW_PICKPOCKET);
};
	
func void DIA_ThiefOW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_ThiefOW_PICKPOCKET);
};

// ************************************************************
// *** 														***
// 					Mit Diego Durch die Gegend
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 					Lass uns zusammen gehen!
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_Together(C_INFO)
{
	npc			= 	PC_ThiefOW;
	nr		 	= 	11;
	condition	= 	DIA_Addon_ThiefOW_Together_Condition;
	information	= 	DIA_Addon_ThiefOW_Together_Info;

	description	= 	"Allons-y ensemble.";
};
func int DIA_Addon_ThiefOW_Together_Condition ()
{
	return TRUE;
};
func void DIA_Addon_ThiefOW_Together_Info ()
{
	AI_Output (other, self,	"DIA_Addon_Diego_Together_15_00"); //Partons ensemble.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_01"); //Jusqu'au col ? Pourquoi pas...
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_02"); //Passez en premier. Vous en revenez.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_03"); //Mais n'envisagez m�me pas d'aller trop pr�s du ch�teau ou jusqu'au mur des Orques.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_04"); //Nous devons aussi �viter les camps fortifi�s des paladins.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_05"); //Je viens de m'�chapper de l'un d'eux et je n'ai pas l'intention de retourner peiner dans l'une des mines.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_06"); //Et cela va sans dire que nous ne nous approchons d'aucun dragon.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_07"); //Faites-le moi savoir d�s que vous �tes pr�t.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_ComeOn(C_INFO)
{
	npc			= 	PC_ThiefOW;
	nr		 	= 	12;
	condition	= 	DIA_Addon_ThiefOW_ComeOn_Condition;
	information	= 	DIA_Addon_ThiefOW_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Venez avec moi.";
};
func int DIA_Addon_ThiefOW_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_ThiefOW_Together))
	&& (Diego_angekommen == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_ThiefOW_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Diego_ComeOn_15_00"); //Venez avec moi.
	
	if (C_DiegoTooFar(0))
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_01"); //C'est la mauvaise direction !

		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_02"); //Tr�s bien.

		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_ThiefOW_GoHome(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 13;
	condition	= DIA_Addon_ThiefOW_GoHome_Condition;
	information	= DIA_Addon_ThiefOW_GoHome_Info;
	permanent	= TRUE;
	description = "Attendez-moi ici.";
};                       
FUNC INT DIA_Addon_ThiefOW_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_ThiefOW_GoHome_Info()
{	
	AI_Output (other, self,"DIA_Addon_Diego_WarteHier_15_00"); //Attendez ici !
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") < 2000)
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_01"); //D'accord. 
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else if (Npc_GetDistToWP (self, "DT_E1_04") < (1500+1000)) //XARDAS
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_02"); //J'attendrai � l'ext�rieur pr�s de la tour.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"XARDAS");
	}
	else if (Npc_GetDistToWP (self, "OW_NEWMINE_11") < (4000+1000)) //FAJETHMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_03"); //J'attendrai pr�s de la mine.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"FAJETH");
	}
	else if (Npc_GetDistToWP (self, "OW_MINE3_OUT") < (1200+1000)) //SILVESTROMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_04"); //J'attendrai devant la mine.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"SILVESTRO");
	}
	else if (Npc_GetDistToWP (self, "OW_PATH_266") < (3000+1000)) //GRIMESMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_05"); //J'attendrai � deux pas d'ici.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"GRIMES");
	}
	else if (Npc_GetDistToWP (self, "LOCATION_02_05") < 15000) //Orcbarrier FIRE ANGAR LAKE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_06"); //Non. Je retourne dans la grotte.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_07"); //Venez me voir quand vous en avez fini ici.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_08"); //Mais n'attendez pas trop, ou je repars seul.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else //zu weit weg
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_09"); //Vous devez plaisanter. Nous sommes cens�s nous s�parer ? Ici ?
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_10"); //Faudra me passer sur le corps !
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_11"); //Nous allons jusqu'au col maintenant, ensemble.
	};
};

// ------------------------------------------------------------
// 			 			Zu weit gegangen
// ------------------------------------------------------------
func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_00"); //Passez devant et regardez autour de vous. J'attendrai � l'ext�rieur.
};
// ------------------------------------------------------------
func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_01"); //Pour aller jusqu'au col, nous devons suivre l'autre direction.
};
// ------------------------------------------------------------
var int Diego_TooFarComment;
var int Diego_BurgVariation;
var int Diego_FajethVariation;
var int Diego_SilvestroVariation;
var int Diego_GrimesVariation;
var int Diego_XardasVariation;
var int Diego_IceVariation;
// ------------------------------------------------------------
INSTANCE DIA_Addon_ThiefOW_TooFar(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 14;
	condition	= DIA_Addon_ThiefOW_TooFar_Condition;
	information	= DIA_Addon_ThiefOW_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_ThiefOW_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{	
		if (C_DiegoTooFar(0))
		{
			if (Diego_TooFarComment == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			Diego_TooFarComment = FALSE;
		};
	};
};

FUNC VOID DIA_Addon_ThiefOW_TooFar_Info()
{	
	if (C_DiegoTooFar(1000) == LOC_ANGAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_02"); //Cette vieille tombe a quelque chose de sinistre.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_03"); //Contournons-la plut�t.
	}
	else if (C_DiegoTooFar(1000) == LOC_ICE)
	{
		if (Diego_IceVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_04"); //Voici l'entr�e de l'ancien Nouveau Camp. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_05"); //Je suis s�r qu'un dragon y a �lu domicile.
			B_Addon_Diego_PassOtherDirection();
			Diego_IceVariation = 1;
		}
		else //1 
		{
			B_Addon_Diego_PassOtherDirection();
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SWAMP)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_06"); //Ce mar�cage est un cul-de-sac.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_07"); //Je ne serai pas �tonn� qu'un dragon nous y attende.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_08"); //N'y allons pas.
	}
	else if (C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_09"); //Si nous continuons � monter vers le sommet de la montagne, nous sommes s�rs de rencontrer un dragon..
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_10"); //Et j'aimerais atteindre Khorinis vivant.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_11"); //Prenons un chemin diff�rent.
	}
	else if (C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_12"); //Ce lac ne nous conduit nulle part.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_13"); //Pour acc�der au col, nous devons prendre l'autre direction.
	}
	else if (C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if (Diego_XardasVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_14"); //C'est la vieille ville de Xardas. Il s'est sauv� il y a longtemps, �videmment.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_15"); //Je suis certain que de mauvaises surprises nous attendent l�. 
			B_Addon_Diego_WillWaitOutside();
			Diego_XardasVariation = 1;
		}
		else //1
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos (self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine	(self,"XARDAS");
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_FAJETHMINE)
	{
		if (Diego_FajethVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_16"); //C'est la mine de Fajeth l�-bas derri�re.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_17"); //Si vous voulez aller l�, ne comptez pas sur moi !
			Diego_FajethVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_18"); //J'�viterais cette mine � tout prix !
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if (Diego_SilvestroVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_19"); //C'est la mine o� ils m'ont emmen� lorsque je suis revenu avec le convoi des prisonniers.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_20"); //je suis certain que plus personne n'est encore en vie.
			B_Addon_Diego_WillWaitOutside();
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_20"); //Mais si cela vous prend trop de temps, je vais retourner � mon camp.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_21"); //� moins que  vous ne vouliez que je vous attende ici.
			Diego_SilvestroVariation = 1;
		}
		else //1
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos (self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine	(self,"SILVESTRO");
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_GRIMESMINE)
	{
		if (Diego_GrimesVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_21"); //C'est l'une des nouvelles mines des paladins. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_22"); //Je ne suis jamais venu l�  � et je n'ai pas l'intention d'y aller.
			Diego_GrimesVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_23"); //�vitons cette mine � tout prix.
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_BURG)
	{
		if (Diego_BurgVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_24"); //Vous �tes suicidaire ? Tenez-vous � bonne distance de ce ch�teau.
			Diego_BurgVariation = 1;
		}
		else if (Diego_BurgVariation == 1)
		{	
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_25"); //Dites donc, est-ce que vous m'�coutez ?! Ne vous approchez pas de ce ch�teau !
			Diego_BurgVariation = 2;
		}
		else //2
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_26"); //Qu'est-ce qui n'est pas compr�hensible dans cette phrase � Ne vous approchez pas de ce ch�teau�� ?
			Diego_BurgVariation = 1;
		};	
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_27"); //Nous ne pouvons continuer. La Barri�re orque est trop dangereuse.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_28"); //Je pense qu'il serait pr�f�rable que nous retournions vers l'ouest pour atteindre l'autre c�t� en la contournant.
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_29"); //Si nous continuons dans cette direction, nous finirons encore par tomber sur la Barri�re orque.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_30"); //Allons vers le col !
	};

	Diego_TooFarComment = TRUE;
};

// ------------------------------------------------------------
// 						Angekommen
// ------------------------------------------------------------
func void B_Diego_WirSindDa()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_02"); //Je vais faire le reste du chemin seul.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_03"); //J'ai quelques affaires dont je dois m'occuper avant de retourner � Khorinis.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_04"); //Merci mon ami. Nous nous reverrons en ville.
	
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"PASS");
	
	Diego_angekommen = TRUE;
};
// ------------------------------------------------------------
INSTANCE DIA_Addon_ThiefOW_Angekommen (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 1;
	condition	= DIA_Addon_ThiefOW_Angekommen_Condition;
	information	= DIA_Addon_ThiefOW_Angekommen_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_ThiefOW_Angekommen_Condition()
{
	if (Npc_GetDistToWP (self, "OW_VM_ENTRANCE") < 800)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_ThiefOW_Angekommen_Info()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_01"); //Enfin, nous voil� arriv�s.
	B_GivePlayerXP (500);
	B_Diego_WirSindDa();
};

// ------------------------------------------------------------
// 							Nostalgie
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_Nostalgie (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 1;
	condition	= DIA_Addon_ThiefOW_Nostalgie_Condition;
	information	= DIA_Addon_ThiefOW_Nostalgie_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_ThiefOW_Nostalgie_Condition()
{
	if (Npc_GetDistToWP (self, "WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_ThiefOW_Nostalgie_Info()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_01"); //Vous vous rappellez ?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_02"); //De notre premi�re rencontre ici  ?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_03"); //Cela fait bien longtemps...
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_04"); //Il y avait quelque chose d'autre dans cet endroit � humm � diantre ! Je ne m'en souviens plus.
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_05"); //Quoi qu'il en soit...
	B_GivePlayerXP (500);
	hero.exp = hero.exp + 500;
	PrintScreen (ConcatStrings(NAME_Addon_NostalgieBonus, IntToString(500)), -1, 60, FONT_Screen, 2);
	
	
	B_Diego_WirSindDa();
};


// ------------------------------------------------------------
// 							PERM
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_PERM (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 10;
	condition	= DIA_Addon_ThiefOW_PERM_Condition;
	information	= DIA_Addon_ThiefOW_PERM_Info;
	permanent	= TRUE;
	description = "Tout va bien ?";
};                       
FUNC INT DIA_Addon_ThiefOW_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_DiegoOw_Perm))
	&& (Npc_KnowsInfo(other, DIA_Addon_ThiefOW_Together))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_ThiefOW_PERM_Info()
{	
	AI_Output (other ,self,"DIA_Addon_Diego_PERM_15_00"); //Comment �a va ?
	if (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_01"); //J'ai bien besoin d'une potion de soin. Vous n'en auriez pas une pour moi par hasard ?
	}
	else if (DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE)
	&& 		(Diego_angekommen == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_02"); //Faites-moi savoir quand vous voulez vous mettre en route.
	}
	else if (Diego_angekommen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_03"); //Parfait. Je fais seulement une courte pause.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_04"); //Parfait.
	};
};


