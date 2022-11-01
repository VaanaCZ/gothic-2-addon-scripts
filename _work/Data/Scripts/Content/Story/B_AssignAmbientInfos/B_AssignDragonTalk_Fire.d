// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Fire_Exit_Condition;
	information	= DIA_Dragon_Fire_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Fire_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Fire_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Fire_Exit_20_00"); //L'Œil a perdu son pouvoir et vous ne survivrez pas à cette journée.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;


	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};	
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Fire_Hello_Condition;
	information	= DIA_Dragon_Fire_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Fire_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Fire_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_00"); //Je n'arrive pas à croire qu'ils sont prêts à sacrifier leur vie pour voir un dragon en chair et en os.
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_01"); //Vous vous exprimez plutôt bien pour un monstre aussi imposant.
	};
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_02"); //Je ne suis pas venu juste pour vous voir. J'avais en tête quelque chose de plus radical.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_03"); //Vous ne voulez pas dire que vous désirez me défier ?
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_04"); //Ha ! Ha ! Ha ! Je vais briser votre cou décharné.
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_05"); //Pas si vite mon ami. J'ai l'Œil d'Innos sur moi. Vous ne pouvez résister à ma volonté. Répondez à mes questions ou l'agonie sera insupportable.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_06"); //(rugissements) Arrh ! Alors posez vos ridicules questions tant que vous le pouvez. Votre pouvoir ne durera pas très longtemps.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_WerBistDu_Condition;
	information	 = 	DIA_Dragon_Fire_WerBistDu_Info;

	description	 = 	"Qui êtes-vous ?";
};

func int DIA_Dragon_Fire_WerBistDu_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Fire_WerBistDu_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //Qui êtes-vous ?
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //Je me nomme Féomathar et c'est tout ce que vous saurez de moi.
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //Une fois que j'aurai échappé au sort de l'Œil, vous finirez dans les flammes.

};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_HORT_Condition;
	information	 = 	DIA_Dragon_Fire_HORT_Info;

	description	 = 	"Alors où sont vos réserves ?";
};

func int DIA_Dragon_Fire_HORT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Fire_HORT_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Fire_HORT_15_00"); //Tous les dragons ont un trésor qu'ils amassent. Où est le vôtre ?
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_01"); //Dans un endroit où vous ne pourrez pas vous rendre une fois que je me serai libéré de l'emprise de l'Œil.
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_02"); //Mon trésor se trouve sur une haute falaise presque impossible à atteindre pour un être sans ailes tel que vous.

};


//**********************************************************************************
//		B_AssignDragonTalk_Fire
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Fire (var c_NPC slf)
{
	DIA_Dragon_Fire_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_WerBistDu.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_HORT.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};




