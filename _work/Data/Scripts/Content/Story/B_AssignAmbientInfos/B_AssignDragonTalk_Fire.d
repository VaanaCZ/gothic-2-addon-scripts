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

	AI_Output			(self, other, "DIA_Dragon_Fire_Exit_20_00"); //El Ojo ha perdido su poder y tú no vas a ver amanecer.

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
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_00"); //No me creo que siga habiendo gente que dé la vida para ver un dragón en carne y hueso.
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_01"); //Para ser un monstruo tan corpulento, te expresas muy bien.
	};
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_02"); //No he venido solo para verte. Me temo que tenía en mente algo más radical.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_03"); //¿Te refieres a que quieres desafiarme?
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_04"); //Ja, ja, ja. Voy a partirte tu pescuezo escuálido.
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_05"); //No tan deprisa, amigo mío. Llevo encima el Ojo de Innos y no puedes resistirte a mi voluntad. Responde mis preguntas, o sufrirás un dolor insoportable.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_06"); //(Brama) Arrh. Entonces plantea tus preguntas ridículas mientras puedas. Tu poder no durará mucho.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_WerBistDu_Condition;
	information	 = 	DIA_Dragon_Fire_WerBistDu_Info;

	description	 = 	"¿Quién eres tú?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //¿Quién eres tú?
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //Me llamo Feomathar, y eso es todo lo que vas a saber de mí.
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //En cuanto me libre del hechizo del Ojo, vas a arder.

};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_HORT_Condition;
	information	 = 	DIA_Dragon_Fire_HORT_Info;

	description	 = 	"¿Y dónde está tu tesoro?";
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
	AI_Output			(other, self, "DIA_Dragon_Fire_HORT_15_00"); //Todos los dragones guardan su tesoro en algún lugar. ¿Dónde está tu tesoro?
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_01"); //En un lugar al que no podrás acceder en cuanto me libre de las cadenas del Ojo.
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_02"); //Guardo mi tesoro en lo alto de los barrancos abrasadores, a los que no puede llegar un humano sin alas como tú.

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




