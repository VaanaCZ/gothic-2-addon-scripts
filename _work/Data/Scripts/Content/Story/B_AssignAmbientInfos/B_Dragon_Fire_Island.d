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
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Fermo, umano. Tutti i miei sensi mi dicono che l'assassino del sangue del mio sangue si trova di fronte a me.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //Davvero? Chi stai chiamando assassino, creatura del demonio?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Non ti è bastato aver distrutto quasi tutta la nostra discendenza?
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //Hai mio fratello Feomathar sulla tua coscienza, e pagherai per questo.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //Ucciderò anche il resto della tua disgustosa prole.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Argh. Sarà un piacere per me bruciarti vivo.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Smettila di fare tutto questo chiasso e cerchiamo di ragionare.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Sei arrivato fin qui, piccolo umano, ma non lascerai vivo queste stanze.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Un altro drago di fuoco. Mi sto stancando dei denti di quelle bestiacce. Tutto ciò che desidero è solamente attraversare il baratro che si apre dietro il drago di fuoco."); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

