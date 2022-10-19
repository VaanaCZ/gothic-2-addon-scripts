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

	AI_Output			(self, other, "DIA_Dragon_Fire_Exit_20_00"); //L'�il a perdu son pouvoir et vous ne survivrez pas � cette journ�e.

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
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_00"); //Je n'arrive pas � croire qu'ils sont pr�ts � sacrifier leur vie pour voir un dragon en chair et en os.
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_01"); //Vous vous exprimez plut�t bien pour un monstre aussi imposant.
	};
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_02"); //Je ne suis pas venu juste pour vous voir. J'avais en t�te quelque chose de plus radical.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_03"); //Vous ne voulez pas dire que vous d�sirez me d�fier ?
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_04"); //Ha ! Ha ! Ha ! Je vais briser votre cou d�charn�.
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_05"); //Pas si vite mon ami. J'ai l'�il d'Innos sur moi. Vous ne pouvez r�sister � ma volont�. R�pondez � mes questions ou l'agonie sera insupportable.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_06"); //(rugissements) Arrh ! Alors posez vos ridicules questions tant que vous le pouvez. Votre pouvoir ne durera pas tr�s longtemps.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_WerBistDu_Condition;
	information	 = 	DIA_Dragon_Fire_WerBistDu_Info;

	description	 = 	"Qui �tes-vous ?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //Qui �tes-vous ?
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //Je me nomme F�omathar et c'est tout ce que vous saurez de moi.
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //Une fois que j'aurai �chapp� au sort de l'�il, vous finirez dans les flammes.

};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_HORT_Condition;
	information	 = 	DIA_Dragon_Fire_HORT_Info;

	description	 = 	"Alors o� sont vos r�serves ?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_HORT_15_00"); //Tous les dragons ont un tr�sor qu'ils amassent. O� est le v�tre ?
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_01"); //Dans un endroit o� vous ne pourrez pas vous rendre une fois que je me serai lib�r� de l'emprise de l'�il.
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_02"); //Mon tr�sor se trouve sur une haute falaise presque impossible � atteindre pour un �tre sans ailes tel que vous.

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




