// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Rock_Exit_Condition;
	information	= DIA_Dragon_Rock_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Rock_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Assez parl�. Le pouvoir dont vous disposiez est �puis�. L'�il n'a plus de puissance. Pr�parez-vous � mourir.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Rock_Hello_Condition;
	information	= DIA_Dragon_Rock_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Rock_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Encore un �tre pr�somptueux qui ose escalader mon rocher. Petits humains. Si braves et si fragiles.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Eh ! Mais vous pouvez parler.
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //Je vous arracherai les entrailles pour les donner aux rats.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //Pas si vite. J'ai l'�il d'Innos. Vous allez m'ob�ir et r�pondre � mes questions.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //(rugissements) Arrh. Posez vos questions.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"Qui �tes-vous ?";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //Qui �tes-vous ?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //Je me nomme Pedrakhan et je vais vous �corcher vif tr�s lentement quand je vous aurai attrap�.

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"Qui est le plus puissant des dragons ?";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //Qui est le plus puissant des dragons ?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //Nous tirons notre puissance des �l�ments de ce monde. La hi�rarchie est donc claire et simple.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //La terre mall�able accorde la vie � toutes les cr�atures de la surface. Et pourtant elle s'ouvrira pour vous avaler si vous vous en approchez trop.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //La roche, qui se brise plut�t que de se rendre, s'�lance avec fiert� vers le ciel et �crase les imprudents. Et pourtant elle offre la meilleure protection contre la mar�e.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //L'�tincelle de vie subsiste dans les profonds feux du monde. Et pourtant le feu incin�re tout dans un souffle et ne laisse que des cendres.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //Tous nos �l�ments pr�servent et d�truisent. Mais ce n'est que dans l'eau devenue aussi solide et dure que la pierre que tout sera transform� en un �ternel pilier de sel o� la vie sera � peine possible.

};


//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Rock (var c_NPC slf)
{
	DIA_Dragon_Rock_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






