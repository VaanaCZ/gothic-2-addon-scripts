// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Island_Exit(C_INFO)
{
	
	npc 		= Dragon_Fire_Island;
	nr			= 999;
	condition	= DIA_Dragon_Fire_Island_Exit_Condition;
	information	= DIA_Dragon_Fire_Island_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Fire_Island_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Fire_Island_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Island_Hello(C_INFO)
{
	
	npc 		= Dragon_Fire_Island;
	nr			= 5;
	condition	= DIA_Dragon_Fire_Island_Hello_Condition;
	information	= DIA_Dragon_Fire_Island_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Fire_Island_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Fire_Island_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Quieto, humano. Mis sentidos me dicen que tengo ante mí al asesino de los de mi propia carne y sangre.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //¿De verdad? ¿A quién llamas asesino, engendro infernal?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //¿No te bastó con matar a casi todos nuestros vástagos?
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //Mi hermano Feomathar pesa en tu conciencia y pagarás por ello.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //También acabaré con el resto de tu repugnante estirpe.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrh. Será un placer quemarte vivo.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Deja de hacer tanto ruido. Entremos en materia.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Has llegado lejos, hombrecillo, pero no vas a salir vivo de estos salones.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Otro dragón de fuego. Estoy empezando a hartarme de esas bestias. Lo que quiero es cruzar el abismo que se abre tras el dragón."); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

