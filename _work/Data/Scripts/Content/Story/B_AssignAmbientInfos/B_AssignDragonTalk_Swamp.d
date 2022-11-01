// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Swamp_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Swamp_Exit_Condition;
	information	= DIA_Dragon_Swamp_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Swamp_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Swamp_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Swamp_Exit_20_00"); //El poder del Ojo se agota. Aquí acaba tu existencia, humano.

	Swampdragon = Hlp_GetNpc (dragon_swamp);

	Swampdragon.flags = 0;

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;

	if (DJG_SwampParty_GoGoGo == TRUE)
	{
		if (DJG_SwampParty == TRUE) 
		&& (Npc_IsDead(DJG_Cipher) == FALSE)
		{
			B_StartOtherRoutine	(DJG_Rod,"SwampDragon");
		};
		B_StartOtherRoutine	(DJG_Cipher,"SwampDragon");
	};

	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Swamp_Hello(C_INFO)
{
	nr			= 5;
	condition	= DIA_Dragon_Swamp_Hello_Condition;
	information	= DIA_Dragon_Swamp_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Swamp_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Swamp_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_00"); //¡Ay de ti si te acercas un paso más!

	if (Mis_KilledDragons == 0)
		{
			AI_Output	(other, self, "DIA_Dragon_Swamp_Hello_15_01"); //Ah. Parece que el Ojo de Innos funciona.
		};
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_02"); //Han venido muchos como tú, y acabé con todos.
	AI_Output			(other, self, "DIA_Dragon_Swamp_Hello_15_03"); //No gastes saliva. Tu palabrería no me asusta, apestoso engendro infernal.
	AI_Output			(other, self, "DIA_Dragon_Swamp_Hello_15_04"); //Dime lo que quiero saber o haré que te ahogues en tu propia sangre.
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_05"); //Ja, ja, ja. ¿Osas amenazarme, gusano? Dame una razón para que no te haga mil pedazos ahora mismo.
	AI_Output			(other, self, "DIA_Dragon_Swamp_Hello_15_06"); //Soy un emisario de Innos y llevo encima el Ojo sagrado. No te queda más remedio. Debes someterte a mi voluntad si no quieres ser destruido.
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_07"); //(Brama) Arrh. Dime qué quieres de mí.
};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Swamp_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Swamp_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Swamp_WERBISTDU_Info;

	description	 = 	"¿Quién eres tú?";
};

func int DIA_Dragon_Swamp_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Swamp_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Swamp_WERBISTDU_15_00"); //¿Quién eres tú?
	AI_Output			(self, other, "DIA_Dragon_Swamp_WERBISTDU_20_01"); //Me llamo Pandrodor. Harías bien en volver a escabullirte bajo la roca de la que has salido.
	
};


///////////////////////////////////////////////////////////////////////
//	Info WoSindDieAnderen
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Swamp_WOSINDDIEANDEREN		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition;
	information	 = 	DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info;

	description	 = 	"¿Dónde puedo encontrar a las demás criaturas repugnantes?";
};

func int DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00"); //¿Dónde puedo encontrar a las demás criaturas repugnantes?
	AI_Output			(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01"); //Los elementos son la materia prima de todo y mantienen unido el mundo.
	AI_Output			(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02"); //Cada uno representa la capacidad de controlar una parte del mundo.
	AI_Output			(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03"); //Busca los elementos y encontrarás a los demás.
};



//**********************************************************************************
//		B_AssignDragonTalk_Swamp
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Swamp (var c_NPC slf)
{
	DIA_Dragon_Swamp_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WERBISTDU.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WOSINDDIEANDEREN.npc	= Hlp_GetInstanceID(slf);

	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
};








