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

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Basta de charla. Se ha agotado tu poder temporal. El Ojo ha perdido su fuerza. Prepárate para morir.

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
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Otro individuo presuntuoso que osa escalar mi roca. Los hombrecillos sois valientes, pero muy frágiles.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Anda, si sabes hablar.
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //Te arrancaré las entrañas y se las echaré a las ratas.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //No tan deprisa. Llevo encima el Ojo de Innos. Vas a obedecerme y a responder mis preguntas.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //(Brama) Arrh. Pregunta.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"¿Quién eres tú?";
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
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //¿Quién eres tú?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //Me llaman Pedrakhan y cuando te coja voy a despellejarte muy despacio.

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"¿Quién es el dragón más fuerte?";
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
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //¿Quién es el dragón más fuerte?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //Nuestro poder procede de los elementos de este mundo. Su jerarquía es evidente.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //La tierra da la vida a todas las criaturas que ilumina el sol, pero se abrirá y te tragará si te acercas demasiado a ella.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //La roca, que prefiere quebrarse a ceder, se eleva con orgullo y entierra bajo ella a los incautos. Aun así, es la mejor protección ante las mareas.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //Los fuegos de las entrañas del mundo albergan la chispa de la vida, aunque el fuego lo abrasa todo en un suspiro y no deja más que cenizas.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //Todos nuestros elementos preservan y destruyen. No obstante, solo en agua que se ha vuelto dura y maciza como una roca todo se transformará en un pilar eterno de sal donde la vida apenas podrá subsistir.

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






