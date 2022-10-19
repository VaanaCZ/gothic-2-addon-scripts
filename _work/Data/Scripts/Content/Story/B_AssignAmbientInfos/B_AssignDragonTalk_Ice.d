// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Ice_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Ice_Exit_Condition;
	information	= DIA_Dragon_Ice_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Ice_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Ice_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Ice_Exit_20_00"); //Le pouvoir de l'Œil est épuisé. Votre heure a sonné.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;

	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};	
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_29_02");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_30_01");

	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_BLOODFLY_05_01");

};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Ice_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Ice_Hello_Condition;
	information	= DIA_Dragon_Ice_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Ice_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Ice_Hello_Info()
{
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_00"); //Pourquoi troubler mon repos ? Dois-je aller encore plus profondément pour que les petits parasites tels que vous me laissiez en paix ?
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_01"); //Un dragon qui parle. Grâces en soient rendues à l'Œil d'Innos.
	};
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_02"); //Vous êtes de bien curieuses créatures vous autres les humains. On a beau vous balayer, il y en a toujours un pour renaître des cendres et se prendre pour un héros.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_03"); //Mais bientôt tout cela sera terminé. Cette fois-ci, je veillerai personnellement à ce qu'aucun d'entre vous ne se relève.
	AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_04"); //Silence. Par le pouvoir de l'Œil sacré qui m'a été conféré, je vous ordonne de répondre à mes questions.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_05"); //Ha ! Ha ! Ha ! Eh ! Bien, posez-les. Cela ne vous sauvera pas.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_WERBISTDU		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Ice_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Ice_WERBISTDU_Info;

	description	 = 	"Qui êtes-vous ?";
};

func int DIA_Dragon_Ice_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Ice_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Ice_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Ice_WERBISTDU_15_00"); //Qui êtes-vous ?
	AI_Output			(self, other, "DIA_Dragon_Ice_WERBISTDU_20_01"); //Je suis Finkregh, Seigneur de la glace et de la neige, Gardien du Concile et, bientôt, votre bourreau.

};

///////////////////////////////////////////////////////////////////////
//	Info Beliar
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_BELIAR		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Ice_BELIAR_Condition;
	information	 = 	DIA_Dragon_Ice_BELIAR_Info;

	description	 = 	"Quel divinité adorez-vous ?";
};

func int DIA_Dragon_Ice_BELIAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Ice_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Ice_BELIAR_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_00"); //Quel dieu servez-vous ?
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_01"); //Quel divinité maudite peut permettre à une créature aussi immonde que vous d'errer sur cette terre ?
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_02"); //N'essayez même de vouloir comprendre les raisons de notre assemblée, petit héros.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_03"); //Non seulement Béliar nous a permis de nous retrouver ici, mais il l'a ordonné.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_04"); //Inspirés par ses paroles divines, nous n'aurons de cesse d'accomplir sa volonté.

};

//**********************************************************************************
//		B_AssignDragonTalk_Ice
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Ice (var c_NPC slf)
{
	DIA_Dragon_Ice_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_Hello.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_WERBISTDU.npc		= Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_BELIAR.npc			= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






